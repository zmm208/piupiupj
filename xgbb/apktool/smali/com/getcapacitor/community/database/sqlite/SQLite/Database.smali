.class public Lcom/getcapacitor/community/database/sqlite/SQLite/Database;
.super Ljava/lang/Object;
.source "Database.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.getcapacitor.community.database.sqlite.SQLite.Database"


# instance fields
.field private final _context:Landroid/content/Context;

.field private _db:Landroidx/sqlite/db/SupportSQLiteDatabase;

.field private final _dbName:Ljava/lang/String;

.field private final _encrypted:Ljava/lang/Boolean;

.field private final _file:Ljava/io/File;

.field private final _isEncryption:Ljava/lang/Boolean;

.field private _isOpen:Ljava/lang/Boolean;

.field private final _mode:Ljava/lang/String;

.field private final _readOnly:Ljava/lang/Boolean;

.field private final _uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

.field private final _uDrop:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

.field private final _uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

.field private final _uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

.field private final _uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

.field private final _uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

.field private final _uUpg:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsUpgrade;

.field private final _vUpgObject:Ljava/util/Dictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Dictionary<",
            "Ljava/lang/Integer;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private final _version:I

.field private final fromJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

.field private isAvailableTransaction:Z

.field private ncDB:Ljava/lang/Boolean;

.field private final toJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;ILjava/lang/Boolean;Ljava/util/Dictionary;Landroid/content/SharedPreferences;Ljava/lang/Boolean;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "dbName",
            "encrypted",
            "mode",
            "version",
            "isEncryption",
            "vUpgObject",
            "sharedPreferences",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Boolean;",
            "Ljava/util/Dictionary<",
            "Ljava/lang/Integer;",
            "Lorg/json/JSONObject;",
            ">;",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 48
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    const/4 v2, 0x0

    .line 57
    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 66
    new-instance v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    invoke-direct {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;-><init>()V

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->fromJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    .line 67
    new-instance v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    invoke-direct {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;-><init>()V

    iput-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->toJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    .line 68
    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->ncDB:Ljava/lang/Boolean;

    .line 69
    iput-boolean v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isAvailableTransaction:Z

    .line 82
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    .line 83
    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    .line 84
    iput-object p4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_mode:Ljava/lang/String;

    .line 85
    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_encrypted:Ljava/lang/Boolean;

    .line 86
    iput-object p6, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isEncryption:Ljava/lang/Boolean;

    .line 87
    iput p5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_version:I

    .line 88
    iput-object p7, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_vUpgObject:Ljava/util/Dictionary;

    .line 89
    iput-object p9, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_readOnly:Ljava/lang/Boolean;

    .line 90
    const-string p3, "/"

    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    const-string p3, "SQLite.db"

    invoke-virtual {p2, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x1

    .line 91
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->ncDB:Ljava/lang/Boolean;

    .line 92
    new-instance p3, Ljava/io/File;

    invoke-direct {p3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    goto :goto_0

    .line 94
    :cond_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p2

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    .line 96
    :goto_0
    new-instance p2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-direct {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;-><init>()V

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    .line 97
    new-instance p2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    invoke-direct {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;-><init>()V

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    .line 98
    new-instance p2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    invoke-direct {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;-><init>()V

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    .line 99
    new-instance p2, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-direct {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;-><init>()V

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    .line 100
    new-instance p2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsUpgrade;

    invoke-direct {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsUpgrade;-><init>()V

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uUpg:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsUpgrade;

    .line 101
    new-instance p2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

    invoke-direct {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;-><init>()V

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uDrop:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

    .line 102
    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_1

    new-instance v2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    invoke-direct {v2, p1, p8}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;)V

    :cond_1
    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    .line 103
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->InitializeSQLCipher()V

    .line 104
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_2

    .line 105
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result p1

    if-nez p1, :cond_2

    .line 107
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string p2, "Failed to create parent directories."

    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 110
    :cond_2
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "&&& file path "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private InitializeSQLCipher()V
    .locals 1

    .line 118
    const-string v0, "sqlcipher"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method private getInsertReturnedValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)Lcom/getcapacitor/JSArray;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "mDB",
            "colNames",
            "tableName",
            "iLastId",
            "lastId",
            "rMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 871
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 872
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 873
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    .line 874
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " FROM "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 876
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " WHERE rowid "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 877
    const-string p3, "wAone"

    invoke-virtual {p6, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 878
    const-string p3, "= "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 880
    :cond_1
    const-string p3, "wAall"

    invoke-virtual {p6, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 881
    const-string p3, "BETWEEN "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, " AND "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 883
    :cond_2
    const-string p3, ";"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 884
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, p2, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_0
    return-object v0
.end method

.method private getNames(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 766
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 767
    const-string v1, "--"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 768
    const-string v2, "/*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 771
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, -0x1

    if-eq v0, v4, :cond_0

    .line 773
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v3

    :cond_0
    if-eq v1, v4, :cond_1

    .line 776
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    :cond_1
    if-eq v2, v4, :cond_2

    .line 779
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    :cond_2
    const/4 v0, 0x0

    .line 781
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getStmtAndRetColNames(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sqlStmt",
            "retMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 745
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 746
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isReturning(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    .line 747
    const-string v1, "isReturning"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 748
    const-string v2, "stmt"

    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 749
    const-string v4, "names"

    invoke-virtual {p1, v4}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 750
    invoke-virtual {v0, v2, v3}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 751
    const-string v2, ""

    invoke-virtual {v0, v4, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 753
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "wA"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    .line 754
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 755
    :cond_0
    const-string p2, "returning"

    invoke-virtual {v2, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 757
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v1, p2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 758
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 759
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getNames(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v4, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    :cond_1
    return-object v0
.end method

.method private getUpdDelReturnedValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSArray;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "mDB",
            "stmt",
            "colNames"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 890
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 891
    invoke-static {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLStatement;->extractTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 892
    invoke-static {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLStatement;->extractWhereClause(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    if-eqz v1, :cond_0

    .line 894
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "SELECT "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " FROM "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    .line 895
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " WHERE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ";"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 896
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, p2, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method private isReturning(Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sqlStmt"
        }
    .end annotation

    .line 785
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 787
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 788
    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_0

    .line 790
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v5

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 792
    :cond_0
    const-string v3, "isReturning"

    invoke-virtual {v0, v3, v4}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 793
    const-string v6, "stmt"

    invoke-virtual {v0, v6, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 794
    const-string v7, ""

    const-string v8, "names"

    invoke-virtual {v0, v8, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 795
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v7, "\\s+"

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, v4

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 797
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v9

    const/4 v10, -0x1

    sparse-switch v9, :sswitch_data_0

    :goto_0
    move p1, v10

    goto :goto_1

    :sswitch_0
    const-string v9, "DELETE"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x2

    goto :goto_1

    :sswitch_1
    const-string v9, "UPDATE"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move p1, v5

    goto :goto_1

    :sswitch_2
    const-string v9, "INSERT"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    move p1, v4

    :goto_1
    const-string v9, "returning"

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_5

    .line 825
    :pswitch_0
    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 826
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 827
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 830
    array-length v10, p1

    :goto_2
    if-ge v4, v10, :cond_9

    aget-object v11, p1, v4

    .line 831
    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 834
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 835
    invoke-direct {p0, v11, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->wordsAfter(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v7, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 842
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-static {v4, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 843
    invoke-static {v4, v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    .line 844
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 845
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 847
    :cond_4
    invoke-virtual {v0, v3, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 848
    invoke-virtual {v0, v6, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 849
    invoke-virtual {v0, v8, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    return-object v0

    .line 838
    :cond_5
    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 799
    :pswitch_1
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    const-string v7, "VALUES"

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-eq p1, v10, :cond_9

    .line 803
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v5

    :goto_3
    if-lt v7, p1, :cond_7

    .line 804
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x29

    if-ne v11, v12, :cond_6

    goto :goto_4

    :cond_6
    add-int/lit8 v7, v7, -0x1

    goto :goto_3

    :cond_7
    move v7, v10

    :goto_4
    if-eq v7, v10, :cond_9

    .line 810
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    add-int/2addr v7, v5

    invoke-virtual {v1, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 811
    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 812
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_8

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 813
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 815
    :cond_8
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 816
    invoke-virtual {v0, v3, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 817
    invoke-virtual {v0, v6, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 818
    invoke-virtual {v0, v8, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    :cond_9
    :goto_5
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7efc4947 -> :sswitch_2
        -0x6a6cd337 -> :sswitch_1
        0x77f979ab -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static mergeJSONArrays(Lorg/json/JSONArray;Lorg/json/JSONArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "target",
            "source"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 592
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 593
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 594
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private wordsAfter(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "word",
            "words"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 860
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    .line 861
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 863
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1

    .line 865
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    add-int/lit8 p1, p1, 0x1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p2, p1, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method


# virtual methods
.method public addToResponse(Lcom/getcapacitor/JSObject;Lcom/getcapacitor/JSObject;)Lcom/getcapacitor/JSObject;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "response",
            "respSet"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 579
    const-string v0, "lastId"

    invoke-virtual {p2, v0}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 580
    const-string v3, "values"

    invoke-virtual {p2, v3}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 581
    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 582
    invoke-virtual {p2, v3}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 583
    invoke-virtual {p1, v3}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 584
    invoke-static {v4, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->mergeJSONArrays(Lorg/json/JSONArray;Lorg/json/JSONArray;)V

    .line 586
    :cond_0
    invoke-virtual {p1, v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;J)Lcom/getcapacitor/JSObject;

    .line 587
    invoke-virtual {p1, v3, v4}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    return-object p1
.end method

.method public beginTransaction()Ljava/lang/Integer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 158
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 160
    :try_start_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isAvailTrans()Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->beginTransaction()V

    const/4 v0, 0x0

    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 161
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Already in transaction"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed in beginTransaction"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 171
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Database not opened"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 358
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->close()V

    const/4 v0, 0x0

    .line 361
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 364
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed in database close"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 365
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 369
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Database not opened"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public commitTransaction()Ljava/lang/Integer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "Failed in commitTransaction"

    .line 181
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 183
    :try_start_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isAvailTrans()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->setTransactionSuccessful()V

    const/4 v1, 0x0

    .line 187
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 193
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->endTransaction()V

    return-object v0

    .line 184
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "No transaction active"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 189
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 193
    :goto_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->endTransaction()V

    .line 194
    throw v0

    .line 196
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Database not opened"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSyncTable()Lcom/getcapacitor/JSObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1080
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1082
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v2, "sync_table"

    invoke-virtual {v1, p0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 1084
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v0, p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isLastModified(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Z

    move-result v0

    .line 1085
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v1, p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isSqlDeleted(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Z

    move-result v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 1087
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 1088
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v3, 0x3e8

    div-long/2addr v0, v3

    const/4 v3, 0x2

    .line 1089
    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "CREATE TABLE IF NOT EXISTS sync_table (id INTEGER PRIMARY KEY NOT NULL,sync_date INTEGER);"

    aput-object v4, v3, v2

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "INSERT INTO sync_table (sync_date) VALUES (\'"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v3, v1

    .line 1094
    :try_start_0
    new-array v0, v2, [Ljava/lang/Boolean;

    invoke-virtual {p0, v3, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->execute([Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1097
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1100
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No last_modified/sql_deleted columns in tables"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1103
    :cond_1
    const-string v1, "changes"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    return-object v0
.end method

.method public deleteDB(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1050
    const-string v0, "Failed in deleteDB "

    :try_start_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1051
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->open()V

    .line 1054
    :cond_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1055
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V

    .line 1058
    :cond_1
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1059
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    invoke-virtual {v1, v2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->deleteDatabase(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    .line 1060
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    .line 1061
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    return-void

    .line 1063
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-void

    :catch_0
    move-exception p1

    .line 1068
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public deleteExportedRows()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1255
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->toJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    invoke-virtual {v0, p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->delExportedRows(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1258
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error: exportToJson "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1259
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public deleteSQL(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "mDB",
            "statement",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/Database;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, " SET sql_deleted = 1 WHERE "

    const-string v1, "UPDATE "

    .line 915
    :try_start_0
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isLastModified(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Z

    move-result v2

    .line 916
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {v3, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isSqlDeleted(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Z

    move-result v3

    if-eqz v2, :cond_6

    if-nez v3, :cond_0

    goto :goto_0

    .line 924
    :cond_0
    invoke-static {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLStatement;->extractWhereClause(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 926
    const-string v3, "deleteSQL: cannot find a WHERE clause"

    if-eqz v2, :cond_5

    .line 930
    :try_start_1
    invoke-static {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLStatement;->extractTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_4

    .line 935
    invoke-static {v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLStatement;->extractColumnNames(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 937
    array-length v5, v3

    if-eqz v5, :cond_3

    .line 943
    invoke-static {p1, p2, v2, v3, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete;->findReferencesAndUpdate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 946
    const-string p1, ";"

    invoke-virtual {v2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v2, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 948
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " AND sql_deleted = 0;"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 950
    :cond_2
    const-string p1, ""

    return-object p1

    .line 938
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "deleteSQL: Did not find column names in the WHERE Statement"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 933
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 927
    :cond_5
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_6
    :goto_0
    return-object p2

    :catch_0
    move-exception p1

    .line 955
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_7

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_7
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    .line 956
    :goto_1
    new-instance p2, Ljava/lang/Exception;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "DeleteSQL "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public varargs execute([Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "statements",
            "others"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 405
    const-string v0, ";"

    array-length v1, p2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    aget-object p2, p2, v2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    .line 406
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v3, -0x1

    .line 407
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 409
    :try_start_0
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz v4, :cond_8

    invoke-interface {v4}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 410
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {v4, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbChanges(Landroidx/sqlite/db/SupportSQLiteDatabase;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 411
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->beginTransaction()Ljava/lang/Integer;

    .line 412
    :cond_1
    array-length v5, p1

    move v6, v2

    :goto_0
    if-ge v6, v5, :cond_4

    aget-object v7, p1, v6

    .line 413
    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 415
    :cond_2
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    const/16 v10, 0xb

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-virtual {v8, v2, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    .line 416
    const-string v9, "DELETE FROM"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "WHERE"

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 417
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 418
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, p0, v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->deleteSQL(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v7

    .line 420
    :cond_3
    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v8, v7}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 422
    :cond_4
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {p1, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbChanges(Landroidx/sqlite/db/SupportSQLiteDatabase;)I

    move-result p1

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 423
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v3, :cond_6

    .line 424
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->commitTransaction()Ljava/lang/Integer;

    .line 425
    :cond_5
    const-string v0, "changes"

    invoke-virtual {v1, v0, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 434
    :cond_6
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz p1, :cond_7

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {p1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    :cond_7
    return-object v1

    .line 429
    :cond_8
    :try_start_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Database not opened"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    .line 432
    :try_start_2
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 434
    :goto_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz v0, :cond_9

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_9

    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {p2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    .line 435
    :cond_9
    throw p1
.end method

.method public executeSet(Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "set",
            "transaction",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 446
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-wide/16 v1, -0x1

    .line 447
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, -0x1

    .line 448
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 449
    new-instance v2, Lcom/getcapacitor/JSObject;

    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 451
    :try_start_0
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz v3, :cond_8

    invoke-interface {v3}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 452
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {v3, v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbChanges(Landroidx/sqlite/db/SupportSQLiteDatabase;)I

    move-result v3

    .line 453
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->beginTransaction()Ljava/lang/Integer;

    :cond_0
    const/4 v4, 0x0

    move-object v6, v1

    move v5, v4

    .line 454
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->length()I

    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v8, "lastId"

    const-string v9, "values"

    if-ge v5, v7, :cond_4

    .line 455
    :try_start_1
    invoke-virtual {p1, v5}, Lcom/getcapacitor/JSArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 456
    new-instance v7, Lcom/getcapacitor/JSObject;

    invoke-direct {v7}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 457
    const-string v7, "statement"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 458
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 460
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lez v10, :cond_1

    iget-object v10, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->parse(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto :goto_1

    :cond_1
    move v10, v4

    :goto_1
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 461
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 462
    invoke-virtual {p0, v7, v6, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->multipleRowsStatement(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v6

    goto :goto_2

    .line 464
    :cond_2
    invoke-virtual {p0, v7, v6, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->oneRowStatement(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v6

    .line 466
    :goto_2
    invoke-virtual {v6, v8}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 467
    invoke-virtual {v7, v1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    move-object v6, v7

    goto :goto_3

    .line 468
    :cond_3
    invoke-virtual {p0, v2, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->addToResponse(Lcom/getcapacitor/JSObject;Lcom/getcapacitor/JSObject;)Lcom/getcapacitor/JSObject;

    move-result-object v2

    add-int/lit8 v5, v5, 0x1

    move-object v6, v7

    goto :goto_0

    .line 470
    :cond_4
    :goto_3
    invoke-virtual {v6, v1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 473
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->commitTransaction()Ljava/lang/Integer;

    .line 474
    :cond_5
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {p1, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbChanges(Landroidx/sqlite/db/SupportSQLiteDatabase;)I

    move-result p1

    sub-int/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 475
    const-string p3, "changes"

    invoke-virtual {v0, p3, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 476
    invoke-virtual {v0, v8, v6}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 477
    invoke-virtual {v2, v9}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {v0, v9, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 486
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz p1, :cond_6

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {p1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    :cond_6
    return-object v0

    .line 471
    :cond_7
    :try_start_2
    new-instance p1, Ljava/lang/Exception;

    const-string p3, "lastId equals -1"

    invoke-direct {p1, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 481
    :cond_8
    new-instance p1, Ljava/lang/Exception;

    const-string p3, "Database not opened"

    invoke-direct {p1, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_0
    move-exception p1

    .line 484
    :try_start_3
    new-instance p3, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 486
    :goto_4
    iget-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz p3, :cond_9

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_9

    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {p2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    .line 487
    :cond_9
    throw p1
.end method

.method public exportToJson(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mode",
            "isEncrypted"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1198
    const-string v0, "views"

    const-string v1, "tables"

    .line 0
    const-string v2, "Error: exportToJson "

    .line 1198
    new-instance v3, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;

    invoke-direct {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;-><init>()V

    .line 1199
    new-instance v4, Lcom/getcapacitor/JSObject;

    invoke-direct {v4}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1200
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x9

    const/4 v7, 0x0

    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setDatabase(Ljava/lang/String;)V

    .line 1201
    iget v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_version:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setVersion(Ljava/lang/Integer;)V

    .line 1202
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_encrypted:Ljava/lang/Boolean;

    invoke-virtual {v3, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setEncrypted(Ljava/lang/Boolean;)V

    .line 1203
    invoke-virtual {v3, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->setMode(Ljava/lang/String;)V

    .line 1205
    :try_start_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v5, "sync_table"

    invoke-virtual {p1, p0, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1208
    new-instance p1, Ljava/util/Date;

    invoke-direct {p1}, Ljava/util/Date;-><init>()V

    .line 1209
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    .line 1210
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->toJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p1, p0, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->setLastExportDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/Long;)V

    goto :goto_0

    .line 1212
    :cond_0
    invoke-virtual {v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object p1

    const-string v5, "partial"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 1217
    :goto_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->toJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    invoke-virtual {p1, p0, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->createExportObject(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;

    move-result-object p1

    .line 1219
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getKeys()Ljava/util/ArrayList;

    move-result-object v3

    .line 1220
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v6, "encrypted"

    if-eqz v5, :cond_1

    .line 1221
    :try_start_1
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getTables()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 1222
    const-string v5, "database"

    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getDatabase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 1223
    const-string v5, "version"

    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getVersion()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1224
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getEncrypted()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v6, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1225
    const-string v5, "mode"

    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 1226
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getTablesAsJSObject()Lcom/getcapacitor/JSArray;

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1227
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 1228
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViewsAsJSObject()Lcom/getcapacitor/JSArray;

    move-result-object p1

    invoke-virtual {v4, v0, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1232
    :cond_1
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_encrypted:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isEncryption:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    .line 1233
    invoke-virtual {v4, v6, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 1234
    const-string p2, "overwrite"

    invoke-virtual {v4, p2, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 1235
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    invoke-static {p1, v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsEncryption;->encryptJSONObject(Landroid/content/Context;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    .line 1236
    new-instance p2, Lcom/getcapacitor/JSObject;

    invoke-direct {p2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1237
    const-string v0, "expData"

    invoke-virtual {p2, v0, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    return-object p2

    :cond_2
    return-object v4

    .line 1213
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "No sync_table available"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 1245
    throw p1

    :catch_0
    move-exception p1

    .line 1242
    sget-object p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1243
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public extractQuestionMarkValues(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 553
    const-string v0, "(?i)VALUES \\((\\?(?:,\\s*\\?\\s*)*)\\)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 554
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 556
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 557
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    .line 558
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\\s*,\\s*"

    const-string v2, ","

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDb()Landroidx/sqlite/db/SupportSQLiteDatabase;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    return-object v0
.end method

.method public getSyncDate()Ljava/lang/Long;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1118
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v1, "sync_table"

    invoke-virtual {v0, p0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1122
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->toJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    invoke-virtual {v0, p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->getSyncDate(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 1123
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 1120
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No sync_table available"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 1125
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getTableNames()Lcom/getcapacitor/JSArray;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1028
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 1030
    :try_start_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uDrop:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;

    invoke-virtual {v1, p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDrop;->getTablesNames(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    .line 1031
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1032
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    .line 1036
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "in getTableNames "

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

.method public getUrl()Ljava/lang/String;
    .locals 2

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "file://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Ljava/lang/Integer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 374
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 376
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->getVersion()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 379
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed in database getVersion"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 380
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 384
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Database not opened"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public importFromJson(Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;)Lcom/getcapacitor/JSObject;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonSQL"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1165
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, 0x0

    .line 1166
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1169
    :try_start_0
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v3, v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    .line 1171
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getTables()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 1173
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->fromJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    invoke-virtual {v1, p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;->createDatabaseSchema(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v1, -0x1

    if-eq v2, v1, :cond_0

    .line 1175
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->fromJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    invoke-virtual {v1, p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;->createDatabaseData(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v2, v1

    .line 1178
    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 1179
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->fromJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getViews()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {v1, p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;->createViews(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/util/ArrayList;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/2addr v2, p1

    .line 1182
    :cond_1
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    .line 1184
    const-string p1, "changes"

    invoke-virtual {v0, p1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 1187
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public inTransaction()Z
    .locals 1

    .line 605
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result v0

    return v0
.end method

.method public isAvailTrans()Z
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result v0

    return v0
.end method

.method public isDBExists()Z
    .locals 1

    .line 394
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public isNCDB()Ljava/lang/Boolean;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->ncDB:Ljava/lang/Boolean;

    return-object v0
.end method

.method public isOpen()Ljava/lang/Boolean;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    return-object v0
.end method

.method public multipleRowsStatement(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "statement",
            "valuesJson",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 491
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    .line 493
    :goto_0
    :try_start_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 494
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    .line 495
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move v5, v1

    .line 496
    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v7, ","

    if-ge v5, v6, :cond_2

    .line 497
    :try_start_1
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 500
    instance-of v8, v6, Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 501
    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 503
    :cond_0
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 505
    :goto_2
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_1

    .line 508
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 512
    :cond_2
    const-string v3, "("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_3

    .line 515
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 518
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->replacePlaceholders(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 520
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->prepareSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 523
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public oneRowStatement(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "statement",
            "valuesJson",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 565
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    .line 566
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 567
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 570
    :cond_0
    :try_start_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->prepareSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 573
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public open()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "backup-"

    const-string v1, "Failed in get/setVersion "

    const-string v2, "Failed in setForeignKeyConstraintsEnabled "

    .line 241
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_encrypted:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v4, "decryption"

    const-string v5, "encryption"

    const-string v6, ""

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_mode:Ljava/lang/String;

    const-string v7, "secret"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_mode:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_mode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 242
    :cond_0
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->isPassphrase()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 245
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 243
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No Passphrase stored"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move-object v3, v6

    .line 247
    :goto_0
    iget-object v7, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_mode:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v7, "No Encryption set in capacitor.config"

    if-eqz v5, :cond_4

    .line 248
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 250
    :try_start_0
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    iget-object v9, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v10}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v10

    invoke-virtual {v5, v8, v9, v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->encrypt(Landroid/content/Context;Ljava/io/File;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 252
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed in encryption "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 253
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 257
    :cond_3
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 260
    :cond_4
    :goto_1
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_mode:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 261
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 263
    :try_start_1
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    iget-object v7, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v4, v5, v7, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->decrypt(Landroid/content/Context;Ljava/io/File;[B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    .line 266
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed in decryption "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 267
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 271
    :cond_5
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    move-object v6, v3

    :goto_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 275
    :try_start_2
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    const/4 v7, 0x1

    if-nez v5, :cond_7

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_readOnly:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_7

    .line 276
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-static {v5, v6, v4, v4}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;Lnet/zetetic/database/DatabaseErrorHandler;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v5

    iput-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    goto :goto_3

    .line 278
    :cond_7
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_file:Ljava/io/File;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v6, v4, v7, v4}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v5

    iput-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 280
    :goto_3
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz v5, :cond_e

    .line 281
    invoke-interface {v5}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    if-eqz v5, :cond_d

    .line 284
    :try_start_3
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v5, v7}, Landroidx/sqlite/db/SupportSQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 292
    :try_start_4
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_c

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_readOnly:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    if-eqz v2, :cond_8

    goto/16 :goto_5

    .line 297
    :cond_8
    :try_start_5
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->getVersion()I

    move-result v1
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 305
    :try_start_6
    iget v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_version:I

    if-le v2, v1, :cond_b

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_vUpgObject:Ljava/util/Dictionary;

    if-eqz v2, :cond_b

    invoke-virtual {v2}, Ljava/util/Dictionary;->size()I

    move-result v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    if-lez v2, :cond_b

    .line 308
    :try_start_7
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    iget-object v6, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v5, v6, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->copyFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 310
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uUpg:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsUpgrade;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_vUpgObject:Ljava/util/Dictionary;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_version:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, p0, v2, v1, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsUpgrade;->onUpgrade(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/util/Dictionary;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 312
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->deleteBackupDB(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_4

    .line 314
    :cond_9
    const-string v0, "Failed in deleteBackupDB backup-\" + _dbName"

    .line 315
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V

    .line 317
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 318
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    :catch_2
    move-exception v0

    .line 322
    :try_start_8
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_context:Landroid/content/Context;

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    invoke-virtual {v1, v2, v5}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->restoreDatabase(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 323
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v1, :cond_a

    .line 324
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Failed in restoreDatabase "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_dbName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 325
    :cond_a
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V

    .line 327
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 328
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 331
    :cond_b
    :goto_4
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    return-void

    :catch_3
    move-exception v0

    .line 299
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V

    .line 302
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 303
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    :cond_c
    :goto_5
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    return-void

    :catch_4
    move-exception v0

    .line 286
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 287
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V

    .line 289
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 290
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 334
    :cond_d
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    .line 335
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 336
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Database not opened"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 339
    :cond_e
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    .line 340
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 341
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No database returned"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    :catch_5
    move-exception v0

    .line 344
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error in creating the database"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 345
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_isOpen:Ljava/lang/Boolean;

    .line 346
    iput-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    .line 347
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public prepareSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 18
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "statement",
            "values",
            "fromJson",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ")",
            "Lcom/getcapacitor/JSObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    .line 652
    const-string v4, "INSERT"

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\\s+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    .line 656
    new-instance v7, Lcom/getcapacitor/JSArray;

    invoke-direct {v7}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 657
    new-instance v8, Lcom/getcapacitor/JSObject;

    invoke-direct {v8}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 667
    const-string v9, "no"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    const-string v11, "wA"

    if-nez v10, :cond_0

    .line 668
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 671
    :cond_0
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-string v10, ""

    if-nez v9, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v12, 0x2

    invoke-static {v9, v12}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-virtual {v3, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 674
    :cond_1
    :try_start_0
    invoke-direct {v1, v0, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getStmtAndRetColNames(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v9

    .line 675
    const-string v12, "stmt"

    invoke-virtual {v9, v12, v0}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 676
    const-string v12, "names"

    invoke-virtual {v9, v12, v10}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_4

    :cond_2
    const/4 v9, 0x0

    .line 682
    :try_start_1
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const-string v13, "DELETE"

    if-nez v12, :cond_3

    :try_start_2
    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 683
    invoke-virtual {v1, v1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->deleteSQL(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    goto :goto_0

    :catch_0
    move-exception v0

    goto/16 :goto_5

    :cond_3
    :goto_0
    if-eqz v0, :cond_d

    .line 686
    :try_start_3
    iget-object v12, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v12, v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v12
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v2, :cond_7

    .line 690
    :try_start_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-lez v14, :cond_7

    .line 692
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v14

    new-array v14, v14, [Ljava/lang/Object;

    .line 693
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-ge v6, v15, :cond_6

    .line 694
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    if-nez v15, :cond_4

    .line 695
    aput-object v9, v14, v6

    move-object/from16 p1, v9

    goto :goto_2

    .line 696
    :cond_4
    sget-object v15, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    move-object/from16 p1, v9

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    if-ne v15, v9, :cond_5

    .line 697
    aput-object p1, v14, v6

    goto :goto_2

    .line 699
    :cond_5
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v14, v6

    :goto_2
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v9, p1

    goto :goto_1

    .line 702
    :cond_6
    invoke-static {v12, v14}, Landroidx/sqlite/db/SimpleSQLiteQuery;->bind(Landroidx/sqlite/db/SupportSQLiteProgram;[Ljava/lang/Object;)V

    .line 704
    :cond_7
    iget-object v2, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object v6, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {v2, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbLastId(Landroidx/sqlite/db/SupportSQLiteDatabase;)J

    move-result-wide v14

    .line 705
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 706
    invoke-interface {v12}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeInsert()J

    goto :goto_3

    .line 708
    :cond_8
    invoke-virtual {v3, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_9

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 709
    invoke-direct {v1, v1, v0, v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getUpdDelReturnedValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v7

    .line 711
    :cond_9
    invoke-interface {v12}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 713
    :goto_3
    iget-object v2, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object v6, v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {v2, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbLastId(Landroidx/sqlite/db/SupportSQLiteDatabase;)J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 714
    invoke-virtual {v3, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_b

    .line 715
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 716
    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLStatement;->extractTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 718
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v2, p0

    move-object v7, v3

    move-object v3, v10

    invoke-direct/range {v1 .. v7}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getInsertReturnedValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    move-object v7, v0

    goto :goto_4

    :cond_a
    move-object v3, v10

    .line 720
    const-string v2, "UPDATE"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 721
    invoke-direct {v1, v1, v0, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getUpdDelReturnedValues(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v7

    .line 732
    :cond_b
    :goto_4
    const-string v0, "lastId"

    invoke-virtual {v8, v0, v6}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 733
    const-string v0, "values"

    invoke-virtual {v8, v0, v7}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v12, :cond_c

    .line 739
    invoke-interface {v12}, Landroidx/sqlite/db/SupportSQLiteStatement;->close()V

    :cond_c
    return-object v8

    :catchall_0
    move-exception v0

    move-object v9, v12

    goto :goto_6

    :catch_1
    move-exception v0

    move-object v9, v12

    goto :goto_5

    :cond_d
    move-object/from16 p1, v9

    .line 688
    :try_start_5
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "sqlStmt is null"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    move-object/from16 v9, p1

    goto :goto_6

    :catch_2
    move-exception v0

    move-object/from16 v9, p1

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object/from16 p1, v9

    goto :goto_6

    :catch_3
    move-exception v0

    move-object/from16 p1, v9

    .line 736
    :goto_5
    :try_start_6
    new-instance v2, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :catchall_3
    move-exception v0

    :goto_6
    if-eqz v9, :cond_e

    .line 739
    invoke-interface {v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->close()V

    .line 741
    :cond_e
    throw v0

    :catch_4
    move-exception v0

    .line 678
    new-instance v2, Ljava/lang/Exception;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public replacePlaceholders(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stmt",
            "sqlBuilder"
        }
    .end annotation

    .line 529
    invoke-virtual {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->extractQuestionMarkValues(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-object p1

    .line 536
    :cond_0
    const-string v0, "(?i)VALUES\\s*\\((\\s*\\?\\s*(?:,\\s*\\?\\s*)*)\\)"

    .line 539
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 540
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 543
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 545
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "VALUES "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 548
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The statement does not contain a valid VALUES clause with placeholders."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public rollbackTransaction()Ljava/lang/Integer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 208
    :try_start_0
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isAvailTrans()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->endTransaction()V

    :cond_0
    const/4 v0, 0x0

    .line 211
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 213
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed in rollbackTransaction"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 214
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Database not opened"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public runSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "statement",
            "values",
            "transaction",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ")",
            "Lcom/getcapacitor/JSObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 616
    const-string v0, "values"

    const-string v1, "lastId"

    new-instance v2, Lcom/getcapacitor/JSObject;

    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 620
    :try_start_0
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz v3, :cond_3

    invoke-interface {v3}, Landroidx/sqlite/db/SupportSQLiteDatabase;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    .line 621
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {v3, v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbChanges(Landroidx/sqlite/db/SupportSQLiteDatabase;)I

    move-result v3

    .line 622
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->beginTransaction()Ljava/lang/Integer;

    :cond_0
    const/4 v4, 0x0

    .line 623
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0, p1, p2, v4, p4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->prepareSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    .line 624
    invoke-virtual {p1, v1}, Lcom/getcapacitor/JSObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long p2, v4, v6

    if-eqz p2, :cond_1

    .line 625
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->commitTransaction()Ljava/lang/Integer;

    .line 626
    :cond_1
    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    iget-object p4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-virtual {p2, p4}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->dbChanges(Landroidx/sqlite/db/SupportSQLiteDatabase;)I

    move-result p2

    sub-int/2addr p2, v3

    .line 627
    const-string p4, "changes"

    invoke-virtual {v2, p4, p2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;

    .line 628
    invoke-virtual {v2, v1, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;J)Lcom/getcapacitor/JSObject;

    .line 629
    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {v2, v0, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 637
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz p1, :cond_2

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {p1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    :cond_2
    return-object v2

    .line 632
    :cond_3
    :try_start_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "Database not opened"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 635
    :try_start_2
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 637
    :goto_0
    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-eqz p2, :cond_4

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    invoke-interface {p2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    .line 638
    :cond_4
    throw p1
.end method

.method public selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "statement",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/getcapacitor/JSArray;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 969
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 971
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_db:Landroidx/sqlite/db/SupportSQLiteDatabase;

    if-nez v1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 975
    :try_start_0
    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    invoke-interface {v1, p1, p2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;

    move-result-object p1

    check-cast p1, Lnet/zetetic/database/sqlcipher/SQLiteCursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 976
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->moveToNext()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 977
    new-instance p2, Lcom/getcapacitor/JSObject;

    invoke-direct {p2}, Lcom/getcapacitor/JSObject;-><init>()V

    move v1, v2

    .line 978
    :goto_1
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getColumnCount()I

    move-result v3

    if-ge v1, v3, :cond_6

    .line 979
    invoke-virtual {p1, v1}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v3

    .line 980
    invoke-virtual {p1, v3}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 981
    invoke-virtual {p1, v1}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getType(I)I

    move-result v5

    if-eqz v5, :cond_5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_4

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    const/4 v6, 0x3

    if-eq v5, v6, :cond_2

    const/4 v6, 0x4

    if-eq v5, v6, :cond_1

    goto :goto_2

    .line 993
    :cond_1
    invoke-virtual {p1, v4}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getBlob(I)[B

    move-result-object v4

    .line 994
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {v5, v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->ByteArrayToJSArray([B)Lcom/getcapacitor/JSArray;

    move-result-object v4

    .line 995
    invoke-virtual {p2, v3, v4}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    goto :goto_2

    .line 984
    :cond_2
    invoke-virtual {p1, v4}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    goto :goto_2

    .line 990
    :cond_3
    invoke-virtual {p1, v4}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getDouble(I)D

    move-result-wide v4

    invoke-virtual {p2, v3, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;D)Lcom/getcapacitor/JSObject;

    goto :goto_2

    .line 987
    :cond_4
    invoke-virtual {p1, v4}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p2, v3, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;J)Lcom/getcapacitor/JSObject;

    goto :goto_2

    .line 1004
    :cond_5
    sget-object v4, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p2, v3, v4}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1010
    :cond_6
    invoke-virtual {v0, p2}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_7
    if-eqz p1, :cond_8

    .line 1016
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->close()V

    :cond_8
    :goto_3
    return-object v0

    :catchall_0
    move-exception p2

    move-object v3, p1

    goto :goto_5

    :catch_0
    move-exception p2

    move-object v3, p1

    goto :goto_4

    :catchall_1
    move-exception p2

    goto :goto_5

    :catch_1
    move-exception p2

    .line 1014
    :goto_4
    :try_start_2
    new-instance p1, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "in selectSQL cursor "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_5
    if-eqz v3, :cond_9

    .line 1016
    invoke-virtual {v3}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->close()V

    .line 1017
    :cond_9
    throw p2
.end method

.method public setSyncDate(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "syncDate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "UPDATE sync_table SET sync_date = "

    .line 1137
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1139
    :try_start_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->_uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    const-string v2, "sync_table"

    invoke-virtual {v1, p0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1143
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZ"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 1144
    const-string v2, "Z$"

    const-string v3, "+0000"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    .line 1145
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    const/4 p1, 0x1

    .line 1146
    new-array p1, p1, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " WHERE id = 1;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p1, v1

    .line 1147
    new-array v0, v1, [Ljava/lang/Boolean;

    invoke-virtual {p0, p1, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->execute([Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    .line 1148
    const-string v0, "changes"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    if-eq p1, v0, :cond_0

    return-void

    .line 1151
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "changes < 0"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1141
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No sync_table available"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1154
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method
