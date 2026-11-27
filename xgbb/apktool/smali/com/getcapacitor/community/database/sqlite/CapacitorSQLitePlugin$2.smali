.class Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$2;
.super Lcom/getcapacitor/community/database/sqlite/MyRunnable;
.source "CapacitorSQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->AddObserversToNotificationCenter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1563
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$2;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;

    invoke-direct {p0}, Lcom/getcapacitor/community/database/sqlite/MyRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1566
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 1567
    invoke-virtual {p0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$2;->getInfo()Ljava/util/Map;

    move-result-object v1

    const-string v2, "progress"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 1568
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin$2;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;

    const-string v2, "sqliteExportProgressEvent"

    invoke-static {v1, v2, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;->access$100(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLitePlugin;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    return-void
.end method
