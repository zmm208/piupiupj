.class public Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;
.super Ljava/lang/Object;
.source "GlobalSQLite.java"


# instance fields
.field public newsecret:Ljava/lang/String;

.field public secret:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v0, "sqlite secret"

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;->secret:Ljava/lang/String;

    .line 30
    const-string v0, "sqlite new secret"

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/GlobalSQLite;->newsecret:Ljava/lang/String;

    return-void
.end method
