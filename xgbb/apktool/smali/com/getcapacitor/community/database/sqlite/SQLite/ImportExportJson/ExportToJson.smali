.class public Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;
.super Ljava/lang/Object;
.source "ExportToJson.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final _uDrop:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

.field private final uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-class v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    .line 20
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->_uDrop:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

    return-void
.end method

.method private getIndexes(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mDb",
            "tableName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/Database;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 394
    const-string v0, "UNIQUE"

    const-string v1, "GetIndexes: "

    .line 395
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 398
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SELECT name,tbl_name,sql FROM sqlite_master WHERE type = \'index\' AND tbl_name = \'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 399
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' AND sql NOTNULL;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 401
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v3, v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1

    .line 402
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object p1

    .line 403
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_3

    const/4 v3, 0x0

    .line 404
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 405
    new-instance v4, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;

    invoke-direct {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;-><init>()V

    .line 406
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getcapacitor/JSObject;

    const-string v6, "tbl_name"

    invoke-virtual {v5, v6}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 407
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getcapacitor/JSObject;

    const-string v6, "name"

    invoke-virtual {v5, v6}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;->setName(Ljava/lang/String;)V

    .line 408
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getcapacitor/JSObject;

    const-string v6, "sql"

    invoke-virtual {v5, v6}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 409
    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 410
    invoke-virtual {v4, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;->setMode(Ljava/lang/String;)V

    :cond_0
    if-eqz v5, :cond_1

    .line 413
    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    .line 414
    const-string v7, ")"

    invoke-virtual {v5, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v6, v6, 0x1

    .line 415
    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonIndex;->setValue(Ljava/lang/String;)V

    .line 416
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 418
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "sql statement is null"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 421
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "table name doesn\'t match"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-object v2

    :catch_0
    move-exception p1

    .line 427
    new-instance p2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private getIndices(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "textString",
            "search"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 314
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :cond_0
    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 318
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-eq v1, v2, :cond_0

    .line 320
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getPartialModeData(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;)Lcom/getcapacitor/JSObject;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mDb",
            "resTables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 636
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 642
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getSyncDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/lang/Long;

    move-result-object v1

    .line 643
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 648
    invoke-direct {p0, p1, p2, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getTablesModified(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;Ljava/lang/Long;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    .line 649
    const-string p2, "syncDate"

    invoke-virtual {v0, p2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 650
    const-string p2, "modTables"

    invoke-virtual {v0, p2, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    return-object v0

    .line 644
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "GetPartialModeData: did not find a sync_date"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 653
    new-instance p2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GetPartialModeData: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private getSchema(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 19
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sqlStmt"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 333
    const-string v1, "_"

    const-string v2, ","

    .line 334
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 336
    const-string v4, "("

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x1

    add-int/2addr v5, v6

    const-string v7, ")"

    invoke-virtual {v0, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v0, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v5, p0

    .line 339
    :try_start_0
    invoke-direct {v5, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->modEmbeddedParentheses(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 340
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 343
    array-length v8, v0

    const/4 v9, 0x0

    move v10, v9

    :goto_0
    if-ge v10, v8, :cond_5

    aget-object v11, v0, v10

    .line 344
    const-string v12, "\n"

    const-string v13, ""

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 345
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    const-string v13, "\\s+"

    const/4 v14, 0x2

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v12

    .line 346
    new-instance v13, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;

    invoke-direct {v13}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;-><init>()V

    .line 347
    aget-object v15, v12, v9

    invoke-virtual {v15}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v15

    .line 350
    aget-object v16, v12, v9

    move/from16 p1, v9

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v16
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v14, "PRIMARY"

    sparse-switch v16, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    :try_start_1
    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v6, 0x1

    goto :goto_2

    :sswitch_1
    const-string v6, "CONSTRAINT"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x3

    goto :goto_2

    :sswitch_2
    const-string v6, "FOREIGN"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move/from16 v6, p1

    goto :goto_2

    :sswitch_3
    const-string v6, "UNIQUE"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v6, :cond_0

    const/4 v6, 0x2

    goto :goto_2

    :cond_0
    :goto_1
    const/4 v6, -0x1

    :goto_2
    const-string v9, "\u00a7"

    if-eqz v6, :cond_4

    move-object/from16 v18, v0

    const/4 v0, 0x1

    if-eq v6, v0, :cond_2

    const/4 v0, 0x2

    if-eq v6, v0, :cond_2

    const/4 v0, 0x3

    if-eq v6, v0, :cond_1

    .line 375
    :try_start_2
    aget-object v0, v12, p1

    invoke-virtual {v13, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->setColumn(Ljava/lang/String;)V

    :goto_3
    move/from16 v14, p1

    :goto_4
    const/16 v17, 0x1

    goto/16 :goto_6

    :cond_1
    const/16 v17, 0x1

    .line 370
    aget-object v0, v12, v17

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v6, " "

    const/4 v11, 0x2

    invoke-virtual {v0, v6, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 371
    aget-object v6, v0, p1

    aput-object v6, v12, p1

    .line 372
    invoke-virtual {v13, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->setConstraint(Ljava/lang/String;)V

    const/16 v17, 0x1

    .line 373
    aget-object v0, v0, v17

    aput-object v0, v12, v17

    goto :goto_3

    .line 360
    :cond_2
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "CPK_"

    goto :goto_5

    :cond_3
    const-string v0, "CUN_"

    .line 361
    :goto_5
    invoke-virtual {v11, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 362
    invoke-virtual {v11, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    const/16 v17, 0x1

    add-int/lit8 v6, v6, 0x1

    .line 363
    invoke-virtual {v11, v6, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 364
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v6, v9, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v12, p1

    .line 365
    const-string v6, "_ "

    invoke-virtual {v0, v6, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v12, p1

    add-int/lit8 v14, v14, 0x1

    move/from16 v0, p1

    .line 366
    invoke-virtual {v11, v0, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const/16 v17, 0x1

    aput-object v6, v12, v17

    .line 367
    aget-object v6, v12, v0

    invoke-virtual {v13, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->setConstraint(Ljava/lang/String;)V

    const/4 v14, 0x0

    goto :goto_4

    :cond_4
    move-object/from16 v18, v0

    .line 352
    invoke-virtual {v11, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 353
    invoke-virtual {v11, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/16 v17, 0x1

    add-int/lit8 v0, v0, 0x1

    .line 354
    invoke-virtual {v11, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 355
    invoke-virtual {v0, v9, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v14, 0x0

    aput-object v0, v12, v14

    add-int/lit8 v6, v6, 0x2

    .line 356
    invoke-virtual {v11, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v12, v17

    .line 357
    aget-object v0, v12, v14

    invoke-virtual {v13, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->setForeignkey(Ljava/lang/String;)V

    .line 377
    :goto_6
    aget-object v0, v12, v17

    invoke-virtual {v0, v9, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonColumn;->setValue(Ljava/lang/String;)V

    .line 378
    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    add-int/lit8 v10, v10, 0x1

    move v9, v14

    move/from16 v6, v17

    move-object/from16 v0, v18

    goto/16 :goto_0

    :cond_5
    return-object v3

    :catch_0
    move-exception v0

    .line 382
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "GetSchema: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_data_0
    .sparse-switch
        -0x6a86802f -> :sswitch_3
        0x2670cb4 -> :sswitch_2
        0x119101dd -> :sswitch_1
        0x180899e2 -> :sswitch_0
    .end sparse-switch
.end method

.method private getTablesFull(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;
    .locals 18
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mDb",
            "resTables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/Database;",
            "Lcom/getcapacitor/JSArray;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 197
    const-string v2, " ..."

    const-string v3, "/"

    const-string v4, " "

    const-string v5, "Full: Table "

    const-string v6, "sql"

    const-string v7, "name"

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 200
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v9

    const/4 v10, 0x0

    .line 201
    :goto_0
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_b

    .line 204
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/getcapacitor/JSObject;

    invoke-virtual {v11, v7}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v12, "GetTablesFull: no name"

    if-eqz v11, :cond_a

    .line 205
    :try_start_1
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/getcapacitor/JSObject;

    invoke-virtual {v11, v7}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_9

    .line 211
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/getcapacitor/JSObject;

    invoke-virtual {v12, v6}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 212
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/getcapacitor/JSObject;

    invoke-virtual {v12, v6}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 216
    new-instance v13, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;

    invoke-direct {v13}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;-><init>()V

    .line 218
    invoke-direct {v1, v12}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getSchema(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v12

    .line 219
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-eqz v14, :cond_7

    .line 223
    iget-object v14, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v14, v12}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->checkSchemaValidity(Ljava/util/ArrayList;)V

    .line 226
    invoke-direct {v1, v0, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getIndexes(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v14

    .line 227
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-lez v15, :cond_0

    .line 229
    iget-object v15, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v15, v14}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->checkIndexesValidity(Ljava/util/ArrayList;)V

    .line 232
    :cond_0
    invoke-direct {v1, v0, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getTriggers(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v15

    .line 233
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_1

    move-object/from16 v16, v6

    .line 235
    iget-object v6, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v6, v15}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->checkTriggersValidity(Ljava/util/ArrayList;)V

    goto :goto_1

    :cond_1
    move-object/from16 v16, v6

    .line 239
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v17, v7

    const-string v7, "SELECT * FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 240
    iget-object v7, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v7, v0, v6, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->getValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 242
    invoke-virtual {v13, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setName(Ljava/lang/String;)V

    .line 243
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-eqz v7, :cond_6

    .line 244
    invoke-virtual {v13, v12}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setSchema(Ljava/util/ArrayList;)V

    .line 248
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-eqz v7, :cond_2

    .line 249
    invoke-virtual {v13, v14}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setIndexes(Ljava/util/ArrayList;)V

    .line 251
    :cond_2
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-eqz v7, :cond_3

    .line 252
    invoke-virtual {v13, v15}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setTriggers(Ljava/util/ArrayList;)V

    .line 254
    :cond_3
    invoke-virtual {v5, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v12, " schema export completed"

    invoke-virtual {v7, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 255
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 256
    invoke-virtual {v1, v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-eqz v7, :cond_4

    .line 258
    invoke-virtual {v13, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setValues(Ljava/util/ArrayList;)V

    .line 260
    :cond_4
    invoke-virtual {v13}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getKeys()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_5

    .line 263
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    invoke-virtual {v5, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, " data export completed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 265
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 266
    invoke-virtual {v1, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    move-object/from16 v6, v16

    move-object/from16 v7, v17

    goto/16 :goto_0

    .line 261
    :cond_5
    new-instance v0, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GetTablesFull: table "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a jsonTable"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_6
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "GetTablesFull: must contain schema"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_7
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "GetTablesFull: no Schema returned"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_8
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "GetTablesFull: no sql"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_9
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_a
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 268
    :cond_b
    const-string v0, "Full: Table\'s export completed"

    .line 269
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v8

    :catch_0
    move-exception v0

    .line 272
    const-string v2, "Full: Table\'s export failed"

    .line 273
    invoke-virtual {v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    .line 274
    new-instance v2, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "GetTablesFull: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private getTablesModified(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;Ljava/lang/Long;)Lcom/getcapacitor/JSObject;
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "mDb",
            "resTables",
            "syncDate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 693
    const-string v1, "count"

    const-string v2, ";"

    const-string v3, "SELECT count(*) AS count FROM "

    const-string v4, "name"

    new-instance v5, Lcom/getcapacitor/JSObject;

    invoke-direct {v5}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 695
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x0

    move v8, v7

    .line 696
    :goto_0
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_5

    .line 699
    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/getcapacitor/JSObject;

    invoke-virtual {v9, v4}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 700
    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/getcapacitor/JSObject;

    invoke-virtual {v9, v4}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 704
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 705
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v10, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object v10

    .line 706
    invoke-virtual {v10}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v10

    .line 707
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v11

    const/4 v12, 0x1

    if-eq v11, v12, :cond_0

    goto :goto_2

    .line 708
    :cond_0
    invoke-interface {v10, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getcapacitor/JSObject;

    invoke-virtual {v10, v1}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 710
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " WHERE last_modified >= "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v14, p3

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 711
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v13, v15}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object v13

    .line 712
    invoke-virtual {v13}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v13

    .line 713
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v15

    if-eq v15, v12, :cond_1

    goto :goto_2

    .line 714
    :cond_1
    invoke-interface {v13, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/getcapacitor/JSObject;

    invoke-virtual {v12, v1}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v12

    const-wide/16 v15, 0x0

    cmp-long v15, v12, v15

    if-nez v15, :cond_2

    .line 716
    const-string v10, "No"

    goto :goto_1

    :cond_2
    cmp-long v10, v10, v12

    if-nez v10, :cond_3

    .line 718
    const-string v10, "Create"

    goto :goto_1

    .line 720
    :cond_3
    const-string v10, "Modified"

    .line 722
    :goto_1
    invoke-virtual {v5, v9, v10}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 702
    :cond_4
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "GetTablesModified: no name"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_2
    return-object v5

    :catch_0
    move-exception v0

    .line 726
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "GetTablesModified: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getTablesPartial(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;
    .locals 23
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mDb",
            "resTables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/Database;",
            "Lcom/getcapacitor/JSArray;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 509
    const-string v2, " ..."

    const-string v3, "/"

    const-string v4, " "

    const-string v5, "Partial: Table "

    const-string v6, "Create"

    const-string v7, "sql"

    const-string v8, "name"

    const-string v9, "modTables"

    const-string v10, "syncDate"

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 516
    :try_start_0
    invoke-direct/range {p0 .. p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getPartialModeData(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;)Lcom/getcapacitor/JSObject;

    move-result-object v12

    .line 517
    invoke-virtual {v12, v10}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_12

    .line 518
    invoke-virtual {v12, v10}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v13

    .line 522
    invoke-virtual {v12, v9}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v15, "GetTablesPartial: no modTables"

    if-eqz v10, :cond_11

    .line 523
    :try_start_1
    invoke-virtual {v12, v9}, Lcom/getcapacitor/JSObject;->getJSObject(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 530
    iget-object v10, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v10, v9}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->getJSObjectKeys(Lcom/getcapacitor/JSObject;)Ljava/util/ArrayList;

    move-result-object v10

    .line 533
    invoke-virtual/range {p2 .. p2}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v12

    const/4 v15, 0x0

    move-object/from16 v16, v11

    .line 534
    :goto_0
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v11

    if-ge v15, v11, :cond_f

    .line 537
    invoke-interface {v12, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/getcapacitor/JSObject;

    invoke-virtual {v11, v8}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move/from16 p2, v11

    const-string v11, "GetTablesPartial: no name"

    if-eqz p2, :cond_e

    .line 538
    :try_start_2
    invoke-interface {v12, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 p2, v11

    move-object/from16 v11, v17

    check-cast v11, Lcom/getcapacitor/JSObject;

    invoke-virtual {v11, v8}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_d

    .line 545
    invoke-interface {v12, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v8

    move-object/from16 v8, v17

    check-cast v8, Lcom/getcapacitor/JSObject;

    invoke-virtual {v8, v7}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 546
    invoke-interface {v12, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getcapacitor/JSObject;

    invoke-virtual {v8, v7}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 551
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-eqz v17, :cond_b

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    move-object/from16 v17, v7

    invoke-virtual {v9, v11}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v19, v10

    const-string v10, "No"

    invoke-static {v7, v10}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move-object/from16 v21, v6

    move-object/from16 v22, v9

    goto/16 :goto_5

    .line 555
    :cond_0
    new-instance v7, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;

    invoke-direct {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;-><init>()V

    .line 556
    invoke-virtual {v7, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setName(Ljava/lang/String;)V

    .line 557
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 558
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 559
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 p2, v10

    .line 560
    invoke-virtual {v9, v11}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 562
    invoke-direct {v1, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getSchema(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 563
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_1

    .line 565
    iget-object v8, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v8, v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->checkSchemaValidity(Ljava/util/ArrayList;)V

    .line 569
    :cond_1
    invoke-direct {v1, v0, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getIndexes(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 571
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v20

    if-lez v20, :cond_2

    move-object/from16 p2, v10

    .line 573
    iget-object v10, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v10, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->checkIndexesValidity(Ljava/util/ArrayList;)V

    goto :goto_1

    :cond_2
    move-object/from16 p2, v10

    .line 576
    :goto_1
    invoke-direct {v1, v0, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getTriggers(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 578
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v20

    if-lez v20, :cond_3

    move-object/from16 v20, v8

    .line 580
    iget-object v8, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v8, v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->checkTriggersValidity(Ljava/util/ArrayList;)V

    goto :goto_2

    :cond_3
    move-object/from16 v20, v8

    :goto_2
    move-object v8, v10

    move-object/from16 v10, p2

    move-object/from16 p2, v8

    goto :goto_3

    :cond_4
    move-object/from16 v10, p2

    move-object/from16 p2, v21

    :goto_3
    move-object/from16 v8, v20

    move-object/from16 v20, v12

    .line 585
    invoke-virtual {v9, v11}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object/from16 v21, v6

    const-string v6, ";"

    move-object/from16 v22, v9

    const-string v9, "SELECT * FROM "

    if-eqz v12, :cond_5

    .line 586
    :try_start_3
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 588
    :cond_5
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, " WHERE last_modified >= "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 590
    :goto_4
    iget-object v9, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v9, v0, v6, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->getValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 593
    invoke-virtual {v7, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setName(Ljava/lang/String;)V

    .line 594
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-eqz v9, :cond_6

    .line 595
    invoke-virtual {v7, v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setSchema(Ljava/util/ArrayList;)V

    .line 597
    :cond_6
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-eqz v9, :cond_7

    .line 598
    invoke-virtual {v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setIndexes(Ljava/util/ArrayList;)V

    .line 600
    :cond_7
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-eqz v8, :cond_8

    move-object/from16 v10, p2

    .line 601
    invoke-virtual {v7, v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setTriggers(Ljava/util/ArrayList;)V

    .line 603
    :cond_8
    invoke-virtual {v5, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, " schema export completed"

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 604
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int/lit8 v9, v15, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 605
    invoke-virtual {v1, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    .line 607
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-eqz v8, :cond_9

    .line 608
    invoke-virtual {v7, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->setValues(Ljava/util/ArrayList;)V

    .line 610
    :cond_9
    invoke-virtual {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTable;->getKeys()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v8, 0x1

    if-le v6, v8, :cond_a

    move-object/from16 v6, v16

    .line 613
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 614
    invoke-virtual {v5, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, " data export completed"

    invoke-virtual {v7, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 615
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 616
    invoke-virtual {v1, v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    goto :goto_6

    .line 611
    :cond_a
    new-instance v0, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GetTablesPartial: table "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a jsonTable"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    move-object/from16 v21, v6

    move-object/from16 v17, v7

    move-object/from16 v22, v9

    move-object/from16 v19, v10

    :goto_5
    move-object/from16 v20, v12

    move-object/from16 v6, v16

    :goto_6
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v16, v6

    move-object/from16 v7, v17

    move-object/from16 v8, v18

    move-object/from16 v10, v19

    move-object/from16 v12, v20

    move-object/from16 v6, v21

    move-object/from16 v9, v22

    goto/16 :goto_0

    .line 548
    :cond_c
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "GetTablesPartial: no sql"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 543
    :cond_d
    new-instance v0, Ljava/lang/Exception;

    move-object/from16 v2, p2

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    move-object v2, v11

    .line 540
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    move-object/from16 v6, v16

    .line 618
    const-string v0, "Partial: Table\'s export completed"

    .line 619
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    return-object v6

    .line 528
    :cond_10
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v15}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 525
    :cond_11
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v15}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 520
    :cond_12
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "GetTablesPartial: no syncDate"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    .line 622
    const-string v2, "Partial: Table\'s export failed"

    .line 623
    invoke-virtual {v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V

    .line 624
    new-instance v2, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "GetTablesPartial: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private getTriggers(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mDb",
            "tableName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/Database;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p2

    .line 439
    const-string v1, "BEGIN"

    const-string v2, "Error: getTriggers "

    .line 440
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 443
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "SELECT name,tbl_name,sql FROM sqlite_master WHERE type = \'trigger\' AND tbl_name = \'"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 444
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' AND sql NOTNULL;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 446
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v6, p1

    invoke-virtual {v6, v4, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object v4

    .line 447
    invoke-virtual {v4}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v4

    .line 448
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_9

    const/4 v5, 0x0

    move v6, v5

    .line 449
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_9

    .line 450
    new-instance v7, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;

    invoke-direct {v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;-><init>()V

    .line 451
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getcapacitor/JSObject;

    const-string v9, "tbl_name"

    invoke-virtual {v8, v9}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 452
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getcapacitor/JSObject;

    const-string v9, "name"

    invoke-virtual {v8, v9}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 453
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/getcapacitor/JSObject;

    const-string v10, "sql"

    invoke-virtual {v9, v10}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_7

    if-eqz v8, :cond_7

    .line 458
    invoke-virtual {v9, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 459
    array-length v10, v9

    const/4 v11, 0x2

    if-ne v10, v11, :cond_6

    const/4 v10, 0x1

    .line 462
    aget-object v12, v9, v10

    invoke-virtual {v12, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 465
    aget-object v12, v9, v10

    invoke-virtual {v12, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    aget-object v12, v12, v5

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 466
    aget-object v9, v9, v10

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x20

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 467
    array-length v13, v9

    if-ne v13, v11, :cond_4

    .line 470
    const-string v13, ""

    .line 472
    aget-object v14, v9, v10

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x5

    invoke-virtual {v14, v5, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 473
    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 474
    array-length v13, v9

    if-ne v13, v11, :cond_0

    .line 477
    aget-object v11, v9, v5

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 478
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    aget-object v9, v9, v10

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    .line 475
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "sql split BEGIN does not return 2 values"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 480
    :cond_1
    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 482
    :goto_1
    invoke-virtual {v12}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    const-string v11, " ON"

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 483
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x3

    invoke-virtual {v12, v5, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 485
    :cond_2
    invoke-virtual {v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->setName(Ljava/lang/String;)V

    .line 486
    invoke-virtual {v7, v12}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->setTimeevent(Ljava/lang/String;)V

    .line 487
    invoke-virtual {v7, v9}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->setLogic(Ljava/lang/String;)V

    .line 488
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_3

    invoke-virtual {v7, v13}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonTrigger;->setCondition(Ljava/lang/String;)V

    .line 489
    :cond_3
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 468
    :cond_4
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "sql split tableName does not return 2 values"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 463
    :cond_5
    new-instance v1, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "sql split does not contains "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 460
    :cond_6
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "sql split name does not return 2 values"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 456
    :cond_7
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "sql statement or name is null"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 491
    :cond_8
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "table name doesn\'t match"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_9
    return-object v3

    :catch_0
    move-exception v0

    .line 497
    new-instance v1, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private modEmbeddedParentheses(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sqlStmt"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 284
    const-string v0, "("

    invoke-direct {p0, p1, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getIndices(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 285
    const-string v1, ")"

    invoke-direct {p0, p1, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getIndices(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 286
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ne v2, v3, :cond_5

    .line 289
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    return-object p1

    .line 290
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 293
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_2

    add-int/lit8 v4, v3, 0x1

    .line 294
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 295
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 298
    :cond_1
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 301
    :cond_2
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    :goto_1
    move-object v7, v4

    move v4, v3

    move-object v3, v7

    .line 303
    :goto_2
    const-string v5, ","

    const-string v6, "\u00a7"

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 304
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v4, v3, :cond_3

    .line 306
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v5, v4, 0x1

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    add-int/lit8 v3, v4, 0x1

    goto/16 :goto_0

    .line 309
    :cond_4
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 287
    :cond_5
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "ModEmbeddedParentheses: Not same number of opening and closing parentheses"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public createExportObject(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "db",
            "sqlObj"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 133
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;-><init>()V

    .line 134
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 140
    :try_start_0
    const-string v2, "SELECT name,sql FROM sqlite_master WHERE type = \'view\' AND name NOT LIKE \'sqlite_%\';"

    .line 141
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object v2

    .line 142
    invoke-virtual {v2}, Lcom/getcapacitor/JSArray;->length()I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_0

    move v3, v4

    .line 143
    :goto_0
    invoke-virtual {v2}, Lcom/getcapacitor/JSArray;->length()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 144
    invoke-virtual {v2, v3}, Lcom/getcapacitor/JSArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 145
    new-instance v6, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;

    invoke-direct {v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;-><init>()V

    .line 146
    const-string v7, "sql"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 147
    const-string v8, "AS "

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x3

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 148
    const-string v8, "name"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;->setName(Ljava/lang/String;)V

    .line 149
    invoke-virtual {v6, v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonView;->setValue(Ljava/lang/String;)V

    .line 150
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 154
    :cond_0
    const-string v2, "SELECT name,sql FROM sqlite_master WHERE "

    .line 155
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "type = \'table\' AND name NOT LIKE \'sqlite_%\' AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "name NOT LIKE \'android_%\' AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "name NOT LIKE \'sync_table\';"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 158
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object v2

    .line 159
    invoke-virtual {v2}, Lcom/getcapacitor/JSArray;->length()I

    move-result v3

    if-eqz v3, :cond_9

    .line 162
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v5, "sync_table"

    invoke-virtual {v3, p1, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    const-string v5, "partial"

    if-nez v3, :cond_2

    :try_start_1
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 164
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "No sync_table available"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 167
    :cond_2
    :goto_1
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    const v7, -0x2f43367f

    const/4 v8, 0x1

    if-eq v6, v7, :cond_4

    const v4, 0x30228f

    if-eq v6, v4, :cond_3

    goto :goto_2

    :cond_3
    const-string v4, "full"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    move v4, v8

    goto :goto_3

    :cond_4
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_3

    :cond_5
    :goto_2
    const/4 v4, -0x1

    :goto_3
    if-eqz v4, :cond_7

    if-ne v4, v8, :cond_6

    .line 169
    invoke-direct {p0, p1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getTablesFull(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_4

    .line 170
    :cond_6
    new-instance p1, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CreateExportObject: expMode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " not defined"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 168
    :cond_7
    invoke-direct {p0, p1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getTablesPartial(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p1

    .line 172
    :goto_4
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_8

    .line 173
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getDatabase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setDatabase(Ljava/lang/String;)V

    .line 174
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getVersion()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setVersion(Ljava/lang/Integer;)V

    .line 175
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getEncrypted()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setEncrypted(Ljava/lang/Boolean;)V

    .line 176
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setMode(Ljava/lang/String;)V

    .line 177
    invoke-virtual {v0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setTables(Ljava/util/ArrayList;)V

    .line 178
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_8

    .line 179
    invoke-virtual {v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setViews(Ljava/util/ArrayList;)V

    :cond_8
    return-object v0

    .line 160
    :cond_9
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "CreateExportObject: table\'s names failed"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p1

    .line 185
    new-instance p2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CreateExportObject: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public delExportedRows(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mDb"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v1, "sync_table"

    invoke-virtual {v0, p1, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 101
    invoke-virtual {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getLastExportDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_3

    .line 106
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->_uDrop:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

    invoke-virtual {v4, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;->getTablesNames(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/util/List;

    move-result-object v4

    .line 107
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_2

    .line 111
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 114
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DELETE FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " WHERE sql_deleted = 1 AND last_modified < "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ";"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 115
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const-string v8, "no"

    invoke-virtual {p1, v5, v6, v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->prepareSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v5

    .line 116
    const-string v6, "lastId"

    invoke-virtual {v5, v6}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    cmp-long v5, v5, v2

    if-ltz v5, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "SetLastExportDate: lastId < 0"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    return-void

    .line 108
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "DelExportedRows: No table\'s names returned"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 103
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "DelExportedRows: No last exported date available"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 98
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "DelExportedRows: No sync_table available"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 122
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DelExportedRows: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLastExportDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/lang/Long;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mDb"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 47
    const-string v0, "SELECT sync_date FROM sync_table WHERE id = 2;"

    .line 50
    :try_start_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v2, "sync_table"

    invoke-virtual {v1, p1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 54
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object p1

    .line 56
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 57
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/getcapacitor/JSObject;

    const-string v0, "sync_date"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    .line 60
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 52
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "GetSyncDate: No sync_table available"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 62
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GetSyncDate: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSyncDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/lang/Long;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mDb"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 665
    const-string v0, "SELECT sync_date FROM sync_table WHERE id = 1;"

    .line 668
    :try_start_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v2, "sync_table"

    invoke-virtual {v1, p1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 672
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1

    .line 673
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object p1

    .line 674
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 675
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/getcapacitor/JSObject;

    const-string v0, "sync_date"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    .line 678
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 670
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No sync_table available"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 680
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GetSyncDate: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public notifyExportProgressEvent(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "msg"
        }
    .end annotation

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Export: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 28
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson$1;

    invoke-direct {v0, p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson$1;-><init>(Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;Ljava/lang/String;)V

    .line 33
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->defaultCenter()Lcom/getcapacitor/community/database/sqlite/NotificationCenter;

    move-result-object p1

    const-string v1, "exportJsonProgress"

    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->postNotification(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public setLastExportDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/Long;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mDb",
            "sTime"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "UPDATE sync_table SET sync_date = "

    const-string v1, "INSERT INTO sync_table (sync_date) VALUES ("

    .line 68
    :try_start_0
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v3, "sync_table"

    invoke-virtual {v2, p1, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 73
    invoke-virtual {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getLastExportDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/lang/Long;

    move-result-object v2

    .line 74
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " WHERE id = 2;"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 77
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ");"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 79
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "no"

    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->prepareSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    .line 80
    const-string p2, "lastId"

    invoke-virtual {p1, p2}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide p1

    cmp-long p1, p1, v4

    if-ltz p1, :cond_1

    return-void

    .line 82
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "SetLastExportDate: lastId < 0"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 70
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "SetLastExportDate: No sync_table available"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 85
    new-instance p2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SetLastExportDate: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method
