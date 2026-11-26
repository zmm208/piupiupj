.class public final Lnet/zetetic/database/sqlcipher/SQLiteQuery;
.super Lnet/zetetic/database/sqlcipher/SQLiteProgram;
.source "SQLiteQuery.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SQLiteQuery"


# instance fields
.field private final mCancellationSignal:Landroid/os/CancellationSignal;


# direct methods
.method constructor <init>(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;Ljava/lang/String;Landroid/os/CancellationSignal;)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, p2, v0, p3}, Lnet/zetetic/database/sqlcipher/SQLiteProgram;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V

    .line 46
    iput-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->mCancellationSignal:Landroid/os/CancellationSignal;

    return-void
.end method


# virtual methods
.method fillWindow(Lnet/zetetic/database/CursorWindow;IIZ)I
    .locals 11

    const-string v1, "exception: "

    .line 65
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->acquireReference()V

    .line 67
    :try_start_0
    invoke-virtual {p1}, Lnet/zetetic/database/CursorWindow;->acquireReference()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 69
    :try_start_1
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getSession()Lnet/zetetic/database/sqlcipher/SQLiteSession;

    move-result-object v2

    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getSql()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getBindArgs()[Ljava/lang/Object;

    move-result-object v4

    .line 70
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getConnectionFlags()I

    move-result v9

    iget-object v10, p0, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->mCancellationSignal:Landroid/os/CancellationSignal;
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v5, p1

    move v6, p2

    move v7, p3

    move v8, p4

    .line 69
    :try_start_2
    invoke-virtual/range {v2 .. v10}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeForCursorWindow(Ljava/lang/String;[Ljava/lang/Object;Lnet/zetetic/database/CursorWindow;IIZILandroid/os/CancellationSignal;)I

    move-result p1
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 80
    :try_start_3
    invoke-virtual {v5}, Lnet/zetetic/database/CursorWindow;->releaseReference()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 83
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->releaseReference()V

    return p1

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v5, p1

    :goto_0
    move-object p1, v0

    goto :goto_3

    :catch_2
    move-exception v0

    move-object v5, p1

    :goto_1
    move-object p1, v0

    .line 77
    :try_start_4
    const-string p2, "SQLiteQuery"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, "; query: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getSql()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    throw p1

    :catch_3
    move-exception v0

    move-object v5, p1

    :goto_2
    move-object p1, v0

    .line 74
    invoke-virtual {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->onCorruption(Landroid/database/sqlite/SQLiteException;)V

    .line 75
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_0

    .line 80
    :goto_3
    :try_start_5
    invoke-virtual {v5}, Lnet/zetetic/database/CursorWindow;->releaseReference()V

    .line 81
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception v0

    move-object p1, v0

    .line 83
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->releaseReference()V

    .line 84
    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SQLiteQuery: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
