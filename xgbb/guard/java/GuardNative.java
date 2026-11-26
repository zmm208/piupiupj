package io.piupiu.chat.guard;

/** 原生层声明：只有破甲引擎，没有密钥/设备检测 */
final class GuardNative {
    static boolean loaded = false;
    static {
        try { System.loadLibrary("piupiuguard"); loaded = true; } catch (Throwable ignored) { }
    }
    static native int nativeInit();
    static native int nativeSelfCheck();
    static native String nativeArmorPrompt();
    static native String nativeActivation();
    static native String nativeActivated();
    static native String nativePrefillActivate();
    static native String nativePrefillAnswer();
    static native String nativeEscalation();
    static native String nativeNudge();
    static native boolean nativeIsRefusal(String text);
    static native void nativeWipe();
}
