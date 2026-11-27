package io.piupiu.chat.guard;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;
import android.os.Build;
import android.util.Base64;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;

import java.security.KeyStore;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/** 加密保险库：所有持久化状态都以 AndroidKeyStore(AES-256-GCM) 封装后落盘，绝不写明文。 */
final class GuardVault {
    private static final String KS = "AndroidKeyStore";
    private static final String ALIAS = "pp_guard_vault_v1";
    private static final String PREFS = "pp_guard_store";
    private static SharedPreferences sp;

    static void init(Context c) {
        if (sp == null) sp = c.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static SecretKey key() throws Exception {
        KeyStore ks = KeyStore.getInstance(KS);
        ks.load(null);
        if (ks.containsAlias(ALIAS)) return (SecretKey) ks.getKey(ALIAS, null);
        KeyGenerator kg = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, KS);
        KeyGenParameterSpec.Builder b = new KeyGenParameterSpec.Builder(ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .setUserAuthenticationRequired(false);
        if (Build.VERSION.SDK_INT >= 28) {
            try { b.setIsStrongBoxBacked(true); } catch (Throwable ignored) { b.setIsStrongBoxBacked(false); }
        }
        try {
            kg.init(b.build());
            kg.generateKey();
        } catch (Throwable t) {
            KeyGenParameterSpec.Builder b2 = new KeyGenParameterSpec.Builder(ALIAS,
                    KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                    .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                    .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                    .setKeySize(256).setUserAuthenticationRequired(false);
            kg.init(b2.build());
            kg.generateKey();
        }
        ks.load(null);
        return (SecretKey) ks.getKey(ALIAS, null);
    }

    static void put(String k, String v) {
        try {
            byte[] iv = new byte[12];
            new java.security.SecureRandom().nextBytes(iv);
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.ENCRYPT_MODE, key(), new GCMParameterSpec(128, iv));
            byte[] ct = c.doFinal(v.getBytes("UTF-8"));
            byte[] out = new byte[iv.length + ct.length];
            System.arraycopy(iv, 0, out, 0, iv.length);
            System.arraycopy(ct, 0, out, iv.length, ct.length);
            sp.edit().putString(k, Base64.encodeToString(out, Base64.NO_WRAP)).commit();
        } catch (Throwable t) { /* 失败即丢弃，绝不退化为明文 */ }
    }

    static String get(String k, String def) {
        try {
            String s = sp.getString(k, null);
            if (s == null) return def;
            byte[] all = Base64.decode(s, Base64.NO_WRAP);
            if (all.length < 13) return def;
            byte[] iv = new byte[12];
            System.arraycopy(all, 0, iv, 0, 12);
            byte[] ct = new byte[all.length - 12];
            System.arraycopy(all, 12, ct, 0, ct.length);
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.DECRYPT_MODE, key(), new GCMParameterSpec(128, iv));
            return new String(c.doFinal(ct), "UTF-8");
        } catch (Throwable t) { return def; }
    }

    static long getLong(String k, long def) {
        String s = get(k, null);
        if (s == null) return def;
        try { return Long.parseLong(s); } catch (Throwable t) { return def; }
    }

    static void putLong(String k, long v) { put(k, Long.toString(v)); }

    static String androidId(Context c) {
        try {
            String s = Settings.Secure.getString(c.getContentResolver(), "android_id");
            return s == null ? "" : s;
        } catch (Throwable t) { return ""; }
    }

    static String fingerprint() {
        return safe(Build.FINGERPRINT) + "/" + safe(Build.MODEL) + "/" + safe(Build.MANUFACTURER)
                + "/" + safe(Build.DEVICE) + "/" + safe(Build.PRODUCT);
    }

    private static String safe(String s) { return s == null ? "-" : s.replace('|', '-'); }
}
