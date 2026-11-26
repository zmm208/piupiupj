.class public final Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;
.super Ljava/lang/Object;
.source "SQLiteConnectionPool.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;,
        Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final CONNECTION_FLAG_INTERACTIVE:I = 0x4

.field public static final CONNECTION_FLAG_PRIMARY_CONNECTION_AFFINITY:I = 0x2

.field public static final CONNECTION_FLAG_READ_ONLY:I = 0x1

.field private static final CONNECTION_POOL_BUSY_MILLIS:J = 0x7530L

.field private static final TAG:Ljava/lang/String; = "SQLiteConnectionPool"


# instance fields
.field private final mAcquiredConnections:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lnet/zetetic/database/sqlcipher/SQLiteConnection;",
            "Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;",
            ">;"
        }
    .end annotation
.end field

.field private final mAvailableNonPrimaryConnections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lnet/zetetic/database/sqlcipher/SQLiteConnection;",
            ">;"
        }
    .end annotation
.end field

.field private mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

.field private final mCloseGuard:Lnet/zetetic/database/sqlcipher/CloseGuard;

.field private final mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

.field private final mConnectionLeaked:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mConnectionWaiterPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

.field private mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

.field private mIsOpen:Z

.field private final mLock:Ljava/lang/Object;

.field private mMaxConnectionPoolSize:I

.field private mNextConnectionId:I


# direct methods
.method static bridge synthetic -$$Nest$fgetmLock(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcancelConnectionWaiterLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;)V
    .locals 0

    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->cancelConnectionWaiterLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V
    .locals 1

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-static {}, Lnet/zetetic/database/sqlcipher/CloseGuard;->get()Lnet/zetetic/database/sqlcipher/CloseGuard;

    move-result-object v0

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mCloseGuard:Lnet/zetetic/database/sqlcipher/CloseGuard;

    .line 84
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionLeaked:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    .line 116
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    .line 152
    new-instance v0, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-direct {v0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    .line 153
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->setMaxConnectionPoolSizeLocked()V

    return-void
.end method

.method private cancelConnectionWaiterLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;)V
    .locals 3

    .line 732
    iget-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mAssignedConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-nez v0, :cond_3

    iget-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mException:Ljava/lang/RuntimeException;

    if-eqz v0, :cond_0

    goto :goto_2

    .line 739
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    const/4 v1, 0x0

    :goto_0
    if-eq v0, p1, :cond_1

    .line 743
    iget-object v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    move-object v2, v1

    move-object v1, v0

    move-object v0, v2

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    .line 746
    iget-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    iput-object v0, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    goto :goto_1

    .line 748
    :cond_2
    iget-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    .line 752
    :goto_1
    new-instance v0, Landroid/os/OperationCanceledException;

    invoke-direct {v0}, Landroid/os/OperationCanceledException;-><init>()V

    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mException:Ljava/lang/RuntimeException;

    .line 753
    iget-object p1, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mThread:Ljava/lang/Thread;

    invoke-static {p1}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 756
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->wakeConnectionWaitersLocked()V

    :cond_3
    :goto_2
    return-void
.end method

.method private closeAvailableConnectionsAndLogExceptionsLocked()V
    .locals 1

    .line 509
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeAvailableNonPrimaryConnectionsAndLogExceptionsLocked()V

    .line 511
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v0, :cond_0

    .line 512
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    const/4 v0, 0x0

    .line 513
    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    :cond_0
    return-void
.end method

.method private closeAvailableNonPrimaryConnectionsAndLogExceptionsLocked()V
    .locals 3

    .line 519
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 521
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-direct {p0, v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 523
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method private closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V
    .locals 3

    .line 539
    :try_start_0
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 541
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to close connection, its fate is now in the hands of the merciful GC: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "SQLiteConnectionPool"

    invoke-static {v1, p1, v0}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private closeExcessConnectionsAndLogExceptionsLocked()V
    .locals 3

    .line 528
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    add-int/lit8 v1, v0, -0x1

    .line 529
    iget v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mMaxConnectionPoolSize:I

    add-int/lit8 v2, v2, -0x1

    if-le v0, v2, :cond_0

    .line 530
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    .line 531
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 532
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    move v0, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private discardAcquiredConnectionsLocked()V
    .locals 1

    .line 548
    sget-object v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->DISCARD:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->markAcquiredConnectionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;)V

    return-void
.end method

.method private dispose(Z)V
    .locals 4

    const-string v0, "The connection pool for "

    .line 212
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mCloseGuard:Lnet/zetetic/database/sqlcipher/CloseGuard;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_0

    .line 214
    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/CloseGuard;->warnIfOpen()V

    .line 216
    :cond_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mCloseGuard:Lnet/zetetic/database/sqlcipher/CloseGuard;

    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/CloseGuard;->close()V

    :cond_1
    if-nez p1, :cond_3

    .line 224
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter p1

    .line 225
    :try_start_0
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->throwIfClosedLocked()V

    const/4 v1, 0x0

    .line 227
    iput-boolean v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    .line 229
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeAvailableConnectionsAndLogExceptionsLocked()V

    .line 231
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->size()I

    move-result v1

    if-eqz v1, :cond_2

    .line 233
    const-string v2, "SQLiteConnectionPool"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " has been closed but there are still "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " connections in use.  They will be closed as they are released back to the pool."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lnet/zetetic/database/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    :cond_2
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->wakeConnectionWaitersLocked()V

    .line 240
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_3
    return-void
.end method

.method private finishAcquireConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)V
    .locals 3

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 932
    :goto_0
    :try_start_0
    invoke-virtual {p1, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->setOnlyAllowReadOnlyOperations(Z)V

    .line 934
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    sget-object v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->NORMAL:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 936
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to prepare acquired connection for session, closing it: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", connectionFlags="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "SQLiteConnectionPool"

    invoke-static {v1, p2}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    .line 939
    throw v0
.end method

.method private static getPriority(I)I
    .locals 0

    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private isSessionBlockingImportantConnectionWaitersLocked(ZI)Z
    .locals 2

    .line 945
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    if-eqz v0, :cond_4

    .line 947
    invoke-static {p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->getPriority(I)I

    move-result p2

    .line 950
    :cond_0
    iget v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mPriority:I

    if-le p2, v1, :cond_1

    goto :goto_1

    :cond_1
    if-nez p1, :cond_3

    .line 957
    iget-boolean v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mWantPrimaryConnection:Z

    if-nez v1, :cond_2

    goto :goto_0

    .line 961
    :cond_2
    iget-object v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_4
    :goto_1
    const/4 p1, 0x0

    return p1
.end method

.method private logConnectionPoolBusyLocked(JI)V
    .locals 4

    .line 761
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 762
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "The connection pool for database \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 763
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-object v2, v2, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 764
    const-string v2, "\' has been unable to grant a connection to thread "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 765
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ") with flags 0x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 766
    invoke-static {p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 767
    const-string p3, " for "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    long-to-float p1, p1

    const p2, 0x3a83126f    # 0.001f

    mul-float/2addr p1, p2

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " seconds.\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 769
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 772
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {p2}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result p2

    const/4 p3, 0x0

    if-nez p2, :cond_1

    .line 773
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {p2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    move v0, p3

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 774
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->describeCurrentOperationUnsafe()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 776
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move v0, p3

    .line 783
    :cond_2
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    .line 784
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v2, :cond_3

    add-int/lit8 p2, p2, 0x1

    .line 788
    :cond_3
    const-string v2, "Connections: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v2, " active, "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 789
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " idle, "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " available.\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 792
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_4

    .line 793
    const-string p2, "\nRequests in progress:\n"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 794
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 795
    const-string p3, "  "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 799
    :cond_4
    const-string p1, "SQLiteConnectionPool"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lnet/zetetic/database/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private markAcquiredConnectionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;)V
    .locals 5

    .line 583
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 584
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    .line 585
    invoke-virtual {v1}, Ljava/util/WeakHashMap;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 587
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 588
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    if-eq p1, v3, :cond_0

    .line 589
    sget-object v4, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->DISCARD:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    if-eq v3, v4, :cond_0

    .line 591
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 594
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_2

    .line 596
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {v3, v4, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private obtainConnectionWaiterLocked(Ljava/lang/Thread;JIZLjava/lang/String;I)Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;
    .locals 3

    .line 992
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 994
    iget-object v2, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    iput-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    .line 995
    iput-object v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    goto :goto_0

    .line 997
    :cond_0
    new-instance v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    invoke-direct {v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool-IA;)V

    .line 999
    :goto_0
    iput-object p1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mThread:Ljava/lang/Thread;

    .line 1000
    iput-wide p2, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mStartTime:J

    .line 1001
    iput p4, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mPriority:I

    .line 1002
    iput-boolean p5, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mWantPrimaryConnection:Z

    .line 1003
    iput-object p6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mSql:Ljava/lang/String;

    .line 1004
    iput p7, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mConnectionFlags:I

    return-object v0
.end method

.method public static open(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;
    .locals 1

    if-eqz p0, :cond_0

    .line 179
    new-instance v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;

    invoke-direct {v0, p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V

    .line 180
    invoke-direct {v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->open()V

    return-object v0

    .line 175
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "configuration must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private open()V
    .locals 2

    .line 188
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->openConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;Z)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v0

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 192
    iput-boolean v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    .line 193
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mCloseGuard:Lnet/zetetic/database/sqlcipher/CloseGuard;

    const-string v1, "close"

    invoke-virtual {v0, v1}, Lnet/zetetic/database/sqlcipher/CloseGuard;->open(Ljava/lang/String;)V

    return-void
.end method

.method private openConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;Z)Lnet/zetetic/database/sqlcipher/SQLiteConnection;
    .locals 2

    .line 473
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mNextConnectionId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mNextConnectionId:I

    .line 474
    invoke-static {p0, p1, v0, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->open(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;IZ)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object p1

    return-object p1
.end method

.method private reconfigureAllConnectionsLocked()V
    .locals 7

    .line 553
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const-string v1, "SQLiteConnectionPool"

    if-eqz v0, :cond_0

    .line 555
    :try_start_0
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->reconfigure(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 557
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to reconfigure available primary connection, closing it: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 559
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    const/4 v0, 0x0

    .line 560
    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 564
    :cond_0
    :goto_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_1

    .line 566
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 568
    :try_start_1
    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-virtual {v3, v4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->reconfigure(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v4

    .line 570
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Failed to reconfigure available non-primary connection, closing it: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5, v4}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 572
    invoke-direct {p0, v3}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    .line 573
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    move v2, v4

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 578
    :cond_1
    sget-object v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->RECONFIGURE:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->markAcquiredConnectionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;)V

    return-void
.end method

.method private recycleConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;)Z
    .locals 2

    .line 405
    sget-object v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->RECONFIGURE:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    if-ne p2, v0, :cond_0

    .line 407
    :try_start_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-virtual {p1, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->reconfigure(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Failed to reconfigure released connection, closing it: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SQLiteConnectionPool"

    invoke-static {v1, v0, p2}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 411
    sget-object p2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->DISCARD:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    .line 414
    :cond_0
    :goto_0
    sget-object v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;->DISCARD:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    if-ne p2, v0, :cond_1

    .line 415
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private recycleConnectionWaiterLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;)V
    .locals 1

    .line 1009
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    const/4 v0, 0x0

    .line 1010
    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mThread:Ljava/lang/Thread;

    .line 1011
    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mSql:Ljava/lang/String;

    .line 1012
    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mAssignedConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 1013
    iput-object v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mException:Ljava/lang/RuntimeException;

    .line 1014
    iget v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNonce:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNonce:I

    .line 1015
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterPool:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    return-void
.end method

.method private setMaxConnectionPoolSizeLocked()V
    .locals 2

    .line 972
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->openFlags:I

    const/high16 v1, 0x20000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 973
    invoke-static {}, Lnet/zetetic/database/sqlcipher/SQLiteGlobal;->getWALConnectionPoolSize()I

    move-result v0

    iput v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mMaxConnectionPoolSize:I

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 979
    iput v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mMaxConnectionPoolSize:I

    return-void
.end method

.method private throwIfClosedLocked()V
    .locals 2

    .line 984
    iget-boolean v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    if-eqz v0, :cond_0

    return-void

    .line 985
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot perform this operation because the connection pool has been closed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private tryAcquireNonPrimaryConnectionLocked(Ljava/lang/String;I)Lnet/zetetic/database/sqlcipher/SQLiteConnection;
    .locals 6

    .line 894
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-le v0, v2, :cond_1

    if-eqz p1, :cond_1

    move v3, v1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 899
    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 900
    invoke-virtual {v4, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->isPreparedStatementInCache(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 901
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 902
    invoke-direct {p0, v4, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->finishAcquireConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)V

    return-object v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    if-lez v0, :cond_2

    .line 909
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    sub-int/2addr v0, v2

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 910
    invoke-direct {p0, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->finishAcquireConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)V

    return-object p1

    .line 915
    :cond_2
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Ljava/util/WeakHashMap;->size()I

    move-result p1

    .line 916
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v0, :cond_3

    add-int/lit8 p1, p1, 0x1

    .line 919
    :cond_3
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mMaxConnectionPoolSize:I

    if-lt p1, v0, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 922
    :cond_4
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-direct {p0, p1, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->openConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;Z)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object p1

    .line 924
    invoke-direct {p0, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->finishAcquireConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)V

    return-object p1
.end method

.method private tryAcquirePrimaryConnectionLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection;
    .locals 3

    .line 867
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 869
    iput-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 870
    invoke-direct {p0, v0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->finishAcquireConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)V

    return-object v0

    .line 875
    :cond_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 876
    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->isPrimaryConnection()Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    .line 883
    :cond_2
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->openConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;Z)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v0

    .line 885
    invoke-direct {p0, v0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->finishAcquireConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)V

    return-object v0
.end method

.method private waitForConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)Lnet/zetetic/database/sqlcipher/SQLiteConnection;
    .locals 17

    move-object/from16 v1, p0

    move/from16 v8, p2

    move-object/from16 v9, p3

    and-int/lit8 v0, v8, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v0, :cond_0

    move v6, v10

    goto :goto_0

    :cond_0
    move v6, v11

    .line 609
    :goto_0
    iget-object v12, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v12

    .line 610
    :try_start_0
    invoke-direct {v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->throwIfClosedLocked()V

    if-eqz v9, :cond_1

    .line 614
    invoke-virtual {v9}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 624
    :cond_1
    iget-object v0, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v0, :cond_2

    iget-object v0, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    if-eqz v6, :cond_4

    .line 625
    :cond_3
    invoke-direct {v1, v8}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->tryAcquirePrimaryConnectionLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 627
    monitor-exit v12

    return-object v0

    :cond_4
    if-nez v6, :cond_5

    .line 636
    invoke-direct/range {p0 .. p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->tryAcquireNonPrimaryConnectionLocked(Ljava/lang/String;I)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 638
    monitor-exit v12

    return-object v0

    .line 643
    :cond_5
    invoke-static {v8}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->getPriority(I)I

    move-result v5

    .line 644
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 645
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    move-object/from16 v7, p1

    invoke-direct/range {v1 .. v8}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->obtainConnectionWaiterLocked(Ljava/lang/Thread;JIZLjava/lang/String;I)Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    move-result-object v0

    .line 648
    iget-object v2, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    const/4 v3, 0x0

    move-object v4, v3

    :goto_1
    if-eqz v2, :cond_7

    .line 650
    iget v6, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mPriority:I

    if-le v5, v6, :cond_6

    .line 651
    iput-object v2, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    goto :goto_2

    .line 655
    :cond_6
    iget-object v4, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    move-object/from16 v16, v4

    move-object v4, v2

    move-object/from16 v2, v16

    goto :goto_1

    :cond_7
    :goto_2
    if-eqz v4, :cond_8

    .line 658
    iput-object v0, v4, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    goto :goto_3

    .line 660
    :cond_8
    iput-object v0, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    .line 663
    :goto_3
    iget v2, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNonce:I

    .line 664
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-eqz v9, :cond_9

    .line 668
    new-instance v4, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$1;

    invoke-direct {v4, v1, v0, v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$1;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;I)V

    invoke-virtual {v9, v4}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    .line 683
    :cond_9
    :try_start_1
    iget-wide v4, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mStartTime:J

    const-wide/16 v6, 0x7530

    add-long/2addr v4, v6

    move-wide v12, v6

    .line 686
    :goto_4
    iget-object v2, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionLeaked:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v10, v11}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 687
    iget-object v2, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 688
    :try_start_2
    invoke-direct {v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->wakeConnectionWaitersLocked()V

    .line 689
    monitor-exit v2

    goto :goto_5

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0

    :cond_a
    :goto_5
    const-wide/32 v14, 0xf4240

    mul-long/2addr v12, v14

    .line 693
    invoke-static {v1, v12, v13}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(Ljava/lang/Object;J)V

    .line 696
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 699
    iget-object v2, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 700
    :try_start_4
    invoke-direct {v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->throwIfClosedLocked()V

    .line 702
    iget-object v12, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mAssignedConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 703
    iget-object v13, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mException:Ljava/lang/RuntimeException;

    if-nez v12, :cond_d

    if-eqz v13, :cond_b

    goto :goto_7

    .line 712
    :cond_b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    cmp-long v14, v12, v4

    if-gez v14, :cond_c

    sub-long/2addr v12, v4

    goto :goto_6

    .line 716
    :cond_c
    iget-wide v4, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mStartTime:J

    sub-long v4, v12, v4

    invoke-direct {v1, v4, v5, v8}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->logConnectionPoolBusyLocked(JI)V

    add-long/2addr v12, v6

    move-wide v4, v12

    move-wide v12, v6

    .line 720
    :goto_6
    monitor-exit v2

    goto :goto_4

    .line 705
    :cond_d
    :goto_7
    invoke-direct {v1, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->recycleConnectionWaiterLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;)V

    if-eqz v12, :cond_f

    .line 707
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v9, :cond_e

    .line 725
    invoke-virtual {v9, v3}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    :cond_e
    return-object v12

    .line 709
    :cond_f
    :try_start_5
    throw v13

    :catchall_1
    move-exception v0

    .line 720
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz v9, :cond_10

    .line 725
    invoke-virtual {v9, v3}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    .line 727
    :cond_10
    throw v0

    :catchall_3
    move-exception v0

    .line 664
    :try_start_7
    monitor-exit v12
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v0
.end method

.method private wakeConnectionWaitersLocked()V
    .locals 9

    .line 808
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v4, v1

    move v3, v2

    move v5, v3

    :goto_0
    if-eqz v0, :cond_8

    .line 813
    iget-boolean v6, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    const/4 v7, 0x1

    if-nez v6, :cond_0

    goto :goto_2

    .line 818
    :cond_0
    :try_start_0
    iget-boolean v6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mWantPrimaryConnection:Z

    if-nez v6, :cond_1

    if-nez v3, :cond_1

    .line 819
    iget-object v6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mSql:Ljava/lang/String;

    iget v8, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mConnectionFlags:I

    invoke-direct {p0, v6, v8}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->tryAcquireNonPrimaryConnectionLocked(Ljava/lang/String;I)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v6

    if-nez v6, :cond_2

    move v3, v7

    goto :goto_1

    :cond_1
    move-object v6, v1

    :cond_2
    :goto_1
    if-nez v6, :cond_3

    if-nez v5, :cond_3

    .line 826
    iget v6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mConnectionFlags:I

    invoke-direct {p0, v6}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->tryAcquirePrimaryConnectionLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v6

    if-nez v6, :cond_3

    move v5, v7

    :cond_3
    if-eqz v6, :cond_4

    .line 833
    iput-object v6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mAssignedConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_4
    if-eqz v3, :cond_5

    if-eqz v5, :cond_5

    goto :goto_5

    :cond_5
    move v7, v2

    goto :goto_2

    :catch_0
    move-exception v6

    .line 842
    iput-object v6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mException:Ljava/lang/RuntimeException;

    .line 847
    :goto_2
    iget-object v6, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    if-eqz v7, :cond_7

    if-eqz v4, :cond_6

    .line 850
    iput-object v6, v4, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    goto :goto_3

    .line 852
    :cond_6
    iput-object v6, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    .line 854
    :goto_3
    iput-object v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    .line 856
    iget-object v0, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mThread:Ljava/lang/Thread;

    invoke-static {v0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    goto :goto_4

    :cond_7
    move-object v4, v0

    :goto_4
    move-object v0, v6

    goto :goto_0

    :cond_8
    :goto_5
    return-void
.end method


# virtual methods
.method public acquireConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)Lnet/zetetic/database/sqlcipher/SQLiteConnection;
    .locals 0

    .line 359
    invoke-direct {p0, p1, p2, p3}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->waitForConnection(Ljava/lang/String;ILandroid/os/CancellationSignal;)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object p1

    return-object p1
.end method

.method public close()V
    .locals 1

    const/4 v0, 0x0

    .line 208
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->dispose(Z)V

    return-void
.end method

.method public collectDbStats(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lnet/zetetic/database/sqlcipher/SQLiteDebug$DbStats;",
            ">;)V"
        }
    .end annotation

    .line 455
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 456
    :try_start_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v1, :cond_0

    .line 457
    invoke-virtual {v1, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->collectDbStats(Ljava/util/ArrayList;)V

    .line 460
    :cond_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 461
    invoke-virtual {v2, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->collectDbStats(Ljava/util/ArrayList;)V

    goto :goto_0

    .line 464
    :cond_1
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 465
    invoke-virtual {v2, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->collectDbStatsUnsafe(Ljava/util/ArrayList;)V

    goto :goto_1

    .line 467
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public dump(Landroid/util/Printer;Z)V
    .locals 8

    const-string v0, "  Max connections: "

    const-string v1, "  Open: "

    const-string v2, "Connection pool for "

    .line 1037
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1038
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-object v2, v2, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1039
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1040
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mMaxConnectionPoolSize:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1042
    const-string v0, "  Available primary connection:"

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1043
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v0, :cond_0

    .line 1044
    invoke-virtual {v0, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->dump(Landroid/util/Printer;Z)V

    goto :goto_0

    .line 1046
    :cond_0
    const-string v0, "<none>"

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1049
    :goto_0
    const-string v0, "  Available non-primary connections:"

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1050
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1051
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :goto_1
    if-ge v2, v0, :cond_2

    .line 1053
    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    invoke-virtual {v4, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->dump(Landroid/util/Printer;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1056
    :cond_1
    const-string v0, "<none>"

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1059
    :cond_2
    const-string v0, "  Acquired connections:"

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1060
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1062
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 1063
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 1064
    invoke-virtual {v4, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->dumpUnsafe(Landroid/util/Printer;Z)V

    .line 1065
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  Status: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 1068
    :cond_3
    const-string p2, "<none>"

    invoke-interface {p1, p2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1071
    :cond_4
    const-string p2, "  Connection waiters:"

    invoke-interface {p1, p2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1072
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    if-eqz p2, :cond_5

    .line 1074
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 1075
    iget-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionWaiterQueue:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    :goto_3
    if-eqz p2, :cond_6

    .line 1077
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": waited for "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v6, p2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mStartTime:J

    sub-long v6, v4, v6

    long-to-float v2, v6

    const v6, 0x3a83126f    # 0.001f

    mul-float/2addr v2, v6

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ms - thread="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", priority="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mPriority:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", sql=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mSql:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1076
    iget-object p2, p2, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;->mNext:Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$ConnectionWaiter;

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1084
    :cond_5
    const-string p2, "<none>"

    invoke-interface {p1, p2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1086
    :cond_6
    monitor-exit v3

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public enableLocalizedCollators()V
    .locals 3

    .line 1019
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1020
    :try_start_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    if-eqz v1, :cond_0

    .line 1025
    invoke-virtual {v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->enableLocalizedCollators()V

    .line 1026
    monitor-exit v0

    return-void

    .line 1021
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot enable localized collators while database is in use"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception v1

    .line 1026
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 v0, 0x1

    .line 159
    :try_start_0
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->dispose(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 162
    throw v0
.end method

.method onConnectionLeaked()V
    .locals 2

    .line 499
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "A SQLiteConnection object for database \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-object v1, v1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' was leaked!  Please fix your application to end transactions in progress properly and to close the database when it is no longer needed."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SQLiteConnectionPool"

    invoke-static {v1, v0}, Lnet/zetetic/database/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConnectionLeaked:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public reconfigure(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V
    .locals 5

    if-eqz p1, :cond_8

    .line 262
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 263
    :try_start_0
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->throwIfClosedLocked()V

    .line 265
    iget v1, p1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->openFlags:I

    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget v2, v2, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->openFlags:I

    xor-int/2addr v1, v2

    const/high16 v2, 0x20000000

    and-int/2addr v1, v2

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    .line 270
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v3}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 279
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeAvailableNonPrimaryConnectionsAndLogExceptionsLocked()V

    goto :goto_1

    .line 271
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Write Ahead Logging (WAL) mode cannot be enabled or disabled while there are transactions in progress.  Finish all transactions and release all active database connections first."

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 283
    :cond_2
    :goto_1
    iget-boolean v3, p1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-boolean v4, v4, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    if-eq v3, v4, :cond_4

    .line 289
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v3}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_2

    .line 290
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Foreign Key Constraints cannot be enabled or disabled while there are transactions in progress.  Finish all transactions and release all active database connections first."

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 297
    :cond_4
    :goto_2
    iget-object v3, p1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->password:[B

    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-object v4, v4, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->password:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_5

    .line 299
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    iget-object v4, p1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->password:[B

    invoke-virtual {v3, v4}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->changePassword([B)V

    .line 300
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-virtual {v3, p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->updateParametersFrom(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V

    .line 301
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeAvailableNonPrimaryConnectionsAndLogExceptionsLocked()V

    .line 302
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->reconfigureAllConnectionsLocked()V

    .line 305
    :cond_5
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget v3, v3, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->openFlags:I

    iget v4, p1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->openFlags:I

    if-eq v3, v4, :cond_7

    if-eqz v1, :cond_6

    .line 310
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeAvailableConnectionsAndLogExceptionsLocked()V

    .line 317
    :cond_6
    invoke-direct {p0, p1, v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->openConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;Z)Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    move-result-object v1

    .line 320
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeAvailableConnectionsAndLogExceptionsLocked()V

    .line 321
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->discardAcquiredConnectionsLocked()V

    .line 323
    iput-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 324
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-virtual {v1, p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->updateParametersFrom(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V

    .line 325
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->setMaxConnectionPoolSizeLocked()V

    goto :goto_3

    .line 328
    :cond_7
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    invoke-virtual {v1, p1}, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->updateParametersFrom(Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;)V

    .line 329
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->setMaxConnectionPoolSizeLocked()V

    .line 331
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeExcessConnectionsAndLogExceptionsLocked()V

    .line 332
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->reconfigureAllConnectionsLocked()V

    .line 335
    :goto_3
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->wakeConnectionWaitersLocked()V

    .line 336
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 259
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "configuration must not be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public releaseConnection(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V
    .locals 4

    .line 375
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 376
    :try_start_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;

    if-eqz v1, :cond_5

    .line 383
    iget-boolean v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    if-nez v2, :cond_0

    .line 384
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    goto :goto_0

    .line 385
    :cond_0
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->isPrimaryConnection()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 386
    invoke-direct {p0, p1, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->recycleConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 388
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailablePrimaryConnection:Lnet/zetetic/database/sqlcipher/SQLiteConnection;

    .line 390
    :cond_1
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->wakeConnectionWaitersLocked()V

    goto :goto_0

    .line 391
    :cond_2
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mMaxConnectionPoolSize:I

    add-int/lit8 v3, v3, -0x1

    if-lt v2, v3, :cond_3

    .line 392
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->closeConnectionAndLogExceptionsLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;)V

    goto :goto_0

    .line 394
    :cond_3
    invoke-direct {p0, p1, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->recycleConnectionLocked(Lnet/zetetic/database/sqlcipher/SQLiteConnection;Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool$AcquiredConnectionStatus;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 395
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAvailableNonPrimaryConnections:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    :cond_4
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->wakeConnectionWaitersLocked()V

    .line 399
    :goto_0
    monitor-exit v0

    return-void

    .line 378
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot perform this operation because the specified connection was not acquired from this pool or has already been released."

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    .line 399
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public shouldYieldConnection(Lnet/zetetic/database/sqlcipher/SQLiteConnection;I)Z
    .locals 2

    .line 433
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 434
    :try_start_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mAcquiredConnections:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 440
    iget-boolean v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mIsOpen:Z

    if-nez v1, :cond_0

    const/4 p1, 0x0

    .line 441
    monitor-exit v0

    return p1

    .line 445
    :cond_0
    invoke-virtual {p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->isPrimaryConnection()Z

    move-result p1

    .line 444
    invoke-direct {p0, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->isSessionBlockingImportantConnectionWaitersLocked(ZI)Z

    move-result p1

    monitor-exit v0

    return p1

    .line 435
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot perform this operation because the specified connection was not acquired from this pool or has already been released."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    .line 446
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1091
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SQLiteConnectionPool: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnectionPool;->mConfiguration:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;

    iget-object v1, v1, Lnet/zetetic/database/sqlcipher/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
