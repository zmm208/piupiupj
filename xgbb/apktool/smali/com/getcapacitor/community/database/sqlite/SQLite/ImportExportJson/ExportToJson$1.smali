.class Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson$1;
.super Ljava/util/HashMap;
.source "ExportToJson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;->notifyExportProgressEvent(Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$message"
        }
    .end annotation

    .line 28
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson;

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson$1;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 30
    const-string p1, "progress"

    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ExportToJson$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
