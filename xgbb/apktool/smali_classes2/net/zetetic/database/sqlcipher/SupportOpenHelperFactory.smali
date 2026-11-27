.class public Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;
.super Ljava/lang/Object;
.source "SupportOpenHelperFactory.java"

# interfaces
.implements Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;


# static fields
.field private static final UNCHANGED:I = -0x1


# instance fields
.field private final enableWriteAheadLogging:Z

.field private final hook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

.field private final minimumSupportedVersion:I

.field private final password:[B


# direct methods
.method public constructor <init>([B)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 17
    invoke-direct {p0, p1, v0, v1}, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;-><init>([BLnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V

    return-void
.end method

.method public constructor <init>([BLnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V
    .locals 1

    const/4 v0, -0x1

    .line 21
    invoke-direct {p0, p1, p2, p3, v0}, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;-><init>([BLnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;ZI)V

    return-void
.end method

.method public constructor <init>([BLnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;ZI)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->password:[B

    .line 27
    iput-object p2, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->hook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

    .line 28
    iput-boolean p3, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->enableWriteAheadLogging:Z

    .line 29
    iput p4, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->minimumSupportedVersion:I

    return-void
.end method


# virtual methods
.method public create(Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration;)Landroidx/sqlite/db/SupportSQLiteOpenHelper;
    .locals 10

    .line 35
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->minimumSupportedVersion:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 36
    new-instance v0, Lnet/zetetic/database/sqlcipher/SupportHelper;

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->password:[B

    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->hook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

    iget-boolean v3, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->enableWriteAheadLogging:Z

    invoke-direct {v0, p1, v1, v2, v3}, Lnet/zetetic/database/sqlcipher/SupportHelper;-><init>(Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration;[BLnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;Z)V

    return-object v0

    .line 38
    :cond_0
    new-instance v4, Lnet/zetetic/database/sqlcipher/SupportHelper;

    iget-object v6, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->password:[B

    iget-object v7, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->hook:Lnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;

    iget-boolean v8, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->enableWriteAheadLogging:Z

    iget v9, p0, Lnet/zetetic/database/sqlcipher/SupportOpenHelperFactory;->minimumSupportedVersion:I

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lnet/zetetic/database/sqlcipher/SupportHelper;-><init>(Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration;[BLnet/zetetic/database/sqlcipher/SQLiteDatabaseHook;ZI)V

    return-object v4
.end method
