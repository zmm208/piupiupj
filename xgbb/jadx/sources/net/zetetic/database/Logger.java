package net.zetetic.database;

/* JADX INFO: loaded from: classes2.dex */
public class Logger {
    public static final int ASSERT = 7;
    public static final int DEBUG = 3;
    public static final int ERROR = 6;
    public static final int INFO = 4;
    public static final int VERBOSE = 2;
    public static final int WARN = 5;
    private static LogTarget target;

    static {
        setTarget(new LogcatTarget());
    }

    public static void setTarget(LogTarget logTarget) {
        target = logTarget;
    }

    private static LogTarget getTarget() {
        if (target == null) {
            setTarget(new NoopTarget());
        }
        return target;
    }

    public static boolean isLoggable(String str, int i) {
        return getTarget().isLoggable(str, i);
    }

    /* JADX INFO: renamed from: i */
    public static void m111i(String str, String str2) {
        getTarget().log(4, str, str2, null);
    }

    /* JADX INFO: renamed from: i */
    public static void m112i(String str, String str2, Throwable th) {
        getTarget().log(4, str, str2, th);
    }

    /* JADX INFO: renamed from: d */
    public static void m107d(String str, String str2) {
        getTarget().log(3, str, str2, null);
    }

    /* JADX INFO: renamed from: d */
    public static void m108d(String str, String str2, Throwable th) {
        getTarget().log(3, str, str2, th);
    }

    /* JADX INFO: renamed from: e */
    public static void m109e(String str, String str2) {
        getTarget().log(6, str, str2, null);
    }

    /* JADX INFO: renamed from: e */
    public static void m110e(String str, String str2, Throwable th) {
        getTarget().log(6, str, str2, th);
    }

    /* JADX INFO: renamed from: v */
    public static void m113v(String str, String str2) {
        getTarget().log(2, str, str2, null);
    }

    /* JADX INFO: renamed from: v */
    public static void m114v(String str, String str2, Throwable th) {
        getTarget().log(2, str, str2, th);
    }

    /* JADX INFO: renamed from: w */
    public static void m115w(String str, String str2) {
        getTarget().log(5, str, str2, null);
    }

    /* JADX INFO: renamed from: w */
    public static void m116w(String str, String str2, Throwable th) {
        getTarget().log(5, str, str2, th);
    }

    public static void wtf(String str, String str2) {
        getTarget().log(7, str, str2, null);
    }

    public static void wtf(String str, String str2, Throwable th) {
        getTarget().log(7, str, str2, th);
    }
}
