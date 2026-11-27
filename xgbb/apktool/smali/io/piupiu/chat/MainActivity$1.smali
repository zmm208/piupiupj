.class Lio/piupiu/chat/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lio/piupiu/chat/FrontendLicenseManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/piupiu/chat/MainActivity;->startIntegrityGate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/piupiu/chat/MainActivity;


# direct methods
.method public static synthetic $r8$lambda$-SJNkPu8VxAzVELs9gWc4K1RA5w(Lio/piupiu/chat/MainActivity$1;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity$1;->lambda$onAccountInvalid$3()V

    return-void
.end method

.method public static synthetic $r8$lambda$es-WjOF5N8DNYdB3ZINe4cbwMEA(Lio/piupiu/chat/MainActivity$1;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity$1;->lambda$onUnlocked$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$gP6V2XYRm41Y2g83PMmYSSA-8v0(Lio/piupiu/chat/MainActivity$1;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity$1;->lambda$onAccountRequired$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$hARA5rn31Sc8vldf1psqcAQ2r5g(Lio/piupiu/chat/MainActivity$1;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity$1;->lambda$onFailure$1(Z)V

    return-void
.end method

.method constructor <init>(Lio/piupiu/chat/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 262
    iput-object p1, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onAccountInvalid$3()V
    .locals 2

    .line 301
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityCheckInProgress(Lio/piupiu/chat/MainActivity;Z)V

    .line 302
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityRejected(Lio/piupiu/chat/MainActivity;Z)V

    return-void
.end method

.method private synthetic lambda$onAccountRequired$2()V
    .locals 2

    .line 292
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityCheckInProgress(Lio/piupiu/chat/MainActivity;Z)V

    .line 293
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityRejected(Lio/piupiu/chat/MainActivity;Z)V

    return-void
.end method

.method private synthetic lambda$onFailure$1(Z)V
    .locals 2

    .line 282
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityCheckInProgress(Lio/piupiu/chat/MainActivity;Z)V

    .line 283
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0, p1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityRejected(Lio/piupiu/chat/MainActivity;Z)V

    if-eqz p1, :cond_0

    .line 284
    iget-object p1, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {p1}, Lio/piupiu/chat/KeepAliveService;->stop(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method private synthetic lambda$onUnlocked$0()V
    .locals 2

    .line 268
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityCheckInProgress(Lio/piupiu/chat/MainActivity;Z)V

    .line 269
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0, v1}, Lio/piupiu/chat/MainActivity;->-$$Nest$fputintegrityRejected(Lio/piupiu/chat/MainActivity;Z)V

    .line 270
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0}, Lio/piupiu/chat/MainActivity;->-$$Nest$mcompleteVerifiedStartup(Lio/piupiu/chat/MainActivity;)V

    return-void
.end method


# virtual methods
.method public onAccountInvalid(Ljava/lang/String;)V
    .locals 1

    .line 299
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0}, Lio/piupiu/chat/MainActivity;->-$$Nest$fgetprotectedFrontendManager(Lio/piupiu/chat/MainActivity;)Lio/piupiu/chat/ProtectedFrontendManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->markAccountInvalid(Ljava/lang/String;)V

    .line 300
    iget-object p1, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    new-instance v0, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda1;-><init>(Lio/piupiu/chat/MainActivity$1;)V

    invoke-virtual {p1, v0}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onAccountRequired()V
    .locals 2

    .line 290
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0}, Lio/piupiu/chat/MainActivity;->-$$Nest$fgetprotectedFrontendManager(Lio/piupiu/chat/MainActivity;)Lio/piupiu/chat/ProtectedFrontendManager;

    move-result-object v0

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->markAccountRequired()V

    .line 291
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    new-instance v1, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda0;-><init>(Lio/piupiu/chat/MainActivity$1;)V

    invoke-virtual {v0, v1}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onFailure(Ljava/lang/String;Z)V
    .locals 1

    .line 280
    iget-object v0, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {v0}, Lio/piupiu/chat/MainActivity;->-$$Nest$fgetprotectedFrontendManager(Lio/piupiu/chat/MainActivity;)Lio/piupiu/chat/ProtectedFrontendManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lio/piupiu/chat/ProtectedFrontendManager;->markError(Ljava/lang/String;Z)V

    .line 281
    iget-object p1, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    new-instance v0, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2}, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda2;-><init>(Lio/piupiu/chat/MainActivity$1;Z)V

    invoke-virtual {p1, v0}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onUnlocked([BZ)V
    .locals 1

    .line 266
    :try_start_0
    iget-object p2, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    invoke-static {p2}, Lio/piupiu/chat/MainActivity;->-$$Nest$fgetprotectedFrontendManager(Lio/piupiu/chat/MainActivity;)Lio/piupiu/chat/ProtectedFrontendManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->unlock([B)V

    .line 267
    iget-object p1, p0, Lio/piupiu/chat/MainActivity$1;->this$0:Lio/piupiu/chat/MainActivity;

    new-instance p2, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0}, Lio/piupiu/chat/MainActivity$1$$ExternalSyntheticLambda3;-><init>(Lio/piupiu/chat/MainActivity$1;)V

    invoke-virtual {p1, p2}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 273
    const-string p2, "PiuPiuIntegrity"

    const-string v0, "Protected frontend unlock failed"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 274
    const-string p1, "\u524d\u7aef\u8d44\u6e90\u6821\u9a8c\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u5b89\u88c5\u5b98\u65b9\u7248\u672c"

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lio/piupiu/chat/MainActivity$1;->onFailure(Ljava/lang/String;Z)V

    return-void
.end method
