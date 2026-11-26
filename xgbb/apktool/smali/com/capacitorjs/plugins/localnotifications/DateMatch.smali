.class public Lcom/capacitorjs/plugins/localnotifications/DateMatch;
.super Ljava/lang/Object;
.source "DateMatch.java"


# static fields
.field private static final separator:Ljava/lang/String; = " "


# instance fields
.field private day:Ljava/lang/Integer;

.field private hour:Ljava/lang/Integer;

.field private minute:Ljava/lang/Integer;

.field private month:Ljava/lang/Integer;

.field private second:Ljava/lang/Integer;

.field private unit:Ljava/lang/Integer;

.field private weekday:Ljava/lang/Integer;

.field private year:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    return-void
.end method

.method private buildCalendar(Ljava/util/Date;)Ljava/util/Calendar;
    .locals 2

    .line 90
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 91
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/16 p1, 0xe

    const/4 v1, 0x0

    .line 92
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    return-object v0
.end method

.method private buildNextTriggerTime(Ljava/util/Date;)Ljava/util/Calendar;
    .locals 3

    .line 136
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->buildCalendar(Ljava/util/Date;)Ljava/util/Calendar;

    move-result-object p1

    .line 137
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    .line 138
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 139
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 142
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 143
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    .line 145
    :cond_1
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 146
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x5

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 147
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    .line 149
    :cond_2
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 150
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x7

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 151
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    .line 153
    :cond_3
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    if-eqz v0, :cond_4

    .line 154
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0xb

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 155
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    .line 157
    :cond_4
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    if-eqz v0, :cond_5

    .line 158
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0xc

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 159
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    .line 161
    :cond_5
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    if-eqz v0, :cond_6

    .line 162
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0xd

    invoke-virtual {p1, v2, v0}, Ljava/util/Calendar;->set(II)V

    .line 163
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    :cond_6
    return-object p1
.end method

.method public static fromMatchString(Ljava/lang/String;)Lcom/capacitorjs/plugins/localnotifications/DateMatch;
    .locals 11

    .line 250
    new-instance v0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    invoke-direct {v0}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;-><init>()V

    .line 251
    const-string v1, " "

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x6

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x7

    if-eqz p0, :cond_0

    .line 252
    array-length v9, p0

    if-ne v9, v8, :cond_0

    .line 253
    aget-object v9, p0, v7

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setYear(Ljava/lang/Integer;)V

    .line 254
    aget-object v9, p0, v6

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setMonth(Ljava/lang/Integer;)V

    .line 255
    aget-object v9, p0, v5

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setDay(Ljava/lang/Integer;)V

    .line 256
    aget-object v9, p0, v4

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setWeekday(Ljava/lang/Integer;)V

    .line 257
    aget-object v9, p0, v3

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setHour(Ljava/lang/Integer;)V

    .line 258
    aget-object v9, p0, v2

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setMinute(Ljava/lang/Integer;)V

    .line 259
    aget-object v9, p0, v1

    invoke-static {v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setUnit(Ljava/lang/Integer;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 262
    array-length v9, p0

    const/16 v10, 0x8

    if-ne v9, v10, :cond_1

    .line 263
    aget-object v7, p0, v7

    invoke-static {v7}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setYear(Ljava/lang/Integer;)V

    .line 264
    aget-object v6, p0, v6

    invoke-static {v6}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setMonth(Ljava/lang/Integer;)V

    .line 265
    aget-object v5, p0, v5

    invoke-static {v5}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setDay(Ljava/lang/Integer;)V

    .line 266
    aget-object v4, p0, v4

    invoke-static {v4}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setWeekday(Ljava/lang/Integer;)V

    .line 267
    aget-object v3, p0, v3

    invoke-static {v3}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setHour(Ljava/lang/Integer;)V

    .line 268
    aget-object v2, p0, v2

    invoke-static {v2}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setMinute(Ljava/lang/Integer;)V

    .line 269
    aget-object v1, p0, v1

    invoke-static {v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setSecond(Ljava/lang/Integer;)V

    .line 270
    aget-object p0, p0, v8

    invoke-static {p0}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->setUnit(Ljava/lang/Integer;)V

    :cond_1
    return-object v0
.end method

.method public static getValueFromCronElement(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 0

    .line 278
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private postponeTriggerIfNeeded(Ljava/util/Calendar;Ljava/util/Calendar;)J
    .locals 5

    .line 112
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-gtz p1, :cond_7

    iget-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_7

    .line 113
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 114
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_5

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v3, 0x2

    if-ne v1, v3, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v4, 0x5

    if-ne v1, v4, :cond_1

    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    .line 118
    :cond_1
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v3, 0x7

    if-ne v1, v3, :cond_2

    const/4 p1, 0x4

    .line 119
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    .line 120
    :cond_2
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v3, 0xb

    if-ne v1, v3, :cond_3

    .line 121
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    .line 122
    :cond_3
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v4, 0xc

    if-ne v1, v4, :cond_4

    .line 123
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    .line 124
    :cond_4
    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v3, 0xd

    if-ne v1, v3, :cond_6

    .line 125
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    .line 115
    :cond_5
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 128
    :cond_6
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v0, :cond_7

    .line 129
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    add-int/2addr p1, v2

    invoke-virtual {p2, v0, p1}, Ljava/util/Calendar;->set(II)V

    .line 132
    :cond_7
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    return-wide p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_f

    .line 193
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto/16 :goto_6

    .line 195
    :cond_1
    check-cast p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;

    .line 197
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    if-eqz v2, :cond_2

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_2
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    if-eqz v2, :cond_3

    :goto_0
    return v1

    .line 198
    :cond_3
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    if-eqz v2, :cond_4

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto :goto_1

    :cond_4
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    if-eqz v2, :cond_5

    :goto_1
    return v1

    .line 199
    :cond_5
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    if-eqz v2, :cond_6

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    goto :goto_2

    :cond_6
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    if-eqz v2, :cond_7

    :goto_2
    return v1

    .line 200
    :cond_7
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    if-eqz v2, :cond_8

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    goto :goto_3

    :cond_8
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    if-eqz v2, :cond_9

    :goto_3
    return v1

    .line 201
    :cond_9
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    if-eqz v2, :cond_a

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    goto :goto_4

    :cond_a
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    if-eqz v2, :cond_b

    :goto_4
    return v1

    .line 202
    :cond_b
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    if-eqz v2, :cond_c

    iget-object v3, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    goto :goto_5

    :cond_c
    iget-object v2, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    if-eqz v2, :cond_d

    :goto_5
    return v1

    .line 203
    :cond_d
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    iget-object p1, p1, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    if-eqz v2, :cond_e

    invoke-virtual {v2, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_e
    if-nez p1, :cond_f

    return v0

    :cond_f
    :goto_6
    return v1
.end method

.method public getDay()Ljava/lang/Integer;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    return-object v0
.end method

.method public getHour()Ljava/lang/Integer;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMinute()Ljava/lang/Integer;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMonth()Ljava/lang/Integer;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSecond()Ljava/lang/Integer;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    return-object v0
.end method

.method public getUnit()Ljava/lang/Integer;
    .locals 1

    .line 285
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    return-object v0
.end method

.method public getWeekday()Ljava/lang/Integer;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYear()Ljava/lang/Integer;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 208
    iget-object v0, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 209
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 210
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_2

    :cond_2
    move v2, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 211
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_3

    :cond_3
    move v2, v1

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 212
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_4

    :cond_4
    move v2, v1

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 213
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_5

    :cond_5
    move v2, v1

    :goto_5
    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x1f

    .line 214
    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    :cond_6
    add-int/2addr v0, v1

    return v0
.end method

.method public nextTrigger(Ljava/util/Date;)J
    .locals 2

    .line 103
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->buildCalendar(Ljava/util/Date;)Ljava/util/Calendar;

    move-result-object v0

    .line 104
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->buildNextTriggerTime(Ljava/util/Date;)Ljava/util/Calendar;

    move-result-object p1

    .line 105
    invoke-direct {p0, v0, p1}, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->postponeTriggerIfNeeded(Ljava/util/Calendar;Ljava/util/Calendar;)J

    move-result-wide v0

    return-wide v0
.end method

.method public setDay(Ljava/lang/Integer;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    return-void
.end method

.method public setHour(Ljava/lang/Integer;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    return-void
.end method

.method public setMinute(Ljava/lang/Integer;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    return-void
.end method

.method public setMonth(Ljava/lang/Integer;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    return-void
.end method

.method public setSecond(Ljava/lang/Integer;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    return-void
.end method

.method public setUnit(Ljava/lang/Integer;)V
    .locals 0

    .line 289
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    return-void
.end method

.method public setWeekday(Ljava/lang/Integer;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    return-void
.end method

.method public setYear(Ljava/lang/Integer;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    return-void
.end method

.method public toMatchString()Ljava/lang/String;
    .locals 3

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->unit:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 240
    const-string v1, "null"

    const-string v2, "*"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DateMatch{year="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->year:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", month="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->month:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", day="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->day:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", weekday="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->weekday:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", hour="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->hour:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", minute="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->minute:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", second="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/localnotifications/DateMatch;->second:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
