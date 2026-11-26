.class public Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;
.super Ljava/lang/Object;
.source "UtilsBiometric.java"


# instance fields
.field private biometricManager:Landroidx/biometric/BiometricManager;

.field private biometricPrompt:Landroidx/biometric/BiometricPrompt;

.field private context:Landroid/content/Context;

.field private executor:Ljava/util/concurrent/Executor;

.field private listener:Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;

.field private promptInfo:Landroidx/biometric/BiometricPrompt$PromptInfo;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlistener(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->listener:Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/biometric/BiometricManager;Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "biometricManager",
            "listener"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->biometricManager:Landroidx/biometric/BiometricManager;

    .line 25
    iput-object p3, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->listener:Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;

    return-void
.end method

.method private setupBiometricPrompt(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "biometricTitle",
            "biometricSubTitle"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->executor:Ljava/util/concurrent/Executor;

    .line 82
    new-instance v0, Landroidx/biometric/BiometricPrompt;

    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    check-cast v1, Landroidx/fragment/app/FragmentActivity;

    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->executor:Ljava/util/concurrent/Executor;

    new-instance v3, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;

    invoke-direct {v3, p0}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric$1;-><init>(Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;)V

    invoke-direct {v0, v1, v2, v3}, Landroidx/biometric/BiometricPrompt;-><init>(Landroidx/fragment/app/FragmentActivity;Ljava/util/concurrent/Executor;Landroidx/biometric/BiometricPrompt$AuthenticationCallback;)V

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->biometricPrompt:Landroidx/biometric/BiometricPrompt;

    .line 109
    new-instance v0, Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;

    invoke-direct {v0}, Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;-><init>()V

    .line 110
    invoke-virtual {v0, p1}, Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;

    move-result-object p1

    .line 111
    invoke-virtual {p1, p2}, Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;->setSubtitle(Ljava/lang/CharSequence;)Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;

    move-result-object p1

    const p2, 0x800f

    .line 112
    invoke-virtual {p1, p2}, Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;->setAllowedAuthenticators(I)Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;

    move-result-object p1

    .line 113
    invoke-virtual {p1}, Landroidx/biometric/BiometricPrompt$PromptInfo$Builder;->build()Landroidx/biometric/BiometricPrompt$PromptInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->promptInfo:Landroidx/biometric/BiometricPrompt$PromptInfo;

    return-void
.end method


# virtual methods
.method public checkBiometricIsAvailable()Z
    .locals 5

    const/4 v0, 0x0

    .line 33
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    invoke-static {v1}, Landroidx/biometric/BiometricManager;->from(Landroid/content/Context;)Landroidx/biometric/BiometricManager;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->biometricManager:Landroidx/biometric/BiometricManager;

    const v2, 0x800f

    .line 36
    invoke-virtual {v1, v2}, Landroidx/biometric/BiometricManager;->canAuthenticate(I)I

    move-result v1

    const-string v2, "App can authenticate using biometrics."

    const-string v3, "MY_APP_TAG"

    const/4 v4, 0x1

    if-eqz v1, :cond_3

    if-eq v1, v4, :cond_2

    const/16 v2, 0xb

    if-eq v1, v2, :cond_1

    const/16 v2, 0xc

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 48
    :cond_0
    const-string v1, "No biometric features available on this device."

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    invoke-static {v2, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 58
    :cond_1
    const-string v1, "The user hasn\'t associated any biometric credentials with their account.."

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object v2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    invoke-static {v2, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 53
    :cond_2
    const-string v1, "Biometric features are currently unavailable."

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    iget-object v1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 42
    :cond_3
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->context:Landroid/content/Context;

    invoke-static {v0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 44
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 62
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public showBiometricDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "biometricTitle",
            "biometricSubTitle"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->setupBiometricPrompt(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    :try_start_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->biometricPrompt:Landroidx/biometric/BiometricPrompt;

    iget-object p2, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsBiometric;->promptInfo:Landroidx/biometric/BiometricPrompt$PromptInfo;

    invoke-virtual {p1, p2}, Landroidx/biometric/BiometricPrompt;->authenticate(Landroidx/biometric/BiometricPrompt$PromptInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    new-instance p2, Ljava/lang/Exception;

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method
