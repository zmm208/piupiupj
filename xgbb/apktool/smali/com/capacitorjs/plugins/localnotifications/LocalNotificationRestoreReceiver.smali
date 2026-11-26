.class public Lcom/capacitorjs/plugins/localnotifications/LocalNotificationRestoreReceiver;
.super Landroid/content/BroadcastReceiver;
.source "LocalNotificationRestoreReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9

    .line 16
    const-class p2, Landroid/os/UserManager;

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/os/UserManager;

    if-eqz p2, :cond_5

    .line 17
    invoke-virtual {p2}, Landroid/os/UserManager;->isUserUnlocked()Z

    move-result p2

    if-nez p2, :cond_0

    goto/16 :goto_1

    .line 19
    :cond_0
    new-instance p2, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;

    invoke-direct {p2, p1}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-virtual {p2}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->getSavedNotificationIds()Ljava/util/List;

    move-result-object v0

    .line 22
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 23
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 25
    invoke-virtual {p2, v3}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->getSavedNotification(Ljava/lang/String;)Lcom/capacitorjs/plugins/localnotifications/LocalNotification;

    move-result-object v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSchedule()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 32
    invoke-virtual {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getAt()Ljava/util/Date;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 33
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5, v6}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 35
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    const-wide/16 v7, 0x3a98

    add-long/2addr v5, v7

    .line 36
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v7}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->setAt(Ljava/util/Date;)V

    .line 37
    invoke-virtual {v3, v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setSchedule(Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;)V

    .line 38
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    :cond_2
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 45
    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 46
    invoke-virtual {p2, v2}, Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;->appendNotifications(Ljava/util/List;)V

    .line 49
    :cond_4
    invoke-static {p1}, Lcom/getcapacitor/CapConfig;->loadDefault(Landroid/content/Context;)Lcom/getcapacitor/CapConfig;

    move-result-object v0

    .line 50
    new-instance v2, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;

    const/4 v3, 0x0

    invoke-direct {v2, p2, v3, p1, v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;-><init>(Lcom/capacitorjs/plugins/localnotifications/NotificationStorage;Landroid/app/Activity;Landroid/content/Context;Lcom/getcapacitor/CapConfig;)V

    .line 52
    invoke-virtual {v2, v3, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationManager;->schedule(Lcom/getcapacitor/PluginCall;Ljava/util/List;)Lorg/json/JSONArray;

    :cond_5
    :goto_1
    return-void
.end method
