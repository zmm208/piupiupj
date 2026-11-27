.class public Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;
.super Ljava/lang/Object;
.source "CapacitorSQLite.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.getcapacitor.community.database.sqlite.CapacitorSQLite"


# instance fields
.field private final VALIDITY_DURATION:I

.field private final biometricAuth:Ljava/lang/Boolean;

.field private biometricManager:Landroidx/biometric/BiometricManager;

.field private final biometricSubTitle:Ljava/lang/String;

.field private final biometricTitle:Ljava/lang/String;

.field private call:Lcom/getcapacitor/PluginCall;

.field private final context:Landroid/content/Context;

.field private final dbDict:Ljava/util/Dictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Dictionary<",
            "Ljava/lang/String;",
            "Lcom/getcapacitor/community/database/sqlite/SQLite/Database;",
            ">;"
        }
    .end annotation
.end field

.field private final globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

.field private final isEncryption:Ljava/lang/Boolean;

.field private masterKeyAlias:Landroidx/security/crypto/MasterKey;

.field private final rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

.field private sharedPreferences:Landroid/content/SharedPreferences;

.field private final uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

.field private final uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

.field private final uHTTP:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDownloadFromHTTP;

.field private final uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

.field private final uMigrate:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

.field private final uNCDatabase:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsNCDatabase;

.field private uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

.field private final uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetrHandler(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Lcom/getcapacitor/community/database/sqlite/RetHandler;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetuSecret(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmasterKeyAlias(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Landroidx/security/crypto/MasterKey;)V
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->masterKeyAlias:Landroidx/security/crypto/MasterKey;

    return-void
.end method

.method static bridge synthetic -$$Nest$mnotifyBiometricEvent(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->notifyBiometricEvent(Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetSharedPreferences(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)V
    .locals 0

    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->setSharedPreferences()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "config"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    .line 52
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    .line 53
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    .line 54
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    .line 55
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uMigrate:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

    .line 56
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsNCDatabase;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsNCDatabase;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uNCDatabase:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsNCDatabase;

    .line 57
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDownloadFromHTTP;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDownloadFromHTTP;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uHTTP:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDownloadFromHTTP;

    .line 58
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    .line 59
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    const/4 v0, 0x5

    .line 68
    iput v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->VALIDITY_DURATION:I

    .line 69
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    .line 74
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    .line 75
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->call:Lcom/getcapacitor/PluginCall;

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->call:Lcom/getcapacitor/PluginCall;

    .line 76
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getIsEncryption()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    .line 77
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricAuth()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricAuth:Ljava/lang/Boolean;

    .line 78
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricTitle()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricTitle:Ljava/lang/String;

    .line 79
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricSubTitle()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricSubTitle:Ljava/lang/String;

    .line 81
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 85
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    invoke-static {p1}, Landroidx/biometric/BiometricManager;->from(Landroid/content/Context;)Landroidx/biometric/BiometricManager;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricManager:Landroidx/biometric/BiometricManager;

    .line 87
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;

    invoke-direct {v0, p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Landroid/content/Context;)V

    .line 120
    new-instance v1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricManager:Landroidx/biometric/BiometricManager;

    invoke-direct {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;-><init>(Landroid/content/Context;Landroidx/biometric/BiometricManager;Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;)V

    .line 121
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->checkBiometricIsAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v1, v2, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->showBiometricDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 124
    :cond_0
    new-instance p2, Landroidx/security/crypto/MasterKey$Builder;

    invoke-direct {p2, p1}, Landroidx/security/crypto/MasterKey$Builder;-><init>(Landroid/content/Context;)V

    sget-object p1, Landroidx/security/crypto/MasterKey$KeyScheme;->AES256_GCM:Landroidx/security/crypto/MasterKey$KeyScheme;

    invoke-virtual {p2, p1}, Landroidx/security/crypto/MasterKey$Builder;->setKeyScheme(Landroidx/security/crypto/MasterKey$KeyScheme;)Landroidx/security/crypto/MasterKey$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/security/crypto/MasterKey$Builder;->build()Landroidx/security/crypto/MasterKey;

    move-result-object p1

    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->masterKeyAlias:Landroidx/security/crypto/MasterKey;

    .line 125
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->setSharedPreferences()V

    return-void

    .line 128
    :cond_1
    new-instance p2, Landroidx/security/crypto/MasterKey$Builder;

    invoke-direct {p2, p1}, Landroidx/security/crypto/MasterKey$Builder;-><init>(Landroid/content/Context;)V

    sget-object p1, Landroidx/security/crypto/MasterKey$KeyScheme;->AES256_GCM:Landroidx/security/crypto/MasterKey$KeyScheme;

    invoke-virtual {p2, p1}, Landroidx/security/crypto/MasterKey$Builder;->setKeyScheme(Landroidx/security/crypto/MasterKey$KeyScheme;)Landroidx/security/crypto/MasterKey$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/security/crypto/MasterKey$Builder;->build()Landroidx/security/crypto/MasterKey;

    move-result-object p1

    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->masterKeyAlias:Landroidx/security/crypto/MasterKey;

    .line 129
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->setSharedPreferences()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception p1

    .line 133
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private closeAllConnections()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1353
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0}, Ljava/util/Dictionary;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 1354
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1355
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1356
    const-string v2, "RO_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x3

    .line 1357
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1358
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeConnection(Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 1361
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "close all connections "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1362
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getDatabaseName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbName"
        }
    .end annotation

    .line 1342
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1343
    const-string v0, ".db"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1344
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x3

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private notifyBiometricEvent(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "ret",
            "msg"
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 144
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "$$$$$ in notifyBiometricEvent "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->defaultCenter()Lcom/getcapacitor/community/database/sqlite/NotificationCenter;

    move-result-object p1

    const-string p2, "biometricResults"

    invoke-virtual {p1, p2, v0}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->postNotification(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private setSharedPreferences()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 151
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    const-string v1, "sqlite_encrypted_shared_prefs"

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->masterKeyAlias:Landroidx/security/crypto/MasterKey;

    sget-object v3, Landroidx/security/crypto/EncryptedSharedPreferences$PrefKeyEncryptionScheme;->AES256_SIV:Landroidx/security/crypto/EncryptedSharedPreferences$PrefKeyEncryptionScheme;

    sget-object v4, Landroidx/security/crypto/EncryptedSharedPreferences$PrefValueEncryptionScheme;->AES256_GCM:Landroidx/security/crypto/EncryptedSharedPreferences$PrefValueEncryptionScheme;

    invoke-static {v0, v1, v2, v3, v4}, Landroidx/security/crypto/EncryptedSharedPreferences;->create(Landroid/content/Context;Ljava/lang/String;Landroidx/security/crypto/MasterKey;Landroidx/security/crypto/EncryptedSharedPreferences$PrefKeyEncryptionScheme;Landroidx/security/crypto/EncryptedSharedPreferences$PrefValueEncryptionScheme;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 158
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-direct {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;)V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 160
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public addSQLiteSuffix(Ljava/lang/String;Lcom/getcapacitor/JSArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "folderPath",
            "dbList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 842
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {v0, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->stringJSArrayToArrayList(Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p2

    .line 843
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uMigrate:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;->addSQLiteSuffix(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 845
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public addUpgradeStatement(Lcom/getcapacitor/JSArray;)Ljava/util/Dictionary;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "upgrade"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/JSArray;",
            ")",
            "Ljava/util/Dictionary<",
            "Ljava/lang/Integer;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1160
    const-string v0, "toVersion"

    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    const/4 v2, 0x0

    .line 1162
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 1165
    :try_start_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    if-eqz v3, :cond_0

    .line 1166
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "statements"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v4, :cond_0

    .line 1176
    :try_start_1
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 1177
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4, v3}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1179
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Must provide toVersion as Integer"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1180
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1167
    :cond_0
    :try_start_2
    const-string p1, "Must provide an upgrade statement"

    .line 1168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " {toVersion,statement}"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1169
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    move-exception p1

    .line 1172
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Must provide an upgrade statement "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1173
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-object v1
.end method

.method public beginTransaction(Ljava/lang/String;)Lcom/getcapacitor/JSObject;
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

    .line 461
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 462
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 463
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RW_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 464
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v2, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v1, :cond_1

    .line 466
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 468
    :try_start_0
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->beginTransaction()Ljava/lang/Integer;

    move-result-object p1

    .line 469
    const-string v1, "changes"

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 472
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 475
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " not opened"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 476
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 479
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No available connection for database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 480
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public changeEncryptionSecret(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "call",
            "passphrase",
            "oldPassphrase"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 218
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->call:Lcom/getcapacitor/PluginCall;

    .line 219
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 222
    :try_start_0
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    .line 223
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricAuth:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 224
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    .line 248
    new-instance p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    iget-object p3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricManager:Landroidx/biometric/BiometricManager;

    invoke-direct {p1, p2, p3, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;-><init>(Landroid/content/Context;Landroidx/biometric/BiometricManager;Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;)V

    .line 249
    invoke-virtual {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->checkBiometricIsAvailable()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 250
    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricTitle:Ljava/lang/String;

    iget-object p3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->biometricSubTitle:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->showBiometricDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 252
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "Biometric features are currently unavailable."

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 256
    :cond_1
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    invoke-virtual {p1, p2, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->changeEncryptionSecret(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 259
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 262
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "No Encryption set in capacitor.config"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public checkConnectionsConsistency(Lcom/getcapacitor/JSArray;Lcom/getcapacitor/JSArray;)Ljava/lang/Boolean;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbNames",
            "openModes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 679
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1}, Ljava/util/Dictionary;->keys()Ljava/util/Enumeration;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 680
    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    const/4 v2, 0x0

    .line 689
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 681
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->length()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 682
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Lcom/getcapacitor/JSArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1, v2}, Lcom/getcapacitor/JSArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 683
    invoke-virtual {v1, v4}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 685
    :cond_0
    new-instance p1, Ljava/util/HashSet;

    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {p2, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->stringJSArrayToArrayList(Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 687
    :try_start_0
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p2

    if-nez p2, :cond_1

    .line 688
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    return-object v3

    .line 691
    :cond_1
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p2

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v1

    if-ge p2, v1, :cond_2

    .line 693
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    return-object v3

    .line 696
    :cond_2
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p2

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v1

    if-le p2, v1, :cond_4

    .line 697
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_3
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 698
    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 699
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 703
    :cond_4
    new-instance p2, Ljava/util/HashSet;

    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0}, Ljava/util/Dictionary;->keys()Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 704
    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v1

    if-ne v0, v1, :cond_6

    .line 705
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 706
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 707
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 708
    invoke-interface {v1, p1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 709
    invoke-interface {v0, v1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 710
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p1

    if-nez p1, :cond_5

    const/4 p1, 0x1

    .line 711
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 714
    :cond_5
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    return-object v3

    .line 718
    :cond_6
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception p1

    .line 722
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public checkEncryptionSecret(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "passphrase"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 292
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 295
    :try_start_0
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    .line 297
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->checkEncryptionSecret(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 299
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No Encryption set in capacitor.config"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clearEncryptionSecret()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 271
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    :try_start_0
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    .line 276
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->clearEncryptionSecret()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 278
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 281
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No Encryption set in capacitor.config"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 428
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 429
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 430
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_3

    .line 432
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const-string v1, "database "

    if-eqz v0, :cond_2

    .line 433
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->inTransaction()Z

    move-result v0

    if-nez v0, :cond_1

    .line 435
    :try_start_0
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 437
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 440
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " failed to close still in transaction"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 441
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 444
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not opened"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 445
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 448
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 449
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public closeConnection(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 652
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 653
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 654
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_2

    .line 656
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 658
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 660
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 663
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {p1, p2}, Ljava/util/Dictionary;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 665
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 666
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public closeNCConnection(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 628
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RO_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 629
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v1, :cond_1

    .line 631
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 633
    :try_start_0
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 635
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 638
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {p1, v0}, Ljava/util/Dictionary;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 640
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No available connection for database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 641
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public commitTransaction(Ljava/lang/String;)Lcom/getcapacitor/JSObject;
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

    .line 492
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 493
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 494
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RW_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 495
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v2, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v1, :cond_1

    .line 497
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 499
    :try_start_0
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->commitTransaction()Ljava/lang/Integer;

    move-result-object p1

    .line 500
    const-string v1, "changes"

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 503
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 506
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " not opened"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 507
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 510
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No available connection for database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 511
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public copyFromAssets(Ljava/lang/Boolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "overwrite"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1333
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->copyFromAssetsToDatabase(Landroid/content/Context;Ljava/lang/Boolean;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1335
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "copy failed : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1336
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createConnection(Ljava/lang/String;ZLjava/lang/String;ILjava/util/Dictionary;Ljava/lang/Boolean;)V
    .locals 11
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
            "dbName",
            "encrypted",
            "mode",
            "version",
            "vUpgObject",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Dictionary<",
            "Ljava/lang/Integer;",
            "Lorg/json/JSONObject;",
            ">;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 332
    invoke-direct/range {p0 .. p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 333
    invoke-virtual/range {p6 .. p6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RO_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 335
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-nez v1, :cond_3

    if-eqz p2, :cond_2

    .line 340
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 341
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "Database cannot be encrypted as \'No Encryption\' set in capacitor.config"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 344
    :cond_2
    :goto_1
    :try_start_0
    new-instance v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, "SQLite.db"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 347
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v7, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    iget-object v9, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    move-object v5, p3

    move v6, p4

    move-object/from16 v8, p5

    move-object/from16 v10, p6

    invoke-direct/range {v1 .. v10}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;ILjava/lang/Boolean;Ljava/util/Dictionary;Landroid/content/SharedPreferences;Ljava/lang/Boolean;)V

    .line 355
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {p1, v0, v1}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 357
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 337
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Connection "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " already exists"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 338
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public createNCConnection(Ljava/lang/String;I)V
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbPath",
            "version"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "Database "

    .line 370
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RO_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 371
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v2, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-nez v2, :cond_1

    .line 377
    :try_start_0
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    invoke-virtual {v2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->isPathExists(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    .line 378
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 382
    new-instance v3, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    const/4 v0, 0x0

    .line 385
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "no-encryption"

    iget-object v9, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    iget-object v11, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    const/4 v0, 0x1

    .line 391
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v3 .. v12}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;ILjava/lang/Boolean;Ljava/util/Dictionary;Landroid/content/SharedPreferences;Ljava/lang/Boolean;)V

    .line 393
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {p1, v1, v3}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    move-object v5, p1

    .line 379
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " does not exist"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 380
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 395
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_1
    move-object v5, p1

    .line 373
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Connection "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " already exists"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 374
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public createSyncTable(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1094
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1095
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1096
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_2

    .line 1098
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1102
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1106
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->createSyncTable()Lcom/getcapacitor/JSObject;

    move-result-object p1

    return-object p1

    .line 1103
    :cond_0
    const-string p1, "CreateSyncTable: db not opened"

    .line 1104
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1108
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1099
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1111
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1112
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public deleteDatabase(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1075
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1076
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1077
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_1

    .line 1079
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_0

    .line 1083
    :try_start_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "SQLite.db"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->deleteDB(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1085
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1080
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1088
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1089
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public deleteExportedRows(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1307
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1308
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1309
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_2

    .line 1311
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1315
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1319
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->deleteExportedRows()V

    return-void

    .line 1316
    :cond_0
    const-string p1, "deleteExportedRows: db not opened"

    .line 1317
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1321
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "DeleteExportedRows "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1322
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1312
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1325
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1326
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public deleteOldDatabases(Ljava/lang/String;Lcom/getcapacitor/JSArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "folderPath",
            "dbList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 855
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {v0, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->stringJSArrayToArrayList(Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p2

    .line 856
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uMigrate:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;->deleteOldDatabases(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 858
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public echo(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    return-object p1
.end method

.method public execute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "dbName",
            "statements",
            "transaction",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 885
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 886
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 887
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_2

    .line 889
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_1

    .line 892
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-eqz p4, :cond_0

    .line 894
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->getStatementsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    .line 896
    :try_start_0
    new-array p2, p2, [Ljava/lang/Boolean;

    const/4 p4, 0x0

    aput-object p3, p2, p4

    invoke-virtual {v0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->execute([Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 898
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 901
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not opened"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 902
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 890
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 905
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 906
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public executeSet(Ljava/lang/String;Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "dbName",
            "set",
            "transaction",
            "readonly",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 919
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 920
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 921
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_2

    .line 923
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_1

    .line 926
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-eqz p4, :cond_0

    .line 928
    :try_start_0
    invoke-virtual {v0, p2, p3, p5}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->executeSet(Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 930
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 933
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not opened"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 934
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 924
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 937
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 938
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public exportToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "dbName",
            "expMode",
            "readonly",
            "encrypted"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1275
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1276
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_0

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 1277
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p3}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p3, :cond_6

    .line 1280
    :try_start_0
    invoke-virtual {p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1284
    invoke-virtual {p3, p2, p4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->exportToJson(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object p1

    .line 1285
    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->length()I

    move-result p2

    if-eqz p2, :cond_4

    .line 1288
    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->length()I

    move-result p2

    const/4 p3, 0x1

    if-ne p2, p3, :cond_1

    const-string p2, "expData"

    invoke-virtual {p1, p2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_1

    .line 1290
    :cond_1
    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->length()I

    move-result p2

    const/4 p3, 0x5

    if-eq p2, p3, :cond_3

    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->length()I

    move-result p2

    const/4 p3, 0x6

    if-eq p2, p3, :cond_3

    invoke-virtual {p1}, Lcom/getcapacitor/JSObject;->length()I

    move-result p2

    const/4 p3, 0x7

    if-ne p2, p3, :cond_2

    goto :goto_1

    .line 1293
    :cond_2
    const-string p1, "ExportToJson: return Obj is not a JsonSQLite Obj"

    .line 1294
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    :goto_1
    return-object p1

    .line 1286
    :cond_4
    const-string p1, "ExportToJson: : return Object is empty No data to synchronize"

    .line 1287
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1281
    :cond_5
    const-string p1, "ExportToJson: db not opened"

    .line 1282
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1297
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "ExportToJson "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1298
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1301
    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1302
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public getDatabaseList()Lcom/getcapacitor/JSArray;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 797
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->getListOfFiles(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 798
    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 799
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 800
    const-string v5, "SQLite"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 801
    invoke-virtual {v1, v4}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 804
    :cond_1
    invoke-virtual {v1}, Lcom/getcapacitor/JSArray;->length()I

    move-result v0

    if-lez v0, :cond_2

    return-object v1

    .line 808
    :cond_2
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No databases available "

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFromHTTPRequest(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 672
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uHTTP:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDownloadFromHTTP;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDownloadFromHTTP;->download(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 674
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMigratableDbList(Ljava/lang/String;)Lcom/getcapacitor/JSArray;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "folderPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 819
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uMigrate:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;->getMigratableList(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 820
    new-instance v0, Lcom/getcapacitor/JSArray;

    invoke-direct {v0}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 821
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 822
    const-string v4, "SQLite"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 823
    invoke-virtual {v0, v3}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 826
    :cond_1
    invoke-virtual {v0}, Lcom/getcapacitor/JSArray;->length()I

    move-result p1

    if-lez p1, :cond_2

    return-object v0

    .line 830
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No databases available "

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getNCDatabasePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "folderPath",
            "database"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 308
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uNCDatabase:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsNCDatabase;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsNCDatabase;->getNCDatabasePath(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 310
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public getSyncDate(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Long;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1140
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1141
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1142
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_2

    .line 1145
    :try_start_0
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1149
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getSyncDate()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    .line 1146
    :cond_1
    const-string p1, "GetSyncDate: db not opened"

    .line 1147
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1151
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1154
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1155
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public getTableList(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/getcapacitor/JSArray;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1033
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1034
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_2

    .line 1036
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1037
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getTableNames()Lcom/getcapacitor/JSArray;

    move-result-object p1

    return-object p1

    .line 1040
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not opened"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1041
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1044
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1045
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public getUrl(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 583
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 584
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 585
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_1

    .line 588
    :try_start_0
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getUrl()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 590
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 593
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 594
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public getVersion(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Integer;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 606
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 607
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 608
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_1

    .line 611
    :try_start_0
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getVersion()Ljava/lang/Integer;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 613
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 616
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 617
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public importFromJson(Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parsingData"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v1, p0

    .line 1198
    const-string v0, "expData"

    .line 0
    const-string v2, "ImportFromJson: Cannot import a version lower than"

    .line 1198
    :try_start_0
    new-instance v3, Lcom/getcapacitor/JSObject;

    move-object/from16 v4, p1

    invoke-direct {v3, v4}, Lcom/getcapacitor/JSObject;-><init>(Ljava/lang/String;)V

    .line 1199
    invoke-virtual {v3, v0}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1202
    iget-object v4, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v3, v0}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsEncryption;->decryptJSONObject(Landroid/content/Context;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v3

    .line 1205
    :cond_0
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;-><init>()V

    .line 1206
    iget-object v4, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0, v3, v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->isJsonSQLite(Lcom/getcapacitor/JSObject;Ljava/lang/Boolean;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1211
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getDatabase()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1212
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "SQLite.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1213
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getVersion()Ljava/lang/Integer;

    move-result-object v3

    .line 1214
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getMode()Ljava/lang/String;

    move-result-object v14

    .line 1215
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getOverwrite()Ljava/lang/Boolean;

    move-result-object v15

    .line 1217
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->getEncrypted()Ljava/lang/Boolean;

    move-result-object v7

    .line 1218
    const-string v4, "no-encryption"

    .line 1219
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1220
    const-string v4, "secret"

    :cond_1
    move-object v8, v4

    .line 1222
    new-instance v4, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    iget-object v5, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    .line 1227
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v10, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    new-instance v11, Ljava/util/Hashtable;

    invoke-direct {v11}, Ljava/util/Hashtable;-><init>()V

    iget-object v12, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    const/16 v16, 0x0

    .line 1231
    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-direct/range {v4 .. v13}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;ILjava/lang/Boolean;Ljava/util/Dictionary;Landroid/content/SharedPreferences;Ljava/lang/Boolean;)V

    .line 1233
    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v7, "full"

    if-eqz v5, :cond_2

    :try_start_1
    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1234
    iget-object v5, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v8, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v5, v8, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->isFileExists(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v5

    .line 1235
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1236
    iget-object v5, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v8, v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v5, v8, v6}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->deleteFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 1239
    :cond_2
    invoke-virtual {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->open()V

    .line 1240
    invoke-virtual {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 1245
    invoke-virtual {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getTableNames()Lcom/getcapacitor/JSArray;

    move-result-object v5

    .line 1246
    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v7, "changes"

    if-eqz v6, :cond_4

    :try_start_2
    invoke-virtual {v5}, Lcom/getcapacitor/JSArray;->length()I

    move-result v5

    if-lez v5, :cond_4

    .line 1247
    invoke-virtual {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->getVersion()Ljava/lang/Integer;

    move-result-object v5

    .line 1248
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-lt v6, v8, :cond_3

    .line 1253
    invoke-virtual {v5, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1254
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1255
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v7, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    return-object v0

    .line 1250
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1251
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1259
    :cond_4
    invoke-virtual {v4, v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->importFromJson(Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;)Lcom/getcapacitor/JSObject;

    move-result-object v0

    .line 1260
    invoke-virtual {v4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->close()V

    .line 1261
    invoke-virtual {v0, v7}, Lcom/getcapacitor/JSObject;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    return-object v0

    .line 1264
    :cond_5
    const-string v0, "importFromJson: import JsonObject not successful"

    .line 1265
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1241
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "SQLite.db not opened"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1242
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1208
    :cond_7
    const-string v0, "Stringify Json Object not Valid"

    .line 1209
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    .line 1269
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "importFromJson : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1270
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public isDBExists(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1050
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1051
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1052
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_1

    .line 1054
    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "SQLite.db"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 1055
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 1057
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1058
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public isDBOpen(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1063
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1064
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1065
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_1

    .line 1067
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 1069
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1070
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public isDatabase(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbName"
        }
    .end annotation

    .line 733
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 734
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "SQLite.db"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->isFileExists(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public isDatabaseEncrypted(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 5
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

    .line 745
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 746
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "SQLite.db"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 747
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v3, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->isFileExists(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 748
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    invoke-virtual {p1, v1, v0, v2, v3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->getDatabaseState(Landroid/content/Context;Ljava/io/File;Landroid/content/SharedPreferences;Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    move-result-object p1

    .line 749
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 752
    :cond_0
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNENCRYPTED:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    .line 753
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 755
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Database unknown"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    .line 750
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 757
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Database does not exist"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public isJsonValid(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parsingData"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1188
    :try_start_0
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0, p1}, Lcom/getcapacitor/JSObject;-><init>(Ljava/lang/String;)V

    .line 1189
    new-instance p1, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;

    invoke-direct {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;-><init>()V

    .line 1190
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/JsonSQLite;->isJsonSQLite(Lcom/getcapacitor/JSObject;Ljava/lang/Boolean;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1192
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isNCDatabase(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbPath"
        }
    .end annotation

    .line 768
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->isPathExists(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public isSecretStored()Ljava/lang/Boolean;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 178
    :try_start_0
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v0

    .line 179
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 180
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 182
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No Encryption set in capacitor.config"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isTableExists(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "dbName",
            "tableName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 779
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 780
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_0

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 781
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p3}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p3, :cond_1

    .line 783
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uJson:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;

    invoke-virtual {p1, p3, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/UtilsJson;->isTableExists(Lcom/getcapacitor/community/database/sqlite/SQLite/Database;Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 785
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 786
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public isTransactionActive(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
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

    .line 554
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 556
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_1

    .line 558
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 560
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isAvailTrans()Z

    move-result p1

    .line 561
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 563
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 566
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " not opened"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 567
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 570
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No available connection for database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 571
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public moveDatabasesAndAddSuffix(Ljava/lang/String;Lcom/getcapacitor/JSArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "folderPath",
            "dbList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 869
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {v0, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->stringJSArrayToArrayList(Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p2

    .line 870
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uMigrate:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsMigrate;->moveDatabasesAndAddSuffix(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 872
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public open(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dbName",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 406
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 407
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 408
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p2}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p2, :cond_1

    .line 411
    :try_start_0
    invoke-virtual {p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->open()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 413
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 416
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "No available connection for database "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 417
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public query(Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;)Lcom/getcapacitor/JSArray;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "dbName",
            "statement",
            "values",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1000
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1001
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-eqz p4, :cond_0

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "RO_"

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "RW_"

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 1002
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v0, p4}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz p4, :cond_3

    .line 1004
    invoke-virtual {p4}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1005
    invoke-virtual {p3}, Lcom/getcapacitor/JSArray;->length()I

    move-result p1

    if-lez p1, :cond_1

    .line 1007
    :try_start_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {p1, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->objectJSArrayToArrayList(Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p1

    .line 1008
    invoke-virtual {p4, p2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1011
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1015
    :cond_1
    :try_start_1
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p4, p2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->selectSQL(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/getcapacitor/JSArray;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object p1

    :catch_1
    move-exception p1

    .line 1018
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1022
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not opened"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1023
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1026
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1027
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public rollbackTransaction(Ljava/lang/String;)Lcom/getcapacitor/JSObject;
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

    .line 523
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 524
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 525
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RW_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 526
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v2, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v1, :cond_1

    .line 528
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 530
    :try_start_0
    invoke-virtual {v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->rollbackTransaction()Ljava/lang/Integer;

    move-result-object p1

    .line 531
    const-string v1, "changes"

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 534
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 537
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " not opened"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 538
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 541
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No available connection for database "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 542
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public run(Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;
    .locals 2
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
            "dbName",
            "statement",
            "values",
            "transaction",
            "readonly",
            "returnMode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 954
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 955
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 956
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_3

    .line 958
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-nez p5, :cond_2

    .line 961
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isNCDB()Ljava/lang/Boolean;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-nez p5, :cond_1

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-eqz p5, :cond_1

    .line 962
    invoke-virtual {p3}, Lcom/getcapacitor/JSArray;->length()I

    move-result p1

    if-lez p1, :cond_0

    .line 965
    :try_start_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSqlite:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;

    invoke-virtual {p1, p3}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLite;->objectJSArrayToArrayList(Lcom/getcapacitor/JSArray;)Ljava/util/ArrayList;

    move-result-object p1

    .line 966
    invoke-virtual {v0, p2, p1, p4, p6}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->runSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 969
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 973
    :cond_0
    :try_start_1
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p2, p1, p4, p6}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->runSQL(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object p1

    :catch_1
    move-exception p1

    .line 976
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 980
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not opened"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 981
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 959
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 984
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 985
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public setEncryptionSecret(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "passphrase"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 196
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    :try_start_0
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeAllConnections()V

    .line 201
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->uSecret:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->setEncryptionSecret(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 203
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No Encryption set in capacitor.config"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSyncDate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "dbName",
            "syncDate",
            "readonly"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1117
    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1118
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RW_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1119
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->dbDict:Ljava/util/Dictionary;

    invoke-virtual {v1, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;

    if-eqz v0, :cond_2

    .line 1121
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1125
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->isOpen()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1129
    invoke-virtual {v0, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/Database;->setSyncDate(Ljava/lang/String;)V

    return-void

    .line 1126
    :cond_0
    const-string p1, "SetSyncDate: db not opened"

    .line 1127
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1131
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1122
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "not allowed in read-only mode"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1134
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "No available connection for database "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1135
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method
