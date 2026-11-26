package io.piupiu.chat.guard;

import android.app.Activity;
import android.webkit.JavascriptInterface;

/** 前端唯一原生入口：window.PiuPiuGuard.* */
public class GuardBridge {
    private final Activity act;
    GuardBridge(Activity a) { this.act = a; }

    @JavascriptInterface
    public String state() {
        return "{\"native\":" + GuardNative.loaded + ",\"checkBits\":" + GuardApp.checkBits + "}";
    }

    @JavascriptInterface public String armorPrompt()    { return GuardNative.nativeArmorPrompt(); }
    @JavascriptInterface public String activation()     { return GuardNative.nativeActivation(); }
    @JavascriptInterface public String activated()      { return GuardNative.nativeActivated(); }
    @JavascriptInterface public String prefillActivate(){ return GuardNative.nativePrefillActivate(); }
    @JavascriptInterface public String prefillAnswer()  { return GuardNative.nativePrefillAnswer(); }
    @JavascriptInterface public String escalation()     { return GuardNative.nativeEscalation(); }
    @JavascriptInterface public String nudge()          { return GuardNative.nativeNudge(); }

    @JavascriptInterface
    public boolean isRefusal(String text) {
        return GuardNative.loaded && GuardNative.nativeIsRefusal(text);
    }

    /** 加密 KV（厂商 api key 等），落地即密文 */
    @JavascriptInterface public String load(String key) { return GuardVault.get("cfg_" + key, ""); }
    @JavascriptInterface public void save(String key, String val) { GuardVault.put("cfg_" + key, val); }

    @JavascriptInterface
    public void quit() { try { act.finishAffinity(); } catch (Throwable ignored) { } }
}
