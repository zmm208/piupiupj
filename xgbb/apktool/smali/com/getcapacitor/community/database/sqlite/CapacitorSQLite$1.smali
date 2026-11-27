.class Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;
.super Ljava/lang/Object;
.source "CapacitorSQLite.java"

# interfaces
.implements Lcom/getcapacitor/community/database/sqlite/SQLite/BiometricListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;-><init>(Landroid/content/Context;Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$context"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 87
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    iput-object p2, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailed()V
    .locals 3

    .line 115
    const-string v0, "MY_APP_TAG"

    const-string v1, "Error in authenticating biometric"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$mnotifyBiometricEvent(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/Boolean;Ljava/lang/String;)V

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

    .line 91
    :try_start_0
    const-string p1, "AndroidKeyStore"

    invoke-static {p1}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object p1

    const/4 v0, 0x0

    .line 92
    invoke-virtual {p1, v0}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 93
    invoke-virtual {p1}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object p1

    .line 94
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result p1

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    .line 95
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    new-instance v2, Landroidx/security/crypto/MasterKey$Builder;

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->val$context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroidx/security/crypto/MasterKey$Builder;-><init>(Landroid/content/Context;)V

    sget-object v3, Landroidx/security/crypto/MasterKey$KeyScheme;->AES256_GCM:Landroidx/security/crypto/MasterKey$KeyScheme;

    .line 96
    invoke-virtual {v2, v3}, Landroidx/security/crypto/MasterKey$Builder;->setKeyScheme(Landroidx/security/crypto/MasterKey$KeyScheme;)Landroidx/security/crypto/MasterKey$Builder;

    move-result-object v2

    const/4 v3, 0x5

    .line 97
    invoke-virtual {v2, v1, v3}, Landroidx/security/crypto/MasterKey$Builder;->setUserAuthenticationRequired(ZI)Landroidx/security/crypto/MasterKey$Builder;

    move-result-object v2

    .line 98
    invoke-virtual {v2}, Landroidx/security/crypto/MasterKey$Builder;->build()Landroidx/security/crypto/MasterKey;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fputmasterKeyAlias(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Landroidx/security/crypto/MasterKey;)V

    goto :goto_0

    .line 100
    :cond_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    new-instance v2, Landroidx/security/crypto/MasterKey$Builder;

    iget-object v3, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->val$context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroidx/security/crypto/MasterKey$Builder;-><init>(Landroid/content/Context;)V

    sget-object v3, Landroidx/security/crypto/MasterKey$KeyScheme;->AES256_GCM:Landroidx/security/crypto/MasterKey$KeyScheme;

    invoke-virtual {v2, v3}, Landroidx/security/crypto/MasterKey$Builder;->setKeyScheme(Landroidx/security/crypto/MasterKey$KeyScheme;)Landroidx/security/crypto/MasterKey$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/security/crypto/MasterKey$Builder;->build()Landroidx/security/crypto/MasterKey;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$fputmasterKeyAlias(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Landroidx/security/crypto/MasterKey;)V

    .line 102
    :goto_0
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$msetSharedPreferences(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;)V

    .line 103
    iget-object p1, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$mnotifyBiometricEvent(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 105
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 106
    const-string v0, "MY_APP_TAG"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite$1;->this$0:Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;->-$$Nest$mnotifyBiometricEvent(Lcom/getcapacitor/community/database/sqlite/CapacitorSQLite;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method
