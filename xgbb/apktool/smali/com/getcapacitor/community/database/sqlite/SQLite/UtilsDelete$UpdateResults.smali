.class public Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;
.super Ljava/lang/Object;
.source "UtilsDelete.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UpdateResults"
.end annotation


# instance fields
.field private setStmt:Ljava/lang/String;

.field private updWhereStmt:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;->setStmt:Ljava/lang/String;

    .line 75
    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;->updWhereStmt:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "setStmt",
            "updWhereStmt"
        }
    .end annotation

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;->setStmt:Ljava/lang/String;

    .line 80
    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;->updWhereStmt:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getSetStmt()Ljava/lang/String;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;->setStmt:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdWhereStmt()Ljava/lang/String;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$UpdateResults;->updWhereStmt:Ljava/lang/String;

    return-object v0
.end method
