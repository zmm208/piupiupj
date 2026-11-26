package io.piupiu.chat;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.util.Base64;
import android.util.Log;
import android.util.LruCache;
import androidx.core.app.NotificationCompat;
import com.getcapacitor.PluginMethod;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import kotlin.UByte;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
final class ProtectedFrontendManager {
    private static final int CACHEABLE_ENTRY_MAX_BYTES = 524288;
    private static final int DECRYPTED_CACHE_MAX_BYTES = 8388608;
    private static final int FORMAT_V2 = 2;
    private static final int FORMAT_V3 = 3;
    private static final String MANIFEST_ASSET = "public/frontend-code-manifest.json";
    private static final String PAK_ASSET = "public/frontend-code.pak";
    private static final String TAG = "PiuPiuProtectedFrontend";
    private String bundleSha256;
    private String bundleVersion;
    private volatile byte[] contentKey;
    private final Context context;
    private int formatVersion;
    private String keyId;
    private volatile boolean pakVerified;
    private volatile byte[] pathIndexKey;
    private final boolean protectedBuild;
    private JSONObject startup;
    private final Map<String, Entry> entries = new HashMap();
    private final Object decryptedCacheLock = new Object();
    private final LruCache<String, byte[]> decryptedCache = new LruCache<String, byte[]>(this, 8388608) { // from class: io.piupiu.chat.ProtectedFrontendManager.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.util.LruCache
        public int sizeOf(String str, byte[] bArr) {
            return bArr.length;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.util.LruCache
        public void entryRemoved(boolean z, String str, byte[] bArr, byte[] bArr2) {
            if (bArr == null || bArr == bArr2) {
                return;
            }
            ProtectedFrontendManager.wipe(bArr);
        }
    };
    private volatile String status = "checking";
    private volatile String message = "";

    ProtectedFrontendManager(Context context) {
        boolean z;
        this.startup = new JSONObject();
        this.bundleVersion = "";
        this.bundleSha256 = "";
        this.keyId = "";
        this.context = context.getApplicationContext();
        long jNanoTime = System.nanoTime();
        boolean z2 = false;
        z2 = false;
        z2 = false;
        try {
            JSONObject jSONObject = new JSONObject(readAssetText(MANIFEST_ASSET));
            int iOptInt = jSONObject.optInt("formatVersion", 0);
            this.formatVersion = iOptInt;
            int i = 3;
            try {
                if (iOptInt != 2 && iOptInt != 3) {
                    throw new IllegalStateException("Unsupported protected frontend format");
                }
                this.bundleVersion = jSONObject.getString("bundleVersion");
                this.bundleSha256 = jSONObject.getString("bundleSha256").toLowerCase(Locale.ROOT);
                this.keyId = jSONObject.getString("keyId");
                this.startup = jSONObject.getJSONObject("startup");
                JSONObject jSONObject2 = jSONObject.getJSONObject("entries");
                Iterator<String> itKeys = jSONObject2.keys();
                while (itKeys.hasNext()) {
                    String lowerCase = itKeys.next().toLowerCase(Locale.ROOT);
                    JSONObject jSONObject3 = jSONObject2.getJSONObject(lowerCase);
                    if (this.formatVersion == i) {
                        JSONArray jSONArray = jSONObject3.getJSONArray("segments");
                        int length = jSONArray.length();
                        z = z2 ? 1 : 0;
                        try {
                            Segment[] segmentArr = new Segment[length];
                            int i2 = z ? 1 : 0;
                            while (i2 < length) {
                                Segment[] segmentArr2 = segmentArr;
                                JSONObject jSONObject4 = jSONArray.getJSONObject(i2);
                                segmentArr2[i2] = new Segment(jSONObject4.getLong("offset"), jSONObject4.getInt("length"), jSONObject4.getInt("plaintextLength"), jSONObject4.getString("iv"), jSONObject4.getString("tag"));
                                i2++;
                                segmentArr = segmentArr2;
                            }
                            this.entries.put(lowerCase, new Entry(jSONObject3.getLong("plaintextLength"), jSONObject3.getString("mime"), segmentArr, null));
                        } catch (Exception e) {
                            e = e;
                            z2 = z;
                        }
                    } else {
                        z = z2 ? 1 : 0;
                        Segment segment = new Segment(jSONObject3.getLong("offset"), jSONObject3.getInt("length"), -1, jSONObject3.getString("iv"), jSONObject3.getString("tag"));
                        Map<String, Entry> map = this.entries;
                        String string = jSONObject3.getString("mime");
                        Segment[] segmentArr3 = new Segment[1];
                        segmentArr3[z ? 1 : 0] = segment;
                        map.put(lowerCase, new Entry(-1L, string, segmentArr3, jSONObject3.getString("sha256")));
                    }
                    z2 = z;
                    jSONObject2 = jSONObject2;
                    i = 3;
                }
                z = z2 ? 1 : 0;
                z2 = !this.entries.isEmpty();
                diagnostic("PF_MANIFEST_OK", jNanoTime, null);
                this.protectedBuild = z2;
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Exception e3) {
            e = e3;
            Object[] objArr = z2 ? 1 : 0;
        }
        diagnostic("PF_MANIFEST_MISSING", jNanoTime, e);
        this.protectedBuild = z2;
    }

    boolean isProtectedBuild() {
        return this.protectedBuild;
    }

    String getBundleVersion() {
        return this.bundleVersion;
    }

    String getBundleSha256() {
        return this.bundleSha256;
    }

    String getKeyId() {
        return this.keyId;
    }

    int getFormatVersion() {
        return this.formatVersion;
    }

    boolean isReady() {
        if (this.contentKey != null) {
            return !(this.formatVersion == 3 && this.pathIndexKey == null) && "ready".equals(this.status);
        }
        return false;
    }

    synchronized void unlock(byte[] bArr) throws Exception {
        if (this.protectedBuild) {
            if (bArr == null || bArr.length != 32) {
                throw new IllegalArgumentException("Invalid frontend content key");
            }
            long jNanoTime = System.nanoTime();
            verifyPakHash();
            byte[][] bArrDeriveV3Keys = this.formatVersion == 3 ? deriveV3Keys(bArr, this.keyId) : new byte[][]{(byte[]) bArr.clone(), null};
            byte[] bArr2 = bArrDeriveV3Keys[0];
            byte[] bArr3 = bArrDeriveV3Keys[1];
            synchronized (this.decryptedCacheLock) {
                byte[] bArr4 = this.contentKey;
                byte[] bArr5 = this.pathIndexKey;
                if (bArr4 != null && "ready".equals(this.status) && MessageDigest.isEqual(bArr4, bArr2) && equalNullable(bArr5, bArr3)) {
                    wipe(bArr2);
                    wipe(bArr3);
                    return;
                }
                this.decryptedCache.evictAll();
                this.contentKey = bArr2;
                this.pathIndexKey = bArr3;
                try {
                    byte[] bArrDecryptFully = decryptFully("index.html");
                    if (bArrDecryptFully.length <= 524288) {
                        this.decryptedCache.put("index.html", bArrDecryptFully);
                    } else {
                        wipe(bArrDecryptFully);
                    }
                    this.status = "ready";
                    this.message = "";
                    wipe(bArr4);
                    wipe(bArr5);
                    diagnostic("PF_UNLOCK_OK", jNanoTime, null);
                } catch (Exception e) {
                    this.decryptedCache.evictAll();
                    this.contentKey = bArr4;
                    this.pathIndexKey = bArr5;
                    wipe(bArr2);
                    wipe(bArr3);
                    diagnostic("PF_UNLOCK_FAIL", jNanoTime, e);
                    throw e;
                }
            }
        }
    }

    void markChecking() {
        markChecking("");
    }

    void markChecking(String str) {
        if (isReady()) {
            return;
        }
        this.status = "checking";
        this.message = str;
    }

    void markError(String str, boolean z) {
        if (isReady()) {
            return;
        }
        this.status = z ? "rejected" : "error";
        if (str == null) {
            str = "";
        }
        this.message = str;
    }

    void markAccountRequired() {
        if (isReady()) {
            return;
        }
        this.status = "account_required";
        this.message = "请登录账号以解锁模拟器或虚拟机";
        diagnostic("PF_ACCOUNT_REQUIRED", System.nanoTime(), null);
    }

    void markAccountInvalid(String str) {
        if (isReady()) {
            return;
        }
        this.status = "account_invalid";
        if (str == null || str.trim().isEmpty()) {
            str = "登录状态已失效，请重新登录";
        }
        this.message = str;
        diagnostic("PF_ACCOUNT_INVALID", System.nanoTime(), null);
    }

    JSONObject getBootstrapState() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(NotificationCompat.CATEGORY_STATUS, this.protectedBuild ? this.status : "unprotected");
            jSONObject.put("message", this.message);
            if (isReady()) {
                jSONObject.put("startup", this.startup);
            }
        } catch (Exception unused) {
        }
        return jSONObject;
    }

    DecryptedResource open(String str) throws Exception {
        String strNormalizePath = normalizePath(str);
        Entry entryEntryForPath = entryForPath(strNormalizePath);
        if (entryEntryForPath == null) {
            return null;
        }
        if (!isReady()) {
            throw new IllegalStateException("Protected frontend is locked");
        }
        if (this.formatVersion == 3 && entryEntryForPath.plaintextLength > 524288) {
            return new DecryptedResource(entryEntryForPath.mime, new SegmentedInputStream(strNormalizePath, entryEntryForPath));
        }
        return new DecryptedResource(entryEntryForPath.mime, new ByteArrayInputStream(getOrDecrypt(strNormalizePath, entryEntryForPath)));
    }

    void trimMemory(int i) {
        if (i >= 10) {
            clearPlaintextCache();
        }
    }

    synchronized void destroy() {
        clearPlaintextCache();
        wipe(this.contentKey);
        wipe(this.pathIndexKey);
        this.contentKey = null;
        this.pathIndexKey = null;
        this.status = "destroyed";
    }

    private void clearPlaintextCache() {
        synchronized (this.decryptedCacheLock) {
            this.decryptedCache.evictAll();
        }
    }

    private byte[] getOrDecrypt(String str, Entry entry) throws Exception {
        synchronized (this.decryptedCacheLock) {
            byte[] bArr = this.decryptedCache.get(str);
            if (bArr != null) {
                return (byte[]) bArr.clone();
            }
            byte[] bArrDecryptFully = decryptFully(str);
            if (entry.plaintextLength >= 0 && entry.plaintextLength > 524288) {
                return bArrDecryptFully;
            }
            this.decryptedCache.put(str, bArrDecryptFully);
            return (byte[]) bArrDecryptFully.clone();
        }
    }

    private byte[] decryptFully(String str) throws Exception {
        Entry entryEntryForPath = entryForPath(str);
        if (entryEntryForPath == null) {
            throw new GeneralSecurityException("Unknown protected path");
        }
        if (this.formatVersion == 2) {
            Segment segment = entryEntryForPath.segments[0];
            byte[] bArrDecryptSegment = decryptSegment(str, 0, segment, readPakRange(segment.offset, segment.length));
            if (sha256Hex(bArrDecryptSegment).equalsIgnoreCase(entryEntryForPath.legacySha256)) {
                return bArrDecryptSegment;
            }
            wipe(bArrDecryptSegment);
            throw new GeneralSecurityException("Protected frontend plaintext hash mismatch");
        }
        if (entryEntryForPath.plaintextLength > 2147483647L) {
            throw new IOException("Protected resource is too large");
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream((int) entryEntryForPath.plaintextLength);
        for (int i = 0; i < entryEntryForPath.segments.length; i++) {
            Segment segment2 = entryEntryForPath.segments[i];
            byte[] bArrDecryptSegment2 = decryptSegment(str, i, segment2, readPakRange(segment2.offset, segment2.length));
            byteArrayOutputStream.write(bArrDecryptSegment2);
            wipe(bArrDecryptSegment2);
        }
        return byteArrayOutputStream.toByteArray();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public byte[] decryptSegment(String str, int i, Segment segment, byte[] bArr) throws Exception {
        byte[] bytes;
        long jNanoTime = System.nanoTime();
        byte[] bArrDecode = Base64.decode(segment.tag, 0);
        ByteBuffer byteBufferPut = ByteBuffer.allocate(bArr.length + bArrDecode.length).put(bArr).put(bArrDecode);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(2, new SecretKeySpec(requireContentKey(), "AES"), new GCMParameterSpec(128, Base64.decode(segment.f221iv, 0)));
        if (this.formatVersion == 3) {
            bytes = canonicalV3Aad(str, i, segment.plaintextLength);
        } else {
            bytes = str.getBytes(StandardCharsets.UTF_8);
        }
        cipher.updateAAD(bytes);
        try {
            try {
                byte[] bArrDoFinal = cipher.doFinal(byteBufferPut.array());
                if (this.formatVersion == 3 && bArrDoFinal.length != segment.plaintextLength) {
                    wipe(bArrDoFinal);
                    throw new GeneralSecurityException("Protected segment length mismatch");
                }
                diagnostic("PF_SEGMENT_OK", jNanoTime, null);
                wipe(bArr);
                wipe(bArrDecode);
                wipe(byteBufferPut.array());
                return bArrDoFinal;
            } catch (Exception e) {
                diagnostic("PF_SEGMENT_FAIL", jNanoTime, e);
                throw e;
            }
        } catch (Throwable th) {
            wipe(bArr);
            wipe(bArrDecode);
            wipe(byteBufferPut.array());
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public byte[] readPakRange(long j, int i) throws Exception {
        AssetFileDescriptor assetFileDescriptorOpenFd = this.context.getAssets().openFd(PAK_ASSET);
        try {
            FileInputStream fileInputStreamCreateInputStream = assetFileDescriptorOpenFd.createInputStream();
            try {
                FileChannel channel = fileInputStreamCreateInputStream.getChannel();
                try {
                    channel.position(assetFileDescriptorOpenFd.getStartOffset() + j);
                    ByteBuffer byteBufferAllocate = ByteBuffer.allocate(i);
                    while (byteBufferAllocate.hasRemaining()) {
                        if (channel.read(byteBufferAllocate) < 0) {
                            throw new IOException("Unexpected end of protected frontend package");
                        }
                    }
                    byte[] bArrArray = byteBufferAllocate.array();
                    if (channel != null) {
                        channel.close();
                    }
                    if (fileInputStreamCreateInputStream != null) {
                        fileInputStreamCreateInputStream.close();
                    }
                    if (assetFileDescriptorOpenFd != null) {
                        assetFileDescriptorOpenFd.close();
                    }
                    return bArrArray;
                } catch (Throwable th) {
                    if (channel != null) {
                        try {
                            channel.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                if (fileInputStreamCreateInputStream != null) {
                    try {
                        fileInputStreamCreateInputStream.close();
                    } catch (Throwable th4) {
                        th3.addSuppressed(th4);
                    }
                }
                throw th3;
            }
        } catch (Throwable th5) {
            if (assetFileDescriptorOpenFd != null) {
                try {
                    assetFileDescriptorOpenFd.close();
                } catch (Throwable th6) {
                    th5.addSuppressed(th6);
                }
            }
            throw th5;
        }
    }

    private synchronized void verifyPakHash() throws Exception {
        if (this.pakVerified) {
            return;
        }
        long jNanoTime = System.nanoTime();
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        InputStream inputStreamOpen = this.context.getAssets().open(PAK_ASSET);
        try {
            byte[] bArr = new byte[65536];
            while (true) {
                int i = inputStreamOpen.read(bArr);
                if (i < 0) {
                    break;
                } else if (i > 0) {
                    messageDigest.update(bArr, 0, i);
                }
                throw th;
            }
            wipe(bArr);
            if (inputStreamOpen != null) {
                inputStreamOpen.close();
            }
            if (!hex(messageDigest.digest()).equalsIgnoreCase(this.bundleSha256)) {
                GeneralSecurityException generalSecurityException = new GeneralSecurityException("Protected frontend package hash mismatch");
                diagnostic("PF_PAK_FAIL", jNanoTime, generalSecurityException);
                throw generalSecurityException;
            }
            this.pakVerified = true;
            diagnostic("PF_PAK_OK", jNanoTime, null);
        } catch (Throwable th) {
            if (inputStreamOpen != null) {
                try {
                    inputStreamOpen.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    /* JADX WARN: Code duplicated, block: B:28:0x003c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    private String readAssetText(String str) throws Exception {
        InputStream inputStreamOpen = this.context.getAssets().open(str);
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                byte[] bArr = new byte[8192];
                while (true) {
                    int i = inputStreamOpen.read(bArr);
                    if (i < 0) {
                        break;
                    }
                    if (i > 0) {
                        byteArrayOutputStream.write(bArr, 0, i);
                    }
                    if (inputStreamOpen != null) {
                        try {
                            inputStreamOpen.close();
                        } catch (Throwable th) {
                            th.addSuppressed(th);
                        }
                    }
                    throw th;
                }
                String string = byteArrayOutputStream.toString("UTF-8");
                byteArrayOutputStream.close();
                if (inputStreamOpen != null) {
                    inputStreamOpen.close();
                }
                return string;
            } catch (Throwable th2) {
                try {
                    byteArrayOutputStream.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        } catch (Throwable th4) {
            if (inputStreamOpen != null) {
                inputStreamOpen.close();
            }
            throw th4;
        }
    }

    private Entry entryForPath(String str) {
        String strSha256Hex;
        try {
            if (this.formatVersion == 3) {
                strSha256Hex = hmacSha256Hex(requireIndexKey(), str.getBytes(StandardCharsets.UTF_8));
            } else {
                strSha256Hex = sha256Hex(str.getBytes(StandardCharsets.UTF_8));
            }
            return this.entries.get(strSha256Hex);
        } catch (Exception unused) {
            return null;
        }
    }

    private byte[] requireContentKey() throws GeneralSecurityException {
        byte[] bArr = this.contentKey;
        if (bArr != null) {
            return bArr;
        }
        throw new GeneralSecurityException("Protected frontend is locked");
    }

    private byte[] requireIndexKey() throws GeneralSecurityException {
        byte[] bArr = this.pathIndexKey;
        if (bArr != null) {
            return bArr;
        }
        throw new GeneralSecurityException("Protected frontend path index is locked");
    }

    static byte[][] deriveV3Keys(byte[] bArr, String str) throws Exception {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        messageDigest.update("piupiu-frontend-v3\u0000".getBytes(StandardCharsets.UTF_8));
        byte[] bArrDigest = messageDigest.digest(str.getBytes(StandardCharsets.UTF_8));
        byte[] bArrHmacSha256 = hmacSha256(bArrDigest, bArr);
        byte[] bArrHkdfExpand = hkdfExpand(bArrHmacSha256, "piupiu/frontend/content/v3".getBytes(StandardCharsets.UTF_8), 32);
        byte[] bArrHkdfExpand2 = hkdfExpand(bArrHmacSha256, "piupiu/frontend/path-index/v3".getBytes(StandardCharsets.UTF_8), 32);
        wipe(bArrHmacSha256);
        wipe(bArrDigest);
        return new byte[][]{bArrHkdfExpand, bArrHkdfExpand2};
    }

    private static byte[] hkdfExpand(byte[] bArr, byte[] bArr2, int i) throws Exception {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i);
        byte[] bArr3 = new byte[0];
        int i2 = 1;
        while (byteArrayOutputStream.size() < i) {
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(new SecretKeySpec(bArr, "HmacSHA256"));
            mac.update(bArr3);
            mac.update(bArr2);
            mac.update((byte) i2);
            byte[] bArrDoFinal = mac.doFinal();
            byteArrayOutputStream.write(bArrDoFinal, 0, Math.min(bArrDoFinal.length, i - byteArrayOutputStream.size()));
            wipe(bArr3);
            i2++;
            bArr3 = bArrDoFinal;
        }
        wipe(bArr3);
        return byteArrayOutputStream.toByteArray();
    }

    private static byte[] hmacSha256(byte[] bArr, byte[] bArr2) throws Exception {
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(bArr, "HmacSHA256"));
        return mac.doFinal(bArr2);
    }

    private static String hmacSha256Hex(byte[] bArr, byte[] bArr2) throws Exception {
        return hex(hmacSha256(bArr, bArr2));
    }

    private byte[] canonicalV3Aad(String str, int i, int i2) {
        return ("3\n" + this.keyId + "\n" + str + "\n" + i + "\n" + i2).getBytes(StandardCharsets.UTF_8);
    }

    private static String normalizePath(String str) {
        String strReplace = str == null ? "" : str.trim().replace('\\', '/');
        while (strReplace.startsWith("/")) {
            strReplace = strReplace.substring(1);
        }
        return strReplace;
    }

    private static String sha256Hex(byte[] bArr) throws Exception {
        return hex(MessageDigest.getInstance("SHA-256").digest(bArr));
    }

    private static String hex(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (byte b : bArr) {
            sb.append(String.format(Locale.ROOT, "%02x", Byte.valueOf(b)));
        }
        return sb.toString();
    }

    private static boolean equalNullable(byte[] bArr, byte[] bArr2) {
        if (bArr == null || bArr2 == null) {
            return bArr == bArr2;
        }
        return MessageDigest.isEqual(bArr, bArr2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void wipe(byte[] bArr) {
        if (bArr != null) {
            Arrays.fill(bArr, (byte) 0);
        }
    }

    private void diagnostic(String str, long j, Throwable th) {
        Log.i(TAG, "event=" + str + " bundle=" + (this.bundleSha256.length() >= 12 ? this.bundleSha256.substring(0, 12) : this.bundleSha256) + " dur_ms=" + ((System.nanoTime() - j) / 1000000) + " error=" + (th == null ? PluginMethod.RETURN_NONE : th.getClass().getSimpleName()));
    }

    static final class DecryptedResource {
        final String mime;
        final InputStream stream;

        DecryptedResource(String str, InputStream inputStream) {
            this.mime = str;
            this.stream = inputStream;
        }
    }

    private final class SegmentedInputStream extends InputStream {
        private boolean closed;
        private ByteArrayInputStream current;
        private byte[] currentBytes;
        private final Entry entry;
        private final String path;
        private int segmentIndex;

        SegmentedInputStream(String str, Entry entry) {
            this.path = str;
            this.entry = entry;
        }

        @Override // java.io.InputStream
        public int read() throws IOException {
            byte[] bArr = new byte[1];
            if (read(bArr, 0, 1) < 0) {
                return -1;
            }
            return bArr[0] & UByte.MAX_VALUE;
        }

        @Override // java.io.InputStream
        public int read(byte[] bArr, int i, int i2) throws IOException {
            if (this.closed) {
                throw new IOException("Stream is closed");
            }
            if (i2 == 0) {
                return 0;
            }
            while (true) {
                ByteArrayInputStream byteArrayInputStream = this.current;
                if (byteArrayInputStream == null || byteArrayInputStream.available() == 0) {
                    ProtectedFrontendManager.wipe(this.currentBytes);
                    this.currentBytes = null;
                    this.current = null;
                    if (this.segmentIndex >= this.entry.segments.length) {
                        return -1;
                    }
                    Segment[] segmentArr = this.entry.segments;
                    int i3 = this.segmentIndex;
                    Segment segment = segmentArr[i3];
                    try {
                        ProtectedFrontendManager protectedFrontendManager = ProtectedFrontendManager.this;
                        this.currentBytes = protectedFrontendManager.decryptSegment(this.path, i3, segment, protectedFrontendManager.readPakRange(segment.offset, segment.length));
                        this.current = new ByteArrayInputStream(this.currentBytes);
                        this.segmentIndex++;
                    } catch (Exception e) {
                        throw new IOException("Unable to decrypt protected frontend segment", e);
                    }
                } else {
                    return this.current.read(bArr, i, i2);
                }
            }
        }

        @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            this.closed = true;
            ProtectedFrontendManager.wipe(this.currentBytes);
            this.currentBytes = null;
            this.current = null;
        }
    }

    private static final class Entry {
        final String legacySha256;
        final String mime;
        final long plaintextLength;
        final Segment[] segments;

        Entry(long j, String str, Segment[] segmentArr, String str2) {
            this.plaintextLength = j;
            this.mime = str;
            this.segments = segmentArr;
            this.legacySha256 = str2;
        }
    }

    private static final class Segment {

        /* JADX INFO: renamed from: iv */
        final String f221iv;
        final int length;
        final long offset;
        final int plaintextLength;
        final String tag;

        Segment(long j, int i, int i2, String str, String str2) {
            this.offset = j;
            this.length = i;
            this.plaintextLength = i2;
            this.f221iv = str;
            this.tag = str2;
        }
    }
}
