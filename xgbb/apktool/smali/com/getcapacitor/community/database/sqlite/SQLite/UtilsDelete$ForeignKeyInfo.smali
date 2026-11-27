.class public Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;
.super Ljava/lang/Object;
.source "UtilsDelete.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ForeignKeyInfo"
.end annotation


# instance fields
.field action:Ljava/lang/String;

.field forKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field refKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field tableName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->tableName:Ljava/lang/String;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->forKeys:Ljava/util/List;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->refKeys:Ljava/util/List;

    .line 41
    const-string v0, "NO ACTION"

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->action:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "forKeys",
            "tableName",
            "refKeys",
            "action"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->tableName:Ljava/lang/String;

    .line 46
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->forKeys:Ljava/util/List;

    .line 47
    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->refKeys:Ljava/util/List;

    .line 48
    iput-object p4, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->action:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->action:Ljava/lang/String;

    return-object v0
.end method

.method public getForKeys()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->forKeys:Ljava/util/List;

    return-object v0
.end method

.method public getRefKeys()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->refKeys:Ljava/util/List;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsDelete$ForeignKeyInfo;->tableName:Ljava/lang/String;

    return-object v0
.end method
