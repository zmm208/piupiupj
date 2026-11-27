.class public Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;
.super Ljava/lang/Object;
.source "LocalNotificationManager.java"


# static fields
.field public static final ACTION_INTENT_KEY:Ljava/lang/String; = "LocalNotificationUserAction"

.field public static final DEFAULT_NOTIFICATION_CHANNEL_ID:Ljava/lang/String; = "default"

.field private static final DEFAULT_PRESS_ACTION:Ljava/lang/String; = "tap"

.field public static final NOTIFICATION_INTENT_KEY:Ljava/lang/String; = "LocalNotificationId"

.field public static final NOTIFICATION_IS_REMOVABLE_KEY:Ljava/lang/String; = "LocalNotificationRepeating"

.field public static final NOTIFICATION_OBJ_INTENT_KEY:Ljava/lang/String; = "LocalNotficationObject"

.field public static final REMOTE_INPUT_KEY:Ljava/lang/String; = "LocalNotificationRemoteInput"

.field private static defaultSmallIconID:I

.field private static defaultSoundID:I


# instance fields
.field private activity:Landroid/app/Activity;

.field private config:Lcom/getcapacitor/PluginConfig;

.field private context:Landroid/content/Context;

.field private storage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;Landroid/app/Activity;Landroid/content/Context;Lcom/getcapacitor/CapConfig;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->storage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    .line 58
    iput-object p2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->activity:Landroid/app/Activity;

    .line 59
    iput-object p3, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    .line 60
    const-string p1, "LocalNotifications"

    invoke-virtual {p4, p1}, Lcom/getcapacitor/CapConfig;->getPluginConfiguration(Ljava/lang/String;)Lcom/getcapacitor/PluginConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->config:Lcom/getcapacitor/PluginConfig;

    return-void
.end method

.method private buildIntent(Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    .line 301
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 302
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    .line 304
    :cond_0
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 305
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 307
    :goto_0
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 308
    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x24000000

    .line 309
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 310
    const-string v1, "LocalNotificationId"

    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 311
    const-string v1, "LocalNotificationUserAction"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 312
    const-string p2, "LocalNotficationObject"

    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 313
    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSchedule()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 314
    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->isRemovable()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p1, 0x1

    :goto_2
    const-string p2, "LocalNotificationRepeating"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method private buildNotification(Landroidx/core/app/NotificationManagerCompat;Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Lcom/getcapacitor/PluginCall;)V
    .locals 6

    .line 165
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getChannelId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getChannelId()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 165
    :cond_0
    const-string v0, "default"

    .line 168
    :goto_0
    new-instance v1, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 169
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    .line 170
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    .line 171
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->isAutoCancel()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    .line 172
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->isOngoing()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 173
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    .line 174
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->isGroupSummary()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setGroupSummary(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    .line 176
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getLargeBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 178
    new-instance v2, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v2}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 180
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getLargeBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v2

    .line 181
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSummaryText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$BigTextStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v2

    .line 178
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 185
    :cond_1
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getInboxList()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 186
    new-instance v2, Landroidx/core/app/NotificationCompat$InboxStyle;

    invoke-direct {v2}, Landroidx/core/app/NotificationCompat$InboxStyle;-><init>()V

    .line 187
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getInboxList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 188
    invoke-virtual {v2, v4}, Landroidx/core/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$InboxStyle;

    goto :goto_1

    .line 190
    :cond_2
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$InboxStyle;

    .line 191
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSummaryText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$InboxStyle;

    .line 192
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 195
    :cond_3
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->getDefaultSound(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSound(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_4

    .line 197
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 199
    iget-object v4, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-string v5, "com.android.systemui"

    invoke-virtual {v4, v5, v2, v3}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 200
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v2, 0x6

    .line 201
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_4
    const/4 v2, -0x1

    .line 203
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 206
    :goto_2
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getGroup()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 208
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setGroup(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 209
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->isGroupSummary()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 210
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSummaryText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 214
    :cond_5
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setVisibility(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 215
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 217
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-direct {p0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->getDefaultSmallIcon(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {p2, v1, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSmallIcon(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 218
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p2, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getLargeIcon(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$Builder;

    .line 220
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->config:Lcom/getcapacitor/PluginConfig;

    const-string v2, "iconColor"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/PluginConfig;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getIconColor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 223
    :try_start_0
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    if-eqz p3, :cond_6

    .line 226
    const-string p1, "Invalid color provided. Must be a hex string (ex: #ff0000"

    invoke-virtual {p3, p1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    :cond_6
    return-void

    .line 232
    :cond_7
    :goto_3
    invoke-direct {p0, p2, v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->createActionIntents(Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Landroidx/core/app/NotificationCompat$Builder;)V

    .line 234
    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p3

    .line 235
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->isScheduled()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 236
    invoke-direct {p0, p3, p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->triggerScheduledNotification(Landroid/app/Notification;Lcom/capacitorjs/plugins/localnotifications/LocalNotification;)V

    return-void

    .line 239
    :cond_8
    :try_start_1
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getcapacitor/JSObject;-><init>(Ljava/lang/String;)V

    .line 240
    invoke-static {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->fireReceived(Lcom/getcapacitor/JSObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 242
    :catch_1
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, p2, p3}, Landroidx/core/app/NotificationManagerCompat;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method private cancelTimerForNotification(Ljava/lang/Integer;)V
    .locals 3

    .line 412
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-class v2, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 414
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_0

    const/high16 v1, 0x2000000

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 417
    :goto_0
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v2, p1, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 419
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 420
    invoke-virtual {v0, p1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    :cond_1
    return-void
.end method

.method private createActionIntents(Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Landroidx/core/app/NotificationCompat$Builder;)V
    .locals 11

    .line 249
    const-string v0, "tap"

    invoke-direct {p0, p1, v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->buildIntent(Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 251
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_0

    const/high16 v1, 0x12000000

    goto :goto_0

    :cond_0
    const/high16 v1, 0x10000000

    .line 254
    :goto_0
    iget-object v3, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v3, v4, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 255
    invoke-virtual {p2, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 258
    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getActionTypeId()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    .line 260
    iget-object v4, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->storage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {v4, v0}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->getActionGroup(Ljava/lang/String;)[Lcom/capacitorjs/plugins/localnotifications/NotificationAction;

    move-result-object v0

    .line 261
    array-length v4, v0

    move v5, v3

    :goto_1
    if-ge v5, v4, :cond_2

    aget-object v6, v0, v5

    .line 263
    invoke-virtual {v6}, Lcom/capacitorjs/plugins/localnotifications/NotificationAction;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->buildIntent(Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 264
    iget-object v8, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    .line 266
    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v6}, Lcom/capacitorjs/plugins/localnotifications/NotificationAction;->getId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v10

    add-int/2addr v9, v10

    .line 264
    invoke-static {v8, v9, v7, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 270
    new-instance v8, Landroidx/core/app/NotificationCompat$Action$Builder;

    sget v9, Lcom/capacitorjs/plugins/localnotifications/R$drawable;->ic_transparent:I

    .line 272
    invoke-virtual {v6}, Lcom/capacitorjs/plugins/localnotifications/NotificationAction;->getTitle()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10, v7}, Landroidx/core/app/NotificationCompat$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 275
    invoke-virtual {v6}, Lcom/capacitorjs/plugins/localnotifications/NotificationAction;->isInput()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 276
    new-instance v7, Landroidx/core/app/RemoteInput$Builder;

    const-string v9, "LocalNotificationRemoteInput"

    invoke-direct {v7, v9}, Landroidx/core/app/RemoteInput$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/capacitorjs/plugins/localnotifications/NotificationAction;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Landroidx/core/app/RemoteInput$Builder;->setLabel(Ljava/lang/CharSequence;)Landroidx/core/app/RemoteInput$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/core/app/RemoteInput$Builder;->build()Landroidx/core/app/RemoteInput;

    move-result-object v6

    .line 277
    invoke-virtual {v8, v6}, Landroidx/core/app/NotificationCompat$Action$Builder;->addRemoteInput(Landroidx/core/app/RemoteInput;)Landroidx/core/app/NotificationCompat$Action$Builder;

    .line 279
    :cond_1
    invoke-virtual {v8}, Landroidx/core/app/NotificationCompat$Action$Builder;->build()Landroidx/core/app/NotificationCompat$Action;

    move-result-object v6

    invoke-virtual {p2, v6}, Landroidx/core/app/NotificationCompat$Builder;->addAction(Landroidx/core/app/NotificationCompat$Action;)Landroidx/core/app/NotificationCompat$Builder;

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 284
    :cond_2
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-class v4, Lcom/capacitorjs/plugins/localnotifications/NotificationDismissReceiver;

    invoke-direct {v0, v1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x10008000

    .line 285
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 286
    const-string v1, "LocalNotificationId"

    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 287
    const-string v1, "LocalNotificationUserAction"

    const-string v4, "dismiss"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 288
    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSchedule()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 289
    invoke-virtual {v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->isRemovable()Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    :cond_3
    move v1, v3

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v1, 0x1

    :goto_3
    const-string v4, "LocalNotificationRepeating"

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 291
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v2, :cond_5

    const/high16 v3, 0x2000000

    .line 294
    :cond_5
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v1, p1, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 295
    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    return-void
.end method

.method private dismissVisibleNotification(I)V
    .locals 1

    .line 425
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 426
    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V

    return-void
.end method

.method private getDefaultSmallIcon(Landroid/content/Context;)I
    .locals 2

    .line 458
    sget v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->defaultSmallIconID:I

    if-eqz v0, :cond_0

    return v0

    .line 461
    :cond_0
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->config:Lcom/getcapacitor/PluginConfig;

    const-string v1, "smallIcon"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/PluginConfig;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 462
    invoke-static {v0}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 465
    const-string v1, "drawable"

    invoke-static {p1, v0, v1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_2

    const p1, 0x108009b

    .line 472
    :cond_2
    sput p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->defaultSmallIconID:I

    return p1
.end method

.method private getDefaultSound(Landroid/content/Context;)I
    .locals 2

    .line 443
    sget v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->defaultSoundID:I

    if-eqz v0, :cond_0

    return v0

    .line 446
    :cond_0
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->config:Lcom/getcapacitor/PluginConfig;

    const-string v1, "sound"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/PluginConfig;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 447
    invoke-static {v0}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 450
    const-string v1, "raw"

    invoke-static {p1, v0, v1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 453
    :goto_0
    sput p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->defaultSoundID:I

    return p1
.end method

.method private setExactIfPossible(Landroid/app/AlarmManager;Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;JLandroid/app/PendingIntent;)V
    .locals 4

    .line 380
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/app/AlarmManager;->canScheduleExactAlarms()Z

    move-result v0

    if-nez v0, :cond_1

    .line 381
    const-string v0, "Capacitor/LocalNotification"

    const-string v1, "Exact alarms not allowed in user settings.  Notification scheduled with non-exact alarm."

    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->allowWhileIdle()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 386
    invoke-virtual {p1, v2, p3, p4, p5}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void

    .line 388
    :cond_0
    invoke-virtual {p1, v3, p3, p4, p5}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void

    .line 391
    :cond_1
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->allowWhileIdle()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 392
    invoke-virtual {p1, v2, p3, p4, p5}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void

    .line 394
    :cond_2
    invoke-virtual {p1, v3, p3, p4, p5}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V

    return-void
.end method

.method private triggerScheduledNotification(Landroid/app/Notification;Lcom/capacitorjs/plugins/localnotifications/LocalNotification;)V
    .locals 12

    .line 324
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/app/AlarmManager;

    .line 325
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSchedule()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    move-result-object v3

    .line 326
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-class v4, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;

    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 327
    const-string v2, "LocalNotificationId"

    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 328
    sget-object v2, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->NOTIFICATION_KEY:Ljava/lang/String;

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 330
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt p1, v2, :cond_0

    const/high16 p1, 0x12000000

    goto :goto_0

    :cond_0
    const/high16 p1, 0x10000000

    .line 333
    :goto_0
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v2, v4, v0, p1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 336
    invoke-virtual {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getAt()Ljava/util/Date;

    move-result-object v2

    .line 337
    const-string v8, "LN"

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eqz v2, :cond_3

    .line 338
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    cmp-long p1, p1, v4

    if-gez p1, :cond_1

    .line 339
    new-array p1, v10, [Ljava/lang/String;

    aput-object v8, p1, v9

    invoke-static {p1}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "Scheduled time must be *after* current time"

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    .line 342
    :cond_1
    invoke-virtual {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->isRepeating()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 343
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long v5, p1, v3

    move-object p1, v2

    const/4 v2, 0x1

    .line 344
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual/range {v1 .. v7}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    return-void

    :cond_2
    move-object p1, v2

    .line 346
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    move-object v2, v1

    move-object v6, v7

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->setExactIfPossible(Landroid/app/AlarmManager;Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;JLandroid/app/PendingIntent;)V

    move-object v11, v1

    return-void

    :cond_3
    move-object v11, p0

    .line 352
    invoke-virtual {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getEvery()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 354
    invoke-virtual {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getEveryInterval()Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 356
    new-instance p2, Ljava/util/Date;

    invoke-direct {p2}, Ljava/util/Date;-><init>()V

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long v3, v2, v4

    const/4 v2, 0x1

    .line 357
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual/range {v1 .. v7}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    return-void

    .line 363
    :cond_4
    invoke-virtual {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getOn()Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 365
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v4}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->nextTrigger(Ljava/util/Date;)J

    move-result-wide v4

    .line 366
    sget-object v6, Lcom/capacitorjs/plugins/localnotifications/TimedNotificationPublisher;->CRON_KEY:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->toMatchString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 367
    iget-object v2, v11, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v2, v6, v0, p1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    move-object v2, v1

    move-object v1, v11

    .line 368
    invoke-direct/range {v1 .. v6}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->setExactIfPossible(Landroid/app/AlarmManager;Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;JLandroid/app/PendingIntent;)V

    .line 369
    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string v0, "yyyy/MM/dd HH:mm:ss"

    invoke-direct {p1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 370
    new-array v0, v10, [Ljava/lang/String;

    aput-object v8, v0, v9

    invoke-static {v0}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "notification "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " will next fire at "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return-void
.end method


# virtual methods
.method public areNotificationsEnabled()Z
    .locals 1

    .line 430
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 431
    invoke-virtual {v0}, Landroidx/core/app/NotificationManagerCompat;->areNotificationsEnabled()Z

    move-result v0

    return v0
.end method

.method public cancel(Lcom/getcapacitor/PluginCall;)V
    .locals 3

    .line 400
    invoke-static {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getLocalNotificationPendingList(Lcom/getcapacitor/PluginCall;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 402
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 403
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->dismissVisibleNotification(I)V

    .line 404
    invoke-direct {p0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->cancelTimerForNotification(Ljava/lang/Integer;)V

    .line 405
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->storage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->deleteNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 408
    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method public createNotificationChannel()V
    .locals 4

    .line 106
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    .line 110
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "default"

    const-string v2, "Default"

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 111
    invoke-virtual {v0, v2}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 112
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v2, 0x4

    .line 113
    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    .line 114
    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    .line 115
    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 116
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-virtual {p0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->getDefaultSoundUrl(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 118
    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    .line 122
    :cond_0
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    const-class v2, Landroid/app/NotificationManager;

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 123
    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_1
    return-void
.end method

.method public getDefaultSoundUrl(Landroid/content/Context;)Landroid/net/Uri;
    .locals 3

    .line 435
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->getDefaultSound(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android.resource://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public handleNotificationActionPerformed(Landroid/content/Intent;Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;)Lcom/getcapacitor/JSObject;
    .locals 6

    const/4 v0, 0x1

    .line 67
    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "LN"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "LocalNotification received: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v1, "LocalNotificationId"

    const/high16 v4, -0x80000000

    invoke-virtual {p1, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const/4 v5, 0x0

    if-ne v1, v4, :cond_0

    .line 70
    new-array p1, v0, [Ljava/lang/String;

    aput-object v3, p1, v2

    invoke-static {p1}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "Activity started without notification attached"

    invoke-static {p1, p2}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object v5

    .line 73
    :cond_0
    const-string v2, "LocalNotificationRepeating"

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->deleteNotification(Ljava/lang/String;)V

    .line 77
    :cond_1
    new-instance p2, Lcom/getcapacitor/JSObject;

    invoke-direct {p2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 79
    invoke-static {p1}, Landroidx/core/app/RemoteInput;->getResultsFromIntent(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 81
    const-string v2, "LocalNotificationRemoteInput"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 82
    const-string v2, "inputValue"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v2, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 84
    :cond_2
    const-string v0, "LocalNotificationUserAction"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 86
    invoke-direct {p0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->dismissVisibleNotification(I)V

    .line 88
    const-string v1, "actionId"

    invoke-virtual {p2, v1, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 91
    :try_start_0
    const-string v0, "LocalNotficationObject"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 93
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0, p1}, Lcom/getcapacitor/JSObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v5, v0

    .line 96
    :catch_0
    :cond_3
    const-string p1, "notification"

    invoke-virtual {p2, p1, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    return-object p2
.end method

.method public schedule(Lcom/getcapacitor/PluginCall;Ljava/util/List;)Lorg/json/JSONArray;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            "Ljava/util/List<",
            "Lcom/capacitorjs/plugins/localnotifications/LocalNotification;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .line 129
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 130
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->context:Landroid/content/Context;

    invoke-static {v1}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v1

    .line 132
    invoke-virtual {v1}, Landroidx/core/app/NotificationManagerCompat;->areNotificationsEnabled()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    if-eqz p1, :cond_0

    .line 135
    const-string p2, "Notifications not enabled on this device"

    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    :cond_0
    return-object v3

    .line 139
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;

    .line 140
    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v4

    .line 141
    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-nez v5, :cond_3

    if-eqz p1, :cond_2

    .line 143
    const-string p2, "LocalNotification missing identifier"

    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    :cond_2
    return-object v3

    .line 147
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {p0, v5}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->dismissVisibleNotification(I)V

    .line 148
    invoke-direct {p0, v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->cancelTimerForNotification(Ljava/lang/Integer;)V

    .line 149
    invoke-direct {p0, v1, v2, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->buildNotification(Landroidx/core/app/NotificationManagerCompat;Lcom/capacitorjs/plugins/localnotifications/LocalNotification;Lcom/getcapacitor/PluginCall;)V

    .line 150
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_4
    return-object v0
.end method
