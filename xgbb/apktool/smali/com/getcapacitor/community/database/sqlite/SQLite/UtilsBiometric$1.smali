.class Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;
.super Landroidx/biometric/BiometricPrompt$AuthenticationCallback;
.source "UtilsBiometric.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->setupBiometricPrompt(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 85
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    invoke-direct {p0}, Landroidx/biometric/BiometricPrompt$AuthenticationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "errorCode",
            "errString"
        }
    .end annotation

    .line 88
    invoke-super {p0, p1, p2}, Landroidx/biometric/BiometricPrompt$AuthenticationCallback;->onAuthenticationError(ILjava/lang/CharSequence;)V

    .line 89
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    invoke-static {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->-$$Nest$fgetcontext(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Landroid/content/Context;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Authentication error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 90
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    invoke-static {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->-$$Nest$fgetlistener(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;->onFailed()V

    return-void
.end method

.method public onAuthenticationFailed()V
    .locals 3

    .line 101
    invoke-super {p0}, Landroidx/biometric/BiometricPrompt$AuthenticationCallback;->onAuthenticationFailed()V

    .line 102
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->-$$Nest$fgetcontext(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "Authentication failed"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 103
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->-$$Nest$fgetlistener(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;->onFailed()V

    return-void
.end method

.method public onAuthenticationSucceeded(Landroidx/biometric/BiometricPrompt$AuthenticationResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 95
    invoke-super {p0, p1}, Landroidx/biometric/BiometricPrompt$AuthenticationCallback;->onAuthenticationSucceeded(Landroidx/biometric/BiometricPrompt$AuthenticationResult;)V

    .line 96
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;->this$0:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;

    invoke-static {v0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->-$$Nest$fgetlistener(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;->onSuccess(Landroidx/biometric/BiometricPrompt$AuthenticationResult;)V

    return-void
.end method
