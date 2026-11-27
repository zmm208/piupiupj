package org.apache.cordova;

import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public class LOG {
    public static final int DEBUG = 3;
    public static final int ERROR = 6;
    public static final int INFO = 4;
    public static int LOGLEVEL = 6;
    public static final int VERBOSE = 2;
    public static final int WARN = 5;

    public static void setLogLevel(int i) {
        LOGLEVEL = i;
        Log.i("CordovaLog", "Changing log level to " + i);
    }

    public static void setLogLevel(String str) {
        if ("VERBOSE".equals(str)) {
            LOGLEVEL = 2;
        } else if ("DEBUG".equals(str)) {
            LOGLEVEL = 3;
        } else if ("INFO".equals(str)) {
            LOGLEVEL = 4;
        } else if ("WARN".equals(str)) {
            LOGLEVEL = 5;
        } else if ("ERROR".equals(str)) {
            LOGLEVEL = 6;
        }
        Log.i("CordovaLog", "Changing log level to " + str + "(" + LOGLEVEL + ")");
    }

    public static boolean isLoggable(int i) {
        return i >= LOGLEVEL;
    }

    /* JADX INFO: renamed from: v */
    public static void m126v(String str, String str2) {
        if (2 >= LOGLEVEL) {
            Log.v(str, str2);
        }
    }

    /* JADX INFO: renamed from: d */
    public static void m117d(String str, String str2) {
        if (3 >= LOGLEVEL) {
            Log.d(str, str2);
        }
    }

    /* JADX INFO: renamed from: i */
    public static void m123i(String str, String str2) {
        if (4 >= LOGLEVEL) {
            Log.i(str, str2);
        }
    }

    /* JADX INFO: renamed from: w */
    public static void m129w(String str, String str2) {
        if (5 >= LOGLEVEL) {
            Log.w(str, str2);
        }
    }

    /* JADX INFO: renamed from: e */
    public static void m120e(String str, String str2) {
        if (6 >= LOGLEVEL) {
            Log.e(str, str2);
        }
    }

    /* JADX INFO: renamed from: v */
    public static void m127v(String str, String str2, Throwable th) {
        if (2 >= LOGLEVEL) {
            Log.v(str, str2, th);
        }
    }

    /* JADX INFO: renamed from: d */
    public static void m118d(String str, String str2, Throwable th) {
        if (3 >= LOGLEVEL) {
            Log.d(str, str2, th);
        }
    }

    /* JADX INFO: renamed from: i */
    public static void m124i(String str, String str2, Throwable th) {
        if (4 >= LOGLEVEL) {
            Log.i(str, str2, th);
        }
    }

    /* JADX INFO: renamed from: w */
    public static void m132w(String str, Throwable th) {
        if (5 >= LOGLEVEL) {
            Log.w(str, th);
        }
    }

    /* JADX INFO: renamed from: w */
    public static void m130w(String str, String str2, Throwable th) {
        if (5 >= LOGLEVEL) {
            Log.w(str, str2, th);
        }
    }

    /* JADX INFO: renamed from: e */
    public static void m121e(String str, String str2, Throwable th) {
        if (6 >= LOGLEVEL) {
            Log.e(str, str2, th);
        }
    }

    /* JADX INFO: renamed from: v */
    public static void m128v(String str, String str2, Object... objArr) {
        if (2 >= LOGLEVEL) {
            Log.v(str, String.format(str2, objArr));
        }
    }

    /* JADX INFO: renamed from: d */
    public static void m119d(String str, String str2, Object... objArr) {
        if (3 >= LOGLEVEL) {
            Log.d(str, String.format(str2, objArr));
        }
    }

    /* JADX INFO: renamed from: i */
    public static void m125i(String str, String str2, Object... objArr) {
        if (4 >= LOGLEVEL) {
            Log.i(str, String.format(str2, objArr));
        }
    }

    /* JADX INFO: renamed from: w */
    public static void m131w(String str, String str2, Object... objArr) {
        if (5 >= LOGLEVEL) {
            Log.w(str, String.format(str2, objArr));
        }
    }

    /* JADX INFO: renamed from: e */
    public static void m122e(String str, String str2, Object... objArr) {
        if (6 >= LOGLEVEL) {
            Log.e(str, String.format(str2, objArr));
        }
    }
}
