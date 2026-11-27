.class public Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;
.super Landroid/content/BroadcastReceiver;
.source "TimedNotificationPublisher.java"


# static fields
.field public static CRON_KEY:Ljava/lang/String; = "NotificationPublisher.cron"

.field public static NOTIFICATION_KEY:Ljava/lang/String; = "NotificationPublisher.notification"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private getParcelableExtraLegacy(Landroid/content/Intent;Ljava/lang/String;)Landroid/app/Notification;
    .locals 0

    .line 57
    sget-object p2, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->NOTIFICATION_KEY:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/Notification;

    return-object p1
.end method

.method private rescheduleNotificationIfNeeded(Landroid/content/Context;Landroid/content/Intent;I)Z
    .locals 6

    .line 61
    sget-object v0, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->CRON_KEY:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 64
    invoke-static {v0}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->fromMatchString(Ljava/lang/String;)Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    move-result-object v0

    .line 65
    const-string v2, "alarm"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlarmManager;

    .line 67
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v3}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->nextTrigger(Ljava/util/Date;)J

    move-result-wide v3

    .line 68
    invoke-virtual {p2}, Landroid/content/Intent;->clone()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Intent;

    .line 70
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1f

    if-lt v0, v5, :cond_0

    const/high16 v0, 0x12000000

    goto :goto_0

    :cond_0
    const/high16 v0, 0x10000000

    .line 73
    :goto_0
    invoke-static {p1, p3, p2, v0}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 74
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v0, 0x1

    if-lt p2, v5, :cond_1

    invoke-virtual {v2}, Landroid/app/AlarmManager;->canScheduleExactAlarms()Z

    move-result p2

    if-nez p2, :cond_1

    .line 75
    const-string p2, "Capacitor/LocalNotification"

    const-string v5, "Exact alarms not allowed in user settings.  Notification scheduled with non-exact alarm."

    invoke-static {p2, v5}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-virtual {v2, v0, v3, v4, p1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_1

    .line 81
    :cond_1
    invoke-virtual {v2, v0, v3, v4, p1}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V

    .line 83
    :goto_1
    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string p2, "yyyy/MM/dd HH:mm:ss"

    invoke-direct {p1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 84
    new-array p2, v0, [Ljava/lang/String;

    const-string v2, "LN"

    aput-object v2, p2, v1

    invoke-static {p2}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "notification "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v1, " will next fire at "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_2
    return v1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    .line 30
    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 34
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    .line 35
    sget-object v1, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->NOTIFICATION_KEY:Ljava/lang/String;

    const-class v2, Landroid/app/Notification;

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Notification;

    goto :goto_0

    .line 37
    :cond_0
    sget-object v1, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->NOTIFICATION_KEY:Ljava/lang/String;

    invoke-direct {p0, p2, v1}, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->getParcelableExtraLegacy(Landroid/content/Intent;Ljava/lang/String;)Landroid/app/Notification;

    move-result-object v1

    .line 40
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Landroid/app/Notification;->when:J

    .line 42
    const-string v2, "LocalNotificationId"

    const/high16 v3, -0x80000000

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v3, :cond_1

    const/4 v3, 0x1

    .line 44
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "LN"

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "No valid id supplied"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    :cond_1
    new-instance v3, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-direct {v3, p1}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;-><init>(Landroid/content/Context;)V

    .line 47
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->getSavedNotificationAsJSObject(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v4

    .line 48
    invoke-static {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->fireReceived(Lcom/getcapacitor/JSObject;)V

    .line 49
    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 50
    invoke-direct {p0, p1, p2, v2}, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->rescheduleNotificationIfNeeded(Landroid/content/Context;Landroid/content/Intent;I)Z

    move-result p1

    if-nez p1, :cond_2

    .line 51
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->deleteNotification(Ljava/lang/String;)V

    :cond_2
    return-void
.end method
