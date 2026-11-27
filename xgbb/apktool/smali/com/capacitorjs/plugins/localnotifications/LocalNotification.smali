.class public Lcom/capacitorjs/plugins/localnotifications/LocalNotification;
.super Ljava/lang/Object;
.source "LocalNotification.java"


# instance fields
.field private actionTypeId:Ljava/lang/String;

.field private attachments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/capacitorjs/plugins/localnotifications/LocalNotificationAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private autoCancel:Z

.field private body:Ljava/lang/String;

.field private channelId:Ljava/lang/String;

.field private extra:Lcom/getcapacitor/JSObject;

.field private group:Ljava/lang/String;

.field private groupSummary:Z

.field private iconColor:Ljava/lang/String;

.field private id:Ljava/lang/Integer;

.field private inboxList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private largeBody:Ljava/lang/String;

.field private largeIcon:Ljava/lang/String;

.field private ongoing:Z

.field private schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

.field private smallIcon:Ljava/lang/String;

.field private sound:Ljava/lang/String;

.field private source:Ljava/lang/String;

.field private summaryText:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildLocalNotificationPendingList(Ljava/util/List;)Lcom/getcapacitor/JSObject;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/capacitorjs/plugins/localnotifications/LocalNotification;",
            ">;)",
            "Lcom/getcapacitor/JSObject;"
        }
    .end annotation

    .line 307
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 308
    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 309
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;

    .line 310
    new-instance v3, Lcom/getcapacitor/JSObject;

    invoke-direct {v3}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 311
    const-string v4, "id"

    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 312
    const-string v4, "title"

    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 313
    const-string v4, "body"

    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getBody()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 314
    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getSchedule()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 316
    new-instance v5, Lcom/getcapacitor/JSObject;

    invoke-direct {v5}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 317
    const-string v6, "at"

    invoke-virtual {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getAt()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 318
    const-string v6, "every"

    invoke-virtual {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getEvery()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 319
    const-string v6, "count"

    invoke-virtual {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getCount()I

    move-result v7

    invoke-virtual {v5, v6, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;

    .line 320
    const-string v6, "on"

    invoke-virtual {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getOnObj()Lcom/getcapacitor/JSObject;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 321
    const-string v6, "repeats"

    invoke-virtual {v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->isRepeating()Z

    move-result v4

    invoke-virtual {v5, v6, v4}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 322
    const-string v4, "schedule"

    invoke-virtual {v3, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 325
    :cond_0
    const-string v4, "extra"

    invoke-virtual {v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->getExtra()Lcom/getcapacitor/JSObject;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 327
    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 329
    :cond_1
    const-string p0, "notifications"

    invoke-virtual {v0, p0, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    return-object v0
.end method

.method public static buildNotificationFromJSObject(Lcom/getcapacitor/JSObject;)Lcom/capacitorjs/plugins/localnotifications/LocalNotification;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 250
    new-instance v0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;

    invoke-direct {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;-><init>()V

    .line 251
    invoke-virtual {p0}, Lcom/getcapacitor/JSObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setSource(Ljava/lang/String;)V

    .line 252
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setId(Ljava/lang/Integer;)V

    .line 253
    const-string v1, "body"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setBody(Ljava/lang/String;)V

    .line 254
    const-string v1, "largeBody"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setLargeBody(Ljava/lang/String;)V

    .line 255
    const-string v1, "summaryText"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setSummaryText(Ljava/lang/String;)V

    .line 256
    const-string v1, "actionTypeId"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setActionTypeId(Ljava/lang/String;)V

    .line 257
    const-string v1, "group"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setGroup(Ljava/lang/String;)V

    .line 258
    const-string v1, "sound"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setSound(Ljava/lang/String;)V

    .line 259
    const-string v1, "title"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setTitle(Ljava/lang/String;)V

    .line 260
    const-string v1, "smallIcon"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setSmallIcon(Ljava/lang/String;)V

    .line 261
    const-string v1, "largeIcon"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setLargeIcon(Ljava/lang/String;)V

    .line 262
    const-string v1, "iconColor"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setIconColor(Ljava/lang/String;)V

    .line 263
    invoke-static {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationAttachment;->getAttachments(Lcom/getcapacitor/JSObject;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setAttachments(Ljava/util/List;)V

    const/4 v1, 0x0

    .line 264
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "groupSummary"

    invoke-virtual {p0, v3, v2}, Lcom/getcapacitor/JSObject;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setGroupSummary(Z)V

    .line 265
    const-string v3, "channelId"

    invoke-virtual {p0, v3}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setChannelId(Ljava/lang/String;)V

    .line 266
    const-string v3, "schedule"

    invoke-virtual {p0, v3}, Lcom/getcapacitor/JSObject;->getJSObject(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 268
    new-instance v4, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    invoke-direct {v4, v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;-><init>(Lcom/getcapacitor/JSObject;)V

    invoke-virtual {v0, v4}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setSchedule(Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;)V

    .line 270
    :cond_0
    const-string v3, "extra"

    invoke-virtual {p0, v3}, Lcom/getcapacitor/JSObject;->getJSObject(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setExtra(Lcom/getcapacitor/JSObject;)V

    .line 271
    const-string v3, "ongoing"

    invoke-virtual {p0, v3, v2}, Lcom/getcapacitor/JSObject;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setOngoing(Z)V

    .line 272
    const-string v2, "autoCancel"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/getcapacitor/JSObject;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setAutoCancel(Z)V

    .line 275
    :try_start_0
    const-string v2, "inboxList"

    invoke-virtual {p0, v2}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 277
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 278
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 279
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 281
    :cond_1
    invoke-virtual {v0, v2}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->setInboxList(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    return-object v0
.end method

.method public static buildNotificationList(Lcom/getcapacitor/PluginCall;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            ")",
            "Ljava/util/List<",
            "Lcom/capacitorjs/plugins/localnotifications/LocalNotification;",
            ">;"
        }
    .end annotation

    .line 210
    const-string v0, "notifications"

    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 212
    const-string v0, "Must provide notifications array as notifications option"

    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-object v1

    .line 215
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/getcapacitor/JSArray;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 218
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 224
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 227
    :try_start_1
    const-string v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v4, v6

    if-gtz v6, :cond_2

    const-wide/32 v6, -0x80000000

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    goto :goto_1

    .line 232
    :cond_1
    invoke-static {v3}, Lcom/getcapacitor/JSObject;->fromJSONObject(Lorg/json/JSONObject;)Lcom/getcapacitor/JSObject;

    move-result-object v3
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 239
    :try_start_2
    invoke-static {v3}, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->buildNotificationFromJSObject(Lcom/getcapacitor/JSObject;)Lcom/capacitorjs/plugins/localnotifications/LocalNotification;

    move-result-object v3

    .line 240
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 242
    const-string v2, "Invalid date format sent to Notification plugin"

    invoke-virtual {p0, v2, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;Ljava/lang/Exception;)V

    return-object v1

    .line 229
    :cond_2
    :goto_1
    :try_start_3
    const-string v0, "The identifier should be a Java int"

    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    return-object v1

    :catch_1
    move-exception v0

    .line 234
    const-string v2, "Invalid JSON object sent to NotificationPlugin"

    invoke-virtual {p0, v2, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;Ljava/lang/Exception;)V

    return-object v1

    :cond_3
    return-object v2

    .line 220
    :catch_2
    const-string v0, "Provided notification format is invalid"

    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-object v1
.end method

.method public static getLocalNotificationPendingList(Lcom/getcapacitor/PluginCall;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 291
    :try_start_0
    const-string v1, "notifications"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_2

    .line 293
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 297
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 298
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catch_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 300
    :try_start_1
    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :cond_1
    return-object p0

    .line 294
    :cond_2
    :goto_2
    const-string v1, "Must provide notifications array as notifications option"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_20

    .line 408
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto/16 :goto_d

    .line 410
    :cond_1
    check-cast p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;

    .line 412
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_2
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    if-eqz v2, :cond_3

    :goto_0
    return v1

    .line 413
    :cond_3
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto :goto_1

    :cond_4
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    if-eqz v2, :cond_5

    :goto_1
    return v1

    .line 414
    :cond_5
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeBody:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeBody:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    goto :goto_2

    :cond_6
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeBody:Ljava/lang/String;

    if-eqz v2, :cond_7

    :goto_2
    return v1

    .line 415
    :cond_7
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    if-eqz v2, :cond_8

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    goto :goto_3

    :cond_8
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    if-eqz v2, :cond_9

    :goto_3
    return v1

    .line 416
    :cond_9
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    if-eqz v2, :cond_a

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    goto :goto_4

    :cond_a
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    if-eqz v2, :cond_b

    :goto_4
    return v1

    .line 417
    :cond_b
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    if-eqz v2, :cond_c

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    goto :goto_5

    :cond_c
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    if-eqz v2, :cond_d

    :goto_5
    return v1

    .line 418
    :cond_d
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeIcon:Ljava/lang/String;

    if-eqz v2, :cond_e

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeIcon:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    goto :goto_6

    :cond_e
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeIcon:Ljava/lang/String;

    if-eqz v2, :cond_f

    :goto_6
    return v1

    .line 419
    :cond_f
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    if-eqz v2, :cond_10

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    goto :goto_7

    :cond_10
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    if-eqz v2, :cond_11

    :goto_7
    return v1

    .line 420
    :cond_11
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    if-eqz v2, :cond_12

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_13

    goto :goto_8

    :cond_12
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    if-eqz v2, :cond_13

    :goto_8
    return v1

    .line 421
    :cond_13
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    if-eqz v2, :cond_14

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    goto :goto_9

    :cond_14
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    if-eqz v2, :cond_15

    :goto_9
    return v1

    .line 422
    :cond_15
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    if-eqz v2, :cond_16

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    goto :goto_a

    :cond_16
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    if-eqz v2, :cond_17

    :goto_a
    return v1

    .line 423
    :cond_17
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    if-eqz v2, :cond_18

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_b

    :cond_18
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    if-eqz v2, :cond_19

    :goto_b
    return v1

    .line 424
    :cond_19
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->inboxList:Ljava/util/List;

    if-eqz v2, :cond_1a

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->inboxList:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    goto :goto_c

    :cond_1a
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->inboxList:Ljava/util/List;

    if-eqz v2, :cond_1b

    :goto_c
    return v1

    .line 425
    :cond_1b
    iget-boolean v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->groupSummary:Z

    iget-boolean v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->groupSummary:Z

    if-eq v2, v3, :cond_1c

    return v1

    .line 426
    :cond_1c
    iget-boolean v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->ongoing:Z

    iget-boolean v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->ongoing:Z

    if-eq v2, v3, :cond_1d

    return v1

    .line 427
    :cond_1d
    iget-boolean v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->autoCancel:Z

    iget-boolean v3, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->autoCancel:Z

    if-eq v2, v3, :cond_1e

    return v1

    .line 428
    :cond_1e
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    iget-object p1, p1, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    if-eqz v2, :cond_1f

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1f
    if-nez p1, :cond_20

    return v0

    :cond_20
    :goto_d
    return v1
.end method

.method public getActionTypeId()Ljava/lang/String;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    return-object v0
.end method

.method public getAttachments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/capacitorjs/plugins/localnotifications/LocalNotificationAttachment;",
            ">;"
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getChannelId()Ljava/lang/String;
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->channelId:Ljava/lang/String;

    return-object v0
.end method

.method public getExtra()Lcom/getcapacitor/JSObject;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    return-object v0
.end method

.method public getGroup()Ljava/lang/String;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getIconColor(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    return-object p1
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getInboxList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->inboxList:Ljava/util/List;

    return-object v0
.end method

.method public getLargeBody()Ljava/lang/String;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeBody:Ljava/lang/String;

    return-object v0
.end method

.method public getLargeIcon(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 2

    .line 348
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeIcon:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 349
    const-string v1, "drawable"

    invoke-static {p1, v0, v1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 350
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getSchedule()Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    return-object v0
.end method

.method public getSmallIcon(Landroid/content/Context;I)I
    .locals 2

    .line 336
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 337
    const-string v1, "drawable"

    invoke-static {p1, v0, v1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    return p2

    :cond_1
    return p1
.end method

.method public getSound(Landroid/content/Context;I)Ljava/lang/String;
    .locals 2

    .line 88
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    invoke-static {v0}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 90
    const-string v1, "raw"

    invoke-static {p1, v0, v1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move p2, v0

    :goto_1
    if-eqz p2, :cond_2

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "android.resource://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .line 460
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->source:Ljava/lang/String;

    return-object v0
.end method

.method public getSummaryText()Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->summaryText:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 433
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 434
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 435
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_2

    :cond_2
    move v2, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 436
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_3

    :cond_3
    move v2, v1

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 437
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_4

    :cond_4
    move v2, v1

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 438
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_5

    :cond_5
    move v2, v1

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 439
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_6

    :cond_6
    move v2, v1

    :goto_6
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 440
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_7

    :cond_7
    move v2, v1

    :goto_7
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 441
    iget-boolean v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->groupSummary:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 442
    iget-boolean v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->ongoing:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 443
    iget-boolean v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->autoCancel:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 444
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    if-eqz v2, :cond_8

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_8

    :cond_8
    move v2, v1

    :goto_8
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 445
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    if-eqz v2, :cond_9

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_9

    :cond_9
    move v2, v1

    :goto_9
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 446
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    if-eqz v2, :cond_a

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_a
    add-int/2addr v0, v1

    return v0
.end method

.method public isAutoCancel()Z
    .locals 1

    .line 191
    iget-boolean v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->autoCancel:Z

    return v0
.end method

.method public isGroupSummary()Z
    .locals 1

    .line 175
    iget-boolean v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->groupSummary:Z

    return v0
.end method

.method public isOngoing()Z
    .locals 1

    .line 183
    iget-boolean v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->ongoing:Z

    return v0
.end method

.method public isScheduled()Z
    .locals 1

    .line 357
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    if-eqz v0, :cond_1

    .line 358
    invoke-virtual {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getOn()Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    invoke-virtual {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getAt()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    invoke-virtual {v0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->getEvery()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public setActionTypeId(Ljava/lang/String;)V
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    return-void
.end method

.method public setAttachments(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/capacitorjs/plugins/localnotifications/LocalNotificationAttachment;",
            ">;)V"
        }
    .end annotation

    .line 139
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    return-void
.end method

.method public setAutoCancel(Z)V
    .locals 0

    .line 195
    iput-boolean p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->autoCancel:Z

    return-void
.end method

.method public setBody(Ljava/lang/String;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    return-void
.end method

.method public setChannelId(Ljava/lang/String;)V
    .locals 0

    .line 203
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->channelId:Ljava/lang/String;

    return-void
.end method

.method public setExtra(Lcom/getcapacitor/JSObject;)V
    .locals 0

    .line 163
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    return-void
.end method

.method public setExtraFromString(Ljava/lang/String;)V
    .locals 3

    .line 452
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 453
    invoke-static {v0}, Lcom/getcapacitor/JSObject;->fromJSONObject(Lorg/json/JSONObject;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const/4 v0, 0x1

    .line 455
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "LN"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Cannot rebuild extra data"

    invoke-static {v0, v1, p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 0

    .line 155
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    return-void
.end method

.method public setGroupSummary(Z)V
    .locals 0

    .line 179
    iput-boolean p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->groupSummary:Z

    return-void
.end method

.method public setIconColor(Ljava/lang/String;)V
    .locals 0

    .line 131
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0

    .line 171
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    return-void
.end method

.method public setInboxList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 114
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->inboxList:Ljava/util/List;

    return-void
.end method

.method public setLargeBody(Ljava/lang/String;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeBody:Ljava/lang/String;

    return-void
.end method

.method public setLargeIcon(Ljava/lang/String;)V
    .locals 0

    .line 110
    invoke-static {p1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->largeIcon:Ljava/lang/String;

    return-void
.end method

.method public setOngoing(Z)V
    .locals 0

    .line 187
    iput-boolean p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->ongoing:Z

    return-void
.end method

.method public setSchedule(Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    return-void
.end method

.method public setSmallIcon(Ljava/lang/String;)V
    .locals 0

    .line 106
    invoke-static {p1}, Lcom/getcapacitor/plugin/util/AssetUtil;->getResourceBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    return-void
.end method

.method public setSound(Ljava/lang/String;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0

    .line 464
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->source:Ljava/lang/String;

    return-void
.end method

.method public setSummaryText(Ljava/lang/String;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->summaryText:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 364
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LocalNotification{title=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', body=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->body:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->id:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sound=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->sound:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', smallIcon=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->smallIcon:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', iconColor=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->iconColor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', actionTypeId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->actionTypeId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', group=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->group:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', extra="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->extra:Lcom/getcapacitor/JSObject;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", attachments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->attachments:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", schedule="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->schedule:Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", groupSummary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->groupSummary:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ongoing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->ongoing:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", autoCancel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotification;->autoCancel:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
