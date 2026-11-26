package io.piupiu.chat;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.util.Base64;
import androidx.core.app.NotificationCompat;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.KeyPair;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.security.Signature;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
final class BusinessRequestSigner {
    private static final String ENDPOINT = "https://www.piupiuchan.top/includes/business_proof.php";
    private long clockOffset;
    private final Context context;
    private boolean enabled;
    private long nextStatusCheck;
    private final SharedPreferences prefs;

    BusinessRequestSigner(Context context) {
        this.context = context.getApplicationContext();
        this.prefs = context.getApplicationContext().getSharedPreferences("piupiu_business_proof_v1", 0);
    }

    synchronized String sign(String str) {
        KeyStore keyStore;
        String str2;
        if (str != null) {
            try {
                if (str.length() <= 33554432) {
                    JSONObject jSONObject = new JSONObject(str);
                    if (jSONObject.optBoolean("forceRefresh", false)) {
                        this.nextStatusCheck = 0L;
                    }
                    URL url = new URL(jSONObject.getString("url"));
                    if (!"https".equals(url.getProtocol()) || !"www.piupiuchan.top".equals(url.getHost()) || ((url.getPort() != -1 && url.getPort() != 443) || url.getUserInfo() != null)) {
                        throw new SecurityException("request origin mismatch");
                    }
                    if (System.currentTimeMillis() >= this.nextStatusCheck) {
                        JSONObject jSONObjectRequest = request(null);
                        this.enabled = jSONObjectRequest.getBoolean("enabled");
                        this.clockOffset = jSONObjectRequest.getLong("server_time") - (System.currentTimeMillis() / 1000);
                        this.nextStatusCheck = System.currentTimeMillis() + 30000;
                    }
                    if (!this.enabled) {
                        return "{\"headers\":{}}";
                    }
                    KeyStore keyStore2 = KeyStore.getInstance("AndroidKeyStore");
                    keyStore2.load(null);
                    String strBusinessKeyAlias = FrontendLicenseManager.businessKeyAlias(this.context);
                    KeyPair orCreateDeviceKey = FrontendLicenseManager.getOrCreateDeviceKey(strBusinessKeyAlias, 2048);
                    String strHex = hex(MessageDigest.getInstance("SHA-256").digest(orCreateDeviceKey.getPublic().getEncoded()));
                    JSONObject jSONObjectBusinessLicense = FrontendLicenseManager.businessLicense(this.context, strBusinessKeyAlias);
                    long jMax = this.prefs.getLong("expires_" + strHex, 0L);
                    if (jSONObjectBusinessLicense != null && strHex.equals(jSONObjectBusinessLicense.optString("device_public_key_sha256"))) {
                        jMax = Math.max(jMax, jSONObjectBusinessLicense.optLong("business_proof_expires_at", 0L));
                    }
                    if (jMax <= (System.currentTimeMillis() / 1000) + this.clockOffset + 300) {
                        enroll(orCreateDeviceKey, jSONObjectBusinessLicense, strHex);
                    }
                    if (jSONObjectBusinessLicense == null || !"hardware".equals(jSONObjectBusinessLicense.optString("verification_level"))) {
                        keyStore = keyStore2;
                        str2 = strHex;
                    } else {
                        keyStore = keyStore2;
                        str2 = strHex;
                        migrateSession(keyStore, orCreateDeviceKey, strBusinessKeyAlias, str2, jSONObject.optString("accessToken", "").trim(), jSONObject.optString("deviceId", "").trim());
                    }
                    KeyStore.PrivateKeyEntry privateKeyEntry = (KeyStore.PrivateKeyEntry) keyStore.getEntry(strBusinessKeyAlias, null);
                    String string = jSONObject.getString("method");
                    if (!string.matches("[A-Z]+")) {
                        throw new SecurityException("invalid method");
                    }
                    String file = url.getFile();
                    if (file.indexOf(10) >= 0 || file.indexOf(13) >= 0) {
                        throw new SecurityException("invalid target");
                    }
                    String strHash = hash(jSONObject.optString("body", ""));
                    byte[] bArr = new byte[16];
                    new SecureRandom().nextBytes(bArr);
                    String strHex2 = hex(bArr);
                    String strValueOf = String.valueOf((System.currentTimeMillis() / 1000) + this.clockOffset);
                    String strCanonical = FrontendLicenseManager.canonical("piupiu-business-v1", str2, strValueOf, strHex2, string, file, strHash, hash(jSONObject.optString("accessToken", "").trim()), hash(jSONObject.optString("deviceId", "").trim()), hash(jSONObject.optString("authorization", "").trim()));
                    Signature signature = Signature.getInstance("SHA256withRSA");
                    signature.initSign(privateKeyEntry.getPrivateKey());
                    signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("X-PiuPiu-Proof-Key", str2);
                    jSONObject2.put("X-PiuPiu-Proof-Time", strValueOf);
                    jSONObject2.put("X-PiuPiu-Proof-Nonce", strHex2);
                    jSONObject2.put("X-PiuPiu-Proof-Body", strHash);
                    jSONObject2.put("X-PiuPiu-Proof-Signature", Base64.encodeToString(signature.sign(), 2));
                    return new JSONObject().put("headers", jSONObject2).toString();
                }
            } catch (Exception e) {
                this.nextStatusCheck = 0L;
                if ((e instanceof ProofRejected) && "app_proof_migration_rejected".equals(((ProofRejected) e).code)) {
                    return "{\"error\":true,\"message\":\"设备授权迁移未完成，原会话未被替换；请重试或重新登录\"}";
                }
                return "{\"error\":true,\"message\":\"设备验证失败，请检查网络或更新官方版本\"}";
            }
        }
        throw new SecurityException("request too large");
    }

    private void migrateSession(KeyStore keyStore, KeyPair keyPair, String str, String str2, String str3, String str4) throws Exception {
        String strPreviousBusinessKeyAlias;
        if (str3.isEmpty() || str4.isEmpty() || (strPreviousBusinessKeyAlias = FrontendLicenseManager.previousBusinessKeyAlias(this.context, str)) == null || strPreviousBusinessKeyAlias.isEmpty() || strPreviousBusinessKeyAlias.equals(str) || !keyStore.containsAlias(strPreviousBusinessKeyAlias)) {
            return;
        }
        String str5 = "migrated_" + str2 + "_" + hash(str3);
        if (this.prefs.getBoolean(str5, false)) {
            return;
        }
        KeyStore.PrivateKeyEntry privateKeyEntry = (KeyStore.PrivateKeyEntry) keyStore.getEntry(strPreviousBusinessKeyAlias, null);
        String strHex = hex(MessageDigest.getInstance("SHA-256").digest(privateKeyEntry.getCertificate().getPublicKey().getEncoded()));
        JSONObject jSONObjectRequest = request("action=challenge");
        String strCanonical = FrontendLicenseManager.canonical("piupiu-business-migrate-v1", jSONObjectRequest.getString("challenge_id"), jSONObjectRequest.getString("challenge"), hash(str3), hash(str4), strHex, str2);
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initSign(privateKeyEntry.getPrivateKey());
        signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
        String strEncodeToString = Base64.encodeToString(signature.sign(), 2);
        signature.initSign(keyPair.getPrivate());
        signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
        if (!str2.equals(request("action=migrate_session&challenge_id=" + encode(jSONObjectRequest.getString("challenge_id")) + "&access_token=" + encode(str3) + "&device_id=" + encode(str4) + "&old_key_id=" + strHex + "&new_key_id=" + str2 + "&old_signature=" + encode(strEncodeToString) + "&new_signature=" + encode(Base64.encodeToString(signature.sign(), 2))).getString("key_id"))) {
            throw new SecurityException("migration mismatch");
        }
        this.prefs.edit().putBoolean(str5, true).apply();
    }

    private void enroll(KeyPair keyPair, JSONObject jSONObject, String str) throws Exception {
        byte[] byteArray;
        JSONObject jSONObjectRequest = request("action=challenge");
        String strOptString = jSONObject != null ? jSONObject.optString("license_id", "") : "";
        String str2 = strOptString.isEmpty() ? "account_compatible" : "frontend_reuse";
        String strCanonical = FrontendLicenseManager.canonical("piupiu-business-register-v2", jSONObjectRequest.getString("challenge_id"), jSONObjectRequest.getString("challenge"), str, str2, strOptString);
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initSign(keyPair.getPrivate());
        signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
        if (Build.VERSION.SDK_INT >= 28) {
            byteArray = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 134217728).signingInfo.getApkContentsSigners()[0].toByteArray();
        } else {
            byteArray = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 64).signatures[0].toByteArray();
        }
        try {
            JSONObject jSONObjectRequest2 = request("action=register&verification_level=" + str2 + "&frontend_license_id=" + encode(strOptString) + "&challenge_id=" + encode(jSONObjectRequest.getString("challenge_id")) + "&device_public_key=" + encode(Base64.encodeToString(keyPair.getPublic().getEncoded(), 2)) + "&device_signature=" + encode(Base64.encodeToString(signature.sign(), 2)) + "&app_platform=android&app_package_name=" + encode(this.context.getPackageName()) + "&app_signature_sha256=" + hex(MessageDigest.getInstance("SHA-256").digest(byteArray)));
            if (!str.equals(jSONObjectRequest2.getString("key_id"))) {
                throw new SecurityException("registration mismatch");
            }
            this.clockOffset = jSONObjectRequest2.getLong("server_time") - (System.currentTimeMillis() / 1000);
            this.prefs.edit().putLong("expires_" + str, jSONObjectRequest2.getLong("expires_at")).apply();
        } catch (ProofRejected e) {
            if (!"frontend_license_invalid".equals(e.code) || jSONObject == null) {
                throw e;
            }
            enroll(keyPair, null, str);
        }
    }

    private static final class ProofRejected extends SecurityException {
        final String code;

        ProofRejected(String str) {
            super("verification rejected");
            this.code = str;
        }
    }

    private JSONObject request(String str) throws Exception {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(ENDPOINT).openConnection();
        try {
            httpURLConnection.setConnectTimeout(5000);
            httpURLConnection.setReadTimeout(15000);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setInstanceFollowRedirects(false);
            httpURLConnection.setRequestMethod(str == null ? "GET" : "POST");
            if (str != null) {
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
                byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
                httpURLConnection.setFixedLengthStreamingMode(bytes.length);
                OutputStream outputStream = httpURLConnection.getOutputStream();
                try {
                    outputStream.write(bytes);
                    if (outputStream != null) {
                        outputStream.close();
                    }
                } catch (Throwable th) {
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            }
            int responseCode = httpURLConnection.getResponseCode();
            InputStream inputStream = responseCode == 200 ? httpURLConnection.getInputStream() : httpURLConnection.getErrorStream();
            if (inputStream == null) {
                throw new SecurityException("verification rejected");
            }
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    byte[] bArr = new byte[4096];
                    do {
                        int i = inputStream.read(bArr);
                        if (i == -1) {
                            JSONObject jSONObject = new JSONObject(new String(byteArrayOutputStream.toByteArray(), StandardCharsets.UTF_8));
                            if (responseCode != 200) {
                                throw new ProofRejected(jSONObject.optString("code", ""));
                            }
                            if (!"success".equals(jSONObject.optString(NotificationCompat.CATEGORY_STATUS))) {
                                throw new SecurityException("verification rejected");
                            }
                            byteArrayOutputStream.close();
                            if (inputStream != null) {
                                inputStream.close();
                            }
                            httpURLConnection.disconnect();
                            return jSONObject;
                        }
                        byteArrayOutputStream.write(bArr, 0, i);
                    } while (byteArrayOutputStream.size() <= 65536);
                    throw new SecurityException("response too large");
                } catch (Throwable th3) {
                    try {
                        byteArrayOutputStream.close();
                    } catch (Throwable th4) {
                        th3.addSuppressed(th4);
                    }
                    throw th3;
                }
            } catch (Throwable th5) {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (Throwable th6) {
                        th5.addSuppressed(th6);
                    }
                }
                throw th5;
            }
        } catch (Throwable th7) {
            httpURLConnection.disconnect();
            throw th7;
        }
    }

    private static String encode(String str) throws Exception {
        return URLEncoder.encode(str, "UTF-8");
    }

    private static String hash(String str) throws Exception {
        return hex(MessageDigest.getInstance("SHA-256").digest(str.getBytes(StandardCharsets.UTF_8)));
    }

    private static String hex(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (byte b : bArr) {
            sb.append(Character.forDigit((b >> 4) & 15, 16)).append(Character.forDigit(b & 15, 16));
        }
        return sb.toString();
    }
}
