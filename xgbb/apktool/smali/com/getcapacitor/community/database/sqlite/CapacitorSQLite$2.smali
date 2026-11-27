.class Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;
.super Ljava/util/HashMap;
.source "CapacitorSQLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->notifyBiometricEvent(Ljava/lang/Boolean;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

.field final synthetic val$msg:Ljava/lang/String;

.field final synthetic val$ret:Ljava/lang/Boolean;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$ret",
            "val$msg"
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;->val$ret:Ljava/lang/Boolean;

    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 140
    const-string p1, "result"

    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string p1, "message"

    invoke-virtual {p0, p1, p3}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
