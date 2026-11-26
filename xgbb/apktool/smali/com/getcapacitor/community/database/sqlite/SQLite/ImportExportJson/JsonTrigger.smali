.class public Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;
.super Ljava/lang/Object;
.source "JsonTrigger.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "JsonTrigger"

.field private static final keyTriggerLevel:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private condition:Ljava/lang/String;

.field private logic:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private timeevent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "name"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "timeevent"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "condition"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "logic"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->keyTriggerLevel:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->name:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->timeevent:Ljava/lang/String;

    .line 18
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->condition:Ljava/lang/String;

    .line 19
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->logic:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCondition()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->condition:Ljava/lang/String;

    return-object v0
.end method

.method public getKeys()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 57
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "name"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getTimeevent()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getTimeevent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    const-string v1, "timeevent"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    :cond_1
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getCondition()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getCondition()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    const-string v1, "condition"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    :cond_2
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getLogic()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getLogic()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    const-string v1, "logic"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object v0
.end method

.method public getLogic()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->logic:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeevent()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->timeevent:Ljava/lang/String;

    return-object v0
.end method

.method public getTriggerAsJSObject()Lcom/getcapacitor/JSObject;
    .locals 3

    .line 117
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 118
    const-string v1, "name"

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 119
    const-string v1, "timeevent"

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->timeevent:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 120
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->condition:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v2, "condition"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 121
    :cond_0
    const-string v1, "logic"

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->logic:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    return-object v0
.end method

.method public isTrigger(Lorg/json/JSONObject;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsObj"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_b

    .line 65
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 66
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 67
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 68
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 69
    sget-object v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->keyTriggerLevel:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v0

    .line 71
    :cond_2
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 73
    const-string v4, "name"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 74
    instance-of v4, v3, Ljava/lang/String;

    if-nez v4, :cond_3

    return v0

    .line 77
    :cond_3
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->name:Ljava/lang/String;

    .line 80
    :cond_4
    const-string v4, "timeevent"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 81
    instance-of v4, v3, Ljava/lang/String;

    if-nez v4, :cond_5

    return v0

    .line 84
    :cond_5
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->timeevent:Ljava/lang/String;

    .line 87
    :cond_6
    const-string v4, "condition"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 88
    instance-of v4, v3, Ljava/lang/String;

    if-nez v4, :cond_7

    return v0

    .line 91
    :cond_7
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->condition:Ljava/lang/String;

    .line 94
    :cond_8
    const-string v4, "logic"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    instance-of v2, v3, Ljava/lang/String;

    if-nez v2, :cond_9

    return v0

    .line 98
    :cond_9
    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->logic:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 102
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    return v0

    :cond_a
    const/4 p1, 0x1

    return p1

    :cond_b
    :goto_1
    return v0
.end method

.method public print()V
    .locals 2

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "name: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " timeevent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getTimeevent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getCondition()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " condition: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getCondition()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 113
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " logic: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getLogic()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "JsonTrigger"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setCondition(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newCondition"
        }
    .end annotation

    .line 48
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->condition:Ljava/lang/String;

    return-void
.end method

.method public setLogic(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newLogic"
        }
    .end annotation

    .line 52
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->logic:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newName"
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->name:Ljava/lang/String;

    return-void
.end method

.method public setTimeevent(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newTimeevent"
        }
    .end annotation

    .line 44
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->timeevent:Ljava/lang/String;

    return-void
.end method
