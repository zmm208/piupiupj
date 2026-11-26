package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import android.content.Context;
import android.util.Base64;
import com.getcapacitor.JSObject;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsSecret;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class UtilsEncryption {
    private static final String CIPHER_TRANSFORMATION = "AES/GCM/NoPadding";
    private static final int ITERATION_COUNT = 65536;
    private static final String PBKDF2_ALGORITHM = "PBKDF2WithHmacSHA1";
    private static final String SALT = "jeep_capacitor_sqlite";

    public static String encryptJSONObject(Context context, JSONObject jsonObject) throws Exception {
        String string = jsonObject.toString();
        if (!UtilsSecret.isPassphrase().booleanValue()) {
            throw new Exception("encryptJSONObject: No Passphrase stored");
        }
        String passphrase = UtilsSecret.getPassphrase();
        try {
            byte[] bytes = SALT.getBytes("UTF-8");
            SecretKeySpec secretKeySpec = new SecretKeySpec(SecretKeyFactory.getInstance(PBKDF2_ALGORITHM).generateSecret(new PBEKeySpec(passphrase.toCharArray(), bytes, 65536, 256)).getEncoded(), "AES");
            Cipher cipher = Cipher.getInstance(CIPHER_TRANSFORMATION);
            cipher.init(1, secretKeySpec, new GCMParameterSpec(128, bytes, 0, 12));
            byte[] bArrDoFinal = cipher.doFinal(string.getBytes());
            byte[] bArr = new byte[bytes.length + bArrDoFinal.length];
            System.arraycopy(bytes, 0, bArr, 0, bytes.length);
            System.arraycopy(bArrDoFinal, 0, bArr, bytes.length, bArrDoFinal.length);
            return Base64.encodeToString(bArr, 0);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("encryptJSONObject: " + e.getMessage());
        }
    }

    public static JSObject decryptJSONObject(Context context, String encryptedBase64) throws Exception {
        if (!UtilsSecret.isPassphrase().booleanValue()) {
            throw new Exception("decryptJSONObject: No Passphrase stored");
        }
        String passphrase = UtilsSecret.getPassphrase();
        try {
            byte[] bArrDecode = Base64.decode(encryptedBase64, 0);
            byte[] bytes = SALT.getBytes("UTF-8");
            int length = bArrDecode.length - bytes.length;
            byte[] bArr = new byte[length];
            System.arraycopy(bArrDecode, 0, bytes, 0, bytes.length);
            System.arraycopy(bArrDecode, bytes.length, bArr, 0, length);
            SecretKeySpec secretKeySpec = new SecretKeySpec(SecretKeyFactory.getInstance(PBKDF2_ALGORITHM).generateSecret(new PBEKeySpec(passphrase.toCharArray(), bytes, 65536, 256)).getEncoded(), "AES");
            Cipher cipher = Cipher.getInstance(CIPHER_TRANSFORMATION);
            cipher.init(2, secretKeySpec, new GCMParameterSpec(128, bytes, 0, 12));
            return new JSObject(new String(cipher.doFinal(bArr), "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("decryptJSONObject: " + e.getMessage());
        }
    }

    private static byte[] generateSalt() {
        try {
            byte[] bArr = new byte[16];
            SecureRandom.getInstance("SHA1PRNG").nextBytes(bArr);
            return bArr;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
