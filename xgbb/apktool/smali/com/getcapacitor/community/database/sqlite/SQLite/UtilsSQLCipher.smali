.class public Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;
.super Ljava/lang/Object;
.source "UtilsSQLCipher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.getcapacitor.community.database.sqlite.SQLite.UtilsSQLCipher"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public changePassword(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "ctxt",
            "file",
            "password",
            "nwpassword"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 207
    const-string p1, "sqlcipher"

    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 209
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 210
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p1, p3, v1, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object p1

    .line 212
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isOpen()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 215
    invoke-virtual {p1, p4}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->changePassword(Ljava/lang/String;)V

    .line 216
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    return-void

    .line 213
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "database "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " open failed"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 218
    :cond_1
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not found"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public decrypt(Landroid/content/Context;Ljava/io/File;[B)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "ctxt",
            "originalFile",
            "passphrase"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    const-string v0, "sqlcipher"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 145
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 147
    const-string v0, "tmp"

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "sqlcipherutils"

    invoke-static {v1, v0, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 151
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 150
    invoke-static {v0, v1, v2, v3, v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    .line 160
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p3}, Ljava/lang/String;-><init>([B)V

    .line 159
    invoke-static {v1, v4, v2, v3, v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object p3

    .line 167
    invoke-virtual {p3}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    move-result v1

    .line 168
    invoke-virtual {v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->setVersion(I)V

    .line 170
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 175
    const-string v0, "ATTACH DATABASE ? AS plaintext KEY \'\';"

    invoke-virtual {p3, v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Lnet/zetetic/database/sqlcipher/SQLiteStatement;

    move-result-object v0

    const/4 v1, 0x1

    .line 177
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lnet/zetetic/database/sqlcipher/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 178
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteStatement;->execute()V

    .line 183
    const-string v1, "SELECT sqlcipher_export(\'plaintext\');"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p3, v1, v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 188
    const-string v1, "DETACH DATABASE plaintext;"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p3, v1, v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 190
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteStatement;->close()V

    .line 191
    invoke-virtual {p3}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 193
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 197
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 199
    :cond_0
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not renamed"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 195
    :cond_1
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not deleted"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 202
    :cond_2
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not found"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public encrypt(Landroid/content/Context;Ljava/io/File;[B)V
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "ctxt",
            "originalFile",
            "passphrase"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    const-string v0, "sqlcipher"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 103
    const-string v0, "tmp"

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "sqlcipherutils"

    invoke-static {v1, v0, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 104
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3, v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    move-result v1

    .line 107
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 109
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v5, p3

    invoke-static/range {v4 .. v9}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object p3

    .line 113
    const-string v0, "ATTACH DATABASE ? AS plaintext KEY \'\';"

    invoke-virtual {p3, v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Lnet/zetetic/database/sqlcipher/SQLiteStatement;

    move-result-object v0

    const/4 v2, 0x1

    .line 115
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lnet/zetetic/database/sqlcipher/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 116
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteStatement;->execute()V

    .line 120
    const-string v2, "SELECT sqlcipher_export(\'main\', \'plaintext\');"

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {p3, v2, v4}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 123
    const-string v2, "DETACH DATABASE plaintext;"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p3, v2, v3}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 125
    invoke-virtual {p3, v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->setVersion(I)V

    .line 126
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteStatement;->close()V

    .line 127
    invoke-virtual {p3}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 129
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 133
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 135
    :cond_0
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not renamed"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 131
    :cond_1
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not deleted"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 138
    :cond_2
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " not found"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getDatabaseState(Landroid/content/Context;Ljava/io/File;Landroid/content/SharedPreferences;Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "ctxt",
            "dbPath",
            "sharedPreferences",
            "globVar"
        }
    .end annotation

    .line 38
    const-string p1, ""

    const-string v0, "sqlcipher"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 39
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 43
    :try_start_0
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1, v1, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :try_start_1
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    .line 47
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNENCRYPTED:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v2, :cond_0

    .line 79
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_0
    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-object v2, v1

    .line 50
    :catch_1
    :try_start_2
    const-string v3, "secret"

    invoke-interface {p3, v3, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    if-lez p3, :cond_2

    .line 52
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3, p1, v1, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v2

    .line 53
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    .line 54
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v2, :cond_1

    .line 79
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_1
    return-object p1

    .line 56
    :cond_2
    :try_start_3
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v2, :cond_3

    .line 79
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_3
    return-object p1

    :catchall_1
    move-exception p1

    move-object v1, v2

    goto :goto_0

    .line 60
    :catch_2
    :try_start_4
    iget-object p1, p4, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;->secret:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_5

    .line 62
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p4, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;->secret:Ljava/lang/String;

    .line 61
    invoke-static {p1, p2, v1, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 68
    :try_start_5
    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    .line 69
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v1, :cond_4

    .line 79
    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_4
    return-object p1

    .line 71
    :cond_5
    :try_start_6
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v2, :cond_6

    .line 79
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_6
    return-object p1

    :catch_3
    move-object v1, v2

    .line 74
    :catch_4
    :try_start_7
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-eqz v1, :cond_7

    .line 79
    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_7
    return-object p1

    :goto_0
    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 81
    :cond_8
    throw p1

    .line 84
    :cond_9
    sget-object p1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->DOES_NOT_EXIST:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    return-object p1
.end method
