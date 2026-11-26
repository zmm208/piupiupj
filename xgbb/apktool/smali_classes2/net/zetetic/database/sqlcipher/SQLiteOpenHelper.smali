.class public abstract Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;
.super Ljava/lang/Object;
.source "SQLiteOpenHelper.java"

# interfaces
.implements Landroidx/sqlite/db/SupportSQLiteOpenHelper;


# static fields
.field private static final DEBUG_STRICT_READONLY:Z = false

.field private static final TAG:Ljava/lang/String; = "SQLiteOpenHelper"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

.field private final mDatabaseHook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

.field private mEnableWriteAheadLogging:Z

.field private final mErrorHandler:Lnet/zetetic/database/DatabaseErrorHandler;

.field private final mFactory:Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;

.field private mIsInitializing:Z

.field private final mMinimumSupportedVersion:I

.field private final mName:Ljava/lang/String;

.field private final mNewVersion:I

.field private mPassword:[B


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;IILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V
    .locals 10

    .line 177
    invoke-static {p3}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v9, p9

    invoke-direct/range {v0 .. v9}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;[BLnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;IILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;I)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 94
    invoke-direct/range {v0 .. v5}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/DatabaseErrorHandler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;IILnet/zetetic/database/DatabaseErrorHandler;)V
    .locals 11

    const/4 v0, 0x0

    .line 144
    new-array v4, v0, [B

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move v6, p4

    move/from16 v7, p5

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v10}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;[BLnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;IILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/DatabaseErrorHandler;)V
    .locals 7

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, p5

    .line 116
    invoke-direct/range {v0 .. v6}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;IILnet/zetetic/database/DatabaseErrorHandler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;[BLnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;IILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V
    .locals 1

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p5, v0, :cond_0

    .line 212
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mContext:Landroid/content/Context;

    .line 213
    iput-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    .line 214
    iput-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mPassword:[B

    .line 215
    iput-object p4, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mFactory:Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;

    .line 216
    iput p5, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mNewVersion:I

    .line 217
    iput-object p7, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mErrorHandler:Lnet/zetetic/database/DatabaseErrorHandler;

    .line 218
    iput-object p8, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabaseHook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

    .line 219
    iput-boolean p9, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mEnableWriteAheadLogging:Z

    const/4 p1, 0x0

    .line 220
    invoke-static {p1, p6}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mMinimumSupportedVersion:I

    return-void

    .line 210
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Version must be >= 1, was "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static getBytes(Ljava/lang/String;)[B
    .locals 1

    if-eqz p0, :cond_1

    .line 542
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 543
    :cond_0
    invoke-static {p0}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object p0

    .line 544
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 545
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    new-array v0, v0, [B

    .line 546
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object v0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 542
    new-array p0, p0, [B

    return-object p0
.end method

.method private getDatabaseLocked(Z)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;
    .locals 14

    const-string v1, "Unable to delete obsolete database "

    const-string v2, "Opened "

    const-string v3, "Can\'t upgrade read-only database from version "

    const-string v4, "Couldn\'t open "

    .line 307
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    const/4 v5, 0x0

    if-eqz v0, :cond_2

    .line 308
    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 310
    iput-object v5, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 311
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_2

    .line 313
    :cond_1
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    return-object p1

    .line 317
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    if-nez v0, :cond_13

    .line 321
    iget-object v6, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    const/4 v0, 0x1

    const/4 v7, 0x0

    .line 323
    :try_start_0
    iput-boolean v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    if-eqz v6, :cond_3

    if-eqz p1, :cond_8

    .line 326
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 327
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->reopenReadWrite()V

    goto/16 :goto_2

    .line 329
    :cond_3
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 330
    invoke-static {v5}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->create(Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    goto/16 :goto_2

    .line 334
    :cond_4
    :try_start_1
    const-string v5, "file:"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 335
    iget-object v5, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    :cond_5
    move-object v8, v0

    .line 343
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 344
    new-instance v5, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 345
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_6

    .line 346
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 356
    :cond_6
    iget-boolean v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mEnableWriteAheadLogging:Z

    if-eqz v0, :cond_7

    const/high16 v0, 0x30000000

    goto :goto_1

    :cond_7
    const/high16 v0, 0x10000000

    :goto_1
    move v11, v0

    .line 359
    iget-object v9, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mPassword:[B

    iget-object v10, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mFactory:Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;

    iget-object v12, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mErrorHandler:Lnet/zetetic/database/DatabaseErrorHandler;

    iget-object v13, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabaseHook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

    invoke-static/range {v8 .. v13}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v6
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catch_0
    move-exception v0

    if-nez p1, :cond_11

    .line 366
    :try_start_2
    sget-object v5, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " for writing (will try read-only):"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4, v0}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 368
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    .line 369
    iget-object v9, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mPassword:[B

    iget-object v10, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mFactory:Lnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;

    iget-object v12, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mErrorHandler:Lnet/zetetic/database/DatabaseErrorHandler;

    iget-object v13, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabaseHook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

    const/4 v11, 0x1

    invoke-static/range {v8 .. v13}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLnet/zetetic/database/sqlcipher/SQLiteDatabase$CursorFactory;ILnet/zetetic/database/DatabaseErrorHandler;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v6

    .line 374
    :cond_8
    :goto_2
    invoke-virtual {p0, v6}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->onConfigure(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V

    .line 376
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    move-result v0

    .line 377
    iget v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mNewVersion:I

    if-eq v0, v4, :cond_f

    .line 378
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isReadOnly()Z

    move-result v4

    if-nez v4, :cond_e

    if-lez v0, :cond_b

    .line 383
    iget v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mMinimumSupportedVersion:I

    if-ge v0, v3, :cond_b

    .line 384
    new-instance v2, Ljava/io/File;

    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    invoke-virtual {p0, v6}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->onBeforeDelete(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V

    .line 386
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 387
    invoke-static {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->deleteDatabase(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 388
    iput-boolean v7, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    .line 389
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->getDatabaseLocked(Z)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 423
    iput-boolean v7, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    if-eqz v6, :cond_9

    .line 424
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    if-eq v6, v0, :cond_9

    .line 425
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    :cond_9
    return-object p1

    .line 391
    :cond_a
    :try_start_3
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 395
    :cond_b
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v0, :cond_c

    .line 398
    :try_start_4
    invoke-virtual {p0, v6}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->onCreate(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V

    goto :goto_3

    .line 400
    :cond_c
    iget p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mNewVersion:I

    if-le v0, p1, :cond_d

    .line 401
    invoke-virtual {p0, v6, v0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->onDowngrade(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;II)V

    goto :goto_3

    .line 403
    :cond_d
    invoke-virtual {p0, v6, v0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->onUpgrade(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;II)V

    .line 406
    :goto_3
    iget p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mNewVersion:I

    invoke-virtual {v6, p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->setVersion(I)V

    .line 407
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 409
    :try_start_5
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->endTransaction()V

    goto :goto_4

    :catchall_0
    move-exception v0

    move-object p1, v0

    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->endTransaction()V

    .line 410
    throw p1

    .line 379
    :cond_e
    new-instance p1, Landroid/database/sqlite/SQLiteException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 380
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getVersion()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mNewVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 414
    :cond_f
    :goto_4
    invoke-virtual {p0, v6}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->onOpen(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V

    .line 416
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isReadOnly()Z

    move-result p1

    if-eqz p1, :cond_10

    .line 417
    sget-object p1, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " in read-only mode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lnet/zetetic/database/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    :cond_10
    iput-object v6, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 423
    iput-boolean v7, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    return-object v6

    .line 364
    :cond_11
    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v0

    move-object p1, v0

    .line 423
    iput-boolean v7, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    if-eqz v6, :cond_12

    .line 424
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    if-eq v6, v0, :cond_12

    .line 425
    invoke-virtual {v6}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    .line 427
    :cond_12
    throw p1

    .line 318
    :cond_13
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "getDatabase called recursively"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    monitor-enter p0

    .line 434
    :try_start_0
    iget-boolean v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mIsInitializing:Z

    if-nez v0, :cond_1

    .line 436
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->close()V

    const/4 v0, 0x0

    .line 438
    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 440
    :cond_0
    monitor-exit p0

    return-void

    .line 434
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed during initialization"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 228
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getReadableDatabase()Landroidx/sqlite/db/SupportSQLiteDatabase;
    .locals 1

    .line 56
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->getReadableDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public getReadableDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;
    .locals 1

    .line 301
    monitor-enter p0

    const/4 v0, 0x0

    .line 302
    :try_start_0
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->getDatabaseLocked(Z)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 303
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public bridge synthetic getWritableDatabase()Landroidx/sqlite/db/SupportSQLiteDatabase;
    .locals 1

    .line 56
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->getWritableDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public getWritableDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;
    .locals 1

    .line 277
    monitor-enter p0

    const/4 v0, 0x1

    .line 278
    :try_start_0
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->getDatabaseLocked(Z)Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 279
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onBeforeDelete(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V
    .locals 0

    return-void
.end method

.method public onConfigure(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V
    .locals 0

    return-void
.end method

.method public abstract onCreate(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V
.end method

.method public onDowngrade(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;II)V
    .locals 2

    .line 522
    new-instance p1, Landroid/database/sqlite/SQLiteException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Can\'t downgrade database from version "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " to "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onOpen(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;)V
    .locals 0

    return-void
.end method

.method public abstract onUpgrade(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;II)V
.end method

.method public setWriteAheadLoggingEnabled(Z)V
    .locals 1

    .line 243
    monitor-enter p0

    .line 244
    :try_start_0
    iget-boolean v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mEnableWriteAheadLogging:Z

    if-eq v0, p1, :cond_2

    .line 245
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    .line 247
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->enableWriteAheadLogging()Z

    goto :goto_0

    .line 249
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mDatabase:Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->disableWriteAheadLogging()V

    .line 252
    :cond_1
    :goto_0
    iput-boolean p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteOpenHelper;->mEnableWriteAheadLogging:Z

    .line 254
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
