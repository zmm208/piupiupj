package io.piupiu.chat;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.security.keystore.KeyGenParameterSpec;
import android.util.Base64;
import android.util.Log;
import androidx.core.app.NotificationCompat;
import com.getcapacitor.PluginMethod;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.cert.Certificate;
import java.security.spec.X509EncodedKeySpec;
import java.util.Arrays;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.crypto.Cipher;
import kotlin.text.Typography;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
final class FrontendLicenseManager {
    private static final String ATTESTATION_ACTIVE_ALIAS = "attestation_active_alias_v1";
    private static final String ATTESTATION_CACHED_LICENSE = "attestation_cached_license_v1";
    private static final String ATTESTATION_INSTALLATION_ID = "attestation_installation_id_v1";
    private static final String ATTESTATION_KEY_ALIAS_A = "piupiu_frontend_attested_a_v1";
    private static final String ATTESTATION_KEY_ALIAS_B = "piupiu_frontend_attested_b_v1";
    private static final String ATTESTATION_UNVERIFIED_KEY_ALIAS = "piupiu_frontend_unverified_v1";
    private static final int BACKGROUND_RENEWAL_DELAY_MS = 30000;
    private static final String CACHED_LICENSE_COMPAT = "cached_license_v2";
    private static final String CACHED_LICENSE_V1 = "cached_license";
    private static final String CHALLENGE_URL = "https://www.piupiuchan.top/includes/frontend_attestation_challenge.php";
    private static final String DEVICE_KEY_ALIAS_COMPAT = "piupiu_frontend_device_v2";
    private static final String DEVICE_KEY_ALIAS_V1 = "piupiu_frontend_device_v1";
    private static final String INSTALLATION_ID_COMPAT = "installation_id_v2";
    private static final String INSTALLATION_ID_V1 = "installation_id";
    private static final String ISSUE_URL = "https://www.piupiuchan.top/includes/frontend_attestation_issue.php";
    private static final int LICENSE_ISSUE_READ_TIMEOUT_MS = 8000;
    private static final int NETWORK_TIMEOUT_MS = 4000;
    private static final String PREFS = "piupiu_frontend_license";
    private static final long RENEWAL_WINDOW_SECONDS = 43200;
    private static final int STARTUP_WATCHDOG_MS = 15000;
    private static final String TAG = "PiuPiuFrontendLicense";
    private static final String V3_ACCOUNT_KEY_ALIAS = "piupiu_frontend_account_v3";
    private static final String V3_ATTESTED_KEY_ALIAS_A = "piupiu_frontend_attested_a_v3";
    private static final String V3_ATTESTED_KEY_ALIAS_B = "piupiu_frontend_attested_b_v3";
    private static final String V3_CACHED_KEY_ALIAS = "cached_key_alias_v3";
    private static final String V3_CACHED_LICENSE = "cached_license_v3";
    private static final String V3_CHALLENGE_URL = "https://www.piupiuchan.top/includes/frontend_v3_challenge.php";
    private static final String V3_INSTALLATION_ID = "installation_id_v3";
    private static final String V3_ISSUE_URL = "https://www.piupiuchan.top/includes/frontend_v3_issue.php";
    private static final String V3_UNVERIFIED_KEY_ALIAS = "piupiu_frontend_unverified_v3";
    private volatile Callback callback;
    private final Context context;
    private volatile boolean forceAccountMode;
    private final ProtectedFrontendManager frontend;
    private final SharedPreferences preferences;
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final AtomicBoolean requestInProgress = new AtomicBoolean(false);
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final AtomicBoolean startupCompleted = new AtomicBoolean(false);
    private volatile String accountAccessToken = "";
    private volatile String accountDeviceId = "";
    private final AtomicBoolean retryQueued = new AtomicBoolean(false);
    private final Runnable startupWatchdog = new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda6
        @Override // java.lang.Runnable
        public final void run() {
            this.f$0.lambda$new$0();
        }
    };
    private final Runnable backgroundRenewal = new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda7
        @Override // java.lang.Runnable
        public final void run() {
            this.f$0.lambda$new$2();
        }
    };
    private final Runnable backgroundV3Renewal = new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda8
        @Override // java.lang.Runnable
        public final void run() {
            this.f$0.lambda$new$4();
        }
    };

    interface Callback {
        void onAccountInvalid(String str);

        void onAccountRequired();

        void onFailure(String str, boolean z);

        void onUnlocked(byte[] bArr, boolean z);
    }

    static boolean usesCompatibilityProfile(int i) {
        return i <= 29;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$0() {
        Callback callback = this.callback;
        if (callback == null || !this.startupCompleted.compareAndSet(false, true)) {
            return;
        }
        Log.w(TAG, "Frontend license startup timed out");
        callback.onFailure("解锁耗时较长，请重试", false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$1() {
        requestFreshLicense(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$2() {
        if (this.executor.isShutdown()) {
            return;
        }
        this.executor.execute(new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$new$1();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$3() throws Throwable {
        lambda$requestFreshV3$9(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$4() {
        if (this.executor.isShutdown()) {
            return;
        }
        this.executor.execute(new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                this.f$0.lambda$new$3();
            }
        });
    }

    FrontendLicenseManager(Context context, ProtectedFrontendManager protectedFrontendManager) {
        Context applicationContext = context.getApplicationContext();
        this.context = applicationContext;
        this.frontend = protectedFrontendManager;
        this.preferences = applicationContext.getSharedPreferences(PREFS, 0);
    }

    void start(Callback callback) {
        this.callback = callback;
        if (this.frontend.getFormatVersion() >= 3) {
            startV3();
            return;
        }
        this.startupCompleted.set(false);
        this.mainHandler.removeCallbacks(this.startupWatchdog);
        this.mainHandler.removeCallbacks(this.backgroundRenewal);
        this.mainHandler.postDelayed(this.startupWatchdog, 15000L);
        this.executor.execute(new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$start$5();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$start$5() {
        boolean z;
        FrontendLicenseManager frontendLicenseManager;
        boolean z2;
        boolean z3 = false;
        try {
            byte[] cachedAttestedLicense = readCachedAttestedLicense();
            if (cachedAttestedLicense != null) {
                try {
                    reportUnlocked(cachedAttestedLicense, true);
                    z2 = true;
                    z3 = true;
                } catch (Exception e) {
                    e = e;
                    z3 = true;
                    z = z3;
                    Log.w(TAG, "Cached attested frontend license was rejected", e);
                    this.preferences.edit().remove(ATTESTATION_CACHED_LICENSE).remove(ATTESTATION_ACTIVE_ALIAS).apply();
                } catch (LinkageError e2) {
                    e = e2;
                    z3 = true;
                    z = z3;
                    Log.e(TAG, "Cached attested license runtime is incompatible", e);
                }
            } else {
                z2 = false;
            }
            z = z2;
        } catch (Exception e3) {
            e = e3;
        } catch (LinkageError e4) {
            e = e4;
        }
        if (z3) {
            frontendLicenseManager = this;
        } else {
            try {
                frontendLicenseManager = this;
                try {
                    byte[] cachedLicense = frontendLicenseManager.readCachedLicense(activeCachedLicense(), activeInstallationId(), activeDeviceKeyAlias(), true, activeDeviceKeySize());
                    if (cachedLicense != null) {
                        try {
                            reportUnlocked(cachedLicense, true);
                            z3 = true;
                        } catch (Exception e5) {
                            e = e5;
                            z3 = true;
                            Log.w(TAG, "Cached frontend license was rejected", e);
                            frontendLicenseManager.preferences.edit().remove(activeCachedLicense()).apply();
                        } catch (LinkageError e6) {
                            e = e6;
                            z3 = true;
                            Log.e(TAG, "Cached frontend license runtime is incompatible", e);
                        }
                    }
                } catch (Exception e7) {
                    e = e7;
                } catch (LinkageError e8) {
                    e = e8;
                }
            } catch (Exception e9) {
                e = e9;
                frontendLicenseManager = this;
            } catch (LinkageError e10) {
                e = e10;
                frontendLicenseManager = this;
            }
        }
        if (!z3 && usesCompatibilityProfile()) {
            try {
                byte[] cachedLicense2 = frontendLicenseManager.readCachedLicense(CACHED_LICENSE_V1, INSTALLATION_ID_V1, DEVICE_KEY_ALIAS_V1, false, 3072);
                if (cachedLicense2 != null) {
                    try {
                        reportUnlocked(cachedLicense2, true);
                        z3 = true;
                    } catch (Exception e11) {
                        e = e11;
                        z3 = true;
                        Log.w(TAG, "Legacy cached frontend license was rejected", e);
                    } catch (LinkageError e12) {
                        e = e12;
                        z3 = true;
                        Log.e(TAG, "Legacy cached frontend license runtime is incompatible", e);
                    }
                }
            } catch (Exception e13) {
                e = e13;
            } catch (LinkageError e14) {
                e = e14;
            }
        }
        if (!z3) {
            requestFreshLicense(true);
        } else if (!z || shouldRenewCachedAttestedLicense()) {
            frontendLicenseManager.mainHandler.postDelayed(frontendLicenseManager.backgroundRenewal, 30000L);
        }
    }

    void retry() {
        if (this.callback == null) {
            return;
        }
        if (this.frontend.getFormatVersion() >= 3) {
            retryV3();
            return;
        }
        this.startupCompleted.set(false);
        this.mainHandler.removeCallbacks(this.startupWatchdog);
        this.mainHandler.removeCallbacks(this.backgroundRenewal);
        this.mainHandler.postDelayed(this.startupWatchdog, 15000L);
        this.executor.execute(new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$retry$6();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$retry$6() {
        requestFreshLicense(true);
    }

    void shutdown() {
        this.mainHandler.removeCallbacks(this.startupWatchdog);
        this.mainHandler.removeCallbacks(this.backgroundRenewal);
        this.mainHandler.removeCallbacks(this.backgroundV3Renewal);
        this.executor.shutdownNow();
    }

    void restoreAccountSession(String str) {
        if (str == null || str.length() > 16384) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            String strTrim = jSONObject.optString("accessToken", jSONObject.optString("access_token", "")).trim();
            String strTrim2 = jSONObject.optString("deviceId", jSONObject.optString("device_id", "")).trim();
            if (!strTrim.matches("^[A-Za-z0-9_-]{16,512}$") || strTrim2.isEmpty() || strTrim2.length() > 128) {
                return;
            }
            this.accountAccessToken = strTrim;
            this.accountDeviceId = strTrim2;
        } catch (Exception unused) {
        }
    }

    private void beginStage(String str) {
        if (this.startupCompleted.get() || this.frontend.isReady()) {
            return;
        }
        this.frontend.markChecking(str);
        this.mainHandler.removeCallbacks(this.startupWatchdog);
        this.mainHandler.postDelayed(this.startupWatchdog, 15000L);
    }

    void submitAccountSession(String str) {
        if (this.frontend.getFormatVersion() < 3 || str == null || str.length() > 16384) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            String strTrim = jSONObject.optString("accessToken", jSONObject.optString("access_token", "")).trim();
            String strTrim2 = jSONObject.optString("deviceId", jSONObject.optString("device_id", "")).trim();
            if (strTrim.matches("^[A-Za-z0-9_-]{16,512}$") && !strTrim2.isEmpty() && strTrim2.length() <= 128) {
                this.accountAccessToken = strTrim;
                this.accountDeviceId = strTrim2;
                this.frontend.markChecking();
                diagnostic("LIC_V3_ACCOUNT_SESSION_ACCEPTED", null);
                retryV3();
                return;
            }
            reportFailure("登录状态无效，请重新登录", false);
        } catch (Exception unused) {
            reportFailure("登录状态无效，请重新登录", false);
        }
    }

    private void startV3() {
        this.startupCompleted.set(false);
        this.mainHandler.removeCallbacks(this.startupWatchdog);
        this.mainHandler.removeCallbacks(this.backgroundRenewal);
        this.mainHandler.removeCallbacks(this.backgroundV3Renewal);
        this.mainHandler.postDelayed(this.startupWatchdog, 15000L);
        this.executor.execute(new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                this.f$0.lambda$startV3$7();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$startV3$7() throws Throwable {
        beginStage("正在读取本地授权...");
        try {
            byte[] cachedV3License = readCachedV3License();
            if (cachedV3License != null) {
                String string = this.preferences.getString(V3_CACHED_KEY_ALIAS, "");
                JSONObject jSONObjectBusinessLicense = businessLicense(this.context, string);
                boolean z = V3_UNVERIFIED_KEY_ALIAS.equals(string) || (jSONObjectBusinessLicense != null && "account".equals(jSONObjectBusinessLicense.optString("verification_level")));
                diagnostic("LIC_V3_CACHE_HIT", null);
                reportUnlocked(cachedV3License, true);
                if (!z && !shouldRenewV3License()) {
                    return;
                }
                this.mainHandler.postDelayed(this.backgroundV3Renewal, 30000L);
                return;
            }
        } catch (Exception e) {
            diagnostic("LIC_V3_CACHE_REJECT", e);
        }
        lambda$requestFreshV3$9(true);
    }

    private void retryV3() {
        if (!this.retryQueued.compareAndSet(false, true) || this.executor.isShutdown()) {
            return;
        }
        this.executor.execute(new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                this.f$0.lambda$retryV3$8();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$retryV3$8() throws Throwable {
        this.retryQueued.set(false);
        if (this.frontend.isReady()) {
            return;
        }
        this.startupCompleted.set(false);
        beginStage("正在连接授权服务...");
        lambda$requestFreshV3$9(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:191:0x0472 A[Catch: all -> 0x0461, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:196:0x0484 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:197:0x0486  */
    /* JADX WARN: Code duplicated, block: B:203:0x0491  */
    /* JADX WARN: Code duplicated, block: B:207:0x049a  */
    /* JADX WARN: Code duplicated, block: B:214:0x04bc A[Catch: all -> 0x0461, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:216:0x04c2 A[Catch: all -> 0x0461, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:221:0x04d2 A[Catch: all -> 0x0461, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:222:0x04d6 A[Catch: all -> 0x0461, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:224:0x04de A[Catch: all -> 0x0461, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:225:0x04e6 A[Catch: all -> 0x0461, TRY_LEAVE, TryCatch #3 {all -> 0x0461, blocks: (B:15:0x005e, B:17:0x0064, B:19:0x0072, B:21:0x007c, B:23:0x0082, B:27:0x008d, B:29:0x009d, B:31:0x00a7, B:37:0x00be, B:49:0x00de, B:51:0x0152, B:53:0x0164, B:55:0x016e, B:57:0x0195, B:59:0x019c, B:113:0x0278, B:115:0x0297, B:121:0x02f0, B:123:0x0398, B:146:0x040a, B:152:0x041e, B:153:0x0421, B:189:0x046b, B:191:0x0472, B:193:0x0478, B:199:0x0489, B:212:0x04b5, B:214:0x04bc, B:216:0x04c2, B:219:0x04cc, B:221:0x04d2, B:222:0x04d6, B:224:0x04de, B:225:0x04e6, B:120:0x02ae, B:62:0x01b8, B:64:0x01be, B:68:0x01cd, B:70:0x01d3, B:73:0x01da, B:76:0x01e0, B:80:0x01ea, B:83:0x01fb, B:87:0x0213, B:91:0x0220, B:93:0x0232, B:95:0x0237, B:97:0x023c, B:99:0x0240, B:102:0x025b, B:103:0x0262, B:160:0x042b, B:161:0x0434, B:162:0x0435, B:163:0x043e, B:170:0x0447, B:171:0x0452), top: B:238:0x005c }] */
    /* JADX WARN: Code duplicated, block: B:226:0x04ef  */
    /* JADX WARN: Code duplicated, block: B:229:0x04f8  */
    /* JADX WARN: Code duplicated, block: B:257:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:259:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:86:0x0210  */
    /* JADX WARN: Code duplicated, block: B:89:0x021b  */
    /* JADX WARN: Code duplicated, block: B:90:0x021e  */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v20 */
    /* JADX WARN: Type inference failed for: r17v1 */
    /* JADX WARN: Type inference failed for: r17v10 */
    /* JADX WARN: Type inference failed for: r17v2 */
    /* JADX WARN: Type inference failed for: r17v3 */
    /* JADX WARN: Type inference failed for: r17v6 */
    /* JADX WARN: Type inference failed for: r17v8 */
    /* JADX WARN: Type inference failed for: r17v9 */
    /* JADX WARN: Type inference failed for: r2v8, types: [boolean] */
    /* JADX WARN: Type inference failed for: r40v0, types: [io.piupiu.chat.FrontendLicenseManager] */
    /* JADX WARN: Type inference failed for: r9v0 */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v11 */
    /* JADX WARN: Type inference failed for: r9v13 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v28 */
    /* JADX WARN: Type inference failed for: r9v29, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r9v3, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r9v30 */
    /* JADX WARN: Type inference failed for: r9v31 */
    /* JADX WARN: Type inference failed for: r9v32 */
    /* JADX WARN: Type inference failed for: r9v33 */
    /* JADX WARN: Type inference failed for: r9v34 */
    /* JADX WARN: Type inference failed for: r9v35 */
    /* JADX WARN: Type inference failed for: r9v39 */
    /* JADX WARN: Type inference failed for: r9v4, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r9v40 */
    /* JADX WARN: Type inference failed for: r9v5 */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    /* JADX INFO: renamed from: requestFreshV3, reason: merged with bridge method [inline-methods] */
    public void lambda$requestFreshV3$9(final boolean z) throws Throwable {
        byte[] cachedV3License;
        ?? r17;
        ?? r9;
        boolean z2;
        ?? r0;
        ExecutorService executorService;
        Runnable runnable;
        boolean z3;
        String string;
        String strEncodeToString;
        KeyPair orCreateDeviceKey;
        Object obj;
        String str;
        String str2;
        Object obj2;
        Certificate[] certificateChain;
        Object obj3;
        String str3;
        ?? r10 = 1;
        ?? r11 = 1;
        r10 = 1;
        if (!this.requestInProgress.compareAndSet(false, true)) {
            return;
        }
        String strSelectV3Mode = selectV3Mode(this.forceAccountMode, !this.accountAccessToken.isEmpty());
        JSONObject jSONObjectBusinessLicense = businessLicense(this.context, this.preferences.getString(V3_CACHED_KEY_ALIAS, ""));
        if (!this.forceAccountMode && jSONObjectBusinessLicense != null && "hardware".equals(jSONObjectBusinessLicense.optString("verification_level"))) {
            r17 = 300;
            r17 = 300;
            if (jSONObjectBusinessLicense.optLong("expires_at", 0L) > (System.currentTimeMillis() / 1000) + 300) {
                strSelectV3Mode = "hardware";
            }
        }
        try {
            if (!z) {
                String orCreateInstallationId = getOrCreateInstallationId(V3_INSTALLATION_ID);
                string = Settings.Secure.getString(this.context.getContentResolver(), "android_id");
                if (string != null) {
                }
                throw new SecurityException("Android ID unavailable");
            }
            try {
                try {
                    try {
                        if ("account".equals(strSelectV3Mode)) {
                            try {
                                JSONObject jSONObjectBusinessLicense2 = businessLicense(this.context, this.preferences.getString(V3_CACHED_KEY_ALIAS, ""));
                                if (jSONObjectBusinessLicense2 != null && "account".equals(jSONObjectBusinessLicense2.optString("verification_level")) && (cachedV3License = readCachedV3License()) != null) {
                                    reportUnlocked(cachedV3License, true);
                                    this.requestInProgress.set(false);
                                    return;
                                }
                            } catch (Exception unused) {
                            }
                        }
                        try {
                            String orCreateInstallationId2 = getOrCreateInstallationId(V3_INSTALLATION_ID);
                            string = Settings.Secure.getString(this.context.getContentResolver(), "android_id");
                            try {
                                if (string != null || string.trim().isEmpty()) {
                                    throw new SecurityException("Android ID unavailable");
                                }
                                r17 = 1;
                                if ("account".equals(strSelectV3Mode)) {
                                    try {
                                        orCreateDeviceKey = getOrCreateDeviceKey(V3_ACCOUNT_KEY_ALIAS, 2048);
                                        try {
                                            strEncodeToString = Base64.encodeToString(orCreateDeviceKey.getPublic().getEncoded(), 2);
                                        } catch (Exception e) {
                                            e = e;
                                            r17 = r17;
                                            r10 = "hardware";
                                            diagnostic("LIC_V3_FAIL", e);
                                            if (z) {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            } else {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            }
                                            this.requestInProgress.set(z2);
                                            if (r0 != 0) {
                                                return;
                                            } else {
                                                return;
                                            }
                                        } catch (LinkageError e2) {
                                            e = e2;
                                            r17 = r17;
                                            r10 = "hardware";
                                            diagnostic("LIC_V3_FAIL", e);
                                            if (z) {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            } else {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            }
                                            this.requestInProgress.set(z2);
                                            if (r0 != 0) {
                                                return;
                                            } else {
                                                return;
                                            }
                                        }
                                    } catch (LicenseException e3) {
                                        e = e3;
                                        strSelectV3Mode = strSelectV3Mode;
                                        r9 = "hardware";
                                    } catch (Exception e4) {
                                        e = e4;
                                        r17 = r17;
                                        r10 = "hardware";
                                        diagnostic("LIC_V3_FAIL", e);
                                        if (z) {
                                            if (z) {
                                                z2 = false;
                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                            } else {
                                                z2 = false;
                                            }
                                            r0 = z2;
                                        } else {
                                            if (z) {
                                                z2 = false;
                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                            } else {
                                                z2 = false;
                                            }
                                            r0 = z2;
                                        }
                                        this.requestInProgress.set(z2);
                                        if (r0 != 0) {
                                            return;
                                        } else {
                                            return;
                                        }
                                    } catch (LinkageError e5) {
                                        e = e5;
                                        r17 = r17;
                                        r10 = "hardware";
                                        diagnostic("LIC_V3_FAIL", e);
                                        if (z) {
                                            if (z) {
                                                z2 = false;
                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                            } else {
                                                z2 = false;
                                            }
                                            r0 = z2;
                                        } else {
                                            if (z) {
                                                z2 = false;
                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                            } else {
                                                z2 = false;
                                            }
                                            r0 = z2;
                                        }
                                        this.requestInProgress.set(z2);
                                        if (r0 != 0) {
                                            return;
                                        } else {
                                            return;
                                        }
                                    } catch (Throwable th) {
                                        th = th;
                                        this.requestInProgress.set(false);
                                        throw th;
                                    }
                                } else {
                                    strEncodeToString = "";
                                    orCreateDeviceKey = null;
                                }
                                try {
                                    beginStage("正在连接授权服务...");
                                    KeyPair keyPair = orCreateDeviceKey;
                                    JSONObject jSONObjectPostForm = postForm(V3_CHALLENGE_URL, INSTALLATION_ID_V1, orCreateInstallationId2, "bundle_version", this.frontend.getBundleVersion(), "bundle_sha256", this.frontend.getBundleSha256(), "verification_level", strSelectV3Mode, "android_id", string, "device_public_key", strEncodeToString, "account_access_token", this.accountAccessToken, "account_device_id", this.accountDeviceId);
                                    if (jSONObjectPostForm.getInt("protocol_version") != 3 || !this.frontend.getKeyId().equals(jSONObjectPostForm.getString("key_id")) || !strSelectV3Mode.equals(jSONObjectPostForm.getString("verification_level"))) {
                                        throw new SecurityException("V3 challenge downgrade or identity mismatch");
                                    }
                                    boolean zIsSignatureCheckEnabled = isSignatureCheckEnabled(jSONObjectPostForm.opt("signature_check_enabled"));
                                    String string2 = jSONObjectPostForm.getString("challenge_id");
                                    String string3 = jSONObjectPostForm.getString("challenge");
                                    byte[] bArrDecode = Base64.decode(string3, 0);
                                    if (bArrDecode.length != 32) {
                                        throw new SecurityException("Invalid V3 challenge");
                                    }
                                    JSONArray jSONArray = new JSONArray();
                                    if (!zIsSignatureCheckEnabled) {
                                        KeyPair orCreateDeviceKey2 = getOrCreateDeviceKey(V3_UNVERIFIED_KEY_ALIAS, 2048);
                                        diagnostic("LIC_V3_VERIFICATION_DISABLED", null);
                                        keyPair = orCreateDeviceKey2;
                                        str = V3_ACCOUNT_KEY_ALIAS;
                                        str2 = "verification_level";
                                        r11 = "hardware";
                                        str3 = V3_UNVERIFIED_KEY_ALIAS;
                                    } else if ("hardware".equals(strSelectV3Mode)) {
                                        try {
                                            String string4 = this.preferences.getString(V3_CACHED_KEY_ALIAS, "");
                                            Context context = this.context;
                                            str = V3_ACCOUNT_KEY_ALIAS;
                                            JSONObject jSONObjectBusinessLicense3 = businessLicense(context, string4 == null ? "" : string4);
                                            KeyPair existingDeviceKey = (string4 == null || string4.isEmpty()) ? null : getExistingDeviceKey(string4);
                                            if (isAttestedV3Alias(string4) && existingDeviceKey != null && jSONObjectBusinessLicense3 != null) {
                                                keyPair = existingDeviceKey;
                                                if ("hardware".equals(jSONObjectBusinessLicense3.optString("verification_level"))) {
                                                    str2 = "verification_level";
                                                    obj = "hardware";
                                                    try {
                                                        try {
                                                            obj2 = obj;
                                                            if (jSONObjectBusinessLicense3.optLong("expires_at", 0L) > (System.currentTimeMillis() / 1000) + 300) {
                                                                obj3 = obj;
                                                            }
                                                        } catch (LicenseException e6) {
                                                            e = e6;
                                                            strSelectV3Mode = strSelectV3Mode;
                                                            r9 = obj;
                                                            diagnostic("LIC_V3_REJECT", e);
                                                            if (z == 0) {
                                                                z3 = false;
                                                            } else {
                                                                if (r9.equals(strSelectV3Mode)) {
                                                                }
                                                                if (r9.equals(strSelectV3Mode)) {
                                                                    reportAccountRequired();
                                                                } else if (isAccountSessionError(e.code)) {
                                                                    reportAccountInvalid(e.getMessage());
                                                                } else {
                                                                    reportFailure(e.getMessage(), e.rejected);
                                                                }
                                                                z3 = false;
                                                            }
                                                            this.requestInProgress.set(false);
                                                            if (z3) {
                                                                return;
                                                            } else {
                                                                return;
                                                            }
                                                        }
                                                    } catch (Exception e7) {
                                                        e = e7;
                                                        r10 = obj;
                                                        strSelectV3Mode = strSelectV3Mode;
                                                        diagnostic("LIC_V3_FAIL", e);
                                                        if (z) {
                                                            if (z) {
                                                                z2 = false;
                                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                            } else {
                                                                z2 = false;
                                                            }
                                                            r0 = z2;
                                                        } else {
                                                            if (z) {
                                                                z2 = false;
                                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                            } else {
                                                                z2 = false;
                                                            }
                                                            r0 = z2;
                                                        }
                                                        this.requestInProgress.set(z2);
                                                        if (r0 != 0) {
                                                            return;
                                                        } else {
                                                            return;
                                                        }
                                                    } catch (LinkageError e8) {
                                                        e = e8;
                                                        r10 = obj;
                                                        strSelectV3Mode = strSelectV3Mode;
                                                        diagnostic("LIC_V3_FAIL", e);
                                                        if (z) {
                                                            if (z) {
                                                                z2 = false;
                                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                            } else {
                                                                z2 = false;
                                                            }
                                                            r0 = z2;
                                                        } else {
                                                            if (z) {
                                                                z2 = false;
                                                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                            } else {
                                                                z2 = false;
                                                            }
                                                            r0 = z2;
                                                        }
                                                        this.requestInProgress.set(z2);
                                                        if (r0 != 0) {
                                                            return;
                                                        } else {
                                                            return;
                                                        }
                                                    }
                                                } else {
                                                    str2 = "verification_level";
                                                    obj2 = "hardware";
                                                }
                                                if (V3_ATTESTED_KEY_ALIAS_A.equals(string4)) {
                                                    string4 = V3_ATTESTED_KEY_ALIAS_B;
                                                } else {
                                                    string4 = V3_ATTESTED_KEY_ALIAS_A;
                                                }
                                                deleteDeviceKey(string4);
                                                beginStage("正在验证设备...");
                                                KeyPair keyPairCreateAttestedDeviceKey = createAttestedDeviceKey(string4, bArrDecode);
                                                certificateChain = getCertificateChain(string4);
                                                if (certificateChain != null) {
                                                }
                                                throw new SecurityException("Hardware attestation certificate chain unavailable");
                                            }
                                            str2 = "verification_level";
                                            obj2 = "hardware";
                                            if (V3_ATTESTED_KEY_ALIAS_A.equals(string4)) {
                                                string4 = V3_ATTESTED_KEY_ALIAS_B;
                                            } else {
                                                string4 = V3_ATTESTED_KEY_ALIAS_A;
                                            }
                                            deleteDeviceKey(string4);
                                            beginStage("正在验证设备...");
                                            KeyPair keyPairCreateAttestedDeviceKey2 = createAttestedDeviceKey(string4, bArrDecode);
                                            certificateChain = getCertificateChain(string4);
                                            if (certificateChain != null || certificateChain.length < 2 || certificateChain.length > 8) {
                                                throw new SecurityException("Hardware attestation certificate chain unavailable");
                                            }
                                            int length = certificateChain.length;
                                            int i = 0;
                                            while (i < length) {
                                                jSONArray.put(Base64.encodeToString(certificateChain[i].getEncoded(), 2));
                                                i++;
                                                string4 = string4;
                                            }
                                            keyPair = keyPairCreateAttestedDeviceKey2;
                                            obj3 = obj2;
                                            str3 = string4;
                                            r11 = obj3;
                                        } catch (LicenseException e9) {
                                            e = e9;
                                            obj = "hardware";
                                        } catch (Exception e10) {
                                            e = e10;
                                            r10 = "hardware";
                                            strSelectV3Mode = strSelectV3Mode;
                                            diagnostic("LIC_V3_FAIL", e);
                                            if (z) {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            } else {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            }
                                            this.requestInProgress.set(z2);
                                            if (r0 != 0) {
                                                return;
                                            } else {
                                                return;
                                            }
                                        } catch (LinkageError e11) {
                                            e = e11;
                                            r10 = "hardware";
                                            strSelectV3Mode = strSelectV3Mode;
                                            diagnostic("LIC_V3_FAIL", e);
                                            if (z) {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            } else {
                                                if (z) {
                                                    z2 = false;
                                                    reportFailure("无法连接授权服务器，请检查网络后重试", false);
                                                } else {
                                                    z2 = false;
                                                }
                                                r0 = z2;
                                            }
                                            this.requestInProgress.set(z2);
                                            if (r0 != 0) {
                                                return;
                                            } else {
                                                return;
                                            }
                                        }
                                    } else {
                                        str = V3_ACCOUNT_KEY_ALIAS;
                                        str2 = "verification_level";
                                        r11 = "hardware";
                                        str3 = str;
                                    }
                                    try {
                                        String strEncodeToString2 = Base64.encodeToString(keyPair.getPublic().getEncoded(), 2);
                                        String strSha256Hex = sha256Hex(keyPair.getPublic().getEncoded());
                                        String str4 = "account".equals(strSelectV3Mode) ? new String(Base64.decode(jSONObjectPostForm.getString("proof_payload"), 0), StandardCharsets.UTF_8) : canonical("3", string2, string3, orCreateInstallationId2, this.frontend.getBundleVersion(), this.frontend.getBundleSha256(), this.frontend.getKeyId(), strSelectV3Mode, strSha256Hex, sha256Hex(string.getBytes(StandardCharsets.UTF_8)), "");
                                        Signature signature = Signature.getInstance("SHA256withRSA");
                                        signature.initSign(keyPair.getPrivate());
                                        signature.update(str4.getBytes(StandardCharsets.UTF_8));
                                        String strEncodeToString3 = Base64.encodeToString(signature.sign(), 2);
                                        beginStage("正在获取解密密钥...");
                                        JSONObject jSONObjectPostForm2 = postForm(V3_ISSUE_URL, "challenge_id", string2, INSTALLATION_ID_V1, orCreateInstallationId2, "bundle_version", this.frontend.getBundleVersion(), "bundle_sha256", this.frontend.getBundleSha256(), str2, strSelectV3Mode, "android_id", string, "device_public_key", strEncodeToString2, "device_signature", strEncodeToString3, "attestation_chain", jSONArray.toString(), "account_access_token", this.accountAccessToken, "account_device_id", this.accountDeviceId);
                                        String str5 = strSelectV3Mode;
                                        byte[] bArrVerifyAndUnwrapV3License = verifyAndUnwrapV3License(jSONObjectPostForm2, keyPair.getPrivate(), strSha256Hex, orCreateInstallationId2, str5);
                                        try {
                                            String string5 = this.preferences.getString(V3_CACHED_KEY_ALIAS, "");
                                            if ((string5 == null || string5.isEmpty()) && !this.accountAccessToken.isEmpty()) {
                                                String str6 = str;
                                                if (getExistingDeviceKey(str6) != null) {
                                                    string5 = str6;
                                                }
                                            }
                                            SharedPreferences.Editor editorPutString = this.preferences.edit().putString(V3_CACHED_LICENSE, jSONObjectPostForm2.toString()).putString(V3_CACHED_KEY_ALIAS, str3);
                                            if (zIsSignatureCheckEnabled && r11.equals(str5) && string5 != null && !string5.isEmpty() && !string5.equals(str3)) {
                                                editorPutString.putString("migration_from_" + str3, string5);
                                            }
                                            if (!editorPutString.commit()) {
                                                throw new IllegalStateException("Unable to persist verified license");
                                            }
                                            diagnostic("LIC_V3_ISSUE_OK", null);
                                            reportUnlocked(bArrVerifyAndUnwrapV3License, false);
                                            Arrays.fill(bArrVerifyAndUnwrapV3License, (byte) 0);
                                            this.requestInProgress.set(false);
                                            return;
                                        } catch (Throwable th2) {
                                            Arrays.fill(bArrVerifyAndUnwrapV3License, (byte) 0);
                                            throw th2;
                                        }
                                    } catch (LicenseException e12) {
                                        e = e12;
                                        strSelectV3Mode = strSelectV3Mode;
                                    }
                                } catch (LicenseException e13) {
                                    e = e13;
                                    r11 = "hardware";
                                }
                            } catch (LicenseException e14) {
                                e = e14;
                            } catch (Exception e15) {
                                e = e15;
                            } catch (LinkageError e16) {
                                e = e16;
                            }
                        } catch (LicenseException e17) {
                            e = e17;
                        }
                        r11 = "hardware";
                        r9 = r11;
                    } catch (LinkageError e18) {
                        e = e18;
                        r17 = 1;
                        r10 = "hardware";
                        diagnostic("LIC_V3_FAIL", e);
                        if (z || !r10.equals(strSelectV3Mode) || this.accountAccessToken.isEmpty()) {
                            if (z) {
                                z2 = false;
                                reportFailure("无法连接授权服务器，请检查网络后重试", false);
                            } else {
                                z2 = false;
                            }
                            r0 = z2;
                        } else {
                            r0 = r17;
                            z2 = false;
                        }
                        this.requestInProgress.set(z2);
                        if (r0 != 0 || this.executor.isShutdown()) {
                            return;
                        }
                        this.forceAccountMode = r17;
                        executorService = this.executor;
                        runnable = new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda5
                            @Override // java.lang.Runnable
                            public final void run() throws Throwable {
                                this.f$0.lambda$requestFreshV3$9(z);
                            }
                        };
                        executorService.execute(runnable);
                    }
                } catch (Exception e19) {
                    e = e19;
                    r17 = 1;
                    r10 = "hardware";
                    diagnostic("LIC_V3_FAIL", e);
                    if (z) {
                        if (z) {
                            z2 = false;
                            reportFailure("无法连接授权服务器，请检查网络后重试", false);
                        } else {
                            z2 = false;
                        }
                        r0 = z2;
                    } else {
                        if (z) {
                            z2 = false;
                            reportFailure("无法连接授权服务器，请检查网络后重试", false);
                        } else {
                            z2 = false;
                        }
                        r0 = z2;
                    }
                    this.requestInProgress.set(z2);
                    if (r0 != 0) {
                        return;
                    } else {
                        return;
                    }
                }
            } catch (LicenseException e20) {
                e = e20;
                strSelectV3Mode = strSelectV3Mode;
                r9 = "hardware";
                diagnostic("LIC_V3_REJECT", e);
                if (z == 0) {
                    z3 = false;
                } else {
                    if (r9.equals(strSelectV3Mode)) {
                    }
                    if (r9.equals(strSelectV3Mode)) {
                        reportAccountRequired();
                    } else if (isAccountSessionError(e.code)) {
                        reportAccountInvalid(e.getMessage());
                    } else {
                        reportFailure(e.getMessage(), e.rejected);
                    }
                    z3 = false;
                }
                this.requestInProgress.set(false);
                if (z3) {
                    return;
                } else {
                    return;
                }
            }
            diagnostic("LIC_V3_REJECT", e);
            if (z == 0) {
                z3 = false;
            } else if (r9.equals(strSelectV3Mode) || this.accountAccessToken.isEmpty()) {
                if (r9.equals(strSelectV3Mode)) {
                    reportAccountRequired();
                } else if (isAccountSessionError(e.code)) {
                    reportAccountInvalid(e.getMessage());
                } else {
                    reportFailure(e.getMessage(), e.rejected);
                }
                z3 = false;
            } else {
                z3 = true;
            }
            this.requestInProgress.set(false);
            if (z3 || this.executor.isShutdown()) {
                return;
            }
            this.forceAccountMode = true;
            executorService = this.executor;
            runnable = new Runnable() { // from class: io.piupiu.chat.FrontendLicenseManager$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() throws Throwable {
                    this.f$0.lambda$requestFreshV3$9(z);
                }
            };
            executorService.execute(runnable);
        } catch (Throwable th3) {
            th = th3;
        }
    }

    static String selectV3Mode(boolean z, boolean z2) {
        return (z && z2) ? "account" : "hardware";
    }

    static boolean isSignatureCheckEnabled(Object obj) {
        return !Boolean.FALSE.equals(obj);
    }

    static boolean isAttestedV3Alias(String str) {
        return V3_ATTESTED_KEY_ALIAS_A.equals(str) || V3_ATTESTED_KEY_ALIAS_B.equals(str);
    }

    private byte[] readCachedV3License() throws Exception {
        KeyPair existingDeviceKey;
        String string = this.preferences.getString(V3_CACHED_LICENSE, "");
        String string2 = this.preferences.getString(V3_CACHED_KEY_ALIAS, "");
        if (string == null || string.trim().isEmpty() || string2 == null || string2.trim().isEmpty() || (existingDeviceKey = getExistingDeviceKey(string2)) == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject(string);
        return verifyAndUnwrapV3License(jSONObject, existingDeviceKey.getPrivate(), sha256Hex(existingDeviceKey.getPublic().getEncoded()), getOrCreateInstallationId(V3_INSTALLATION_ID), jSONObject.getString("verification_level"));
    }

    private boolean shouldRenewV3License() {
        try {
            String string = this.preferences.getString(V3_CACHED_LICENSE, "");
            return string == null || string.trim().isEmpty() || new JSONObject(string).getLong("expires_at") - (System.currentTimeMillis() / 1000) <= RENEWAL_WINDOW_SECONDS;
        } catch (Exception unused) {
            return true;
        }
    }

    private byte[] verifyAndUnwrapV3License(JSONObject jSONObject, PrivateKey privateKey, String str, String str2, String str3) throws Exception {
        if (jSONObject.getInt("protocol_version") != 3) {
            throw new SecurityException("V3 license downgrade");
        }
        String string = jSONObject.getString("license_id");
        String string2 = jSONObject.getString("verification_level");
        String string3 = jSONObject.getString("bundle_version");
        String string4 = jSONObject.getString("bundle_sha256");
        String string5 = jSONObject.getString("key_id");
        String string6 = jSONObject.getString(INSTALLATION_ID_V1);
        String string7 = jSONObject.getString("device_public_key_sha256");
        String strOptString = jSONObject.optString("account_subject", "");
        long j = jSONObject.getLong("issued_at");
        long j2 = jSONObject.getLong("expires_at");
        String string8 = jSONObject.getString("wrapped_key");
        if (!str3.equals(string2) || !str2.equals(string6) || !str.equalsIgnoreCase(string7) || !this.frontend.getBundleVersion().equals(string3) || !this.frontend.getBundleSha256().equalsIgnoreCase(string4) || !this.frontend.getKeyId().equals(string5)) {
            throw new SecurityException("V3 license identity mismatch");
        }
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        if (j > jCurrentTimeMillis + 300 || j2 <= jCurrentTimeMillis) {
            throw new SecurityException("V3 license expired");
        }
        String strCanonical = canonical(string, "3", string2, string3, string4, string5, string6, string7, strOptString, String.valueOf(j), String.valueOf(j2), string8);
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(readLicenseServerPublicKey());
        signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
        if (!signature.verify(Base64.decode(jSONObject.getString("license_signature"), 0))) {
            throw new SecurityException("V3 license signature mismatch");
        }
        Cipher cipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding");
        cipher.init(2, privateKey);
        byte[] bArrDoFinal = cipher.doFinal(Base64.decode(string8, 0));
        if (bArrDoFinal.length == 32) {
            return bArrDoFinal;
        }
        throw new SecurityException("V3 license returned an invalid key");
    }

    private void reportAccountRequired() {
        if (this.startupCompleted.compareAndSet(false, true)) {
            this.mainHandler.removeCallbacks(this.startupWatchdog);
            Callback callback = this.callback;
            if (callback != null) {
                callback.onAccountRequired();
            }
        }
    }

    private void reportAccountInvalid(String str) {
        this.accountAccessToken = "";
        this.accountDeviceId = "";
        if (this.startupCompleted.compareAndSet(false, true)) {
            this.mainHandler.removeCallbacks(this.startupWatchdog);
            Callback callback = this.callback;
            if (callback != null) {
                if (str == null || str.trim().isEmpty()) {
                    str = "登录状态已失效，请重新登录";
                }
                callback.onAccountInvalid(str);
            }
        }
    }

    static boolean isAccountSessionError(String str) {
        return "session_invalid".equals(str) || "session_missing".equals(str) || "account_auth_required".equals(str);
    }

    private void diagnostic(String str, Throwable th) {
        String simpleName = th == null ? PluginMethod.RETURN_NONE : th.getClass().getSimpleName();
        String bundleSha256 = this.frontend.getBundleSha256();
        if (bundleSha256.length() > 12) {
            bundleSha256 = bundleSha256.substring(0, 12);
        }
        Log.i(TAG, "event=" + str + " bundle=" + bundleSha256 + " error=" + simpleName);
    }

    /* JADX WARN: Code duplicated, block: B:49:0x01d1  */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    private void requestFreshLicense(boolean z) {
        boolean z2;
        AtomicBoolean atomicBoolean;
        KeyPair keyPairCreateAttestedDeviceKey;
        String str = ATTESTATION_KEY_ALIAS_A;
        String str2 = "challenge_id";
        try {
            if (this.requestInProgress.compareAndSet(false, true)) {
                try {
                    JSONObject jSONObjectPostForm = postForm(CHALLENGE_URL, INSTALLATION_ID_V1, getOrCreateInstallationId(ATTESTATION_INSTALLATION_ID), "bundle_version", this.frontend.getBundleVersion(), "bundle_sha256", this.frontend.getBundleSha256());
                    String string = jSONObjectPostForm.getString("challenge_id");
                    String string2 = jSONObjectPostForm.getString("challenge");
                    byte[] bArrDecode = Base64.decode(string2, 0);
                    if (bArrDecode.length != 32) {
                        throw new SecurityException("Invalid attestation challenge");
                    }
                    boolean zIsSignatureCheckEnabled = isSignatureCheckEnabled(jSONObjectPostForm.opt("signature_check_enabled"));
                    JSONArray jSONArray = new JSONArray();
                    if (!zIsSignatureCheckEnabled) {
                        str = ATTESTATION_UNVERIFIED_KEY_ALIAS;
                        keyPairCreateAttestedDeviceKey = getOrCreateDeviceKey(ATTESTATION_UNVERIFIED_KEY_ALIAS, 2048);
                    } else {
                        if (ATTESTATION_KEY_ALIAS_A.equals(this.preferences.getString(ATTESTATION_ACTIVE_ALIAS, ""))) {
                            str = ATTESTATION_KEY_ALIAS_B;
                        }
                        deleteDeviceKey(str);
                        keyPairCreateAttestedDeviceKey = createAttestedDeviceKey(str, bArrDecode);
                        Certificate[] certificateChain = getCertificateChain(str);
                        if (certificateChain == null || certificateChain.length < 2 || certificateChain.length > 8) {
                            throw new SecurityException("Hardware attestation certificate chain unavailable");
                        }
                        int length = certificateChain.length;
                        int i = 0;
                        while (i < length) {
                            jSONArray.put(Base64.encodeToString(certificateChain[i].getEncoded(), 2));
                            i++;
                            str2 = str2;
                            str = str;
                        }
                    }
                    String str3 = str2;
                    String orCreateInstallationId = getOrCreateInstallationId(ATTESTATION_INSTALLATION_ID);
                    String strEncodeToString = Base64.encodeToString(keyPairCreateAttestedDeviceKey.getPublic().getEncoded(), 2);
                    String strSha256Hex = sha256Hex(keyPairCreateAttestedDeviceKey.getPublic().getEncoded());
                    String strCanonical = canonical("android-key-attestation-v1", string, string2, orCreateInstallationId, this.frontend.getBundleVersion(), this.frontend.getBundleSha256(), strSha256Hex);
                    Signature signature = Signature.getInstance("SHA256withRSA");
                    signature.initSign(keyPairCreateAttestedDeviceKey.getPrivate());
                    signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
                    JSONObject jSONObjectPostForm2 = postForm(ISSUE_URL, str3, string, INSTALLATION_ID_V1, orCreateInstallationId, "bundle_version", this.frontend.getBundleVersion(), "bundle_sha256", this.frontend.getBundleSha256(), "device_public_key", strEncodeToString, "device_signature", Base64.encodeToString(signature.sign(), 2), "attestation_chain", jSONArray.toString());
                    byte[] bArrVerifyAndUnwrapLicense = verifyAndUnwrapLicense(jSONObjectPostForm2, keyPairCreateAttestedDeviceKey.getPrivate(), strSha256Hex, orCreateInstallationId);
                    this.preferences.edit().putString(ATTESTATION_CACHED_LICENSE, jSONObjectPostForm2.toString()).putString(ATTESTATION_ACTIVE_ALIAS, str).apply();
                    reportUnlocked(bArrVerifyAndUnwrapLicense, false);
                    this.requestInProgress.set(false);
                } catch (LicenseException e) {
                    Log.w(TAG, "Frontend license request rejected: " + e.getMessage());
                    if (z) {
                        reportFailure(e.getMessage(), e.rejected);
                    }
                    atomicBoolean = this.requestInProgress;
                    z2 = false;
                    atomicBoolean.set(z2);
                } catch (Exception e2) {
                    Log.w(TAG, "Frontend license request failed", e2);
                    if (z) {
                        z2 = false;
                        reportFailure("无法连接授权服务器，请检查网络后重试", false);
                    } else {
                        z2 = false;
                    }
                    atomicBoolean = this.requestInProgress;
                    atomicBoolean.set(z2);
                } catch (LinkageError e3) {
                    Log.e(TAG, "Frontend license runtime is incompatible with this Android version", e3);
                    if (z) {
                        z2 = false;
                        reportFailure("当前系统版本暂不兼容，请更新应用后重试", false);
                    } else {
                        z2 = false;
                    }
                    atomicBoolean = this.requestInProgress;
                    atomicBoolean.set(z2);
                }
            }
        } catch (Throwable th) {
            this.requestInProgress.set(false);
            throw th;
        }
    }

    private void reportUnlocked(byte[] bArr, boolean z) {
        try {
            beginStage("正在校验应用资源...");
            Callback callback = this.callback;
            if (callback != null) {
                callback.onUnlocked(bArr, z);
            }
        } finally {
            Arrays.fill(bArr, (byte) 0);
            this.startupCompleted.set(true);
            this.mainHandler.removeCallbacks(this.startupWatchdog);
        }
    }

    private void reportFailure(String str, boolean z) {
        if (this.startupCompleted.compareAndSet(false, true)) {
            this.mainHandler.removeCallbacks(this.startupWatchdog);
            Callback callback = this.callback;
            if (callback != null) {
                callback.onFailure(str, z);
            }
        }
    }

    private byte[] readCachedLicense(String str, String str2, String str3, boolean z, int i) throws Exception {
        String string = this.preferences.getString(str, "");
        if (string == null || string.trim().isEmpty()) {
            return null;
        }
        KeyPair orCreateDeviceKey = z ? getOrCreateDeviceKey(str3, i) : getExistingDeviceKey(str3);
        if (orCreateDeviceKey == null) {
            return null;
        }
        return verifyAndUnwrapLicense(new JSONObject(string), orCreateDeviceKey.getPrivate(), sha256Hex(orCreateDeviceKey.getPublic().getEncoded()), getOrCreateInstallationId(str2));
    }

    private byte[] readCachedAttestedLicense() throws Exception {
        KeyPair existingDeviceKey;
        String string = this.preferences.getString(ATTESTATION_CACHED_LICENSE, "");
        String string2 = this.preferences.getString(ATTESTATION_ACTIVE_ALIAS, "");
        if (string == null || string.trim().isEmpty() || string2 == null || string2.trim().isEmpty() || ATTESTATION_UNVERIFIED_KEY_ALIAS.equals(string2) || (existingDeviceKey = getExistingDeviceKey(string2)) == null) {
            return null;
        }
        return verifyAndUnwrapLicense(new JSONObject(string), existingDeviceKey.getPrivate(), sha256Hex(existingDeviceKey.getPublic().getEncoded()), getOrCreateInstallationId(ATTESTATION_INSTALLATION_ID));
    }

    private boolean shouldRenewCachedAttestedLicense() {
        try {
            String string = this.preferences.getString(ATTESTATION_CACHED_LICENSE, "");
            return string == null || string.trim().isEmpty() || new JSONObject(string).getLong("expires_at") - (System.currentTimeMillis() / 1000) <= RENEWAL_WINDOW_SECONDS;
        } catch (Exception e) {
            Log.w(TAG, "Unable to inspect cached attested license expiry", e);
            return true;
        }
    }

    private byte[] verifyAndUnwrapLicense(JSONObject jSONObject, PrivateKey privateKey, String str, String str2) throws Exception {
        String string = jSONObject.getString("license_id");
        String string2 = jSONObject.getString(INSTALLATION_ID_V1);
        String string3 = jSONObject.getString("device_public_key_sha256");
        String string4 = jSONObject.getString("key_id");
        String string5 = jSONObject.getString("bundle_version");
        String string6 = jSONObject.getString("bundle_sha256");
        long j = jSONObject.getLong("issued_at");
        long j2 = jSONObject.getLong("expires_at");
        String string7 = jSONObject.getString("wrapped_key");
        String string8 = jSONObject.getString("license_signature");
        if (!str2.equals(string2) || !str.equalsIgnoreCase(string3) || !this.frontend.getKeyId().equals(string4) || !this.frontend.getBundleVersion().equals(string5) || !this.frontend.getBundleSha256().equalsIgnoreCase(string6)) {
            throw new SecurityException("Frontend license identity mismatch");
        }
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        if (j > 300 + jCurrentTimeMillis || j2 <= jCurrentTimeMillis) {
            throw new SecurityException("Frontend license expired");
        }
        String strCanonical = canonical(string, string2, string3, string4, string5, string6, String.valueOf(j), String.valueOf(j2), string7);
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(readLicenseServerPublicKey());
        signature.update(strCanonical.getBytes(StandardCharsets.UTF_8));
        if (!signature.verify(Base64.decode(string8, 0))) {
            throw new SecurityException("Frontend license signature mismatch");
        }
        Cipher cipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding");
        cipher.init(2, privateKey);
        byte[] bArrDoFinal = cipher.doFinal(Base64.decode(string7, 0));
        if (bArrDoFinal.length == 32) {
            return bArrDoFinal;
        }
        throw new SecurityException("Frontend license returned an invalid key");
    }

    static String businessKeyAlias(Context context) throws Exception {
        String string = context.getSharedPreferences(PREFS, 0).getString(V3_CACHED_KEY_ALIAS, "");
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        return (string == null || string.isEmpty() || !keyStore.containsAlias(string)) ? V3_ACCOUNT_KEY_ALIAS : string;
    }

    static String previousBusinessKeyAlias(Context context, String str) {
        return context.getSharedPreferences(PREFS, 0).getString("migration_from_" + str, "");
    }

    static JSONObject businessLicense(Context context, String str) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(PREFS, 0);
        if (!str.equals(sharedPreferences.getString(V3_CACHED_KEY_ALIAS, ""))) {
            return null;
        }
        try {
            return new JSONObject(sharedPreferences.getString(V3_CACHED_LICENSE, ""));
        } catch (Exception unused) {
            return null;
        }
    }

    static KeyPair getOrCreateDeviceKey(String str, int i) throws Exception {
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        if (!keyStore.containsAlias(str)) {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA", "AndroidKeyStore");
            keyPairGenerator.initialize(new KeyGenParameterSpec.Builder(str, 6).setKeySize(i).setDigests("SHA-1", "SHA-256").setEncryptionPaddings("OAEPPadding").setSignaturePaddings("PKCS1").setUserAuthenticationRequired(false).build());
            keyPairGenerator.generateKeyPair();
            keyStore.load(null);
        }
        return readDeviceKey(keyStore, str);
    }

    static KeyPair createAttestedDeviceKey(String str, byte[] bArr) throws Exception {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA", "AndroidKeyStore");
        keyPairGenerator.initialize(new KeyGenParameterSpec.Builder(str, 6).setKeySize(2048).setDigests("SHA-1", "SHA-256").setEncryptionPaddings("OAEPPadding").setSignaturePaddings("PKCS1").setAttestationChallenge(bArr).setUserAuthenticationRequired(false).build());
        keyPairGenerator.generateKeyPair();
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        return readDeviceKey(keyStore, str);
    }

    private Certificate[] getCertificateChain(String str) throws Exception {
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        return keyStore.getCertificateChain(str);
    }

    private void deleteDeviceKey(String str) throws Exception {
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        if (keyStore.containsAlias(str)) {
            keyStore.deleteEntry(str);
        }
    }

    private KeyPair getExistingDeviceKey(String str) throws Exception {
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        if (keyStore.containsAlias(str)) {
            return readDeviceKey(keyStore, str);
        }
        return null;
    }

    private static KeyPair readDeviceKey(KeyStore keyStore, String str) throws Exception {
        PrivateKey privateKey = (PrivateKey) keyStore.getKey(str, null);
        Certificate certificate = keyStore.getCertificate(str);
        if (privateKey == null || certificate == null) {
            throw new IllegalStateException("Device license key unavailable");
        }
        return new KeyPair(certificate.getPublicKey(), privateKey);
    }

    /* JADX WARN: Code duplicated, block: B:31:0x0065 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    private PublicKey readLicenseServerPublicKey() throws Exception {
        InputStream inputStreamOpenRawResource = this.context.getResources().openRawResource(C0954R.raw.frontend_license_public);
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                byte[] bArr = new byte[4096];
                while (true) {
                    int i = inputStreamOpenRawResource.read(bArr);
                    if (i < 0) {
                        break;
                    }
                    if (i > 0) {
                        byteArrayOutputStream.write(bArr, 0, i);
                    }
                    if (inputStreamOpenRawResource != null) {
                        try {
                            inputStreamOpenRawResource.close();
                        } catch (Throwable th) {
                            th.addSuppressed(th);
                        }
                    }
                    throw th;
                }
                PublicKey publicKeyGeneratePublic = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(Base64.decode(byteArrayOutputStream.toString("UTF-8").replace("-----BEGIN PUBLIC KEY-----", "").replace("-----END PUBLIC KEY-----", "").replaceAll("\\s+", ""), 0)));
                byteArrayOutputStream.close();
                if (inputStreamOpenRawResource != null) {
                    inputStreamOpenRawResource.close();
                }
                return publicKeyGeneratePublic;
            } catch (Throwable th2) {
                try {
                    byteArrayOutputStream.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        } catch (Throwable th4) {
            if (inputStreamOpenRawResource != null) {
                inputStreamOpenRawResource.close();
            }
            throw th4;
        }
    }

    private String getOrCreateInstallationId(String str) {
        String string = this.preferences.getString(str, "");
        if (string != null && !string.trim().isEmpty()) {
            return string;
        }
        String string2 = UUID.randomUUID().toString();
        this.preferences.edit().putString(str, string2).apply();
        return string2;
    }

    private static boolean usesCompatibilityProfile() {
        return usesCompatibilityProfile(Build.VERSION.SDK_INT);
    }

    private static String activeInstallationId() {
        return usesCompatibilityProfile() ? INSTALLATION_ID_COMPAT : INSTALLATION_ID_V1;
    }

    private static String activeCachedLicense() {
        return usesCompatibilityProfile() ? CACHED_LICENSE_COMPAT : CACHED_LICENSE_V1;
    }

    private static String activeDeviceKeyAlias() {
        return usesCompatibilityProfile() ? DEVICE_KEY_ALIAS_COMPAT : DEVICE_KEY_ALIAS_V1;
    }

    private static int activeDeviceKeySize() {
        return deviceKeySizeForSdk(Build.VERSION.SDK_INT);
    }

    static int deviceKeySizeForSdk(int i) {
        return usesCompatibilityProfile(i) ? 2048 : 3072;
    }

    private String getCurrentAppSignatureSha256() throws Exception {
        byte[] byteArray;
        if (Build.VERSION.SDK_INT >= 28) {
            byteArray = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 134217728).signingInfo.getApkContentsSigners()[0].toByteArray();
        } else {
            byteArray = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 64).signatures[0].toByteArray();
        }
        return sha256Hex(byteArray).toUpperCase(Locale.ROOT);
    }

    private JSONObject postForm(String str, String... strArr) throws Exception {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strArr.length; i += 2) {
            if (sb.length() > 0) {
                sb.append(Typography.amp);
            }
            sb.append(URLEncoder.encode(strArr[i], "UTF-8"));
            sb.append('=');
            sb.append(URLEncoder.encode(strArr[i + 1], "UTF-8"));
        }
        byte[] bytes = sb.toString().getBytes(StandardCharsets.UTF_8);
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
        try {
            httpURLConnection.setRequestMethod("POST");
            int i2 = NETWORK_TIMEOUT_MS;
            httpURLConnection.setConnectTimeout(NETWORK_TIMEOUT_MS);
            if (str.equals(V3_ISSUE_URL) || str.equals(ISSUE_URL)) {
                i2 = LICENSE_ISSUE_READ_TIMEOUT_MS;
            }
            httpURLConnection.setReadTimeout(i2);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setRequestProperty("Accept", "application/json");
            httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            httpURLConnection.setFixedLengthStreamingMode(bytes.length);
            OutputStream outputStream = httpURLConnection.getOutputStream();
            try {
                outputStream.write(bytes);
                if (outputStream != null) {
                    outputStream.close();
                }
                int responseCode = httpURLConnection.getResponseCode();
                JSONObject jSONObject = new JSONObject(readUtf8((responseCode < 200 || responseCode >= 400) ? httpURLConnection.getErrorStream() : httpURLConnection.getInputStream()));
                if (responseCode < 200 || responseCode >= 300 || !"success".equals(jSONObject.optString(NotificationCompat.CATEGORY_STATUS))) {
                    throw new LicenseException(jSONObject.optString("message", "正版验证失败"), responseCode == 401 || responseCode == 403, jSONObject.optString("code", ""));
                }
                httpURLConnection.disconnect();
                return jSONObject;
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
        } catch (Throwable th3) {
            httpURLConnection.disconnect();
            throw th3;
        }
    }

    /* JADX WARN: Code duplicated, block: B:33:0x0037 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    private static String readUtf8(InputStream inputStream) throws Exception {
        if (inputStream == null) {
            return "{}";
        }
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                byte[] bArr = new byte[4096];
                while (true) {
                    int i = inputStream.read(bArr);
                    if (i < 0) {
                        break;
                    }
                    if (i > 0) {
                        byteArrayOutputStream.write(bArr, 0, i);
                    }
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (Throwable th) {
                            th.addSuppressed(th);
                        }
                    }
                    throw th;
                }
                String string = byteArrayOutputStream.toString("UTF-8");
                byteArrayOutputStream.close();
                if (inputStream != null) {
                    inputStream.close();
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
            if (inputStream != null) {
                inputStream.close();
            }
            throw th4;
        }
    }

    static String canonical(String... strArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strArr.length; i++) {
            if (i > 0) {
                sb.append('\n');
            }
            sb.append(strArr[i]);
        }
        return sb.toString();
    }

    private static String sha256Hex(byte[] bArr) throws Exception {
        byte[] bArrDigest = MessageDigest.getInstance("SHA-256").digest(bArr);
        StringBuilder sb = new StringBuilder(bArrDigest.length * 2);
        for (byte b : bArrDigest) {
            sb.append(String.format(Locale.ROOT, "%02x", Byte.valueOf(b)));
        }
        return sb.toString();
    }

    private static final class LicenseException extends Exception {
        final String code;
        final boolean rejected;

        LicenseException(String str, boolean z, String str2) {
            super(str);
            this.rejected = z;
            this.code = str2 == null ? "" : str2;
        }
    }
}
