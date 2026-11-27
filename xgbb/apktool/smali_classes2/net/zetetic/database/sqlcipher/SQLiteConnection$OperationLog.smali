.class final Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;
.super Ljava/lang/Object;
.source "SQLiteConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/zetetic/database/sqlcipher/SQLiteConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OperationLog"
.end annotation


# static fields
.field private static final COOKIE_GENERATION_SHIFT:I = 0x8

.field private static final COOKIE_INDEX_MASK:I = 0xff

.field private static final MAX_RECENT_OPERATIONS:I = 0x14


# instance fields
.field private mGeneration:I

.field private mIndex:I

.field private final mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x14

    .line 1374
    new-array v0, v0, [Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    return-void
.end method

.method synthetic constructor <init>(Lnet/zetetic/database/sqlcipher/SQLiteConnection-IA;)V
    .locals 0

    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;-><init>()V

    return-void
.end method

.method private endOperationDeferLogLocked(I)Z
    .locals 3

    .line 1448
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->getOperationLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1450
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mEndTime:J

    const/4 v1, 0x1

    .line 1451
    iput-boolean v1, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mFinished:Z

    :cond_0
    return v0
.end method

.method private getOperationLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;
    .locals 2

    and-int/lit16 v0, p1, 0xff

    .line 1475
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    aget-object v0, v1, v0

    .line 1476
    iget v1, v0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mCookie:I

    if-ne v1, p1, :cond_0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private logOperationLocked(ILjava/lang/String;)V
    .locals 2

    .line 1459
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->getOperationLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    move-result-object p1

    .line 1460
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 1461
    invoke-virtual {p1, v0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->describe(Ljava/lang/StringBuilder;Z)V

    if-eqz p2, :cond_0

    .line 1463
    const-string p1, ", "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1465
    :cond_0
    const-string p1, "SQLiteConnection"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lnet/zetetic/database/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private newOperationCookieLocked(I)I
    .locals 2

    .line 1469
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mGeneration:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mGeneration:I

    shl-int/lit8 v0, v0, 0x8

    or-int/2addr p1, v0

    return p1
.end method


# virtual methods
.method public beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I
    .locals 7

    .line 1379
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1380
    :try_start_0
    iget v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mIndex:I

    add-int/lit8 v1, v1, 0x1

    rem-int/lit8 v1, v1, 0x14

    .line 1381
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    aget-object v2, v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez v2, :cond_0

    .line 1383
    new-instance v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    invoke-direct {v2, v3}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteConnection-IA;)V

    .line 1384
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    aput-object v2, v3, v1

    goto :goto_0

    .line 1386
    :cond_0
    iput-boolean v4, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mFinished:Z

    .line 1387
    iput-object v3, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mException:Ljava/lang/Exception;

    .line 1388
    iget-object v3, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    if-eqz v3, :cond_1

    .line 1389
    iget-object v3, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1392
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mStartWallTime:J

    .line 1393
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iput-wide v5, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mStartTime:J

    .line 1394
    iput-object p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mKind:Ljava/lang/String;

    .line 1395
    iput-object p2, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mSql:Ljava/lang/String;

    if-eqz p3, :cond_4

    .line 1397
    iget-object p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    if-nez p1, :cond_2

    .line 1398
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    goto :goto_1

    .line 1400
    :cond_2
    iget-object p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 1402
    :goto_1
    array-length p1, p3

    if-ge v4, p1, :cond_4

    .line 1403
    aget-object p1, p3, v4

    if-eqz p1, :cond_3

    .line 1404
    instance-of p2, p1, [B

    if-eqz p2, :cond_3

    .line 1406
    iget-object p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    invoke-static {}, Lnet/zetetic/database/sqlcipher/SQLiteConnection;->-$$Nest$sfgetEMPTY_BYTE_ARRAY()[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1408
    :cond_3
    iget-object p2, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mBindArgs:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1412
    :cond_4
    invoke-direct {p0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->newOperationCookieLocked(I)I

    move-result p1

    iput p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mCookie:I

    .line 1413
    iput v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mIndex:I

    .line 1414
    iget p1, v2, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mCookie:I

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 1415
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public describeCurrentOperation()Ljava/lang/String;
    .locals 4

    .line 1480
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1481
    :try_start_0
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    iget v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mIndex:I

    aget-object v1, v1, v2

    if-eqz v1, :cond_0

    .line 1482
    iget-boolean v2, v1, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mFinished:Z

    if-nez v2, :cond_0

    .line 1483
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    .line 1484
    invoke-virtual {v1, v2, v3}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->describe(Ljava/lang/StringBuilder;Z)V

    .line 1485
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :cond_0
    const/4 v1, 0x0

    .line 1487
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 1488
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public dump(Landroid/util/Printer;Z)V
    .locals 7

    .line 1492
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1493
    :try_start_0
    const-string v1, "  Most recently executed operations:"

    invoke-interface {p1, v1}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1494
    iget v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mIndex:I

    .line 1495
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    aget-object v2, v2, v1

    if-eqz v2, :cond_2

    const/4 v3, 0x0

    .line 1499
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1500
    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1501
    invoke-static {v2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->-$$Nest$mgetFormattedStartTime(Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1502
    const-string v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1503
    invoke-virtual {v2, v4, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->describe(Ljava/lang/StringBuilder;Z)V

    .line 1504
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    if-lez v1, :cond_1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    const/16 v1, 0x13

    :goto_0
    add-int/lit8 v3, v3, 0x1

    .line 1512
    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    aget-object v2, v2, v1

    if-eqz v2, :cond_3

    const/16 v4, 0x14

    if-lt v3, v4, :cond_0

    goto :goto_1

    .line 1515
    :cond_2
    const-string p2, "    <none>"

    invoke-interface {p1, p2}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 1517
    :cond_3
    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public endOperation(I)V
    .locals 2

    .line 1428
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1429
    :try_start_0
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->endOperationDeferLogLocked(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 1430
    invoke-direct {p0, p1, v1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->logOperationLocked(ILjava/lang/String;)V

    .line 1432
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public endOperationDeferLog(I)Z
    .locals 1

    .line 1436
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1437
    :try_start_0
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->endOperationDeferLogLocked(I)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 1438
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public failOperation(ILjava/lang/Exception;)V
    .locals 1

    .line 1419
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1420
    :try_start_0
    invoke-direct {p0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->getOperationLocked(I)Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1422
    iput-object p2, p1, Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;->mException:Ljava/lang/Exception;

    .line 1424
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public logOperation(ILjava/lang/String;)V
    .locals 1

    .line 1442
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->mOperations:[Lnet/zetetic/database/sqlcipher/SQLiteConnection$Operation;

    monitor-enter v0

    .line 1443
    :try_start_0
    invoke-direct {p0, p1, p2}, Lnet/zetetic/database/sqlcipher/SQLiteConnection$OperationLog;->logOperationLocked(ILjava/lang/String;)V

    .line 1444
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
