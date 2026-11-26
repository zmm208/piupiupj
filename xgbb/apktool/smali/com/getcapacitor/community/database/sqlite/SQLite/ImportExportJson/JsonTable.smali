.class public Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;
.super Ljava/lang/Object;
.source "JsonTable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "JsonTable"

.field private static final keyTableLevel:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private indexes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private schema:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;",
            ">;"
        }
    .end annotation
.end field

.field private triggers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;",
            ">;"
        }
    .end annotation
.end field

.field private values:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "name"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "schema"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "indexes"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "triggers"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "values"

    aput-object v3, v1, v2

    .line 17
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->keyTableLevel:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->name:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getIndexes()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;",
            ">;"
        }
    .end annotation

    .line 36
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

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

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 70
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "names"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getSchema()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    const-string v1, "schema"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    :cond_1
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getIndexes()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    const-string v1, "indexes"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_2
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getTriggers()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    const-string v1, "triggers"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    :cond_3
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getValues()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_4

    const-string v1, "values"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSchema()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;",
            ">;"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTableAsJSObject()Lcom/getcapacitor/JSObject;
    .locals 7

    .line 184
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 185
    const-string v1, "name"

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 186
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 187
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 188
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;

    .line 189
    invoke-virtual {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->getColumnAsJSObject()Lcom/getcapacitor/JSObject;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 191
    :cond_0
    const-string v2, "schema"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 193
    :cond_1
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 194
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 195
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;

    .line 196
    invoke-virtual {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;->getIndexAsJSObject()Lcom/getcapacitor/JSObject;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 198
    :cond_2
    const-string v2, "indexes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 200
    :cond_3
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 201
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 202
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;

    .line 203
    invoke-virtual {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->getTriggerAsJSObject()Lcom/getcapacitor/JSObject;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 205
    :cond_4
    const-string v2, "triggers"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 207
    :cond_5
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 208
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_9

    .line 209
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 210
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 211
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 212
    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 213
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_4

    .line 215
    :cond_6
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_4

    .line 218
    :cond_7
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3

    .line 220
    :cond_8
    const-string v2, "values"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    :cond_9
    return-object v0
.end method

.method public getTriggers()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;",
            ">;"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getValues()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isTable(Lorg/json/JSONObject;)Z
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsObj"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_14

    .line 79
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_5

    .line 81
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    move v2, v0

    .line 82
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 83
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 84
    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->keyTableLevel:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    return v0

    .line 86
    :cond_2
    :try_start_0
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 87
    const-string v5, "name"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 88
    instance-of v5, v4, Ljava/lang/String;

    if-nez v5, :cond_3

    return v0

    .line 91
    :cond_3
    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->name:Ljava/lang/String;

    .line 94
    :cond_4
    const-string v5, "schema"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 95
    instance-of v2, v4, Lorg/json/JSONArray;

    if-nez v2, :cond_5

    instance-of v2, v4, Ljava/util/ArrayList;

    if-nez v2, :cond_5

    return v0

    .line 98
    :cond_5
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    .line 99
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    move v5, v0

    move v6, v5

    .line 101
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_8

    .line 102
    new-instance v7, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;

    invoke-direct {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;-><init>()V

    .line 103
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->isSchema(Lorg/json/JSONObject;)Z

    move-result v8

    .line 104
    invoke-virtual {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->getColumn()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_6

    add-int/lit8 v5, v5, 0x1

    :cond_6
    if-nez v8, :cond_7

    return v0

    .line 106
    :cond_7
    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_8
    move v2, v5

    .line 110
    :cond_9
    const-string v5, "indexes"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 111
    instance-of v5, v4, Lorg/json/JSONArray;

    if-nez v5, :cond_a

    instance-of v5, v4, Ljava/util/ArrayList;

    if-nez v5, :cond_a

    return v0

    .line 114
    :cond_a
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

    .line 115
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    move v6, v0

    .line 116
    :goto_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_c

    .line 117
    new-instance v7, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;

    invoke-direct {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;-><init>()V

    .line 118
    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;->isIndexes(Lorg/json/JSONObject;)Z

    move-result v8

    if-nez v8, :cond_b

    return v0

    .line 120
    :cond_b
    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 124
    :cond_c
    const-string v5, "triggers"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 125
    instance-of v5, v4, Lorg/json/JSONArray;

    if-nez v5, :cond_d

    instance-of v5, v4, Ljava/util/ArrayList;

    if-nez v5, :cond_d

    return v0

    .line 128
    :cond_d
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    .line 129
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    move v6, v0

    .line 130
    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_f

    .line 131
    new-instance v7, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;

    invoke-direct {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;-><init>()V

    .line 132
    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->isTrigger(Lorg/json/JSONObject;)Z

    move-result v8

    if-nez v8, :cond_e

    return v0

    .line 134
    :cond_e
    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 138
    :cond_f
    const-string v5, "values"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 139
    instance-of v5, v4, Lorg/json/JSONArray;

    if-nez v5, :cond_10

    instance-of v4, v4, Ljava/util/ArrayList;

    if-nez v4, :cond_10

    return v0

    .line 142
    :cond_10
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    .line 143
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    move v4, v0

    .line 144
    :goto_3
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 145
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v5

    .line 146
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move v7, v0

    .line 147
    :goto_4
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v7, v8, :cond_12

    if-lez v2, :cond_11

    .line 148
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-eq v8, v2, :cond_11

    return v0

    .line 149
    :cond_11
    invoke-virtual {v5, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 151
    :cond_12
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :catch_0
    move-exception p1

    .line 156
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    return v0

    :cond_13
    const/4 p1, 0x1

    return p1

    :cond_14
    :goto_5
    return v0
.end method

.method public print()V
    .locals 5

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "name: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "JsonTable"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "number of Schema: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getSchema()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getSchema()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;

    .line 167
    invoke-virtual {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->print()V

    goto :goto_0

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "number of Indexes: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getIndexes()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getIndexes()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;

    .line 171
    invoke-virtual {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;->print()V

    goto :goto_1

    .line 173
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "number of Triggers: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getTriggers()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getTriggers()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;

    .line 175
    invoke-virtual {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->print()V

    goto :goto_2

    .line 177
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "number of Values: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getValues()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getValues()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 179
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "row: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_3
    return-void
.end method

.method public setIndexes(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newIndexes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;",
            ">;)V"
        }
    .end annotation

    .line 57
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->indexes:Ljava/util/ArrayList;

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

    .line 49
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->name:Ljava/lang/String;

    return-void
.end method

.method public setSchema(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newSchema"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;",
            ">;)V"
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->schema:Ljava/util/ArrayList;

    return-void
.end method

.method public setTriggers(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newTriggers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;",
            ">;)V"
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->triggers:Ljava/util/ArrayList;

    return-void
.end method

.method public setValues(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newValues"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 65
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->values:Ljava/util/ArrayList;

    return-void
.end method
