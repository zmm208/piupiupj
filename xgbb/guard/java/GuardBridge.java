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


    /* ---------------- 备份（密钥只在原生层计算，不回传 JS） ---------------- */
    @JavascriptInterface public String backupInfo()    { return BackupStore.info(act); }
    @JavascriptInterface public String backupKeyId()   { return BackupStore.keyId(act); }
    @JavascriptInterface public boolean backupEnsure() { return BackupStore.ensure(act); }
    @JavascriptInterface public void backupRequestAccess() { BackupStore.requestAccess(act); }
    @JavascriptInterface public String backupRead()    { return BackupStore.read(act); }
    @JavascriptInterface public boolean backupWrite(String text) { return BackupStore.write(act, text); }
    @JavascriptInterface public String backupEncrypt(String plain) { return BackupStore.encrypt(act, plain); }
    @JavascriptInterface public String backupDecrypt(String packed) { return BackupStore.decrypt(act, packed); }
    @JavascriptInterface public void backupOpenDir()   { BackupStore.openDir(act); }
    @JavascriptInterface public String fileReadB64(String path) { return BackupStore.readFileB64(act, path); }
    @JavascriptInterface public boolean fileWriteB64(String path, String b64) { return BackupStore.writeFileB64(act, path, b64); }
    @JavascriptInterface public String dbDump() { return BackupStore.dbDump(act); }
    @JavascriptInterface public boolean dbExec(String joined) { return BackupStore.dbExec(act, joined); }
    @JavascriptInterface public String dbPath() { return BackupStore.dbPathInfo(act); }

    @JavascriptInterface
    public void quit() { try { act.finishAffinity(); } catch (Throwable ignored) { } }
}
