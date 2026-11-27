.class Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;
.super Ljava/lang/Object;
.source "CapacitorSQLite.java"

# interfaces
.implements Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->changeEncryptionSecret(Lcom/getcapacitor/PluginCall;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

.field final synthetic val$call:Lcom/getcapacitor/PluginCall;

.field final synthetic val$oldPassphrase:Ljava/lang/String;

.field final synthetic val$passphrase:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$passphrase",
            "val$oldPassphrase",
            "val$call"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 224
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$passphrase:Ljava/lang/String;

    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$oldPassphrase:Ljava/lang/String;

    iput-object p4, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$call:Lcom/getcapacitor/PluginCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailed()V
    .locals 4

    .line 242
    const-string v0, "MY_APP_TAG"

    const-string v1, "Error in authenticating biometric"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fgetcontext(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 244
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fgetrHandler(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Lcom/getcapacitor/community/database/sqlite/RetHandler;

    move-result-object v0

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$call:Lcom/getcapacitor/PluginCall;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(Landroidx/biometric/BiometricPrompt$AuthenticationResult;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    const/4 p1, 0x0

    .line 229
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fgetuSecret(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$passphrase:Ljava/lang/String;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$oldPassphrase:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSecret;->changeEncryptionSecret(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fgetrHandler(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Lcom/getcapacitor/community/database/sqlite/RetHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$call:Lcom/getcapacitor/PluginCall;

    invoke-virtual {v0, v1, p1, p1}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 232
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 233
    const-string v2, "MY_APP_TAG"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fgetcontext(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 235
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fgetrHandler(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)Lcom/getcapacitor/community/database/sqlite/RetHandler;

    move-result-object v1

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$3;->val$call:Lcom/getcapacitor/PluginCall;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, p1, v0}, Lcom/getcapacitor/community/database/sqlite/RetHandler;->retResult(Lcom/getcapacitor/PluginCall;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method
