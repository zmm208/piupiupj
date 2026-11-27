.class public Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;
.super Ljava/lang/Object;
.source "LocalNotificationSchedule.java"


# static fields
.field public static JS_DATE_FORMAT:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"


# instance fields
.field private at:Ljava/util/Date;

.field private count:Ljava/lang/Integer;

.field private every:Ljava/lang/String;

.field private on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

.field private repeats:Ljava/lang/Boolean;

.field private scheduleObj:Lcom/getcapacitor/JSObject;

.field private whileIdle:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/getcapacitor/JSObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->scheduleObj:Lcom/getcapacitor/JSObject;

    .line 28
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->buildEveryElement(Lcom/getcapacitor/JSObject;)V

    .line 30
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->buildCountElement(Lcom/getcapacitor/JSObject;)V

    .line 32
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->buildAtElement(Lcom/getcapacitor/JSObject;)V

    .line 34
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->buildOnElement(Lcom/getcapacitor/JSObject;)V

    const/4 v0, 0x0

    .line 37
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "allowWhileIdle"

    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/JSObject;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->whileIdle:Ljava/lang/Boolean;

    return-void
.end method

.method private buildAtElement(Lcom/getcapacitor/JSObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 52
    const-string v0, "repeats"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getBool(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->repeats:Ljava/lang/Boolean;

    .line 53
    const-string v0, "at"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 55
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->JS_DATE_FORMAT:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 56
    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 57
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->at:Ljava/util/Date;

    :cond_0
    return-void
.end method

.method private buildCountElement(Lcom/getcapacitor/JSObject;)V
    .locals 2

    const/4 v0, 0x1

    .line 48
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "count"

    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    return-void
.end method

.method private buildEveryElement(Lcom/getcapacitor/JSObject;)V
    .locals 1

    .line 44
    const-string v0, "every"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->every:Ljava/lang/String;

    return-void
.end method

.method private buildOnElement(Lcom/getcapacitor/JSObject;)V
    .locals 2

    .line 62
    const-string v0, "on"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getJSObject(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 64
    new-instance v0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    invoke-direct {v0}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;-><init>()V

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    .line 65
    const-string v1, "year"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setYear(Ljava/lang/Integer;)V

    .line 66
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    const-string v1, "month"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setMonth(Ljava/lang/Integer;)V

    .line 67
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    const-string v1, "day"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setDay(Ljava/lang/Integer;)V

    .line 68
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    const-string v1, "weekday"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setWeekday(Ljava/lang/Integer;)V

    .line 69
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    const-string v1, "hour"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setHour(Ljava/lang/Integer;)V

    .line 70
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    const-string v1, "minute"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setMinute(Ljava/lang/Integer;)V

    .line 71
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    const-string v1, "second"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setSecond(Ljava/lang/Integer;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public allowWhileIdle()Z
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->whileIdle:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getAt()Ljava/util/Date;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->at:Ljava/util/Date;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getEvery()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->every:Ljava/lang/String;

    return-object v0
.end method

.method public getEveryInterval()Ljava/lang/Long;
    .locals 6

    .line 142
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->every:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, -0x1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "month"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x7

    goto :goto_0

    :sswitch_1
    const-string v1, "year"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x6

    goto :goto_0

    :sswitch_2
    const-string v1, "week"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x5

    goto :goto_0

    :sswitch_3
    const-string v1, "hour"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v3, 0x4

    goto :goto_0

    :sswitch_4
    const-string v1, "day"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_5
    const-string v1, "second"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto :goto_0

    :cond_5
    move v3, v2

    goto :goto_0

    :sswitch_6
    const-string v1, "minute"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_0

    :cond_6
    const/4 v3, 0x1

    goto :goto_0

    :sswitch_7
    const-string v1, "two-weeks"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_0

    :cond_7
    const/4 v3, 0x0

    :goto_0
    const-wide/32 v0, 0x240c8400

    const-wide/32 v4, 0x5265c00

    packed-switch v3, :pswitch_data_0

    const/4 v0, 0x0

    return-object v0

    .line 148
    :pswitch_0
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1e

    int-to-long v0, v0

    mul-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 145
    :pswitch_1
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0x7528ad000L

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 152
    :pswitch_2
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    mul-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 156
    :pswitch_3
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x36ee80

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 154
    :pswitch_4
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 160
    :pswitch_5
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 158
    :pswitch_6
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0xea60

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 150
    :pswitch_7
    iget-object v3, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/2addr v3, v2

    int-to-long v2, v3

    mul-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x43f7b3c2 -> :sswitch_7
        -0x400459ec -> :sswitch_6
        -0x3604bb8c -> :sswitch_5
        0x1839c -> :sswitch_4
        0x30f5e4 -> :sswitch_3
        0x379ff4 -> :sswitch_2
        0x38883d -> :sswitch_1
        0x6342280 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getNextOnSchedule(Ljava/util/Date;)Ljava/lang/Long;
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    invoke-virtual {v0, p1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->nextTrigger(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getOn()Lcom/capacitorjs/plugins/localnotifications/DateMatch;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    return-object v0
.end method

.method public getOnObj()Lcom/getcapacitor/JSObject;
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->scheduleObj:Lcom/getcapacitor/JSObject;

    const-string v1, "on"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->getJSObject(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v0

    return-object v0
.end method

.method public getRepeats()Ljava/lang/Boolean;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->repeats:Ljava/lang/Boolean;

    return-object v0
.end method

.method public isRemovable()Z
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->every:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    if-nez v0, :cond_1

    .line 129
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->at:Ljava/util/Date;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->isRepeating()Z

    move-result v0

    xor-int/2addr v0, v1

    return v0

    :cond_0
    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isRepeating()Z
    .locals 2

    .line 124
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->repeats:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setAt(Ljava/util/Date;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->at:Ljava/util/Date;

    return-void
.end method

.method public setCount(I)V
    .locals 0

    .line 116
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->count:Ljava/lang/Integer;

    return-void
.end method

.method public setEvery(Ljava/lang/String;)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->every:Ljava/lang/String;

    return-void
.end method

.method public setOn(Lcom/capacitorjs/plugins/localnotifications/DateMatch;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->on:Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    return-void
.end method

.method public setRepeats(Ljava/lang/Boolean;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/LocalNotificationSchedule;->repeats:Ljava/lang/Boolean;

    return-void
.end method
