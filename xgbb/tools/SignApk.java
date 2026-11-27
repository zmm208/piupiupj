// SignApk.java —— 用 apksig 库给 APK 签 v1+v2+v3（等价 apksigner）
// 编译：javac -cp apksig.jar -d out SignApk.java
// 运行：java -cp "out;apksig.jar" SignApk <in.apk> <out.apk> <keystore.p12> <alias> <password>
import com.android.apksig.ApkSigner;
import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SignApk {
    public static void main(String[] a) throws Exception {
        if (a.length < 5) {
            System.err.println("usage: SignApk in.apk out.apk keystore.p12 alias password");
            System.exit(2);
        }
        File in = new File(a[0]), out = new File(a[1]);
        KeyStore ks = KeyStore.getInstance("PKCS12");
        char[] pw = a[4].toCharArray();
        try (FileInputStream fis = new FileInputStream(a[2])) { ks.load(fis, pw); }
        String alias = a[3];
        PrivateKey key = (PrivateKey) ks.getKey(alias, pw);
        List<X509Certificate> chain = new ArrayList<>();
        for (java.security.cert.Certificate c : ks.getCertificateChain(alias)) chain.add((X509Certificate) c);

        ApkSigner.SignerConfig cfg = new ApkSigner.SignerConfig.Builder("CERT", key, chain).build();
        ApkSigner signer = new ApkSigner.Builder(Collections.singletonList(cfg))
                .setInputApk(in)
                .setOutputApk(out)
                .setV1SigningEnabled(true)
                .setV2SigningEnabled(true)
                .setV3SigningEnabled(true)
                .setCreatedBy("1.0 (Android)")
                .build();
        signer.sign();
        System.out.println("[sign] ok -> " + out.getAbsolutePath() + " (" + out.length() + " bytes)");
    }
}
