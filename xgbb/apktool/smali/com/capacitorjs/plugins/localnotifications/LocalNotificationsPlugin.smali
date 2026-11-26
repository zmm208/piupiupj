.class public Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;
.super Lcom/getcapacitor/Plugin;
.source "LocalNotificationsPlugin.java"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "LocalNotifications"
    permissions = {
        .subannotation Lcom/getcapacitor/annotation/Permission;
            alias = "display"
            strings = {
                "android.permission.POST_NOTIFICATIONS"
            }
        .end subannotation
    }
.end annotation


# static fields
.field static final LOCAL_NOTIFICATIONS:Ljava/lang/String; = "display"

.field private static staticBridge:Lcom/getcapacitor/Bridge;


# instance fields
.field private manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

.field private notificationChannelManager:Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;

.field public notificationManager:Landroid/app/NotificationManager;

.field private notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    return-void
.end method

.method private alarmPermissionsCallback(Lcom/getcapacitor/PluginCall;Landroidx/activity/result/ActivityResult;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/annotation/ActivityCallback;
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->checkExactNotificationSetting(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static fireReceived(Lcom/getcapacitor/JSObject;)V
    .locals 3

    .line 284
    invoke-static {}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getLocalNotificationsInstance()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 286
    const-string v1, "localNotificationReceived"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    :cond_0
    return-void
.end method

.method private getExactAlarmPermissionText()Ljava/lang/String;
    .locals 3

    .line 271
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const-string v2, "granted"

    if-lt v0, v1, :cond_1

    .line 272
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 273
    invoke-virtual {v0}, Landroid/app/AlarmManager;->canScheduleExactAlarms()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object v2

    .line 276
    :cond_0
    const-string v0, "denied"

    return-object v0

    :cond_1
    return-object v2
.end method

.method public static getLocalNotificationsInstance()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;
    .locals 3

    .line 291
    sget-object v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->staticBridge:Lcom/getcapacitor/Bridge;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 292
    sget-object v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->staticBridge:Lcom/getcapacitor/Bridge;

    const-string v2, "LocalNotifications"

    invoke-virtual {v0, v2}, Lcom/getcapacitor/Bridge;->getPlugin(Ljava/lang/String;)Lcom/getcapacitor/PluginHandle;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v1

    .line 296
    :cond_0
    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getInstance()Lcom/getcapacitor/Plugin;

    move-result-object v0

    check-cast v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;

    return-object v0

    :cond_1
    return-object v1
.end method

.method private getNotificationPermissionText()Ljava/lang/String;
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    invoke-virtual {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->areNotificationsEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    const-string v0, "granted"

    return-object v0

    .line 266
    :cond_0
    const-string v0, "denied"

    return-object v0
.end method

.method private permissionsCallback(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/annotation/PermissionCallback;
    .end annotation

    .line 251
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 252
    const-string v1, "display"

    invoke-direct {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getNotificationPermissionText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 254
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method


# virtual methods
.method public areEnabled(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 118
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 119
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    invoke-virtual {v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->areNotificationsEnabled()Z

    move-result v1

    const-string v2, "value"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 120
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public cancel(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    invoke-virtual {v0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->cancel(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public changeExactNotificationSetting(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 230
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 231
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "package:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.settings.REQUEST_SCHEDULE_EXACT_ALARM"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "alarmPermissionsCallback"

    .line 231
    invoke-virtual {p0, p1, v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;Ljava/lang/String;)V

    return-void

    .line 237
    :cond_0
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->checkExactNotificationSetting(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public checkExactNotificationSetting(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 243
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 244
    const-string v1, "exact_alarm"

    invoke-direct {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getExactAlarmPermissionText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 246
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public checkPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 208
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-ge v0, v1, :cond_0

    .line 209
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 210
    const-string v1, "display"

    invoke-direct {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getNotificationPermissionText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 211
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void

    .line 213
    :cond_0
    invoke-super {p0, p1}, Lcom/getcapacitor/Plugin;->checkPermissions(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public createChannel(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 193
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationChannelManager:Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;

    invoke-virtual {v0, p1}, Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;->createChannel(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public deleteChannel(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 198
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationChannelManager:Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;

    invoke-virtual {v0, p1}, Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;->deleteChannel(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public getDeliveredNotifications(Lcom/getcapacitor/PluginCall;)V
    .locals 11
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 125
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 126
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v1}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object v1

    .line 128
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, v1, v4

    .line 129
    new-instance v6, Lcom/getcapacitor/JSObject;

    invoke-direct {v6}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 131
    const-string v7, "id"

    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;

    .line 132
    const-string v7, "tag"

    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getTag()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 134
    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 136
    iget-object v7, v5, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    const-string v8, "android.title"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v7

    const-string v8, "title"

    invoke-virtual {v6, v8, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 137
    iget-object v7, v5, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    const-string v8, "android.text"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v7

    const-string v8, "body"

    invoke-virtual {v6, v8, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 138
    const-string v7, "group"

    invoke-virtual {v5}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 139
    iget v7, v5, Landroid/app/Notification;->flags:I

    and-int/lit16 v7, v7, 0x200

    if-eqz v7, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    :cond_0
    move v7, v3

    :goto_1
    const-string v8, "groupSummary"

    invoke-virtual {v6, v8, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 141
    new-instance v7, Lcom/getcapacitor/JSObject;

    invoke-direct {v7}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 143
    iget-object v8, v5, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    invoke-virtual {v8}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 144
    iget-object v10, v5, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    invoke-virtual {v10, v9}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    goto :goto_2

    .line 147
    :cond_1
    const-string v5, "data"

    invoke-virtual {v6, v5, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 150
    :cond_2
    invoke-virtual {v0, v6}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 153
    :cond_3
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 154
    const-string v2, "notifications"

    invoke-virtual {v1, v2, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 155
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public getPending(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {v0}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->getSavedNotifications()Ljava/util/List;

    move-result-object v0

    .line 104
    invoke-static {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->buildLocalNotificationPendingList(Ljava/util/List;)Lcom/getcapacitor/JSObject;

    move-result-object v0

    .line 105
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method protected handleOnNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 60
    invoke-super {p0, p1}, Lcom/getcapacitor/Plugin;->handleOnNewIntent(Landroid/content/Intent;)V

    .line 61
    const-string v0, "android.intent.action.MAIN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {v0, p1, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->handleNotificationActionPerformed(Landroid/content/Intent;Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 66
    const-string v0, "localNotificationActionPerformed"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public listChannels(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 203
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationChannelManager:Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;

    invoke-virtual {v0, p1}, Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;->listChannels(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public load()V
    .locals 5

    .line 49
    invoke-super {p0}, Lcom/getcapacitor/Plugin;->load()V

    .line 50
    new-instance v0, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    .line 51
    new-instance v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v4}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;-><init>(Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;Landroid/app/Activity;Landroid/content/Context;Lcom/getcapacitor/CapConfig;)V

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    .line 52
    invoke-virtual {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->createNotificationChannel()V

    .line 53
    new-instance v0, Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;

    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationChannelManager:Lcom/capacitorjs/plugins/localnotifications/NotificationChannelManager;

    .line 54
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationManager:Landroid/app/NotificationManager;

    .line 55
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->bridge:Lcom/getcapacitor/Bridge;

    sput-object v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->staticBridge:Lcom/getcapacitor/Bridge;

    return-void
.end method

.method public registerActionTypes(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 110
    const-string v0, "types"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 111
    invoke-static {v0}, Lcom/capacitorjs/plugins/localnotifications/NotificationAction;->buildTypes(Lcom/getcapacitor/JSArray;)Ljava/util/Map;

    move-result-object v0

    .line 112
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {v1, v0}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->writeActionGroup(Ljava/util/Map;)V

    .line 113
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method public removeAllDeliveredNotifications(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 187
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 188
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method public removeDeliveredNotifications(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 160
    const-string v0, "notifications"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 163
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 164
    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_1

    .line 165
    check-cast v1, Lorg/json/JSONObject;

    invoke-static {v1}, Lcom/getcapacitor/JSObject;->fromJSONObject(Lorg/json/JSONObject;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 166
    const-string v2, "tag"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 167
    const-string v3, "id"

    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    if-nez v2, :cond_0

    .line 170
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_0

    .line 172
    :cond_0
    iget-object v3, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v3, v2, v1}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    goto :goto_0

    .line 175
    :cond_1
    const-string v1, "Expected notifications to be a list of notification objects"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 179
    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 182
    :cond_2
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method public requestPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 219
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const-string v2, "display"

    if-lt v0, v1, :cond_1

    invoke-virtual {p0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getPermissionState(Ljava/lang/String;)Lcom/getcapacitor/PermissionState;

    move-result-object v0

    sget-object v1, Lcom/getcapacitor/PermissionState;->GRANTED:Lcom/getcapacitor/PermissionState;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 224
    :cond_0
    const-string v0, "permissionsCallback"

    invoke-virtual {p0, v2, p1, v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->requestPermissionForAlias(Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    return-void

    .line 220
    :cond_1
    :goto_0
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 221
    invoke-direct {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->getNotificationPermissionText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 222
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public schedule(Lcom/getcapacitor/PluginCall;)V
    .locals 7
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 76
    invoke-static {p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->buildNotificationList(Lcom/getcapacitor/PluginCall;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 80
    :cond_0
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->manager:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    invoke-virtual {v1, p1, v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->schedule(Lcom/getcapacitor/PluginCall;Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 82
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationsPlugin;->notificationStorage:Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-virtual {v2, v0}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->appendNotifications(Ljava/util/List;)V

    .line 83
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 84
    new-instance v2, Lcom/getcapacitor/JSArray;

    invoke-direct {v2}, Lcom/getcapacitor/JSArray;-><init>()V

    const/4 v3, 0x0

    .line 85
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 87
    :try_start_0
    new-instance v4, Lcom/getcapacitor/JSObject;

    invoke-direct {v4}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v5, "id"

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;

    move-result-object v4

    .line 88
    invoke-virtual {v2, v4}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 91
    :cond_1
    const-string v1, "notifications"

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 92
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    :cond_2
    :goto_1
    return-void
.end method
