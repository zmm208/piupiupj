package io.piupiu.chat.guard;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

/**
 * GuardApp —— 只做两件事：
 *   1) 加载原生层（破甲引擎）
 *   2) 把 PiuPiuGuard 桥注入 WebView
 * 无设备检测、无密钥、无试用锁。
 */
public class GuardApp extends Application implements Application.ActivityLifecycleCallbacks {

    static volatile int checkBits = 0;

    @Override
    public void onCreate() {
        super.onCreate();
        GuardVault.init(this);
        registerActivityLifecycleCallbacks(this);
        if (GuardNative.loaded) {
            GuardNative.nativeInit();
            checkBits = GuardNative.nativeSelfCheck();
        }
    }

    @Override public void onActivityCreated(Activity a, Bundle b) { inject(a); }
    @Override public void onActivityStarted(Activity a) { inject(a); }
    @Override public void onActivityResumed(Activity a) { inject(a); }
    @Override public void onActivityPaused(Activity a) { }
    @Override public void onActivityStopped(Activity a) { }
    @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
    @Override public void onActivityDestroyed(Activity a) { }

    private static void inject(Activity a) {
        try {
            WebView wv = find(a.getWindow().getDecorView());
            if (wv == null) return;
            if (wv.getTag(0x7f0f00fe) != null) return;
            wv.getSettings().setJavaScriptEnabled(true);
            wv.addJavascriptInterface(new GuardBridge(a), "PiuPiuGuard");
            wv.setTag(0x7f0f00fe, Boolean.TRUE);
        } catch (Throwable ignored) { }
    }

    private static WebView find(View v) {
        if (v == null) return null;
        if (v instanceof WebView) return (WebView) v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                WebView r = find(g.getChildAt(i));
                if (r != null) return r;
            }
        }
        return null;
    }
}
