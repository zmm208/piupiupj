package io.piupiu.chat;

/* JADX INFO: loaded from: classes.dex */
final class ProtectedOriginMatcher {
    private ProtectedOriginMatcher() {
    }

    static boolean matches(String str, String str2, int i, String str3, String str4, int i2) {
        return (str == null || str2 == null || str3 == null || str4 == null || !str.equalsIgnoreCase(str3) || !str2.equalsIgnoreCase(str4) || effectivePort(str, i) != effectivePort(str3, i2)) ? false : true;
    }

    private static int effectivePort(String str, int i) {
        if (i >= 0) {
            return i;
        }
        if ("https".equalsIgnoreCase(str)) {
            return 443;
        }
        return "http".equalsIgnoreCase(str) ? 80 : -1;
    }
}
