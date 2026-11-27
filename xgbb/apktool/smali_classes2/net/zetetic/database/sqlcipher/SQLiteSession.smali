.class public final Lnet/zetetic/database/sqlcipher/SQLiteSession;
.super Ljava/lang/Object;
.source "SQLiteSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final TRANSACTION_MODE_DEFERRED:I = 0x0

.field public static final TRANSACTION_MODE_EXCLUSIVE:I = 0x2

.field public static final TRANSACTION_MODE_IMMEDIATE:I = 0x1


# instance fields
.field private mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

.field private mConnectionFlags:I

.field private final mConnectionPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;

.field private mConnectionUseCount:I

.field private mTransactionPool:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

.field private mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;)V
    .locals 1

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 237
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;

    return-void

    .line 234
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "connectionPool must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V
    .locals 1

    .line 928
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-nez v0, :cond_0

    .line 930
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;

    invoke-virtual {v0, p1, p2, p3}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object p1

    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 932
    iput p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionFlags:I

    .line 934
    :cond_0
    iget p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionUseCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionUseCount:I

    return-void
.end method

.method private beginTransactionUnchecked(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;ILandroid/os/CancellationSignal;)V
    .locals 2

    if-eqz p4, :cond_0

    .line 311
    invoke-virtual {p4}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 314
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 315
    invoke-direct {p0, v1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 320
    :cond_1
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-nez p3, :cond_4

    const/4 p3, 0x1

    if-eq p1, p3, :cond_3

    const/4 p3, 0x2

    if-eq p1, p3, :cond_2

    .line 332
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string v0, "BEGIN;"

    invoke-virtual {p3, v0, v1, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V

    goto :goto_0

    .line 328
    :cond_2
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string v0, "BEGIN EXCLUSIVE;"

    invoke-virtual {p3, v0, v1, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V

    goto :goto_0

    .line 324
    :cond_3
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string v0, "BEGIN IMMEDIATE;"

    invoke-virtual {p3, v0, v1, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_4
    :goto_0
    if-eqz p2, :cond_6

    .line 340
    :try_start_1
    invoke-interface {p2}, Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;->onBegin()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 342
    :try_start_2
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-nez p2, :cond_5

    .line 343
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string p3, "ROLLBACK;"

    invoke-virtual {p2, p3, v1, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V

    .line 345
    :cond_5
    throw p1

    .line 350
    :cond_6
    :goto_1
    invoke-direct {p0, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->obtainTransaction(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;)Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    move-result-object p1

    .line 351
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iput-object p2, p1, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    .line 352
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez p1, :cond_7

    .line 355
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    :cond_7
    return-void

    :catchall_0
    move-exception p1

    .line 354
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-nez p2, :cond_8

    .line 355
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 357
    :cond_8
    throw p1
.end method

.method private endTransactionUnchecked(Landroid/os/CancellationSignal;Z)V
    .locals 5

    if-eqz p1, :cond_0

    .line 411
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 414
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    .line 415
    iget-boolean v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMarkedSuccessful:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    if-eqz p2, :cond_2

    :cond_1
    iget-boolean p2, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mChildFailed:Z

    if-nez p2, :cond_2

    move p2, v2

    goto :goto_0

    :cond_2
    move p2, v3

    .line 418
    :goto_0
    iget-object v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mListener:Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;

    const/4 v4, 0x0

    if-eqz v1, :cond_4

    if-eqz p2, :cond_3

    .line 422
    :try_start_0
    invoke-interface {v1}, Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;->onCommit()V

    goto :goto_1

    .line 424
    :cond_3
    invoke-interface {v1}, Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;->onRollback()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p2

    goto :goto_2

    :cond_4
    :goto_1
    move v3, p2

    move-object p2, v4

    .line 432
    :goto_2
    iget-object v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iput-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    .line 433
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->recycleTransaction(Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;)V

    .line 435
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz v0, :cond_5

    if-nez v3, :cond_7

    .line 437
    iput-boolean v2, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mChildFailed:Z

    goto :goto_4

    :cond_5
    if-eqz v3, :cond_6

    .line 442
    :try_start_1
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string v1, "COMMIT;"

    invoke-virtual {v0, v1, v4, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V

    goto :goto_3

    .line 444
    :cond_6
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string v1, "ROLLBACK;"

    invoke-virtual {v0, v1, v4, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 447
    :goto_3
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    :cond_7
    :goto_4
    if-nez p2, :cond_8

    return-void

    .line 452
    :cond_8
    throw p2

    :catchall_0
    move-exception p1

    .line 447
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 448
    throw p1
.end method

.method private executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z
    .locals 1

    if-eqz p4, :cond_0

    .line 904
    invoke-virtual {p4}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 907
    :cond_0
    invoke-static {p1}, Landroid/database/DatabaseUtils;->getSqlStatementType(Ljava/lang/String;)I

    move-result p1

    const/4 p2, 0x4

    const/4 v0, 0x1

    if-eq p1, p2, :cond_3

    const/4 p2, 0x5

    if-eq p1, p2, :cond_2

    const/4 p2, 0x6

    if-eq p1, p2, :cond_1

    const/4 p1, 0x0

    return p1

    .line 920
    :cond_1
    invoke-virtual {p0, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->endTransaction(Landroid/os/CancellationSignal;)V

    return v0

    .line 915
    :cond_2
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->setTransactionSuccessful()V

    .line 916
    invoke-virtual {p0, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->endTransaction(Landroid/os/CancellationSignal;)V

    return v0

    :cond_3
    const/4 p1, 0x2

    const/4 p2, 0x0

    .line 910
    invoke-virtual {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->beginTransaction(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;ILandroid/os/CancellationSignal;)V

    return v0
.end method

.method private obtainTransaction(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;)Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;
    .locals 3

    .line 972
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionPool:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 974
    iget-object v2, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iput-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionPool:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    .line 975
    iput-object v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    const/4 v1, 0x0

    .line 976
    iput-boolean v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMarkedSuccessful:Z

    .line 977
    iput-boolean v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mChildFailed:Z

    goto :goto_0

    .line 979
    :cond_0
    new-instance v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    invoke-direct {v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteSession-IA;)V

    .line 981
    :goto_0
    iput p1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMode:I

    .line 982
    iput-object p2, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mListener:Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;

    return-object v0
.end method

.method private recycleTransaction(Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;)V
    .locals 1

    .line 987
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionPool:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    const/4 v0, 0x0

    .line 988
    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mListener:Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;

    .line 989
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionPool:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    return-void
.end method

.method private releaseConnection()V
    .locals 3

    .line 940
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionUseCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionUseCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 942
    :try_start_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;

    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {v1, v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->releaseConnection(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 944
    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    return-void

    :catchall_0
    move-exception v1

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 945
    throw v1

    :cond_0
    return-void
.end method

.method private throwIfNestedTransaction()V
    .locals 2

    .line 965
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->hasNestedTransaction()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 966
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot perform this operation because a nested transaction is in progress."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private throwIfNoTransaction()V
    .locals 2

    .line 950
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz v0, :cond_0

    return-void

    .line 951
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot perform this operation because there is no current transaction."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private throwIfTransactionMarkedSuccessful()V
    .locals 2

    .line 957
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz v0, :cond_1

    iget-boolean v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMarkedSuccessful:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 958
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot perform this operation because the transaction has already been marked successful.  The only thing you can do now is call endTransaction()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method private yieldTransactionUnchecked(JLandroid/os/CancellationSignal;)Z
    .locals 6

    if-eqz p3, :cond_0

    .line 532
    invoke-virtual {p3}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 535
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    iget v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionFlags:I

    invoke-virtual {v0, v1, v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->shouldYieldConnection(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 539
    :cond_1
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iget v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMode:I

    .line 540
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iget-object v1, v1, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mListener:Lnet/zetetic/database/sqlcipher/SQLiteTransactionListener;

    .line 541
    iget v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnectionFlags:I

    const/4 v3, 0x1

    .line 542
    invoke-direct {p0, p3, v3}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->endTransactionUnchecked(Landroid/os/CancellationSignal;Z)V

    const-wide/16 v4, 0x0

    cmp-long v4, p1, v4

    if-lez v4, :cond_2

    .line 546
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 552
    :catch_0
    :cond_2
    invoke-direct {p0, v0, v1, v2, p3}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->beginTransactionUnchecked(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;ILandroid/os/CancellationSignal;)V

    return v3
.end method


# virtual methods
.method public beginTransaction(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;ILandroid/os/CancellationSignal;)V
    .locals 0

    .line 302
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfTransactionMarkedSuccessful()V

    .line 303
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->beginTransactionUnchecked(ILnet/zetetic/database/sqlcipher/SQLiteTransactionListener;ILandroid/os/CancellationSignal;)V

    return-void
.end method

.method public endTransaction(Landroid/os/CancellationSignal;)V
    .locals 1

    .line 403
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfNoTransaction()V

    const/4 v0, 0x0

    .line 406
    invoke-direct {p0, p1, v0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->endTransactionUnchecked(Landroid/os/CancellationSignal;Z)V

    return-void
.end method

.method public execute(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 618
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 622
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 624
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 626
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-void

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 627
    throw p1

    .line 615
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeForBlobFileDescriptor(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;
    .locals 1

    if-eqz p1, :cond_1

    .line 719
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 723
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 725
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeForBlobFileDescriptor(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 728
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 729
    throw p1

    .line 716
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeForChangedRowCount(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)I
    .locals 1

    if-eqz p1, :cond_1

    .line 753
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 757
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 759
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeForChangedRowCount(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 762
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return p1

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 763
    throw p1

    .line 750
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeForCursorWindow(Ljava/lang/String;[Ljava/lang/Object;Lnet/zetetic/database/CursorWindow;IIZILandroid/os/CancellationSignal;)I
    .locals 8

    move-object/from16 v7, p8

    if-eqz p1, :cond_2

    if-eqz p3, :cond_1

    .line 865
    invoke-direct {p0, p1, p2, p7, v7}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 866
    invoke-virtual {p3}, Lnet/zetetic/database/CursorWindow;->clear()V

    const/4 p1, 0x0

    return p1

    .line 870
    :cond_0
    invoke-direct {p0, p1, p7, v7}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 872
    :try_start_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeForCursorWindow(Ljava/lang/String;[Ljava/lang/Object;Lnet/zetetic/database/CursorWindow;IIZLandroid/os/CancellationSignal;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 876
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 877
    throw p1

    .line 862
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "window must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 859
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeForLastInsertedRowId(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)J
    .locals 1

    if-eqz p1, :cond_1

    .line 818
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 p1, 0x0

    return-wide p1

    .line 822
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 824
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeForLastInsertedRowId(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 827
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-wide p1

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 828
    throw p1

    .line 815
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeForLong(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)J
    .locals 1

    if-eqz p1, :cond_1

    .line 651
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 p1, 0x0

    return-wide p1

    .line 655
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 657
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 659
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-wide p1

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 660
    throw p1

    .line 648
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeForString(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_1

    .line 684
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->executeSpecial(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 688
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 690
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeForString(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 692
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 693
    throw p1

    .line 681
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public executeRaw(Ljava/lang/String;[Ljava/lang/Object;ILandroid/os/CancellationSignal;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 788
    invoke-direct {p0, p1, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 790
    :try_start_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p3, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->executeRaw(Ljava/lang/String;[Ljava/lang/Object;Landroid/os/CancellationSignal;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 793
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-void

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 794
    throw p1

    .line 785
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public hasConnection()Z
    .locals 1

    .line 264
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasNestedTransaction()Z
    .locals 1

    .line 255
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasTransaction()Z
    .locals 1

    .line 246
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public prepare(Ljava/lang/String;ILandroid/os/CancellationSignal;Lnet/zetetic/database/sqlcipher/SQLiteStatementInfo;)V
    .locals 0

    if-eqz p1, :cond_1

    if-eqz p3, :cond_0

    .line 588
    invoke-virtual {p3}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 591
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)V

    .line 593
    :try_start_0
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {p2, p1, p4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->prepare(Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteStatementInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 595
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    return-void

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->releaseConnection()V

    .line 596
    throw p1

    .line 584
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql must not be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setTransactionSuccessful()V
    .locals 2

    .line 376
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfNoTransaction()V

    .line 377
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfTransactionMarkedSuccessful()V

    .line 379
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMarkedSuccessful:Z

    return-void
.end method

.method public yieldTransaction(JZLandroid/os/CancellationSignal;)Z
    .locals 1

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 510
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfNoTransaction()V

    .line 511
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfTransactionMarkedSuccessful()V

    .line 512
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->throwIfNestedTransaction()V

    goto :goto_0

    .line 514
    :cond_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz p3, :cond_3

    iget-boolean p3, p3, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mMarkedSuccessful:Z

    if-nez p3, :cond_3

    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iget-object p3, p3, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mParent:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    if-eqz p3, :cond_1

    goto :goto_1

    .line 521
    :cond_1
    :goto_0
    iget-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteSession;->mTransactionStack:Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;

    iget-boolean p3, p3, Lnet/zetetic/database/sqlcipher/SQLiteSession$Transaction;->mChildFailed:Z

    if-eqz p3, :cond_2

    return v0

    .line 525
    :cond_2
    invoke-direct {p0, p1, p2, p4}, Lnet/zetetic/database/sqlcipher/SQLiteSession;->yieldTransactionUnchecked(JLandroid/os/CancellationSignal;)Z

    move-result p1

    return p1

    :cond_3
    :goto_1
    return v0
.end method
