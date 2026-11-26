.class public Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;
.super Lcom/getcapacitor/Plugin;
.source "CapacitorSQLitePlugin.java"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "CapacitorSQLite"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin"


# instance fields
.field private config:Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

.field private implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

.field private loadMessage:Ljava/lang/String;

.field private final modeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private oldpassphrase:Ljava/lang/String;

.field private passphrase:Ljava/lang/String;

.field private final rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

.field private final versionUpgrades:Ljava/util/Dictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Dictionary<",
            "Ljava/lang/String;",
            "Ljava/util/Dictionary<",
            "Ljava/lang/Integer;",
            "Lorg/json/JSONObject;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$KCIuPFcYNEAMiQePAc2sxjPzxaI(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->lambda$getFromHTTPRequest$1(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic $r8$lambda$NVHQzJT-S71S8XVxaKuLaKnQW68(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->lambda$changeEncryptionSecret$0(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic $r8$lambda$gO_4zUHUmoOkJrOY6N_6W93HJj0(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/Exception;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->lambda$getFromHTTPRequest$2(Ljava/lang/Exception;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ouqmQ6nRu3Dj_ensnVLp7BjlhRc(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->lambda$getFromHTTPRequest$3(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 23
    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    .line 28
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->versionUpgrades:Ljava/util/Dictionary;

    .line 29
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->passphrase:Ljava/lang/String;

    .line 31
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->oldpassphrase:Ljava/lang/String;

    .line 32
    const-string v0, ""

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "no-encryption"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "encryption"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "secret"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "decryption"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "wrongsecret"

    aput-object v3, v1, v2

    .line 34
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->modeList:Ljava/util/ArrayList;

    return-void
.end method

.method private AddObserversToNotificationCenter()V
    .locals 3

    .line 1550
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->defaultCenter()Lcom/getcapacitor/community/database/sqlite/NotificationCenter;

    move-result-object v0

    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$1;

    invoke-direct {v1, p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$1;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;)V

    const-string v2, "importJsonProgress"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->addMethodForNotification(Ljava/lang/String;Lcom/getcapacitor/community/database/sqlite/MyRunnable;)V

    .line 1561
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->defaultCenter()Lcom/getcapacitor/community/database/sqlite/NotificationCenter;

    move-result-object v0

    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$2;

    invoke-direct {v1, p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$2;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;)V

    const-string v2, "exportJsonProgress"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->addMethodForNotification(Ljava/lang/String;Lcom/getcapacitor/community/database/sqlite/MyRunnable;)V

    .line 1572
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->defaultCenter()Lcom/getcapacitor/community/database/sqlite/NotificationCenter;

    move-result-object v0

    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$3;

    invoke-direct {v1, p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$3;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;)V

    const-string v2, "biometricResults"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/community/database/sqlite/NotificationCenter;->addMethodForNotification(Ljava/lang/String;Lcom/getcapacitor/community/database/sqlite/MyRunnable;)V

    return-void
.end method

.method static synthetic access$000(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    .locals 0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method static synthetic access$100(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    .locals 0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method static synthetic access$200(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    .locals 0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method private getSqliteConfig()Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1587
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;-><init>()V

    .line 1588
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getcapacitor/PluginConfig;->getConfigJSON()Lorg/json/JSONObject;

    move-result-object v1

    .line 1589
    const-string v2, "androidIsEncryption"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getIsEncryption()Z

    move-result v2

    .line 1590
    :goto_0
    invoke-virtual {v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->setIsEncryption(Z)V

    .line 1591
    const-string v3, "androidBiometric"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_5

    .line 1594
    const-string v3, "biometricAuth"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz v2, :cond_2

    .line 1595
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    goto :goto_2

    .line 1596
    :cond_2
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricAuth()Z

    move-result v2

    .line 1597
    :goto_2
    invoke-virtual {v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->setBiometricAuth(Z)V

    .line 1598
    const-string v2, "biometricTitle"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1599
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 1600
    :cond_3
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricTitle()Ljava/lang/String;

    move-result-object v2

    .line 1601
    :goto_3
    invoke-virtual {v0, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->setBiometricTitle(Ljava/lang/String;)V

    .line 1602
    const-string v2, "biometricSubTitle"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1603
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 1604
    :cond_4
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricSubTitle()Ljava/lang/String;

    move-result-object v1

    .line 1605
    :goto_4
    invoke-virtual {v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->setBiometricSubTitle(Ljava/lang/String;)V

    :cond_5
    return-object v0
.end method

.method private synthetic lambda$changeEncryptionSecret$0(Lcom/getcapacitor/PluginCall;)V
    .locals 4

    const/4 v0, 0x0

    .line 150
    :try_start_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->passphrase:Ljava/lang/String;

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->oldpassphrase:Ljava/lang/String;

    invoke-virtual {v1, p1, v2, v3}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->changeEncryptionSecret(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 153
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ChangeEncryptionSecret: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 154
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$getFromHTTPRequest$1(Lcom/getcapacitor/PluginCall;)V
    .locals 2

    .line 1532
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$getFromHTTPRequest$2(Ljava/lang/Exception;Lcom/getcapacitor/PluginCall;)V
    .locals 2

    .line 1535
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GetFromHTTPRequest: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1536
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, p1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$getFromHTTPRequest$3(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 2

    const/16 v0, 0xa

    .line 1529
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1531
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getFromHTTPRequest(Ljava/lang/String;)V

    .line 1532
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p1

    new-instance v0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda1;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Lcom/getcapacitor/PluginCall;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AppCompatActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1534
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda2;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/Exception;Lcom/getcapacitor/PluginCall;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public addSQLiteSuffix(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 823
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "folderPath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 824
    const-string v0, "default"

    goto :goto_0

    .line 826
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 828
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "dbNameList"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    move-object v1, v3

    goto :goto_1

    .line 831
    :cond_1
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v1

    :goto_1
    if-nez v1, :cond_2

    .line 834
    const-string v0, "AddSQLiteSuffix: dbNameList not given or empty"

    .line 835
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 838
    :cond_2
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_3

    .line 840
    :try_start_0
    invoke-virtual {v2, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->addSQLiteSuffix(Ljava/lang/String;Lcom/getcapacitor/JSArray;)V

    .line 841
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v3, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 843
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "addSQLiteSuffix: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 844
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 847
    :cond_3
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public addUpgradeStatement(Lcom/getcapacitor/PluginCall;)V
    .locals 7
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1326
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1327
    const-string v0, "AddUpgradeStatement: Must provide a database name"

    .line 1328
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1331
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1332
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v3, "upgrade"

    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    const-string v4, "AddUpgradeStatement: Must provide an array with upgrade statement"

    if-nez v1, :cond_1

    .line 1334
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v4}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1337
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v1

    if-nez v1, :cond_2

    .line 1340
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v4}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1344
    :cond_2
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_5

    .line 1346
    :try_start_0
    invoke-virtual {v3, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->addUpgradeStatement(Lcom/getcapacitor/JSArray;)Ljava/util/Dictionary;

    move-result-object v1

    .line 1348
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->versionUpgrades:Ljava/util/Dictionary;

    invoke-virtual {v3, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 1349
    invoke-virtual {v1}, Ljava/util/Dictionary;->keys()Ljava/util/Enumeration;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1350
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 1351
    invoke-virtual {v1, v4}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    .line 1353
    iget-object v6, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->versionUpgrades:Ljava/util/Dictionary;

    invoke-virtual {v6, v0}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Dictionary;

    invoke-virtual {v6, v4, v5}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1356
    :cond_3
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->versionUpgrades:Ljava/util/Dictionary;

    invoke-virtual {v3, v0, v1}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1359
    :cond_4
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1361
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "AddUpgradeStatement: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1362
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1365
    :cond_5
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public beginTransaction(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 380
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, -0x1

    .line 381
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 382
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 383
    const-string v1, "BeginTransaction: Must provide a database name"

    .line 384
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 387
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 389
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_1

    .line 391
    :try_start_0
    invoke-virtual {v2, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->beginTransaction(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 392
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 394
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "BeginTransaction: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 395
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 398
    :cond_1
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public changeEncryptionSecret(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 134
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "passphrase"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 135
    const-string v0, "SetEncryptionSecret: Must provide a passphrase"

    .line 136
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 139
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->passphrase:Ljava/lang/String;

    .line 141
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "oldpassphrase"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    const-string v0, "SetEncryptionSecret: Must provide a oldpassphrase"

    .line 143
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 146
    :cond_1
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->oldpassphrase:Ljava/lang/String;

    .line 147
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v0, :cond_2

    .line 148
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda0;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Lcom/getcapacitor/PluginCall;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 158
    :cond_2
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public checkConnectionsConsistency(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 607
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "dbNames"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 608
    const-string v0, "CheckConnectionsConsistency: Must provide a connection Array"

    .line 609
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 612
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 613
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v3, "openModes"

    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 614
    const-string v0, "CheckConnectionsConsistency: Must provide a openModes Array"

    .line 615
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 618
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v1

    if-eqz v0, :cond_4

    if-nez v1, :cond_2

    goto :goto_0

    .line 624
    :cond_2
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_3

    .line 626
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->checkConnectionsConsistency(Lcom/getcapacitor/JSArray;Lcom/getcapacitor/JSArray;)Ljava/lang/Boolean;

    move-result-object v0

    .line 627
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 629
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CheckConnectionsConsistency: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 630
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 633
    :cond_3
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 620
    :cond_4
    :goto_0
    const-string v0, "CheckConnectionsConsistency: No dbNames or openModes given"

    .line 621
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public checkEncryptionSecret(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 192
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "passphrase"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 193
    const-string v0, "checkEncryptionSecret: Must provide a passphrase"

    .line 194
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 197
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 198
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 200
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->checkEncryptionSecret(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 201
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CheckEncryptionSecret: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 204
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 207
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public clearEncryptionSecret(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 170
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 172
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->clearEncryptionSecret()V

    .line 173
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v1, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 175
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ClearEncryptionSecret: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 176
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public close(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 352
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 353
    const-string v0, "Close: Must provide a database name"

    .line 354
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 357
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 358
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 359
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 361
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->close(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 362
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 364
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Close: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 365
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 368
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public closeConnection(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 579
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 580
    const-string v0, "CloseConnection: Must provide a database name"

    .line 581
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 584
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 585
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 586
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 588
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeConnection(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 589
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 591
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CloseConnection: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 592
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 595
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public closeNCConnection(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 552
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "databasePath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 553
    const-string v0, "CloseNCConnection: Must provide a database path"

    .line 554
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 557
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 558
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 560
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->closeNCConnection(Ljava/lang/String;)V

    .line 561
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 563
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CloseNCConnection: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 564
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 567
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public commitTransaction(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 410
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, -0x1

    .line 411
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 412
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 413
    const-string v1, "CommitTransaction: Must provide a database name"

    .line 414
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 417
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 419
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_1

    .line 421
    :try_start_0
    invoke-virtual {v2, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->commitTransaction(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 422
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 424
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CommitTransaction: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 425
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 428
    :cond_1
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public copyFromAssets(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1498
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "overwrite"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 1500
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 1502
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->copyFromAssets(Ljava/lang/Boolean;)V

    .line 1503
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1505
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CopyFromAssets: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1506
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1509
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public createConnection(Lcom/getcapacitor/PluginCall;)V
    .locals 10
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 281
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 282
    const-string v0, "CreateConnection: Must provide a database name"

    .line 283
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 286
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x1

    .line 287
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "version"

    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/PluginCall;->getInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 289
    const-string v0, "encrypted"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 290
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v5, "no-encryption"

    if-eqz v3, :cond_1

    .line 291
    const-string v3, "mode"

    invoke-virtual {p1, v3, v5}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 292
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->modeList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 294
    const-string v0, "CreateConnection: inMode must be in [\'encryption\',\'secret\', \'decryption\'] "

    .line 295
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    :cond_1
    move-object v6, v5

    .line 301
    const-string v3, "readonly"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 302
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->versionUpgrades:Ljava/util/Dictionary;

    invoke-virtual {v3, v4}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Ljava/util/Dictionary;

    .line 303
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_2

    .line 305
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual/range {v3 .. v9}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->createConnection(Ljava/lang/String;ZLjava/lang/String;ILjava/util/Dictionary;Ljava/lang/Boolean;)V

    .line 306
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 308
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CreateConnection: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 309
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 312
    :cond_2
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public createNCConnection(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 250
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "databasePath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 251
    const-string v0, "CreateNCConnection: Must provide a database path"

    .line 252
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v0, :cond_1

    .line 257
    :try_start_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 258
    const-string v1, "version"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Lcom/getcapacitor/PluginCall;->getInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 259
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->createNCConnection(Ljava/lang/String;I)V

    .line 260
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 262
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CreateNCConnection: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 263
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 266
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public createSyncTable(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1231
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, -0x1

    .line 1232
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1233
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1234
    const-string v1, "CreateSyncTable: Must provide a database name"

    .line 1235
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1238
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 1239
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v2}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v2

    .line 1240
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 1242
    :try_start_0
    invoke-virtual {v3, v1, v2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->createSyncTable(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 1243
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 1245
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CreateSyncTable: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1246
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1249
    :cond_1
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public deleteDatabase(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1203
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1204
    const-string v0, "deleteDatabase: Must provide a database name"

    .line 1205
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1208
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 1209
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 1210
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 1212
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->deleteDatabase(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1213
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1215
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "deleteDatabase: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1216
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1219
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public deleteExportedRows(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1470
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1471
    const-string v0, "DeleteExportedRows: Must provide a database name"

    .line 1472
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1475
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 1476
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 1477
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 1479
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->deleteExportedRows(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1480
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1482
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "DeleteExportedRows: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1483
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1486
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public deleteOldDatabases(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 859
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "folderPath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 860
    const-string v0, "default"

    goto :goto_0

    .line 862
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 864
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "dbNameList"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    move-object v1, v3

    goto :goto_1

    .line 867
    :cond_1
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v1

    :goto_1
    if-nez v1, :cond_2

    .line 870
    const-string v0, "deleteOldDatabases: dbNameList not given or empty"

    .line 871
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 874
    :cond_2
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_3

    .line 876
    :try_start_0
    invoke-virtual {v2, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->deleteOldDatabases(Ljava/lang/String;Lcom/getcapacitor/JSArray;)V

    .line 877
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v3, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 879
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "deleteOldDatabases: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 880
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 883
    :cond_3
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public echo(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 62
    const-string v0, "value"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 63
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_0

    .line 65
    :try_start_0
    new-instance v2, Lcom/getcapacitor/JSObject;

    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 66
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-virtual {v3, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->echo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 67
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void
.end method

.method public execute(Lcom/getcapacitor/PluginCall;)V
    .locals 6
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 931
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, -0x1

    .line 932
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 933
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 934
    const-string v1, "Execute: Must provide a database name"

    .line 935
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 938
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 939
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v2

    const-string v3, "statements"

    invoke-virtual {v2, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 940
    const-string v1, "Execute: Must provide raw SQL statements"

    .line 941
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 944
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    .line 945
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "transaction"

    invoke-virtual {p1, v4, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x0

    .line 946
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "readonly"

    invoke-virtual {p1, v5, v4}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v4

    .line 948
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v5, :cond_2

    .line 950
    :try_start_0
    invoke-virtual {v5, v1, v2, v3, v4}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->execute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 951
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 953
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Execute: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 954
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 957
    :cond_2
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public executeSet(Lcom/getcapacitor/PluginCall;)V
    .locals 9
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 970
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v0, -0x1

    .line 971
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v2, "changes"

    invoke-virtual {v1, v2, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 972
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v2, "database"

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 973
    const-string v0, "ExecuteSet: Must provide a database name"

    .line 974
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 977
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 978
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v2, "set"

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const-string v3, "ExecuteSet: Must provide a set of SQL statements"

    if-nez v0, :cond_1

    .line 980
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 983
    :cond_1
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v5

    if-nez v5, :cond_2

    .line 986
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 989
    :cond_2
    invoke-virtual {v5}, Lcom/getcapacitor/JSArray;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 990
    const-string v0, "ExecuteSet: Must provide a non-empty set of SQL statements"

    .line 991
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    :cond_3
    const/4 v0, 0x0

    move v2, v0

    .line 994
    :goto_0
    invoke-virtual {v5}, Lcom/getcapacitor/JSArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 995
    invoke-virtual {v5, v2}, Lcom/getcapacitor/JSArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v3

    move v6, v0

    .line 996
    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_5

    .line 997
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 998
    const-string v8, "statement"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, "values"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 1000
    const-string v0, "ExecuteSet: Must provide a set as Array of {statement,values}"

    .line 1001
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1006
    :cond_6
    const-string v2, "transaction"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v6

    .line 1007
    const-string v2, "readonly"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v7

    .line 1008
    const-string v0, "returnMode"

    const-string v2, "no"

    invoke-virtual {p1, v0, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1009
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_7

    .line 1011
    :try_start_0
    invoke-virtual/range {v3 .. v8}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->executeSet(Ljava/lang/String;Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v0

    .line 1012
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v0, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1014
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ExecuteSet: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1015
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1018
    :cond_7
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public exportToJson(Lcom/getcapacitor/PluginCall;)V
    .locals 6
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1433
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1434
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1435
    const-string v1, "ExportToJson: Must provide a database name"

    .line 1436
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retJSObject(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1439
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1440
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v2

    const-string v3, "jsonexportmode"

    invoke-virtual {v2, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1441
    const-string v1, "ExportToJson: Must provide an export mode"

    .line 1442
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retJSObject(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1445
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1447
    const-string v3, "full"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "partial"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1448
    const-string v1, "ExportToJson: Json export mode should be \'full\' or \'partial\'"

    .line 1449
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retJSObject(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1452
    :cond_2
    const-string v3, "readonly"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {p1, v3, v5}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v3

    .line 1453
    const-string v5, "encrypted"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p1, v5, v4}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v4

    .line 1455
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v5, :cond_3

    .line 1457
    :try_start_0
    invoke-virtual {v5, v1, v2, v3, v4}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->exportToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 1458
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retJSObject(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 1460
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ExportToJson: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1461
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retJSObject(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1464
    :cond_3
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retJSObject(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public getDatabaseList(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 777
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v0, :cond_0

    .line 779
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getDatabaseList()Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 780
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 782
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDatabaseList: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 783
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v2, Lcom/getcapacitor/JSArray;

    invoke-direct {v2}, Lcom/getcapacitor/JSArray;-><init>()V

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 786
    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void
.end method

.method public getFromHTTPRequest(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1521
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1522
    const-string v0, "GetFromHTTPRequest: Must provide a database url"

    .line 1523
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1526
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1527
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_2

    .line 1528
    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v0, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$$ExternalSyntheticLambda3;-><init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    .line 1540
    new-instance p1, Ljava/lang/Thread;

    invoke-direct {p1, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1541
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 1542
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1543
    :cond_1
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "Thread Exiting!"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    .line 1545
    :cond_2
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public getMigratableDbList(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 797
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "folderPath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 798
    const-string v0, "default"

    goto :goto_0

    .line 800
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 802
    :goto_0
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 804
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getMigratableDbList(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 805
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 807
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getMigratableDbList: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 808
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v2, Lcom/getcapacitor/JSArray;

    invoke-direct {v2}, Lcom/getcapacitor/JSArray;-><init>()V

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 811
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void
.end method

.method public getNCDatabasePath(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 215
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "path"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 216
    const-string v0, "getNCDatabasePath: Must provide a folder path"

    .line 217
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retPath(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 220
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 221
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v3, "database"

    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 222
    const-string v0, "getNCDatabasePath: Must provide a database name"

    .line 223
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retPath(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 226
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 227
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_2

    .line 229
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getNCDatabasePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 230
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retPath(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "getNCDatabasePath: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 233
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 236
    :cond_2
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public getSyncDate(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1296
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1297
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    const-wide/16 v3, 0x0

    .line 1300
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    if-nez v1, :cond_0

    const/4 v1, -0x1

    .line 1299
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1300
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "GetSyncDate : Must provide a database name"

    invoke-virtual {v0, p1, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retSyncDate(Lcom/getcapacitor/PluginCall;Ljava/lang/Long;Ljava/lang/String;)V

    return-void

    .line 1303
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 1304
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "readonly"

    invoke-virtual {p1, v2, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 1305
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_1

    .line 1307
    :try_start_0
    invoke-virtual {v2, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getSyncDate(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 1308
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retSyncDate(Lcom/getcapacitor/PluginCall;Ljava/lang/Long;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1310
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GetSyncDate: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1311
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retSyncDate(Lcom/getcapacitor/PluginCall;Ljava/lang/Long;Ljava/lang/String;)V

    return-void

    .line 1314
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retSyncDate(Lcom/getcapacitor/PluginCall;Ljava/lang/Long;Ljava/lang/String;)V

    return-void
.end method

.method public getTableList(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1118
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1120
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    const-string v2, "getTableList: Must provide a database name"

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 1123
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 1124
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "readonly"

    invoke-virtual {p1, v2, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 1125
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_1

    .line 1127
    :try_start_0
    invoke-virtual {v2, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getTableList(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 1128
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1130
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GetTableList: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1131
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v2, Lcom/getcapacitor/JSArray;

    invoke-direct {v2}, Lcom/getcapacitor/JSArray;-><init>()V

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 1134
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void
.end method

.method public getUrl(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 496
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 497
    const-string v0, "GetUrl: Must provide a database name"

    .line 498
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retUrl(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 501
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 502
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 503
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 505
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getUrl(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object v0

    .line 506
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retUrl(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 508
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "GetUrl: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 509
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retUrl(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 512
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retUrl(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getVersion(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 524
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 525
    const-string v0, "GetVersion: Must provide a database name"

    .line 526
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retVersion(Lcom/getcapacitor/PluginCall;Ljava/lang/Integer;Ljava/lang/String;)V

    return-void

    .line 529
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 530
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 531
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 533
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->getVersion(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Integer;

    move-result-object v0

    .line 534
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retVersion(Lcom/getcapacitor/PluginCall;Ljava/lang/Integer;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 536
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "GetVersion: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 537
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retVersion(Lcom/getcapacitor/PluginCall;Ljava/lang/Integer;Ljava/lang/String;)V

    return-void

    .line 540
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retVersion(Lcom/getcapacitor/PluginCall;Ljava/lang/Integer;Ljava/lang/String;)V

    return-void
.end method

.method public importFromJson(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1404
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, -0x1

    .line 1405
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1406
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "jsonstring"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1407
    const-string v1, "ImportFromJson: Must provide a Stringify Json Object"

    .line 1408
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1411
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1412
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_1

    .line 1414
    :try_start_0
    invoke-virtual {v2, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->importFromJson(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 1415
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 1417
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ImportFromJson: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1418
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1421
    :cond_1
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public isDBExists(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1146
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    .line 1152
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    if-nez v0, :cond_0

    .line 1148
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "isDBExists: Must provide a database name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1151
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1152
    const-string v1, "readonly"

    invoke-virtual {p1, v1, v2}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 1154
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 1156
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isDBExists(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 1157
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v4}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1159
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "isDBExists: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1160
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1163
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v4, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isDBOpen(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1175
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    .line 1181
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    if-nez v0, :cond_0

    .line 1177
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "isDBOpen: Must provide a database name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1180
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1181
    const-string v1, "readonly"

    invoke-virtual {p1, v1, v2}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 1182
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 1184
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isDBOpen(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 1185
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v4}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1187
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "isDBOpen: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1188
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1191
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v4, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isDatabase(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 645
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 646
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "Must provide a database name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 649
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 650
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 652
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isDatabase(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 653
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 655
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "isDatabase: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 656
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 659
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isDatabaseEncrypted(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 671
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 672
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "Must provide a database name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 675
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 676
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 678
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isDatabaseEncrypted(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 679
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 681
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "isDatabaseEncrypted: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 682
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 685
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isInConfigBiometricAuth(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 709
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->config:Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getBiometricAuth()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 710
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isInConfigEncryption(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 697
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->config:Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->getIsEncryption()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 698
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isJsonValid(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1377
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "jsonstring"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    .line 1379
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "IsJsonValid: Must provide a Stringify Json Object"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1382
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1383
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 1385
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isJsonValid(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 1386
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1388
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "IsJsonValid: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1389
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1392
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isNCDatabase(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 721
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "databasePath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 722
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "Must provide a database path"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 725
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 726
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 728
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isNCDatabase(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 729
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 731
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "isNCDatabase: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 732
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 735
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isSecretStored(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 86
    :try_start_0
    invoke-virtual {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isSecretStored()Ljava/lang/Boolean;

    move-result-object v0

    .line 87
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 89
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "IsSecretStored: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 90
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isTableExists(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 747
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 748
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "Must provide a database name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 751
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 752
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v3, "table"

    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 753
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "Must provide a table name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 756
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    .line 757
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "readonly"

    invoke-virtual {p1, v4, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v3

    .line 758
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v4, :cond_2

    .line 760
    :try_start_0
    invoke-virtual {v4, v0, v1, v3}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isTableExists(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 761
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 763
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "isTableExists: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 764
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 767
    :cond_2
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public isTransactionActive(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 470
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const-string v1, "Must provide a database name"

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 474
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 475
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 477
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->isTransactionActive(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 478
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 480
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "IsTransactionActive: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 481
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 484
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public load()V
    .locals 3

    .line 42
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 44
    :try_start_0
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->getSqliteConfig()Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->config:Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

    .line 45
    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->AddObserversToNotificationCenter()V

    .line 46
    new-instance v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->config:Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;

    invoke-direct {v1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;-><init>(Landroid/content/Context;Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;)V

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    .line 48
    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CapacitorSQLitePlugin: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    .line 50
    sget-object v1, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public moveDatabasesAndAddSuffix(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 895
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "folderPath"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 896
    const-string v0, "default"

    goto :goto_0

    .line 898
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 900
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "dbNameList"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    move-object v1, v3

    goto :goto_1

    .line 903
    :cond_1
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v1

    :goto_1
    if-nez v1, :cond_2

    .line 906
    const-string v0, "moveDatabasesAndAddSuffix: dbNameList not given or empty"

    .line 907
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 910
    :cond_2
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_3

    .line 912
    :try_start_0
    invoke-virtual {v2, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->moveDatabasesAndAddSuffix(Ljava/lang/String;Lcom/getcapacitor/JSArray;)V

    .line 913
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v3, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 915
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "moveDatabasesAndAddSuffix: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 916
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v3, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 919
    :cond_3
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public open(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 324
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 325
    const-string v0, "Open: Must provide a database name"

    .line 326
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 329
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 330
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "readonly"

    invoke-virtual {p1, v3, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v1

    .line 331
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_1

    .line 333
    :try_start_0
    invoke-virtual {v3, v0, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->open(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 334
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 336
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Open: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 337
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 340
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public query(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1079
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1081
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    const-string v2, "Query: Must provide a database name"

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 1084
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1085
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "statement"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1087
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    const-string v2, "Query: Must provide a SQL statement"

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 1090
    :cond_1
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1091
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v2

    const-string v3, "values"

    invoke-virtual {v2, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1093
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    const-string v2, "Query: Must provide an Array of Strings"

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 1096
    :cond_2
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v2

    if-nez v2, :cond_3

    .line 1099
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    const-string v2, "Query: Must provide an Array of values"

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    :cond_3
    const/4 v3, 0x0

    .line 1102
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "readonly"

    invoke-virtual {p1, v4, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v3

    .line 1103
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v4, :cond_4

    .line 1105
    :try_start_0
    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->query(Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;)Lcom/getcapacitor/JSArray;

    move-result-object v0

    .line 1106
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1108
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Query: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1109
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v2, Lcom/getcapacitor/JSArray;

    invoke-direct {v2}, Lcom/getcapacitor/JSArray;-><init>()V

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void

    .line 1112
    :cond_4
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retValues(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSArray;Ljava/lang/String;)V

    return-void
.end method

.method public rollbackTransaction(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 440
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v1, -0x1

    .line 441
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "changes"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 442
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 443
    const-string v1, "RollbackTransaction: Must provide a database name"

    .line 444
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 447
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 449
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v2, :cond_1

    .line 451
    :try_start_0
    invoke-virtual {v2, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->rollbackTransaction(Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v1

    .line 452
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 454
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "RollbackTransaction: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 455
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 458
    :cond_1
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v1, p1, v0, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public run(Lcom/getcapacitor/PluginCall;)V
    .locals 10
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1030
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    const/4 v0, -0x1

    .line 1031
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v2, "changes"

    invoke-virtual {v1, v2, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1032
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v2, "database"

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1033
    const-string v0, "Run: Must provide a database name"

    .line 1034
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1037
    :cond_0
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1038
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v2, "statement"

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1039
    const-string v0, "Run: Must provide a SQL statement"

    .line 1040
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1043
    :cond_1
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1044
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v2, "values"

    invoke-virtual {v0, v2}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const-string v3, "Run: Must provide an Array of values"

    if-nez v0, :cond_2

    .line 1046
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1049
    :cond_2
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v6

    if-nez v6, :cond_3

    .line 1052
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v1, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    :cond_3
    const/4 v0, 0x1

    .line 1055
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v2, "transaction"

    invoke-virtual {p1, v2, v0}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v7

    const/4 v0, 0x0

    .line 1056
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v2, "readonly"

    invoke-virtual {p1, v2, v0}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v8

    .line 1057
    const-string v0, "returnMode"

    const-string v2, "no"

    invoke-virtual {p1, v0, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1058
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v3, :cond_4

    .line 1060
    :try_start_0
    invoke-virtual/range {v3 .. v9}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->run(Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSArray;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    move-result-object v0

    .line 1061
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v0, v3}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1063
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Run: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1064
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v2, p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void

    .line 1067
    :cond_4
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retChanges(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;Ljava/lang/String;)V

    return-void
.end method

.method public setEncryptionSecret(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 106
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "passphrase"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 107
    const-string v0, "SetEncryptionSecret: Must provide a passphrase"

    .line 108
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 111
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 112
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v1, :cond_1

    .line 114
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->setEncryptionSecret(Ljava/lang/String;)V

    .line 115
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "SetEncryptionSecret: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 118
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 121
    :cond_1
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public setSyncDate(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "call"
        }
    .end annotation

    .line 1261
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "database"

    invoke-virtual {v0, v1}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1262
    const-string v0, "SetSyncDate: Must provide a database name"

    .line 1263
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1266
    :cond_0
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1268
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v1

    const-string v3, "syncdate"

    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1269
    const-string v0, "SetSyncDate : Must provide a sync date"

    .line 1270
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1273
    :cond_1
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    .line 1274
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "readonly"

    invoke-virtual {p1, v4, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v3

    .line 1275
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->implementation:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    if-eqz v4, :cond_2

    .line 1277
    :try_start_0
    invoke-virtual {v4, v0, v1, v3}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->setSyncDate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1278
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v0, p1, v2, v2}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1280
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "SetSyncDate: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1281
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    invoke-virtual {v1, p1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    .line 1284
    :cond_2
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->rHandler:Lcom/getcapacitor/community/database/sqlite/RetHandler;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->loadMessage:Ljava/lang/String;

    invoke-virtual {v0, p1, v2, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method
