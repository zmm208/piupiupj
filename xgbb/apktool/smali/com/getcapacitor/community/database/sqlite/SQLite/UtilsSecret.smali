.class public Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;
.super Ljava/lang/Object;
.source "UtilsSecret.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sharedPreferences:Landroid/content/SharedPreferences;


# instance fields
.field private context:Landroid/content/Context;

.field private globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

.field private uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

.field private uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    const-class v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/SharedPreferences;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "sharedPreferences"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    .line 17
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    .line 18
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    invoke-direct {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    .line 24
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    .line 25
    sput-object p2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->sharedPreferences:Landroid/content/SharedPreferences;

    return-void
.end method

.method public static getPassphrase()Ljava/lang/String;
    .locals 3

    .line 162
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "secret"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isPassphrase()Ljava/lang/Boolean;
    .locals 1

    .line 171
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 172
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    .line 174
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public changeEncryptionSecret(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "passphrase",
            "oldPassphrase"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 76
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 81
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 82
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4

    .line 85
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 90
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->getListOfFiles(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 91
    array-length v1, v0

    if-lez v1, :cond_2

    .line 92
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 93
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 95
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v6, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    sget-object v7, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    invoke-virtual {v5, v6, v4, v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->getDatabaseState(Landroid/content/Context;Ljava/io/File;Landroid/content/SharedPreferences;Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    move-result-object v5

    .line 97
    sget-object v6, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-ne v5, v6, :cond_0

    .line 98
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    invoke-virtual {v3, v5, v4, p2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->changePassword(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 99
    :cond_0
    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->DOES_NOT_EXIST:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-eq v5, v4, :cond_1

    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-eq v5, v4, :cond_1

    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-eq v5, v4, :cond_1

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 100
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "State for: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not correct"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 101
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 106
    :cond_2
    invoke-virtual {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->setPassphrase(Ljava/lang/String;)V

    return-void

    .line 86
    :cond_3
    const-string p1, "Oldpassphrase is wrong secret"

    .line 87
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 83
    :cond_4
    const-string p1, "Encryption secret has not been set"

    .line 84
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    .line 77
    :cond_5
    const-string p1, "Passphrase and/or oldpassphrase must not be empty"

    .line 78
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 109
    new-instance p2, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public checkEncryptionSecret(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3
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

    const/4 v0, 0x0

    .line 136
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 138
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 143
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v1

    .line 144
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 148
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 149
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0

    .line 145
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "no passphrase stored  in sharedPreferences"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 139
    :cond_2
    const-string p1, "passphrase must not be empty"

    .line 140
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 153
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clearEncryptionSecret()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 120
    :try_start_0
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 123
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->clearPassphrase()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 126
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public clearPassphrase()V
    .locals 2

    .line 167
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "secret"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setEncryptionSecret(Ljava/lang/String;)V
    .locals 9
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

    .line 35
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 40
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->getPassphrase()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 42
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "a passphrase has already been set "

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 45
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->setPassphrase(Ljava/lang/String;)V

    .line 48
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uFile:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsFile;->getListOfFiles(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 49
    array-length v1, v0

    if-lez v1, :cond_4

    .line 50
    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_4

    aget-object v3, v0, v2

    .line 51
    iget-object v4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 53
    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v6, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    sget-object v7, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v8, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    invoke-virtual {v5, v6, v4, v7, v8}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->getDatabaseState(Landroid/content/Context;Ljava/io/File;Landroid/content/SharedPreferences;Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    move-result-object v5

    .line 55
    sget-object v6, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-ne v5, v6, :cond_2

    .line 56
    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->uCipher:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;

    iget-object v5, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->context:Landroid/content/Context;

    iget-object v6, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->globVar:Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;

    iget-object v6, v6, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;->secret:Ljava/lang/String;

    invoke-virtual {v3, v5, v4, v6, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;->changePassword(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 57
    :cond_2
    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->DOES_NOT_EXIST:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-eq v5, v4, :cond_3

    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    if-eq v5, v4, :cond_3

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 58
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "State for: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " not correct"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 59
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    return-void

    .line 36
    :cond_5
    const-string p1, "passphrase must not be empty"

    .line 37
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 64
    new-instance v0, Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPassphrase(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "passphrase"
        }
    .end annotation

    .line 158
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "secret"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
