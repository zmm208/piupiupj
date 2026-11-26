.class Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson$1;
.super Ljava/util/HashMap;
.source "ImportFromJson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;->notifyImportProgressEvent(Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$msg"
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson;

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson$1;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 33
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Import: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "progress"

    invoke-virtual {p0, p2, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/ImportExportJson/ImportFromJson$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
