package io.piupiu.chat;

import android.app.DownloadManager;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.webkit.CookieManager;
import android.webkit.DownloadListener;
import android.webkit.JavascriptInterface;
import android.webkit.URLUtil;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.core.app.NotificationCompat;
import androidx.core.content.ContextCompat;
import androidx.core.content.FileProvider;
import androidx.core.os.EnvironmentCompat;
import androidx.core.view.DisplayCutoutCompat;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;
import androidx.vectordrawable.graphics.drawable.PathInterpolatorCompat;
import androidx.webkit.internal.AssetHelper;
import com.getcapacitor.BridgeActivity;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import net.zetetic.database.sqlcipher.SQLiteDatabase;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends BridgeActivity {
    private static final String APP_INTEGRITY_CHECK_URL = "https://www.piupiuchan.top/includes/app_integrity_check.php";
    private static final int CHAT_REPLY_NOTIFICATION_BASE_ID = 2000;
    private static final String CHAT_REPLY_NOTIFICATION_CHANNEL_ID = "piupiu_chat_reply_native";
    private static final String NATIVE_BRIDGE_VERSION = "chat-reply-notification-v2";
    private static final String OFFICIAL_PACKAGE_NAME = "io.piupiu.chat";
    private static final String OFFICIAL_SIGNATURE_SHA256 = "0290F67FD446FD51D54B8188880523EAFD74CB469CC58A880EE24333ED7AF004";
    private String apkUrlToDownload;
    private File currentUpdateFile;
    private FrontendLicenseManager frontendLicenseManager;
    private Runnable pendingLegacyStorageAction;
    private ProtectedFrontendManager protectedFrontendManager;
    private WebView webView;
    private final ExecutorService executorService = Executors.newSingleThreadExecutor();
    private final ExecutorService businessProofExecutor = Executors.newSingleThreadExecutor();
    private boolean notificationPermissionGranted = false;
    private volatile boolean appInForeground = true;
    private volatile boolean integrityGatePassed = false;
    private volatile boolean integrityCheckInProgress = false;
    private volatile boolean integrityRejected = false;
    private final ActivityResultLauncher<String> requestNotificationPermissionLauncher = registerForActivityResult(new ActivityResultContracts.RequestPermission(), new ActivityResultCallback() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda1
        @Override // androidx.activity.result.ActivityResultCallback
        public final void onActivityResult(Object obj) {
            this.f$0.lambda$new$0((Boolean) obj);
        }
    });
    private final ActivityResultLauncher<String> requestLegacyStoragePermissionLauncher = registerForActivityResult(new ActivityResultContracts.RequestPermission(), new ActivityResultCallback() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda2
        @Override // androidx.activity.result.ActivityResultCallback
        public final void onActivityResult(Object obj) {
            this.f$0.lambda$new$1((Boolean) obj);
        }
    });
    private final ActivityResultLauncher<Intent> requestInstallPermissionLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda3
        @Override // androidx.activity.result.ActivityResultCallback
        public final void onActivityResult(Object obj) {
            this.f$0.lambda$new$3((ActivityResult) obj);
        }
    });

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$0(Boolean bool) {
        this.notificationPermissionGranted = bool.booleanValue();
        if (bool.booleanValue()) {
            Log.d("PiuPiuKeepAlive", "Notification permission granted");
        } else {
            Log.w("PiuPiuKeepAlive", "Notification permission denied - foreground service notification may not show");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$1(Boolean bool) {
        Runnable runnable = this.pendingLegacyStorageAction;
        this.pendingLegacyStorageAction = null;
        if (bool.booleanValue() && runnable != null) {
            runnable.run();
        } else {
            if (bool.booleanValue()) {
                return;
            }
            Toast.makeText(this, "未授予存储权限，无法保存文件", 0).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$3(ActivityResult activityResult) {
        if (Build.VERSION.SDK_INT >= 26) {
            if (getPackageManager().canRequestPackageInstalls()) {
                String str = this.apkUrlToDownload;
                if (str == null || str.isEmpty()) {
                    return;
                }
                downloadAndInstall(this.apkUrlToDownload);
                return;
            }
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda9
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$new$2();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$2() {
        Toast.makeText(this, "未授予安装权限，无法更新应用", 0).show();
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        if (!this.integrityGatePassed) {
            finishAffinity();
            return;
        }
        WebView webView = this.webView;
        if (webView == null) {
            super.onBackPressed();
        } else {
            webView.evaluateJavascript("(function(){if(window.piupiuCloseOfficialWebModal){window.piupiuCloseOfficialWebModal();return true;}return false;})()", new ValueCallback() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda14
                @Override // android.webkit.ValueCallback
                public final void onReceiveValue(Object obj) {
                    this.f$0.lambda$onBackPressed$4((String) obj);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onBackPressed$4(String str) {
        if ("true".equals(str)) {
            return;
        }
        if (!this.webView.canGoBack()) {
            super.onBackPressed();
        } else {
            this.webView.goBack();
        }
    }

    @Override // com.getcapacitor.BridgeActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        hideSystemUI();
    }

    @Override // com.getcapacitor.BridgeActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onStart() {
        super.onStart();
        this.appInForeground = true;
        if (!this.integrityGatePassed || this.integrityRejected) {
            return;
        }
        KeepAliveService.stop(this);
        Log.d("PiuPiuKeepAlive", "App in foreground, stopping keep-alive service");
    }

    @Override // com.getcapacitor.BridgeActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onStop() {
        super.onStop();
        this.appInForeground = false;
        if (!this.integrityGatePassed || this.integrityRejected) {
            return;
        }
        Log.d("PiuPiuKeepAlive", "onStop called, starting keep-alive service...");
        try {
            KeepAliveService.start(this);
            Log.d("PiuPiuKeepAlive", "Keep-alive service start command sent");
        } catch (Exception e) {
            Log.e("PiuPiuKeepAlive", "Failed to start keep-alive service: " + e.getMessage(), e);
        }
    }

    private void requestNotificationPermission() {
        if (Build.VERSION.SDK_INT >= 33) {
            if (ContextCompat.checkSelfPermission(this, "android.permission.POST_NOTIFICATIONS") != 0) {
                Log.d("PiuPiuKeepAlive", "Requesting notification permission...");
                this.requestNotificationPermissionLauncher.launch("android.permission.POST_NOTIFICATIONS");
                return;
            } else {
                this.notificationPermissionGranted = true;
                Log.d("PiuPiuKeepAlive", "Notification permission already granted");
                return;
            }
        }
        this.notificationPermissionGranted = true;
        Log.d("PiuPiuKeepAlive", "Notification permission not required (API < 33)");
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (z) {
            hideSystemUI();
        }
    }

    private void hideSystemUI() {
        WindowInsetsControllerCompat windowInsetsController = ViewCompat.getWindowInsetsController(getWindow().getDecorView());
        if (windowInsetsController != null) {
            windowInsetsController.hide(WindowInsetsCompat.Type.statusBars());
            windowInsetsController.setSystemBarsBehavior(2);
        }
    }

    @Override // com.getcapacitor.BridgeActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        WebView.setWebContentsDebuggingEnabled(false);
        this.webView = getBridge().getWebView();
        ProtectedFrontendManager protectedFrontendManager = new ProtectedFrontendManager(this);
        this.protectedFrontendManager = protectedFrontendManager;
        if (protectedFrontendManager.isProtectedBuild()) {
            getBridge().setWebViewClient(new ProtectedBridgeWebViewClient(getBridge(), this.protectedFrontendManager));
            this.frontendLicenseManager = new FrontendLicenseManager(this, this.protectedFrontendManager);
        }
        this.webView.addJavascriptInterface(new WebAppInterface(this), "AndroidDownloader");
        this.webView.setVisibility(0);
        startIntegrityGate();
    }

    private void startIntegrityGate() {
        ProtectedFrontendManager protectedFrontendManager = this.protectedFrontendManager;
        if (protectedFrontendManager == null || !protectedFrontendManager.isProtectedBuild()) {
            completeVerifiedStartup();
        } else {
            if (this.integrityCheckInProgress) {
                return;
            }
            this.integrityCheckInProgress = true;
            this.integrityRejected = false;
            this.protectedFrontendManager.markChecking();
            this.frontendLicenseManager.start(new C09521());
        }
    }

    /* JADX INFO: renamed from: io.piupiu.chat.MainActivity$1 */
    class C09521 implements FrontendLicenseManager.Callback {
        C09521() {
        }

        @Override // io.piupiu.chat.FrontendLicenseManager.Callback
        public void onUnlocked(byte[] bArr, boolean z) {
            try {
                MainActivity.this.protectedFrontendManager.unlock(bArr);
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$1$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$onUnlocked$0();
                    }
                });
            } catch (Exception e) {
                Log.e("PiuPiuIntegrity", "Protected frontend unlock failed", e);
                onFailure("前端资源校验失败，请重新安装官方版本", true);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onUnlocked$0() {
            MainActivity.this.integrityCheckInProgress = false;
            MainActivity.this.integrityRejected = false;
            MainActivity.this.completeVerifiedStartup();
        }

        @Override // io.piupiu.chat.FrontendLicenseManager.Callback
        public void onFailure(String str, final boolean z) {
            MainActivity.this.protectedFrontendManager.markError(str, z);
            MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$1$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$onFailure$1(z);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onFailure$1(boolean z) {
            MainActivity.this.integrityCheckInProgress = false;
            MainActivity.this.integrityRejected = z;
            if (z) {
                KeepAliveService.stop(MainActivity.this);
            }
        }

        @Override // io.piupiu.chat.FrontendLicenseManager.Callback
        public void onAccountRequired() {
            MainActivity.this.protectedFrontendManager.markAccountRequired();
            MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$onAccountRequired$2();
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onAccountRequired$2() {
            MainActivity.this.integrityCheckInProgress = false;
            MainActivity.this.integrityRejected = false;
        }

        @Override // io.piupiu.chat.FrontendLicenseManager.Callback
        public void onAccountInvalid(String str) {
            MainActivity.this.protectedFrontendManager.markAccountInvalid(str);
            MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$1$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$onAccountInvalid$3();
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onAccountInvalid$3() {
            MainActivity.this.integrityCheckInProgress = false;
            MainActivity.this.integrityRejected = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void retryProtectedFrontendLicense() {
        ProtectedFrontendManager protectedFrontendManager;
        if (this.frontendLicenseManager == null || (protectedFrontendManager = this.protectedFrontendManager) == null || protectedFrontendManager.isReady()) {
            return;
        }
        this.integrityCheckInProgress = true;
        this.integrityRejected = false;
        this.protectedFrontendManager.markChecking();
        this.frontendLicenseManager.retry();
    }

    private IntegrityGateResult requestIntegrityDecision(String str, String str2, boolean z) throws Exception {
        HttpURLConnection httpURLConnection = null;
        try {
            HttpURLConnection httpURLConnection2 = (HttpURLConnection) new URL(APP_INTEGRITY_CHECK_URL).openConnection();
            try {
                httpURLConnection2.setRequestMethod("POST");
                httpURLConnection2.setConnectTimeout(PathInterpolatorCompat.MAX_NUM_POINTS);
                httpURLConnection2.setReadTimeout(PathInterpolatorCompat.MAX_NUM_POINTS);
                httpURLConnection2.setDoOutput(true);
                httpURLConnection2.setUseCaches(false);
                httpURLConnection2.setRequestProperty("Accept", "application/json");
                httpURLConnection2.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
                String str3 = "app_platform=android&app_package_name=" + URLEncoder.encode(str, "UTF-8") + "&app_signature_sha256=" + URLEncoder.encode(str2, "UTF-8");
                JSONObject jSONObject = new JSONObject(new BusinessRequestSigner(this).sign(new JSONObject().put("url", APP_INTEGRITY_CHECK_URL).put("method", "POST").put("body", str3).toString()));
                if (jSONObject.optBoolean("error", false)) {
                    throw new SecurityException("Device request proof unavailable");
                }
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("headers");
                if (jSONObjectOptJSONObject != null) {
                    Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        httpURLConnection2.setRequestProperty(next, jSONObjectOptJSONObject.getString(next));
                    }
                }
                byte[] bytes = str3.getBytes(StandardCharsets.UTF_8);
                httpURLConnection2.setFixedLengthStreamingMode(bytes.length);
                OutputStream outputStream = httpURLConnection2.getOutputStream();
                try {
                    outputStream.write(bytes);
                    if (outputStream != null) {
                        outputStream.close();
                    }
                    int responseCode = httpURLConnection2.getResponseCode();
                    JSONObject jSONObject2 = new JSONObject(readUtf8Response((responseCode < 200 || responseCode >= 400) ? httpURLConnection2.getErrorStream() : httpURLConnection2.getInputStream()));
                    boolean zOptBoolean = jSONObject2.optBoolean("enabled", false);
                    boolean zOptBoolean2 = jSONObject2.optBoolean("valid", false);
                    if (responseCode >= 500) {
                        Log.w("PiuPiuIntegrity", "Integrity server error " + responseCode + "; continuing offline");
                        IntegrityGateResult integrityGateResultAllow = IntegrityGateResult.allow();
                        if (httpURLConnection2 != null) {
                            httpURLConnection2.disconnect();
                        }
                        return integrityGateResultAllow;
                    }
                    if (!zOptBoolean) {
                        IntegrityGateResult integrityGateResultAllow2 = IntegrityGateResult.allow();
                        if (httpURLConnection2 != null) {
                            httpURLConnection2.disconnect();
                        }
                        return integrityGateResultAllow2;
                    }
                    if (responseCode < 200 || responseCode >= 300 || !zOptBoolean2 || !z) {
                        IntegrityGateResult integrityGateResultReject = IntegrityGateResult.reject(jSONObject2.optString("message", "当前安装包不是官方版本，请重新安装正版应用"));
                        if (httpURLConnection2 != null) {
                            httpURLConnection2.disconnect();
                        }
                        return integrityGateResultReject;
                    }
                    IntegrityGateResult integrityGateResultAllow3 = IntegrityGateResult.allow();
                    if (httpURLConnection2 != null) {
                        httpURLConnection2.disconnect();
                    }
                    return integrityGateResultAllow3;
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
                th = th3;
                httpURLConnection = httpURLConnection2;
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    /* JADX WARN: Code duplicated, block: B:32:0x0033 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    private String readUtf8Response(InputStream inputStream) throws Exception {
        if (inputStream == null) {
            throw new IllegalStateException("Integrity server returned an empty response");
        }
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                byte[] bArr = new byte[4096];
                while (true) {
                    int i = inputStream.read(bArr);
                    if (i == -1) {
                        break;
                    }
                    byteArrayOutputStream.write(bArr, 0, i);
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

    private void handleIntegrityDecision(IntegrityGateResult integrityGateResult) {
        this.integrityCheckInProgress = false;
        if (isFinishing() || isDestroyed()) {
            return;
        }
        if (integrityGateResult.allowed) {
            completeVerifiedStartup();
            return;
        }
        this.integrityRejected = true;
        KeepAliveService.stop(this);
        WebView webView = this.webView;
        if (webView != null) {
            webView.stopLoading();
        }
        finishAffinity();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void completeVerifiedStartup() {
        if (this.integrityGatePassed || isFinishing() || isDestroyed()) {
            return;
        }
        this.integrityGatePassed = true;
        initializeVerifiedApp();
        WebView webView = this.webView;
        if (webView != null) {
            webView.setVisibility(0);
        }
    }

    private void initializeVerifiedApp() {
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
        hideSystemUI();
        requestNotificationPermission();
        ViewCompat.setOnApplyWindowInsetsListener(getBridge().getWebView(), new OnApplyWindowInsetsListener() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda18
            @Override // androidx.core.view.OnApplyWindowInsetsListener
            public final WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                return this.f$0.lambda$initializeVerifiedApp$5(view, windowInsetsCompat);
            }
        });
        this.webView.setVerticalScrollBarEnabled(false);
        this.webView.setHorizontalScrollBarEnabled(false);
        this.webView.setScrollBarStyle(0);
        WebSettings settings = this.webView.getSettings();
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        this.webView.setDownloadListener(new DownloadListener() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda19
            @Override // android.webkit.DownloadListener
            public final void onDownloadStart(String str, String str2, String str3, String str4, long j) {
                this.f$0.lambda$initializeVerifiedApp$7(str, str2, str3, str4, j);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ WindowInsetsCompat lambda$initializeVerifiedApp$5(View view, WindowInsetsCompat windowInsetsCompat) {
        int i = windowInsetsCompat.getInsets(WindowInsetsCompat.Type.ime()).bottom;
        int iMax = windowInsetsCompat.getInsets(WindowInsetsCompat.Type.statusBars()).top;
        int i2 = windowInsetsCompat.getInsets(WindowInsetsCompat.Type.navigationBars()).bottom;
        DisplayCutoutCompat displayCutout = windowInsetsCompat.getDisplayCutout();
        if (displayCutout != null) {
            iMax = Math.max(iMax, displayCutout.getSafeInsetTop());
        }
        float f = getResources().getDisplayMetrics().density;
        getBridge().getWebView().evaluateJavascript("(function(){window.__piupiuWindowInsets={keyboard:" + ((int) (i / f)) + ",status:" + ((int) (iMax / f)) + ",navigation:" + ((int) (i2 / f)) + "};function apply(){var v=window.__piupiuWindowInsets;if(!v||!document.documentElement||!document.body)return;document.documentElement.style.setProperty('--keyboard-height',v.keyboard+'px');document.documentElement.style.setProperty('--status-bar-height',v.status+'px');document.documentElement.style.setProperty('--nav-bar-height',v.navigation+'px');document.body.classList.toggle('keyboard-is-visible',v.keyboard>0);}if(document.documentElement&&document.body){apply();}else if(!window.__piupiuInsetsReadyListener){window.__piupiuInsetsReadyListener=true;document.addEventListener('DOMContentLoaded',function(){window.__piupiuInsetsReadyListener=false;apply();},{once:true});}})();", null);
        return windowInsetsCompat;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initializeVerifiedApp$7(final String str, String str2, String str3, String str4, long j) {
        if (isApkDownload(str, str4, str3)) {
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda10
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$initializeVerifiedApp$6(str);
                }
            });
        } else {
            downloadWebContentToDownloads(str, str2, str3, str4);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initializeVerifiedApp$6(String str) {
        this.webView.evaluateJavascript("if(window.piupiuEmbeddedDownloadStarted){window.piupiuEmbeddedDownloadStarted(" + JSONObject.quote(str) + ");}", null);
        this.apkUrlToDownload = str;
        checkAndDownload();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void downloadWebContentToDownloads(final String str, final String str2, final String str3, final String str4) {
        if (str == null || (!str.startsWith("http://") && !str.startsWith("https://"))) {
            Log.w("PiuPiuDownload", "不支持的 WebView 下载地址: " + str);
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda15
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$downloadWebContentToDownloads$8();
                }
            });
            return;
        }
        Runnable runnable = new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda16
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$downloadWebContentToDownloads$11(str, str3, str4, str2);
            }
        };
        if (Build.VERSION.SDK_INT < 29 && ContextCompat.checkSelfPermission(this, "android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
            this.pendingLegacyStorageAction = runnable;
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda17
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$downloadWebContentToDownloads$12();
                }
            });
        } else {
            runnable.run();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadWebContentToDownloads$8() {
        Toast.makeText(this, "暂不支持该下载地址", 0).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadWebContentToDownloads$11(String str, String str2, String str3, String str4) {
        try {
            String strGuessFileName = URLUtil.guessFileName(str, str2, str3);
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(str));
            request.setTitle(strGuessFileName);
            request.setDescription("正在保存到[下载]文件夹");
            request.setNotificationVisibility(1);
            request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, strGuessFileName);
            if (str3 != null && !str3.trim().isEmpty()) {
                request.setMimeType(str3);
            }
            if (str4 != null && !str4.trim().isEmpty()) {
                request.addRequestHeader("User-Agent", str4);
            }
            String cookie = CookieManager.getInstance().getCookie(str);
            if (cookie != null && !cookie.trim().isEmpty()) {
                request.addRequestHeader("Cookie", cookie);
            }
            DownloadManager downloadManager = (DownloadManager) getSystemService("download");
            if (downloadManager == null) {
                throw new IllegalStateException("DownloadManager unavailable");
            }
            downloadManager.enqueue(request);
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$downloadWebContentToDownloads$9();
                }
            });
            Log.d("PiuPiuDownload", "已提交 WebView 下载: " + strGuessFileName + " <- " + str);
        } catch (Exception e) {
            Log.e("PiuPiuDownload", "提交 WebView 下载失败", e);
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda7
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$downloadWebContentToDownloads$10();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadWebContentToDownloads$9() {
        Toast.makeText(this, "文件将保存到[下载]文件夹", 1).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadWebContentToDownloads$10() {
        Toast.makeText(this, "下载文件失败", 0).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadWebContentToDownloads$12() {
        this.requestLegacyStoragePermissionLauncher.launch("android.permission.WRITE_EXTERNAL_STORAGE");
    }

    private static final class IntegrityGateResult {
        final boolean allowed;
        final String message;

        private IntegrityGateResult(boolean z, String str) {
            this.allowed = z;
            this.message = str;
        }

        static IntegrityGateResult allow() {
            return new IntegrityGateResult(true, "");
        }

        static IntegrityGateResult reject(String str) {
            return new IntegrityGateResult(false, str);
        }
    }

    public class WebAppInterface {
        private File binaryDownloadFile;
        private OutputStream binaryDownloadOutput;
        private Uri binaryDownloadUri;
        private final BusinessRequestSigner businessSigner;
        Context mContext;

        WebAppInterface(Context context) {
            this.businessSigner = new BusinessRequestSigner(MainActivity.this);
            this.mContext = context;
        }

        @JavascriptInterface
        public String getDatabaseStorageInfo() {
            try {
                StatFs statFs = new StatFs(this.mContext.getFilesDir().getAbsolutePath());
                File databasePath = this.mContext.getDatabasePath("piupiuSQLite.db");
                long length = databasePath.length() + new File(databasePath.getPath() + "-wal").length() + new File(databasePath.getPath() + "-shm").length();
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("availableBytes", statFs.getAvailableBytes());
                jSONObject.put("databaseBytes", length);
                return jSONObject.toString();
            } catch (Exception unused) {
                return "{}";
            }
        }

        @JavascriptInterface
        public String signBusinessRequest(String str) {
            return this.businessSigner.sign(str);
        }

        @JavascriptInterface
        public void requestBusinessProof(final String str, final String str2) {
            if (str2 == null || !str2.matches("^[a-f0-9]{32}$") || MainActivity.this.businessProofExecutor.isShutdown()) {
                return;
            }
            MainActivity.this.businessProofExecutor.execute(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$requestBusinessProof$1(str, str2);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$requestBusinessProof$1(String str, final String str2) {
            final String strSign = this.businessSigner.sign(str);
            MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda10
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$requestBusinessProof$0(str2, strSign);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$requestBusinessProof$0(String str, String str2) {
            if (MainActivity.this.isDestroyed() || MainActivity.this.getBridge() == null) {
                return;
            }
            MainActivity.this.getBridge().getWebView().evaluateJavascript("window.__piupiuBusinessProofComplete && window.__piupiuBusinessProofComplete(" + JSONObject.quote(str) + "," + str2 + ");", null);
        }

        @JavascriptInterface
        public String getAppSignatureInfo() {
            try {
                return "{\"packageName\":\"" + MainActivity.this.escapeJson(this.mContext.getPackageName()) + "\",\"signatureSha256\":\"" + MainActivity.this.escapeJson(MainActivity.this.getCurrentAppSignatureSha256()) + "\"}";
            } catch (Exception e) {
                Log.e("PiuPiuSignature", "Failed to read app signature", e);
                return "{\"packageName\":\"" + MainActivity.this.escapeJson(this.mContext.getPackageName()) + "\",\"signatureSha256\":\"\"}";
            }
        }

        @JavascriptInterface
        public String getNativeBridgeVersion() {
            return MainActivity.NATIVE_BRIDGE_VERSION;
        }

        @JavascriptInterface
        public String getProtectedFrontendState() {
            if (MainActivity.this.protectedFrontendManager == null) {
                return "{\"status\":\"unprotected\"}";
            }
            return MainActivity.this.protectedFrontendManager.getBootstrapState().toString();
        }

        @JavascriptInterface
        public void retryProtectedFrontendLicense() {
            MainActivity.this.retryProtectedFrontendLicense();
        }

        @JavascriptInterface
        public void restoreProtectedFrontendAccountSession(String str) {
            if (MainActivity.this.frontendLicenseManager != null) {
                MainActivity.this.frontendLicenseManager.restoreAccountSession(str);
            }
        }

        @JavascriptInterface
        public void submitProtectedFrontendAccountSession(String str) {
            if (MainActivity.this.frontendLicenseManager != null) {
                MainActivity.this.frontendLicenseManager.submitAccountSession(str);
            }
        }

        @JavascriptInterface
        public String getProtectedFrontendDeviceId() {
            String string = Settings.Secure.getString(this.mContext.getContentResolver(), "android_id");
            return string == null ? "" : string;
        }

        @JavascriptInterface
        public void reportProtectedFrontendError(String str) {
            String strReplaceAll = str == null ? EnvironmentCompat.MEDIA_UNKNOWN : str.replaceAll("[^A-Za-z0-9_.-]", "");
            if (strReplaceAll.length() > 64) {
                strReplaceAll = strReplaceAll.substring(0, 64);
            }
            Log.w("PiuPiuProtectedFrontend", "event=PF_SHELL_ERROR code=" + strReplaceAll);
        }

        @JavascriptInterface
        public void reportProtectedFrontendEvent(String str) {
            String strReplaceAll = str == null ? EnvironmentCompat.MEDIA_UNKNOWN : str.replaceAll("[^A-Za-z0-9_.-]", "");
            if (strReplaceAll.length() > 64) {
                strReplaceAll = strReplaceAll.substring(0, 64);
            }
            Log.i("PiuPiuProtectedFrontend", "event=PF_SHELL code=" + strReplaceAll);
        }

        @JavascriptInterface
        public void reportProtectedFrontendReady() {
            String bundleSha256 = MainActivity.this.protectedFrontendManager == null ? "" : MainActivity.this.protectedFrontendManager.getBundleSha256();
            if (bundleSha256.length() > 12) {
                bundleSha256 = bundleSha256.substring(0, 12);
            }
            Log.i("PiuPiuProtectedFrontend", "event=PF_FRONTEND_READY bundle=" + bundleSha256);
        }

        @JavascriptInterface
        public void startDownload(String str) {
            MainActivity.this.apkUrlToDownload = str;
            MainActivity.this.checkAndDownload();
        }

        @JavascriptInterface
        public void downloadFileToDownloads(final String str, String str2, final String str3) {
            final String str4;
            if (str2 == null || str2.trim().isEmpty()) {
                str4 = null;
            } else {
                str4 = "attachment; filename=\"" + str2.trim().replace("\r", "").replace("\n", "").replaceAll("[\\\\/:*?\"<>|]", "_") + "\"";
            }
            MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda16
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$downloadFileToDownloads$2(str, str4, str3);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$downloadFileToDownloads$2(String str, String str2, String str3) {
            MainActivity.this.downloadWebContentToDownloads(str, null, str2, str3);
        }

        @JavascriptInterface
        public void installApk(String str) {
            final File file = new File(str);
            if (file.exists()) {
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda15
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$installApk$3(file);
                    }
                });
            } else {
                Toast.makeText(this.mContext, "安装文件不存在: " + str, 0).show();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$installApk$3(File file) {
            MainActivity.this.installApk(file);
        }

        @JavascriptInterface
        public void prepareUpdate() {
            prepareUpdateInternal("");
        }

        @JavascriptInterface
        public void prepareUpdateForUrl(String str) {
            prepareUpdateInternal(str);
        }

        private void prepareUpdateInternal(String str) {
            try {
                MainActivity.this.cleanupOldUpdateFiles();
                File updateFileForUrl = MainActivity.this.getUpdateFileForUrl(str);
                if (updateFileForUrl.exists()) {
                    updateFileForUrl.delete();
                }
                MainActivity.this.currentUpdateFile = updateFileForUrl;
                Log.d("PiuPiuUpdate", "Prepared update file: " + updateFileForUrl.getAbsolutePath());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @JavascriptInterface
        public boolean appendUpdateChunk(String str) {
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(MainActivity.this.getCurrentUpdateFile(), true);
                try {
                    fileOutputStream.write(Base64.decode(str, 0));
                    fileOutputStream.close();
                    return true;
                } catch (Throwable th) {
                    try {
                        fileOutputStream.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                    throw th;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }

        @JavascriptInterface
        public boolean finishAndInstallUpdate() {
            MainActivity mainActivity = MainActivity.this;
            return mainActivity.installApk(mainActivity.getCurrentUpdateFile());
        }

        @JavascriptInterface
        public void abortUpdate() {
            File file = MainActivity.this.currentUpdateFile;
            if (file != null) {
                file.delete();
            }
        }

        @JavascriptInterface
        /* JADX INFO: renamed from: savePngToGallery, reason: merged with bridge method [inline-methods] */
        public void lambda$savePngToGallery$4(final String str, final String str2) {
            if (runWithLegacyStoragePermission(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda13
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$savePngToGallery$4(str, str2);
                }
            })) {
                MainActivity.this.executorService.execute(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda14
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$savePngToGallery$7(str, str2);
                    }
                });
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$savePngToGallery$7(String str, String str2) {
            try {
                byte[] bArrDecode = Base64.decode(str, 0);
                ContentResolver contentResolver = this.mContext.getContentResolver();
                ContentValues contentValues = new ContentValues();
                contentValues.put("_display_name", str2);
                contentValues.put("mime_type", "image/png");
                if (Build.VERSION.SDK_INT >= 29) {
                    contentValues.put("relative_path", Environment.DIRECTORY_PICTURES + File.separator + "PiuPiuChat");
                }
                Uri uriInsert = contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues);
                if (uriInsert == null) {
                    throw new Exception("无法创建 MediaStore 条目");
                }
                OutputStream outputStreamOpenOutputStream = contentResolver.openOutputStream(uriInsert);
                try {
                    if (outputStreamOpenOutputStream == null) {
                        throw new Exception("无法打开输出流");
                    }
                    outputStreamOpenOutputStream.write(bArrDecode);
                    if (outputStreamOpenOutputStream != null) {
                        outputStreamOpenOutputStream.close();
                    }
                    MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda6
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.f$0.lambda$savePngToGallery$5();
                        }
                    });
                    Log.d("PiuPiuGallery", "成功保存到相册: " + uriInsert.toString());
                } catch (Throwable th) {
                    if (outputStreamOpenOutputStream != null) {
                        try {
                            outputStreamOpenOutputStream.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            } catch (Exception e) {
                e.printStackTrace();
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda7
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$savePngToGallery$6();
                    }
                });
                Log.e("PiuPiuGallery", "保存到相册时出错: ", e);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$savePngToGallery$5() {
            Toast.makeText(this.mContext, "已保存到相册", 1).show();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$savePngToGallery$6() {
            Toast.makeText(this.mContext, "保存到相册失败！", 0).show();
        }

        @JavascriptInterface
        /* JADX INFO: renamed from: saveTextFile, reason: merged with bridge method [inline-methods] */
        public void lambda$saveTextFile$8(final String str, final String str2) {
            if (runWithLegacyStoragePermission(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$saveTextFile$8(str, str2);
                }
            })) {
                MainActivity.this.executorService.execute(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda5
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$saveTextFile$11(str2, str);
                    }
                });
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$saveTextFile$11(String str, String str2) {
            String absolutePath;
            try {
                byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
                if (Build.VERSION.SDK_INT >= 29) {
                    ContentResolver contentResolver = this.mContext.getContentResolver();
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("_display_name", str2);
                    contentValues.put("mime_type", str2.toLowerCase(Locale.ROOT).endsWith(".txt") ? AssetHelper.DEFAULT_MIME_TYPE : "application/json");
                    contentValues.put("relative_path", Environment.DIRECTORY_DOWNLOADS);
                    contentValues.put("is_pending", (Integer) 1);
                    Uri uriInsert = contentResolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, contentValues);
                    if (uriInsert == null) {
                        throw new IllegalStateException("Unable to create download entry");
                    }
                    try {
                        OutputStream outputStreamOpenOutputStream = contentResolver.openOutputStream(uriInsert, "w");
                        try {
                            if (outputStreamOpenOutputStream == null) {
                                throw new IllegalStateException("Unable to open download output stream");
                            }
                            outputStreamOpenOutputStream.write(bytes);
                            if (outputStreamOpenOutputStream != null) {
                                outputStreamOpenOutputStream.close();
                            }
                            contentValues.clear();
                            contentValues.put("is_pending", (Integer) 0);
                            contentResolver.update(uriInsert, contentValues, null, null);
                            absolutePath = uriInsert.toString();
                        } catch (Throwable th) {
                            if (outputStreamOpenOutputStream != null) {
                                try {
                                    outputStreamOpenOutputStream.close();
                                } catch (Throwable th2) {
                                    th.addSuppressed(th2);
                                }
                            }
                            throw th;
                        }
                    } catch (Exception e) {
                        contentResolver.delete(uriInsert, null, null);
                        throw e;
                    }
                } else {
                    File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
                    if (!externalStoragePublicDirectory.exists() && !externalStoragePublicDirectory.mkdirs()) {
                        throw new IllegalStateException("Unable to create Downloads directory");
                    }
                    File file = new File(externalStoragePublicDirectory, str2);
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    try {
                        fileOutputStream.write(bytes);
                        fileOutputStream.close();
                        absolutePath = file.getAbsolutePath();
                    } catch (Throwable th3) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th4) {
                            th3.addSuppressed(th4);
                        }
                        throw th3;
                    }
                }
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$saveTextFile$9();
                    }
                });
                Log.d("PiuPiuSaver", "成功保存文本文件: " + absolutePath);
            } catch (Exception e2) {
                e2.printStackTrace();
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$saveTextFile$10();
                    }
                });
                Log.e("PiuPiuSaver", "保存文本文件时出错: ", e2);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$saveTextFile$9() {
            Toast.makeText(this.mContext, "文件已保存到[下载]文件夹", 1).show();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$saveTextFile$10() {
            Toast.makeText(this.mContext, "保存文件失败！", 0).show();
        }

        @JavascriptInterface
        public synchronized boolean prepareBinaryDownload(String str, String str2) {
            if (Build.VERSION.SDK_INT < 29 && ContextCompat.checkSelfPermission(this.mContext, "android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$prepareBinaryDownload$12();
                    }
                });
                return false;
            }
            cancelBinaryDownload();
            try {
                if (Build.VERSION.SDK_INT >= 29) {
                    ContentResolver contentResolver = this.mContext.getContentResolver();
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("_display_name", str);
                    if (str2 == null || str2.isEmpty()) {
                        str2 = "application/octet-stream";
                    }
                    contentValues.put("mime_type", str2);
                    contentValues.put("relative_path", Environment.DIRECTORY_DOWNLOADS);
                    contentValues.put("is_pending", (Integer) 1);
                    Uri uriInsert = contentResolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, contentValues);
                    this.binaryDownloadUri = uriInsert;
                    if (uriInsert == null) {
                        throw new IllegalStateException("Unable to create binary download entry");
                    }
                    OutputStream outputStreamOpenOutputStream = contentResolver.openOutputStream(uriInsert, "w");
                    this.binaryDownloadOutput = outputStreamOpenOutputStream;
                    if (outputStreamOpenOutputStream == null) {
                        throw new IllegalStateException("Unable to open binary download output stream");
                    }
                } else {
                    File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
                    if (!externalStoragePublicDirectory.exists() && !externalStoragePublicDirectory.mkdirs()) {
                        throw new IllegalStateException("Unable to create Downloads directory");
                    }
                    this.binaryDownloadFile = new File(externalStoragePublicDirectory, str);
                    this.binaryDownloadOutput = new FileOutputStream(this.binaryDownloadFile);
                }
                return true;
            } catch (Exception e) {
                Log.e("PiuPiuSaver", "准备二进制下载失败", e);
                cancelBinaryDownload();
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$prepareBinaryDownload$13();
                    }
                });
                return false;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$prepareBinaryDownload$12() {
            Toast.makeText(this.mContext, "未授予存储权限，无法保存备份文件", 0).show();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$prepareBinaryDownload$13() {
            Toast.makeText(this.mContext, "创建备份文件失败", 0).show();
        }

        @JavascriptInterface
        public synchronized boolean appendBinaryDownloadChunk(String str) {
            if (this.binaryDownloadOutput == null) {
                return false;
            }
            try {
                this.binaryDownloadOutput.write(Base64.decode(str, 0));
                return true;
            } catch (Exception e) {
                Log.e("PiuPiuSaver", "写入二进制下载分片失败", e);
                cancelBinaryDownload();
                return false;
            }
        }

        @JavascriptInterface
        public synchronized boolean finishBinaryDownload() {
            try {
                OutputStream outputStream = this.binaryDownloadOutput;
                if (outputStream == null) {
                    return false;
                }
                outputStream.flush();
                this.binaryDownloadOutput.close();
                this.binaryDownloadOutput = null;
                if (Build.VERSION.SDK_INT >= 29 && this.binaryDownloadUri != null) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("is_pending", (Integer) 0);
                    this.mContext.getContentResolver().update(this.binaryDownloadUri, contentValues, null, null);
                    this.binaryDownloadUri = null;
                }
                this.binaryDownloadFile = null;
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda11
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$finishBinaryDownload$14();
                    }
                });
                return true;
            } catch (Exception e) {
                Log.e("PiuPiuSaver", "完成二进制下载失败", e);
                cancelBinaryDownload();
                MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda12
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.lambda$finishBinaryDownload$15();
                    }
                });
                return false;
            }
            throw th;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$finishBinaryDownload$14() {
            Toast.makeText(this.mContext, "文件已保存到[下载]文件夹", 1).show();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$finishBinaryDownload$15() {
            Toast.makeText(this.mContext, "保存备份文件失败", 0).show();
        }

        /* JADX WARN: Code duplicated, block: B:13:0x0014 A[Catch: Exception -> 0x001f, all -> 0x0022, TRY_LEAVE, TryCatch #7 {Exception -> 0x001f, all -> 0x0022, blocks: (B:11:0x0010, B:13:0x0014), top: B:36:0x0010, outer: #6 }] */
        /* JADX WARN: Code duplicated, block: B:14:0x001f A[Catch: all -> 0x003e, DONT_GENERATE, TRY_ENTER, TryCatch #6 {, blocks: (B:7:0x0009, B:14:0x001f, B:23:0x0035, B:25:0x0039, B:26:0x003b, B:16:0x0023, B:17:0x0025, B:9:0x000d, B:10:0x000f, B:11:0x0010, B:13:0x0014, B:4:0x0002, B:6:0x0006, B:18:0x0026, B:20:0x002a, B:22:0x0030), top: B:35:0x0002, inners: #7, #6, #5 }] */
        /* JADX WARN: Code duplicated, block: B:20:0x002a A[Catch: Exception -> 0x0035, all -> 0x0038, TryCatch #5 {Exception -> 0x0035, all -> 0x0038, blocks: (B:18:0x0026, B:20:0x002a, B:22:0x0030), top: B:39:0x0026, outer: #6 }] */
        /* JADX WARN: Multi-variable type inference failed */
        @JavascriptInterface
        public synchronized void cancelBinaryDownload() {
            File file;
            try {
                OutputStream outputStream = this.binaryDownloadOutput;
                if (outputStream != null) {
                    outputStream.close();
                    try {
                        if (this.binaryDownloadUri != null) {
                            this.mContext.getContentResolver().delete(this.binaryDownloadUri, null, null);
                            try {
                                file = this.binaryDownloadFile;
                                if (file != null && file.exists()) {
                                    this.binaryDownloadFile.delete();
                                }
                            } catch (Exception unused) {
                            } finally {
                                this.binaryDownloadFile = null;
                            }
                        } else {
                            file = this.binaryDownloadFile;
                            if (file != null) {
                                this.binaryDownloadFile.delete();
                            }
                        }
                    } catch (Exception unused2) {
                    } finally {
                        this.binaryDownloadUri = null;
                    }
                } else if (this.binaryDownloadUri != null) {
                    this.mContext.getContentResolver().delete(this.binaryDownloadUri, null, null);
                    file = this.binaryDownloadFile;
                    if (file != null) {
                        this.binaryDownloadFile.delete();
                    }
                } else {
                    file = this.binaryDownloadFile;
                    if (file != null) {
                        this.binaryDownloadFile.delete();
                    }
                }
            } catch (Exception unused3) {
            } finally {
                this.binaryDownloadOutput = null;
            }
            throw th;
        }

        @JavascriptInterface
        public void showChatReplyNotification(String str, String str2) {
            MainActivity.this.showChatReplyNotificationNative(str, str2);
        }

        private boolean runWithLegacyStoragePermission(Runnable runnable) {
            if (Build.VERSION.SDK_INT >= 29 || ContextCompat.checkSelfPermission(this.mContext, "android.permission.WRITE_EXTERNAL_STORAGE") == 0) {
                return true;
            }
            MainActivity.this.pendingLegacyStorageAction = runnable;
            MainActivity.this.runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$WebAppInterface$$ExternalSyntheticLambda9
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$runWithLegacyStoragePermission$16();
                }
            });
            return false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$runWithLegacyStoragePermission$16() {
            MainActivity.this.requestLegacyStoragePermissionLauncher.launch("android.permission.WRITE_EXTERNAL_STORAGE");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showChatReplyNotificationNative(String str, String str2) {
        try {
            if (this.appInForeground) {
                Log.d("PiuPiuChatNotify", "App is foreground; skip chat reply notification");
                return;
            }
            String strSanitizeNotificationText = sanitizeNotificationText(str, "PiuPiu酱 已回复", 80);
            String strSanitizeNotificationText2 = sanitizeNotificationText(str2, "新的回复已经生成完成。", 180);
            KeepAliveService.showReplyCompleted(this, strSanitizeNotificationText, strSanitizeNotificationText2);
            if (Build.VERSION.SDK_INT >= 33 && ContextCompat.checkSelfPermission(this, "android.permission.POST_NOTIFICATIONS") != 0) {
                Log.w("PiuPiuChatNotify", "POST_NOTIFICATIONS permission is not granted; foreground service notification was updated instead");
                return;
            }
            createChatReplyNotificationChannel();
            Intent intent = new Intent(this, (Class<?>) MainActivity.class);
            intent.setFlags(335544320);
            PendingIntent activity = PendingIntent.getActivity(this, CHAT_REPLY_NOTIFICATION_BASE_ID, intent, 201326592);
            int iCurrentTimeMillis = ((int) (System.currentTimeMillis() % 100000)) + CHAT_REPLY_NOTIFICATION_BASE_ID;
            NotificationCompat.Builder visibility = new NotificationCompat.Builder(this, CHAT_REPLY_NOTIFICATION_CHANNEL_ID).setContentTitle(strSanitizeNotificationText).setContentText(strSanitizeNotificationText2).setStyle(new NotificationCompat.BigTextStyle().bigText(strSanitizeNotificationText2)).setSmallIcon(C0954R.drawable.ic_launcher_foreground).setContentIntent(activity).setPriority(1).setAutoCancel(true).setOngoing(false).setCategory(NotificationCompat.CATEGORY_MESSAGE).setVisibility(1);
            NotificationManager notificationManager = (NotificationManager) getSystemService("notification");
            if (notificationManager == null) {
                Log.e("PiuPiuChatNotify", "NotificationManager is null");
            } else {
                notificationManager.notify(iCurrentTimeMillis, visibility.build());
                Log.d("PiuPiuChatNotify", "Chat reply notification posted");
            }
        } catch (Exception e) {
            Log.e("PiuPiuChatNotify", "Failed to show chat reply notification", e);
        }
    }

    private void createChatReplyNotificationChannel() {
        if (Build.VERSION.SDK_INT < 26) {
            return;
        }
        NotificationChannel notificationChannel = new NotificationChannel(CHAT_REPLY_NOTIFICATION_CHANNEL_ID, "聊天回复提醒", 4);
        notificationChannel.setDescription("AI 回复完成时提醒你查看");
        notificationChannel.setShowBadge(true);
        notificationChannel.enableLights(true);
        notificationChannel.enableVibration(true);
        NotificationManager notificationManager = (NotificationManager) getSystemService(NotificationManager.class);
        if (notificationManager != null) {
            notificationManager.createNotificationChannel(notificationChannel);
        }
    }

    private String sanitizeNotificationText(String str, String str2, int i) {
        String strTrim = str == null ? "" : str.replaceAll("\\s+", " ").trim();
        if (!strTrim.isEmpty()) {
            str2 = strTrim;
        }
        return str2.length() > i ? str2.substring(0, i - 1) + "…" : str2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getCurrentAppSignatureSha256() throws Exception {
        byte[] byteArray;
        if (Build.VERSION.SDK_INT >= 28) {
            Signature[] apkContentsSigners = getPackageManager().getPackageInfo(getPackageName(), 134217728).signingInfo.getApkContentsSigners();
            if (apkContentsSigners == null || apkContentsSigners.length == 0) {
                return "";
            }
            byteArray = apkContentsSigners[0].toByteArray();
        } else {
            Signature[] signatureArr = getPackageManager().getPackageInfo(getPackageName(), 64).signatures;
            if (signatureArr == null || signatureArr.length == 0) {
                return "";
            }
            byteArray = signatureArr[0].toByteArray();
        }
        return sha256Hex(byteArray);
    }

    private String sha256Hex(byte[] bArr) throws Exception {
        byte[] bArrDigest = MessageDigest.getInstance("SHA-256").digest(bArr);
        StringBuilder sb = new StringBuilder(bArrDigest.length * 2);
        for (byte b : bArrDigest) {
            sb.append(String.format("%02X", Byte.valueOf(b)));
        }
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String escapeJson(String str) {
        if (str == null) {
            return "";
        }
        return str.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkAndDownload() {
        if (Build.VERSION.SDK_INT >= 26 && !getPackageManager().canRequestPackageInstalls()) {
            requestInstallPermission();
        } else {
            downloadAndInstall(this.apkUrlToDownload);
        }
    }

    private void requestInstallPermission() {
        Intent intent = new Intent("android.settings.MANAGE_UNKNOWN_APP_SOURCES");
        intent.setData(Uri.fromParts("package", getPackageName(), null));
        this.requestInstallPermissionLauncher.launch(intent);
    }

    private void downloadAndInstall(final String str) {
        this.executorService.execute(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                this.f$0.lambda$downloadAndInstall$17(str);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:85:0x014e  */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r14v0 */
    /* JADX WARN: Type inference failed for: r14v1, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r14v10 */
    /* JADX WARN: Type inference failed for: r14v3 */
    /* JADX WARN: Type inference failed for: r14v4 */
    /* JADX WARN: Type inference failed for: r14v5 */
    /* JADX WARN: Type inference failed for: r14v6, types: [int] */
    /* JADX WARN: Type inference failed for: r14v7, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r14v8 */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v2, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r7v1, types: [java.io.FileOutputStream] */
    public /* synthetic */ void lambda$downloadAndInstall$17(String str) throws Throwable {
        HttpURLConnection httpURLConnection;
        ?? r14;
        HttpURLConnection httpURLConnection2 = null;
        updateFileForUrl = null;
        File updateFileForUrl = null;
        try {
            try {
                HttpURLConnection httpURLConnection3 = (HttpURLConnection) new URL(str).openConnection();
                try {
                    try {
                        httpURLConnection3.setConnectTimeout(15000);
                        httpURLConnection3.setReadTimeout(30000);
                        httpURLConnection3.connect();
                        int contentLength = httpURLConnection3.getContentLength();
                        Log.d("PiuPiuUpdate", "File length: " + contentLength);
                        if (contentLength <= 0) {
                            try {
                                runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda0
                                    @Override // java.lang.Runnable
                                    public final void run() {
                                        this.f$0.lambda$downloadAndInstall$13();
                                    }
                                });
                            } catch (Throwable th) {
                                th = th;
                                httpURLConnection2 = httpURLConnection3;
                                if (httpURLConnection2 != null) {
                                    httpURLConnection2.disconnect();
                                }
                                throw th;
                            }
                        }
                        updateFileForUrl = getUpdateFileForUrl(str);
                        this.currentUpdateFile = updateFileForUrl;
                        cleanupOldUpdateFiles(updateFileForUrl);
                        if (updateFileForUrl.exists()) {
                            updateFileForUrl.delete();
                        }
                        try {
                            byte[] bArr = new byte[4096];
                            InputStream inputStream = httpURLConnection3.getInputStream();
                            try {
                                ?? fileOutputStream = new FileOutputStream(updateFileForUrl);
                                byte b = -1;
                                int i = -1;
                                long j = 0;
                                ?? r5 = inputStream;
                                while (true) {
                                    try {
                                        try {
                                            r14 = r5.read(bArr);
                                            if (r14 == b) {
                                                break;
                                            }
                                            j += (long) r14;
                                            fileOutputStream.write(bArr, 0, r14);
                                            if (contentLength > 0) {
                                                HttpURLConnection httpURLConnection4 = httpURLConnection3;
                                                r14 = r5;
                                                try {
                                                    final int iMin = (int) Math.min(99L, (100 * j) / ((long) contentLength));
                                                    if (iMin > i) {
                                                        Log.d("PiuPiuUpdate", "Download progress: " + iMin + "%");
                                                        runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda11
                                                            @Override // java.lang.Runnable
                                                            public final void run() {
                                                                this.f$0.lambda$downloadAndInstall$14(iMin);
                                                            }
                                                        });
                                                        i = iMin;
                                                    }
                                                    httpURLConnection3 = httpURLConnection4;
                                                    r5 = r14;
                                                } catch (Throwable th2) {
                                                    th = th2;
                                                }
                                            }
                                            b = -1;
                                            r5 = r5;
                                            th = th2;
                                        } catch (Throwable th3) {
                                            th = th3;
                                            Throwable th4 = th;
                                            if (r14 == 0) {
                                                throw th4;
                                            }
                                            try {
                                                r14.close();
                                                throw th4;
                                            } catch (Throwable th5) {
                                                th4.addSuppressed(th5);
                                                throw th4;
                                            }
                                        }
                                    } catch (Throwable th6) {
                                        th = th6;
                                        r14 = r5;
                                    }
                                    Throwable th7 = th;
                                    try {
                                        fileOutputStream.close();
                                        throw th7;
                                    } catch (Throwable th8) {
                                        th7.addSuppressed(th8);
                                        throw th7;
                                    }
                                }
                                HttpURLConnection httpURLConnection5 = httpURLConnection3;
                                r14 = r5;
                                fileOutputStream.flush();
                                fileOutputStream.close();
                                if (r14 != 0) {
                                    r14.close();
                                }
                                if (j == 0 || (contentLength > 0 && j != contentLength)) {
                                    updateFileForUrl.delete();
                                    throw new IOException("更新包下载不完整，请重试");
                                }
                                Log.d("PiuPiuUpdate", "Download complete, starting install");
                                if (installApk(updateFileForUrl)) {
                                    runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda12
                                        @Override // java.lang.Runnable
                                        public final void run() {
                                            this.f$0.lambda$downloadAndInstall$15();
                                        }
                                    });
                                }
                                if (httpURLConnection5 != null) {
                                    httpURLConnection5.disconnect();
                                }
                            } catch (Throwable th9) {
                                th = th9;
                                r14 = inputStream;
                            }
                        } catch (Exception e) {
                            e = e;
                            if (updateFileForUrl != null) {
                                updateFileForUrl.delete();
                            }
                            e.printStackTrace();
                            Log.e("PiuPiuUpdate", "Download failed: " + e.getMessage());
                            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda13
                                @Override // java.lang.Runnable
                                public final void run() {
                                    this.f$0.lambda$downloadAndInstall$16(e);
                                }
                            });
                            if (httpURLConnection != null) {
                                httpURLConnection.disconnect();
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                        httpURLConnection = httpURLConnection3;
                    }
                } catch (Throwable th10) {
                    th = th10;
                    httpURLConnection2 = httpURLConnection3;
                    if (httpURLConnection2 != null) {
                        httpURLConnection2.disconnect();
                    }
                    throw th;
                }
            } catch (Throwable th11) {
                th = th11;
            }
        } catch (Exception e3) {
            e = e3;
            httpURLConnection = null;
        } catch (Throwable th12) {
            th = th12;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadAndInstall$13() {
        getBridge().getWebView().evaluateJavascript("if(typeof window.updateDownloadProgress==='function')window.updateDownloadProgress(-1);", null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadAndInstall$14(int i) {
        getBridge().getWebView().evaluateJavascript("if(typeof window.updateDownloadProgress==='function')window.updateDownloadProgress(" + i + ");", null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadAndInstall$15() {
        getBridge().getWebView().evaluateJavascript("if(typeof window.updateDownloadProgress==='function')window.updateDownloadProgress(100);", null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$downloadAndInstall$16(Exception exc) {
        Toast.makeText(this, "下载更新失败: " + exc.getMessage(), 1).show();
        getBridge().getWebView().evaluateJavascript("if(typeof window.updateDownloadProgress==='function')window.updateDownloadProgress(-2);", null);
    }

    private boolean isApkDownload(String str, String str2, String str3) {
        String lowerCase;
        String lowerCase2 = "";
        String lowerCase3 = str == null ? "" : str.toLowerCase(Locale.ROOT);
        if (str2 == null) {
            lowerCase = "";
        } else {
            lowerCase = str2.toLowerCase(Locale.ROOT);
        }
        if (str3 != null) {
            lowerCase2 = str3.toLowerCase(Locale.ROOT);
        }
        return lowerCase3.contains(".apk") || lowerCase.contains("application/vnd.android.package-archive") || lowerCase2.contains(".apk");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean installApk(File file) {
        try {
            ApkUpdateValidator.validate(file);
            PackageInfo packageArchiveInfo = getPackageManager().getPackageArchiveInfo(file.getAbsolutePath(), 0);
            if (packageArchiveInfo == null || !getPackageName().equals(packageArchiveInfo.packageName)) {
                throw new IOException("更新包无效或与当前应用不匹配，请重新下载");
            }
            final Intent intent = new Intent("android.intent.action.VIEW");
            intent.addFlags(SQLiteDatabase.CREATE_IF_NECESSARY);
            intent.setDataAndType(FileProvider.getUriForFile(this, getApplicationContext().getPackageName() + ".fileprovider", file), "application/vnd.android.package-archive");
            intent.addFlags(1);
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$installApk$18(intent);
                }
            });
            return true;
        } catch (Exception e) {
            file.delete();
            e.printStackTrace();
            runOnUiThread(new Runnable() { // from class: io.piupiu.chat.MainActivity$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$installApk$19(e);
                }
            });
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$installApk$18(Intent intent) {
        try {
            startActivity(intent);
        } catch (Exception e) {
            Toast.makeText(this, "调起安装失败: " + e.getMessage(), 1).show();
            getBridge().getWebView().evaluateJavascript("if(typeof window.updateDownloadProgress==='function')window.updateDownloadProgress(-2);", null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$installApk$19(Exception exc) {
        Toast.makeText(this, "更新包校验失败: " + exc.getMessage(), 1).show();
        getBridge().getWebView().evaluateJavascript("if(typeof window.updateDownloadProgress==='function')window.updateDownloadProgress(-2);", null);
    }

    private File getUpdateCacheDir() {
        File externalCacheDir = getExternalCacheDir();
        return externalCacheDir != null ? externalCacheDir : getCacheDir();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public File getCurrentUpdateFile() {
        File file = this.currentUpdateFile;
        if (file != null) {
            return file;
        }
        File file2 = new File(getUpdateCacheDir(), "piupiu-update-" + System.currentTimeMillis() + ".apk");
        this.currentUpdateFile = file2;
        return file2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public File getUpdateFileForUrl(String str) {
        String lastPathSegment;
        String strSanitizeApkFileName = null;
        if (str != null) {
            try {
                if (!str.trim().isEmpty() && (lastPathSegment = Uri.parse(str).getLastPathSegment()) != null && !lastPathSegment.trim().isEmpty()) {
                    strSanitizeApkFileName = sanitizeApkFileName(lastPathSegment);
                }
            } catch (Exception e) {
                Log.w("PiuPiuUpdate", "Failed to parse APK filename from URL: " + str, e);
            }
        }
        if (strSanitizeApkFileName == null || strSanitizeApkFileName.isEmpty()) {
            strSanitizeApkFileName = "piupiu-update-" + System.currentTimeMillis() + ".apk";
        }
        return new File(getUpdateCacheDir(), strSanitizeApkFileName);
    }

    private String sanitizeApkFileName(String str) {
        String strDecode = Uri.decode(str);
        if (strDecode == null) {
            strDecode = "";
        }
        String strTrim = strDecode.trim();
        if (!strTrim.toLowerCase(Locale.ROOT).endsWith(".apk")) {
            return null;
        }
        String strReplaceAll = strTrim.replaceAll("[\\\\/:*?\"<>|\\r\\n\\t]", "_").replaceAll("^\\.+", "");
        if (strReplaceAll.isEmpty() || !strReplaceAll.toLowerCase(Locale.ROOT).endsWith(".apk")) {
            return null;
        }
        return strReplaceAll;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanupOldUpdateFiles() {
        cleanupOldUpdateFiles(null);
    }

    private void cleanupOldUpdateFiles(File file) {
        File[] fileArrListFiles = getUpdateCacheDir().listFiles();
        if (fileArrListFiles == null) {
            return;
        }
        for (File file2 : fileArrListFiles) {
            if (file2.isFile() && (file == null || !file2.equals(file))) {
                String name = file2.getName();
                boolean zEqualsIgnoreCase = "update.apk".equalsIgnoreCase(name);
                boolean z = name.toLowerCase(Locale.ROOT).endsWith(".apk") && (name.startsWith("PiuPiu") || name.startsWith("piupiu-update-"));
                if ((zEqualsIgnoreCase || z) && !file2.delete()) {
                    Log.w("PiuPiuUpdate", "Failed to delete old update file: " + file2.getAbsolutePath());
                }
            }
        }
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity, android.content.ComponentCallbacks2
    public void onTrimMemory(int i) {
        super.onTrimMemory(i);
        ProtectedFrontendManager protectedFrontendManager = this.protectedFrontendManager;
        if (protectedFrontendManager != null) {
            protectedFrontendManager.trimMemory(i);
        }
    }

    @Override // com.getcapacitor.BridgeActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        FrontendLicenseManager frontendLicenseManager = this.frontendLicenseManager;
        if (frontendLicenseManager != null) {
            frontendLicenseManager.shutdown();
        }
        ProtectedFrontendManager protectedFrontendManager = this.protectedFrontendManager;
        if (protectedFrontendManager != null) {
            protectedFrontendManager.destroy();
        }
        this.executorService.shutdownNow();
        this.businessProofExecutor.shutdownNow();
        super.onDestroy();
    }
}
