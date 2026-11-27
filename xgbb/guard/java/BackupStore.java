package io.piupiu.chat.guard;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * 备份存储：设备密钥派生 + AES-256-GCM + /storage/emulated/0/piupiupj 读写
 *
 * 设计要点
 *  - 密钥每次按需从设备指纹现算，算完立即清零，不缓存、不落盘、不回传 JS
 *  - 对外只暴露 keyId（64 位密钥的十六进制形式，用于给用户看 / 校验）
 *  - 文件按行存放分片密文，改一段只重写一行（增量备份）
 */
public final class BackupStore {

    private static final String DIR_NAME = "piupiupj";
    private static final String DATA_FILE = "piupiupj.json";
    private static final String README_FILE = "说明.txt";
    private static final String README_TEXT = "这是piupiu插件版的备份数据禁止删除";
    private static final String SALT = "piupiu-backup-v1";
    private static final String INFO_AES = "pp-backup-aes";
    private static final String AAD_PREFIX = "pp-backup-v1";

    private BackupStore() { }

    /* ------------------------------------------------------------ 设备指纹 */

    private static String fingerprint(Activity act) { return fingerprint(act, null); }

    private static String fingerprint(Activity act, String pkgOverride) {
        StringBuilder sb = new StringBuilder(256);
        String androidId = "";
        try {
            androidId = Settings.Secure.getString(act.getContentResolver(), Settings.Secure.ANDROID_ID);
        } catch (Throwable ignored) { }
        sb.append("PPK1\u0000").append(nz(androidId))
          .append('|').append(nz(Build.FINGERPRINT))
          .append('|').append(nz(Build.BOARD))
          .append('|').append(nz(Build.BRAND))
          .append('|').append(nz(Build.DEVICE))
          .append('|').append(nz(Build.HARDWARE))
          .append('|').append(nz(Build.MODEL))
          .append('|').append(nz(Build.MANUFACTURER))
          .append('|').append(nz(Build.PRODUCT))
          .append('|').append(nz(join(Build.SUPPORTED_ABIS)));
        if (pkgOverride != null) sb.append('|').append(pkgOverride);
        try {
            android.util.DisplayMetrics dm = act.getResources().getDisplayMetrics();
            sb.append('|').append(dm.widthPixels).append('x').append(dm.heightPixels)
              .append('@').append(Math.round(dm.density * 100));
        } catch (Throwable ignored) { }
        return sb.toString();
    }

    private static String nz(String s) { return s == null ? "-" : s; }

    private static String join(String[] a) {
        if (a == null || a.length == 0) return "-";
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < a.length; i++) { if (i > 0) b.append(','); b.append(a[i]); }
        return b.toString();
    }

    private static byte[] sha256(byte[] in) throws Exception {
        return MessageDigest.getInstance("SHA-256").digest(in);
    }

    private static byte[] hmac(byte[] key, byte[] msg) throws Exception {
        Mac m = Mac.getInstance("HmacSHA256");
        m.init(new SecretKeySpec(key, "HmacSHA256"));
        return m.doFinal(msg);
    }

    /** HKDF-SHA256（extract + expand 一轮，输出 32 字节） */
    private static byte[] hkdf(byte[] ikm, String salt, String info) throws Exception {
        byte[] prk = hmac(salt.getBytes(StandardCharsets.UTF_8), ikm);
        byte[] t = hmac(prk, concat(info.getBytes(StandardCharsets.UTF_8), new byte[]{1}));
        byte[] out = new byte[32];
        System.arraycopy(t, 0, out, 0, 32);
        Arrays.fill(prk, (byte) 0);
        Arrays.fill(t, (byte) 0);
        return out;
    }

    private static byte[] concat(byte[] a, byte[] b) {
        byte[] r = new byte[a.length + b.length];
        System.arraycopy(a, 0, r, 0, a.length);
        System.arraycopy(b, 0, r, a.length, b.length);
        return r;
    }

    /** 32 字节主密钥材料（IKM），由设备指纹决定 */
    private static byte[] ikm(Activity act) throws Exception {
        return sha256(fingerprint(act).getBytes(StandardCharsets.UTF_8));
    }

    /** 旧版本（包名参与指纹）的密钥材料，用于兼容改包名前生成的备份 */
    private static byte[] ikmLegacy(Activity act) throws Exception {
        return sha256(fingerprint(act, "io.piupiu.chat").getBytes(StandardCharsets.UTF_8));
    }

    /** 对外可见的 64 位密钥：IKM 的前 8 字节 → 16 位十六进制 */
    public static String keyId(Activity act) {
        try {
            byte[] k = ikm(act);
            StringBuilder sb = new StringBuilder(16);
            for (int i = 0; i < 8; i++) sb.append(String.format("%02x", k[i]));
            Arrays.fill(k, (byte) 0);
            return sb.toString();
        } catch (Throwable t) { return "0000000000000000"; }
    }

    private static SecretKeySpec aesKeyFrom(byte[] in) throws Exception {
        byte[] k = hkdf(in, SALT, INFO_AES);
        SecretKeySpec s = new SecretKeySpec(k, "AES");
        Arrays.fill(k, (byte) 0);
        return s;
    }

    private static SecretKeySpec aesKey(Activity act) throws Exception {
        byte[] in = ikm(act);
        byte[] k = hkdf(in, SALT, INFO_AES);
        Arrays.fill(in, (byte) 0);
        SecretKeySpec s = new SecretKeySpec(k, "AES");
        Arrays.fill(k, (byte) 0);
        return s;
    }

    /* ------------------------------------------------------------ 加解密 */

    /** 返回 "ivB64.ctB64" */
    public static String encrypt(Activity act, String plain) {
        try {
            byte[] iv = new byte[12];
            new java.security.SecureRandom().nextBytes(iv);
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.ENCRYPT_MODE, aesKey(act), new GCMParameterSpec(128, iv));
            c.updateAAD((AAD_PREFIX + "|" + keyId(act)).getBytes(StandardCharsets.UTF_8));
            byte[] ct = c.doFinal(plain.getBytes(StandardCharsets.UTF_8));
            return b64(iv) + "." + b64(ct);
        } catch (Throwable t) {
            return "";
        }
    }

    public static String decrypt(Activity act, String packed) {
        String r = decryptWith(act, packed, false);
        if (!r.isEmpty()) return r;
        return decryptWith(act, packed, true);     // 兼容改包名前的老备份
    }

    private static String decryptWith(Activity act, String packed, boolean legacy) {
        try {
            int dot = packed.indexOf('.');
            if (dot <= 0) return "";
            byte[] iv = unb64(packed.substring(0, dot));
            byte[] ct = unb64(packed.substring(dot + 1));
            byte[] in = legacy ? ikmLegacy(act) : ikm(act);
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.DECRYPT_MODE, aesKeyFrom(in), new GCMParameterSpec(128, iv));
            // AAD 里的 keyId 也跟着指纹走
            Arrays.fill(in, (byte) 0);
            String kid = legacy ? legacyKeyId(act) : keyId(act);
            c.updateAAD((AAD_PREFIX + "|" + kid).getBytes(StandardCharsets.UTF_8));
            return new String(c.doFinal(ct), StandardCharsets.UTF_8);
        } catch (Throwable t) {
            return "";
        }
    }

    private static String legacyKeyId(Activity act) {
        try {
            byte[] k = ikmLegacy(act);
            StringBuilder sb = new StringBuilder(16);
            for (int i = 0; i < 8; i++) sb.append(String.format("%02x", k[i]));
            Arrays.fill(k, (byte) 0);
            return sb.toString();
        } catch (Throwable t) { return ""; }
    }

    private static String b64(byte[] d) {
        return android.util.Base64.encodeToString(d, android.util.Base64.NO_WRAP);
    }

    private static byte[] unb64(String s) {
        return android.util.Base64.decode(s, android.util.Base64.NO_WRAP);
    }

    /* ------------------------------------------------------------ 目录权限 */

    public static boolean hasAllFiles(Activity act) {
        if (Build.VERSION.SDK_INT >= 30) return Environment.isExternalStorageManager();
        return act.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                == PackageManager.PERMISSION_GRANTED;
    }

    /** 申请「所有文件访问」（Android 11+）或普通存储权限（10-） */
    public static void requestAccess(Activity act) {
        try {
            if (Build.VERSION.SDK_INT >= 30) {
                Intent i = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
                i.setData(Uri.parse("package:" + act.getPackageName()));
                act.startActivity(i);
            } else {
                act.requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 0x51);
            }
        } catch (Throwable ignored) { }
    }

    /* ------------------------------------------------------------ 文件 */

    private static File dir(Activity act) {
        File root = Environment.getExternalStorageDirectory();
        return new File(root, DIR_NAME);
    }

    private static File dataFile(Activity act) { return new File(dir(act), DATA_FILE); }
    private static File readmeFile(Activity act) { return new File(dir(act), README_FILE); }

    /** 建目录 + 说明文件；返回是否可用 */
    public static boolean ensure(Activity act) {
        try {
            File d = dir(act);
            if (!d.exists() && !d.mkdirs()) return false;
            File r = new File(d, README_FILE);
            if (!r.exists()) {
                FileOutputStream o = new FileOutputStream(r);
                o.write(README_TEXT.getBytes(StandardCharsets.UTF_8));
                o.flush(); o.close();
            }
            return true;
        } catch (Throwable t) { return false; }
    }

    public static String read(Activity act) {
        try {
            File f = dataFile(act);
            if (!f.exists()) return "";
            FileInputStream in = new FileInputStream(f);
            ByteArrayOutputStream bo = new ByteArrayOutputStream((int) Math.min(f.length(), 1 << 20));
            byte[] buf = new byte[64 * 1024];
            int n;
            while ((n = in.read(buf)) > 0) bo.write(buf, 0, n);
            in.close();
            return new String(bo.toByteArray(), StandardCharsets.UTF_8);
        } catch (Throwable t) { return ""; }
    }

    /** 分块写，避免一次性大字符串再拷贝 */
    public static boolean write(Activity act, String text) {
        FileOutputStream o = null;
        try {
            if (!ensure(act)) return false;
            File f = dataFile(act);
            File tmp = new File(f.getAbsolutePath() + ".tmp");
            o = new FileOutputStream(tmp);
            byte[] all = text.getBytes(StandardCharsets.UTF_8);
            int off = 0, chunk = 64 * 1024;
            while (off < all.length) {
                int len = Math.min(chunk, all.length - off);
                o.write(all, off, len);
                off += len;
            }
            o.flush(); o.close(); o = null;
            if (f.exists() && !f.delete()) { /* 覆盖失败也继续尝试 rename */ }
            return tmp.renameTo(f);
        } catch (Throwable t) {
            return false;
        } finally {
            try { if (o != null) o.close(); } catch (Throwable ignored) { }
        }
    }

    public static long size(Activity act) {
        try { return dataFile(act).length(); } catch (Throwable t) { return 0; }
    }

    public static String info(Activity act) {
        boolean granted = hasAllFiles(act);
        boolean exists = dataFile(act).exists();
        return "{\"dir\":" + q(dir(act).getAbsolutePath()) +
               ",\"granted\":" + granted +
               ",\"exists\":" + exists +
               ",\"size\":" + size(act) +
               ",\"kid\":" + q(keyId(act)) + "}";
    }

    private static String q(String s) {
        if (s == null) return "null";
        return "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"") + "\"";
    }

    public static void openDir(Activity act) {
        try {
            Intent i = new Intent(Intent.ACTION_VIEW);
            i.setDataAndType(Uri.fromFile(dir(act)), "resource/folder");
            act.startActivity(i);
        } catch (Throwable ignored) { }
    }


    /* ------------------------------------------------------------ 任意文件读写（卡片图/聊天媒体） */

    private static String stripScheme(String path) {
        if (path == null) return "";
        String p = path.trim();
        if (p.startsWith("file://")) p = p.substring(7);
        return p;
    }

    /** 读文件 → base64（失败返回空串） */
    private static File[] bases(Activity act, String path) {
        String p = stripScheme(path);
        File direct = new File(p);
        if (direct.isAbsolute()) return new File[]{ direct };
        java.util.List<File> list = new java.util.ArrayList<>();
        try { list.add(new File(act.getFilesDir(), p)); } catch (Throwable ignored) { }
        try { list.add(new File(act.getExternalFilesDir(null), p)); } catch (Throwable ignored) { }
        try { list.add(new File(act.getDataDir(), p)); } catch (Throwable ignored) { }
        list.add(direct);
        return list.toArray(new File[0]);
    }

    public static String readFileB64(Activity act, String path) {
        FileInputStream in = null;
        try {
            File f = null;
            File[] cands = bases(act, path);
            for (int i = 0; i < cands.length; i++) {
                if (cands[i].exists() && cands[i].isFile()) { f = cands[i]; break; }
            }
            if (f == null || f.length() > 12L * 1024 * 1024) return "";
            byte[] buf = new byte[(int) f.length()];
            in = new FileInputStream(f);
            int off = 0, n;
            while (off < buf.length && (n = in.read(buf, off, buf.length - off)) > 0) off += n;
            in.close(); in = null;
            return android.util.Base64.encodeToString(buf, android.util.Base64.NO_WRAP);
        } catch (Throwable t) {
            return "";
        } finally {
            try { if (in != null) in.close(); } catch (Throwable ignored) { }
        }
    }

    /** base64 → 写回原路径（自动建父目录，先写 .tmp 再 rename） */
    public static boolean writeFileB64(Activity act, String path, String b64) {
        if (path == null || b64 == null || b64.isEmpty()) return false;
        FileOutputStream o = null;
        try {
            File[] cands = bases(act, path);
            File f = cands[0];
            File parent = f.getParentFile();
            if (parent != null && !parent.exists() && !parent.mkdirs()) return false;
            byte[] data = android.util.Base64.decode(b64, android.util.Base64.NO_WRAP);
            File tmp = new File(f.getAbsolutePath() + ".pptmp");
            o = new FileOutputStream(tmp);
            o.write(data);
            o.flush(); o.close(); o = null;
            if (f.exists()) f.delete();
            return tmp.renameTo(f);
        } catch (Throwable t) {
            return false;
        } finally {
            try { if (o != null) o.close(); } catch (Throwable ignored) { }
        }
    }


    /* 任意文件读写（卡片图 / 聊天媒体）：绕开 Filesystem 插件在绝对路径上的问题 */


    /* ================= 直接读数据库文件（绕开 SQLite 插件的连接问题） ================= */

    private static final String[] DB_TABLES = {
        "roles", "role_tags", "world_books", "world_book_entries",
        "chat_sessions", "chat_messages", "chat_media_refs", "settings"
    };

    private static java.io.File findDb(Activity act) {
        String[] names = { "piupiuSQLite.db", "piupiu.db", "piupiuSQLite", "piupiu" };
        java.util.List<java.io.File> dirs = new java.util.ArrayList<>();
        try { dirs.add(new java.io.File(act.getApplicationInfo().dataDir, "databases")); } catch (Throwable ignored) { }
        try { dirs.add(act.getDatabasePath("piupiu").getParentFile()); } catch (Throwable ignored) { }
        try { dirs.add(new java.io.File(act.getDataDir(), "databases")); } catch (Throwable ignored) { }
        for (java.io.File d : dirs) {
            if (d == null || !d.isDirectory()) continue;
            for (String n : names) {
                java.io.File f = new java.io.File(d, n);
                if (f.isFile() && f.length() > 0) return f;
            }
            java.io.File[] all = d.listFiles();
            if (all != null) {
                for (java.io.File f : all) {
                    if (f.isFile() && f.getName().endsWith(".db")) return f;
                }
            }
        }
        return null;
    }

    private static String esc0(String v) {
        if (v == null) return "";
        return v.replace("\u0001", " ").replace("\u0002", " ").replace("\u0003", " ");
    }

    /** 导出所有表：每行 "#表名\u0002列1\u0001列2" 或 "值1\u0001值2" */
    public static String dbDump(Activity act) {
        java.io.File db = findDb(act);
        if (db == null) return "ERR:NO_DB";
        android.database.sqlite.SQLiteDatabase d = null;
        StringBuilder out = new StringBuilder(1 << 20);
        try {
            d = android.database.sqlite.SQLiteDatabase.openDatabase(
                    db.getAbsolutePath(), null, android.database.sqlite.SQLiteDatabase.OPEN_READONLY);
            out.append("PATH\u0002").append(esc0(db.getAbsolutePath())).append("\u0003");
            for (String t : DB_TABLES) {
                android.database.Cursor c = null;
                try {
                    c = d.rawQuery("SELECT * FROM " + t, null);
                    String[] cols = c.getColumnNames();
                    out.append("#").append(t).append("\u0002");
                    for (int i = 0; i < cols.length; i++) { if (i > 0) out.append('\u0001'); out.append(cols[i]); }
                    out.append('\u0003');
                    while (c.moveToNext()) {
                        for (int i = 0; i < cols.length; i++) {
                            if (i > 0) out.append('\u0001');
                            try { out.append(esc0(c.getString(i))); } catch (Throwable ignored) { }
                        }
                        out.append('\u0003');
                    }
                } catch (Throwable ignored) {
                } finally { if (c != null) c.close(); }
            }
        } catch (Throwable t) {
            return "ERR:" + t.getClass().getSimpleName();
        } finally { try { if (d != null) d.close(); } catch (Throwable ignored) { } }
        return out.toString();
    }

    /** 执行一批 SQL；语句之间用 \u0000 分隔 */
    public static boolean dbExec(Activity act, String joined) {
        java.io.File db = findDb(act);
        if (db == null || joined == null) return false;
        android.database.sqlite.SQLiteDatabase d = null;
        try {
            d = android.database.sqlite.SQLiteDatabase.openDatabase(
                    db.getAbsolutePath(), null, android.database.sqlite.SQLiteDatabase.OPEN_READWRITE);
            d.beginTransaction();
            d.execSQL("PRAGMA foreign_keys=OFF");
            String[] parts = joined.split("\u0000");
            for (String sql : parts) {
                if (sql == null || sql.trim().isEmpty()) continue;
                try { d.execSQL(sql); } catch (Throwable ignored) { }
            }
            d.execSQL("PRAGMA foreign_keys=ON");
            d.setTransactionSuccessful();
            d.endTransaction();
            return true;
        } catch (Throwable t) {
            return false;
        } finally { try { if (d != null) d.close(); } catch (Throwable ignored) { } }
    }

    public static String dbPathInfo(Activity act) {
        java.io.File f = findDb(act);
        return f == null ? "" : f.getAbsolutePath();
    }

    public static Context ctx(Activity act) { return act; }
}
