.class public Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;
.super Ljava/lang/Object;
.source "JsonSQLite.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "JsonSQLite"

.field private static final keyFirstLevel:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private database:Ljava/lang/String;

.field private encrypted:Ljava/lang/Boolean;

.field private mode:Ljava/lang/String;

.field private overwrite:Ljava/lang/Boolean;

.field private tables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;",
            ">;"
        }
    .end annotation
.end field

.field private version:Ljava/lang/Integer;

.field private views:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "database"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "version"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "overwrite"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "encrypted"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "mode"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "tables"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "views"

    aput-object v3, v1, v2

    .line 26
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->keyFirstLevel:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->database:Ljava/lang/String;

    const/4 v1, 0x1

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->version:Ljava/lang/Integer;

    const/4 v1, 0x0

    .line 19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->overwrite:Ljava/lang/Boolean;

    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->encrypted:Ljava/lang/Boolean;

    .line 21
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->mode:Ljava/lang/String;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->tables:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->views:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getDatabase()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->database:Ljava/lang/String;

    return-object v0
.end method

.method public getEncrypted()Ljava/lang/Boolean;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->encrypted:Ljava/lang/Boolean;

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

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getDatabase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getVersion()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "version"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_1
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getOverwrite()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "overwrite"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    :cond_2
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getEncrypted()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v1, "encrypted"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_3
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    const-string v1, "mode"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_4
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getTables()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5

    const-string v1, "tables"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_5
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_6

    const-string v1, "views"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    return-object v0
.end method

.method public getMode()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->mode:Ljava/lang/String;

    return-object v0
.end method

.method public getOverwrite()Ljava/lang/Boolean;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->overwrite:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTables()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;",
            ">;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->tables:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTablesAsJSObject()Lcom/getcapacitor/JSArray;
    .locals 3

    .line 222
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 223
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->tables:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;

    .line 224
    invoke-virtual {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getTableAsJSObject()Lcom/getcapacitor/JSObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getVersion()Ljava/lang/Integer;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->version:Ljava/lang/Integer;

    return-object v0
.end method

.method public getViews()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;",
            ">;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->views:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getViewsAsJSObject()Lcom/getcapacitor/JSArray;
    .locals 3

    .line 230
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 231
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->views:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;

    .line 232
    invoke-virtual {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;->getViewAsJSObject()Lcom/getcapacitor/JSObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public isJsonSQLite(Lcom/getcapacitor/JSObject;Ljava/lang/Boolean;)Z
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "jsObj",
            "isEncryption"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_14

    .line 100
    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 101
    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 102
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 103
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 104
    sget-object v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->keyFirstLevel:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v0

    .line 106
    :cond_2
    :try_start_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 108
    const-string v4, "database"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 109
    instance-of v2, v3, Ljava/lang/String;

    if-nez v2, :cond_3

    return v0

    .line 112
    :cond_3
    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->database:Ljava/lang/String;

    goto :goto_0

    .line 116
    :cond_4
    const-string v4, "version"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 117
    instance-of v2, v3, Ljava/lang/Integer;

    if-nez v2, :cond_5

    return v0

    .line 120
    :cond_5
    check-cast v3, Ljava/lang/Integer;

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->version:Ljava/lang/Integer;

    goto :goto_0

    .line 124
    :cond_6
    const-string v4, "overwrite"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 125
    instance-of v3, v3, Ljava/lang/Boolean;

    if-nez v3, :cond_7

    return v0

    .line 128
    :cond_7
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->getBool(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->overwrite:Ljava/lang/Boolean;

    goto :goto_0

    .line 132
    :cond_8
    const-string v4, "encrypted"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 133
    instance-of v3, v3, Ljava/lang/Boolean;

    if-nez v3, :cond_9

    return v0

    .line 136
    :cond_9
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->getBool(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->encrypted:Ljava/lang/Boolean;

    .line 137
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_1

    return v0

    .line 143
    :cond_a
    const-string v4, "mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 144
    instance-of v3, v3, Ljava/lang/String;

    if-nez v3, :cond_b

    return v0

    .line 147
    :cond_b
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->mode:Ljava/lang/String;

    goto/16 :goto_0

    .line 151
    :cond_c
    const-string v4, "tables"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, "JsonSQLite"

    if-eqz v4, :cond_10

    .line 152
    :try_start_1
    instance-of v4, v3, Lorg/json/JSONArray;

    if-nez v4, :cond_d

    .line 153
    const-string p1, "value: not instance of JSONArray 1"

    .line 154
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 158
    :cond_d
    instance-of v3, v3, Lorg/json/JSONArray;

    if-eqz v3, :cond_f

    .line 159
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 160
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->tables:Ljava/util/ArrayList;

    move v3, v0

    .line 162
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 163
    new-instance v4, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;

    invoke-direct {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;-><init>()V

    .line 164
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->isTable(Lorg/json/JSONObject;)Z

    move-result v5

    if-nez v5, :cond_e

    return v0

    .line 167
    :cond_e
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->tables:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 170
    :cond_f
    const-string v2, "value: not instance of "

    .line 171
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "JSONArray 2"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 172
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 177
    :cond_10
    const-string v4, "views"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 178
    instance-of v3, v3, Lorg/json/JSONArray;

    if-nez v3, :cond_11

    .line 179
    const-string p1, "value: not instance of JSONArray"

    .line 180
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 183
    :cond_11
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 184
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->views:Ljava/util/ArrayList;

    move v3, v0

    .line 186
    :goto_2
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 187
    new-instance v4, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;

    invoke-direct {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;-><init>()V

    .line 188
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;->isView(Lorg/json/JSONObject;)Z

    move-result v5

    if-nez v5, :cond_12

    return v0

    .line 190
    :cond_12
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->views:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :catch_0
    move-exception p1

    .line 196
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    return v0

    :cond_13
    const/4 p1, 0x1

    return p1

    :cond_14
    :goto_3
    return v0
.end method

.method public print()V
    .locals 3

    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "database: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getDatabase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "JsonSQLite"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "version: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getVersion()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "overwrite: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getOverwrite()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "encrypted: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getEncrypted()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "mode: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "number of Tables: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getTables()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getTables()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;

    .line 211
    invoke-virtual {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->print()V

    goto :goto_0

    .line 213
    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 214
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "number of Views: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;

    .line 216
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;->print()V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public setDatabase(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newDatabase"
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->database:Ljava/lang/String;

    return-void
.end method

.method public setEncrypted(Ljava/lang/Boolean;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newEncrypted"
        }
    .end annotation

    .line 72
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->encrypted:Ljava/lang/Boolean;

    return-void
.end method

.method public setMode(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newMode"
        }
    .end annotation

    .line 76
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->mode:Ljava/lang/String;

    return-void
.end method

.method public setOverwrite(Ljava/lang/Boolean;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newOverwrite"
        }
    .end annotation

    .line 68
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->overwrite:Ljava/lang/Boolean;

    return-void
.end method

.method public setTables(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newTables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;",
            ">;)V"
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->tables:Ljava/util/ArrayList;

    return-void
.end method

.method public setVersion(Ljava/lang/Integer;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newVersion"
        }
    .end annotation

    .line 64
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->version:Ljava/lang/Integer;

    return-void
.end method

.method public setViews(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newViews"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;",
            ">;)V"
        }
    .end annotation

    .line 84
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->views:Ljava/util/ArrayList;

    return-void
.end method
