package io.piupiu.chat;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;
import androidx.core.app.NotificationCompat;

/* JADX INFO: loaded from: classes.dex */
public class KeepAliveService extends Service {
    private static final String ACTION_SHOW_REPLY_COMPLETED = "io.piupiu.chat.action.SHOW_REPLY_COMPLETED";
    private static final String CHANNEL_ID = "piupiu_keepalive_channel";
    private static final String EXTRA_REPLY_BODY = "reply_body";
    private static final String EXTRA_REPLY_TITLE = "reply_title";
    private static final int NOTIFICATION_ID = 1001;
    private static final String TAG = "PiuPiuKeepAlive";

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "KeepAliveService onCreate()");
        createNotificationChannel();
    }

    /* JADX WARN: Code duplicated, block: B:9:0x001a  */
    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        boolean z;
        String strSanitizeNotificationText;
        String strSanitizeNotificationText2;
        Log.d(TAG, "KeepAliveService onStartCommand() - starting foreground");
        if (intent != null) {
            try {
                if (ACTION_SHOW_REPLY_COMPLETED.equals(intent.getAction())) {
                    z = true;
                } else {
                    z = false;
                }
            } catch (Exception e) {
                Log.e(TAG, "Failed to start foreground service: " + e.getMessage(), e);
                stopSelf(i2);
                return 2;
            }
        } else {
            z = false;
        }
        if (z) {
            strSanitizeNotificationText = sanitizeNotificationText(intent.getStringExtra(EXTRA_REPLY_TITLE), "PiuPiu酱 已回复", 80);
        } else {
            strSanitizeNotificationText = "PiuPiu酱";
        }
        if (z) {
            strSanitizeNotificationText2 = sanitizeNotificationText(intent.getStringExtra(EXTRA_REPLY_BODY), "新的回复已经生成完成。", 180);
        } else {
            strSanitizeNotificationText2 = "正在后台守护你的数据...";
        }
        Notification notificationBuildForegroundNotification = buildForegroundNotification(strSanitizeNotificationText, strSanitizeNotificationText2, z);
        if (Build.VERSION.SDK_INT >= 34) {
            startForeground(1001, notificationBuildForegroundNotification, 1);
        } else {
            startForeground(1001, notificationBuildForegroundNotification);
        }
        Log.d(TAG, "Foreground service started successfully with notification");
        if (z) {
            Log.d(TAG, "Reply completed notification applied to foreground service");
        }
        return 1;
    }

    private Notification buildForegroundNotification(String str, String str2, boolean z) {
        Intent intent = new Intent(this, (Class<?>) MainActivity.class);
        intent.setFlags(335544320);
        NotificationCompat.Builder visibility = new NotificationCompat.Builder(this, CHANNEL_ID).setContentTitle(str).setContentText(str2).setSmallIcon(C0954R.drawable.ic_launcher_foreground).setContentIntent(PendingIntent.getActivity(this, 0, intent, 201326592)).setPriority(z ? 1 : 0).setOngoing(true).setAutoCancel(false).setCategory(z ? NotificationCompat.CATEGORY_MESSAGE : NotificationCompat.CATEGORY_SERVICE).setVisibility(1);
        if (z) {
            visibility.setStyle(new NotificationCompat.BigTextStyle().bigText(str2));
        }
        return visibility.build();
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "KeepAliveService onDestroy()");
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= 26) {
            Log.d(TAG, "Creating notification channel...");
            NotificationChannel notificationChannel = new NotificationChannel(CHANNEL_ID, "后台保护服务", 3);
            notificationChannel.setDescription("保持 PiuPiu酱在后台运行，防止数据丢失");
            notificationChannel.setShowBadge(false);
            notificationChannel.enableLights(false);
            notificationChannel.enableVibration(false);
            notificationChannel.setSound(null, null);
            NotificationManager notificationManager = (NotificationManager) getSystemService(NotificationManager.class);
            if (notificationManager != null) {
                notificationManager.createNotificationChannel(notificationChannel);
                Log.d(TAG, "Notification channel created successfully");
            } else {
                Log.e(TAG, "NotificationManager is null!");
            }
        }
    }

    public static void start(Context context) {
        Log.d(TAG, "start() called");
        try {
            Intent intent = new Intent(context, (Class<?>) KeepAliveService.class);
            if (Build.VERSION.SDK_INT >= 26) {
                context.startForegroundService(intent);
                Log.d(TAG, "startForegroundService() called");
            } else {
                context.startService(intent);
                Log.d(TAG, "startService() called");
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to start service: " + e.getMessage(), e);
        }
    }

    public static void showReplyCompleted(Context context, String str, String str2) {
        Log.d(TAG, "showReplyCompleted() called");
        try {
            Intent intent = new Intent(context, (Class<?>) KeepAliveService.class);
            intent.setAction(ACTION_SHOW_REPLY_COMPLETED);
            intent.putExtra(EXTRA_REPLY_TITLE, str);
            intent.putExtra(EXTRA_REPLY_BODY, str2);
            if (Build.VERSION.SDK_INT >= 26) {
                context.startForegroundService(intent);
            } else {
                context.startService(intent);
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to show reply completed notification: " + e.getMessage(), e);
        }
    }

    public static void stop(Context context) {
        Log.d(TAG, "stop() called");
        try {
            context.stopService(new Intent(context, (Class<?>) KeepAliveService.class));
        } catch (Exception e) {
            Log.e(TAG, "Failed to stop service: " + e.getMessage(), e);
        }
    }

    private String sanitizeNotificationText(String str, String str2, int i) {
        String strTrim = str == null ? "" : str.replaceAll("\\s+", " ").trim();
        if (!strTrim.isEmpty()) {
            str2 = strTrim;
        }
        return str2.length() > i ? str2.substring(0, i - 1) + "…" : str2;
    }
}
