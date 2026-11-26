.class final Lio/piupiu/chat/FrontendLicenseManager;
.super Ljava/lang/Object;
.source "FrontendLicenseManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/piupiu/chat/FrontendLicenseManager$Callback;,
        Lio/piupiu/chat/FrontendLicenseManager$LicenseException;
    }
.end annotation


# static fields
.field private static final ATTESTATION_ACTIVE_ALIAS:Ljava/lang/String; = "attestation_active_alias_v1"

.field private static final ATTESTATION_CACHED_LICENSE:Ljava/lang/String; = "attestation_cached_license_v1"

.field private static final ATTESTATION_INSTALLATION_ID:Ljava/lang/String; = "attestation_installation_id_v1"

.field private static final ATTESTATION_KEY_ALIAS_A:Ljava/lang/String; = "piupiu_frontend_attested_a_v1"

.field private static final ATTESTATION_KEY_ALIAS_B:Ljava/lang/String; = "piupiu_frontend_attested_b_v1"

.field private static final ATTESTATION_UNVERIFIED_KEY_ALIAS:Ljava/lang/String; = "piupiu_frontend_unverified_v1"

.field private static final BACKGROUND_RENEWAL_DELAY_MS:I = 0x7530

.field private static final CACHED_LICENSE_COMPAT:Ljava/lang/String; = "cached_license_v2"

.field private static final CACHED_LICENSE_V1:Ljava/lang/String; = "cached_license"

.field private static final CHALLENGE_URL:Ljava/lang/String; = "https://www.piupiuchan.top/includes/frontend_attestation_challenge.php"

.field private static final DEVICE_KEY_ALIAS_COMPAT:Ljava/lang/String; = "piupiu_frontend_device_v2"

.field private static final DEVICE_KEY_ALIAS_V1:Ljava/lang/String; = "piupiu_frontend_device_v1"

.field private static final INSTALLATION_ID_COMPAT:Ljava/lang/String; = "installation_id_v2"

.field private static final INSTALLATION_ID_V1:Ljava/lang/String; = "installation_id"

.field private static final ISSUE_URL:Ljava/lang/String; = "https://www.piupiuchan.top/includes/frontend_attestation_issue.php"

.field private static final LICENSE_ISSUE_READ_TIMEOUT_MS:I = 0x1f40

.field private static final NETWORK_TIMEOUT_MS:I = 0xfa0

.field private static final PREFS:Ljava/lang/String; = "piupiu_frontend_license"

.field private static final RENEWAL_WINDOW_SECONDS:J = 0xa8c0L

.field private static final STARTUP_WATCHDOG_MS:I = 0x3a98

.field private static final TAG:Ljava/lang/String; = "PiuPiuFrontendLicense"

.field private static final V3_ACCOUNT_KEY_ALIAS:Ljava/lang/String; = "piupiu_frontend_account_v3"

.field private static final V3_ATTESTED_KEY_ALIAS_A:Ljava/lang/String; = "piupiu_frontend_attested_a_v3"

.field private static final V3_ATTESTED_KEY_ALIAS_B:Ljava/lang/String; = "piupiu_frontend_attested_b_v3"

.field private static final V3_CACHED_KEY_ALIAS:Ljava/lang/String; = "cached_key_alias_v3"

.field private static final V3_CACHED_LICENSE:Ljava/lang/String; = "cached_license_v3"

.field private static final V3_CHALLENGE_URL:Ljava/lang/String; = "https://www.piupiuchan.top/includes/frontend_v3_challenge.php"

.field private static final V3_INSTALLATION_ID:Ljava/lang/String; = "installation_id_v3"

.field private static final V3_ISSUE_URL:Ljava/lang/String; = "https://www.piupiuchan.top/includes/frontend_v3_issue.php"

.field private static final V3_UNVERIFIED_KEY_ALIAS:Ljava/lang/String; = "piupiu_frontend_unverified_v3"


# instance fields
.field private volatile accountAccessToken:Ljava/lang/String;

.field private volatile accountDeviceId:Ljava/lang/String;

.field private final backgroundRenewal:Ljava/lang/Runnable;

.field private final backgroundV3Renewal:Ljava/lang/Runnable;

.field private volatile callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

.field private final context:Landroid/content/Context;

.field private final executor:Ljava/util/concurrent/ExecutorService;

.field private volatile forceAccountMode:Z

.field private final frontend:Lio/piupiu/chat/ProtectedFrontendManager;

.field private final mainHandler:Landroid/os/Handler;

.field private final preferences:Landroid/content/SharedPreferences;

.field private final requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final retryQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final startupWatchdog:Ljava/lang/Runnable;


# direct methods
.method public static synthetic $r8$lambda$-HPx_X30gNqmHN5Jo4uoWJYfBT4(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$startV3$7()V

    return-void
.end method

.method public static synthetic $r8$lambda$0AYnHYMshuVG30T0bbw3FD3Bz5k(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$new$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$3Jq4PffIIgGhEOkalInCUaRj8ss(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$retry$6()V

    return-void
.end method

.method public static synthetic $r8$lambda$6UZWXD0BNMDPOeKg2vs0TWuYO-w(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$start$5()V

    return-void
.end method

.method public static synthetic $r8$lambda$Op09wwD61V-Het14Y5S5wS5EUyQ(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$new$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$R1TgskpGUJdGPQtvE5qAIkoTouk(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$retryV3$8()V

    return-void
.end method

.method public static synthetic $r8$lambda$UPmBzdLRu8-61oO421lybZ9B0Bc(Lio/piupiu/chat/FrontendLicenseManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$requestFreshV3$9(Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$XYiEJy81MxH15nCIv5Ta7VQFNIw(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$new$3()V

    return-void
.end method

.method public static synthetic $r8$lambda$rSp8lGis1ydjN6xRs8jRS3TkP0c(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$new$4()V

    return-void
.end method

.method public static synthetic $r8$lambda$tuOjOSqsuTiBQQqJRumXrEBUB24(Lio/piupiu/chat/FrontendLicenseManager;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->lambda$new$0()V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lio/piupiu/chat/ProtectedFrontendManager;)V
    .locals 3

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    .line 90
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    .line 92
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    .line 95
    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountDeviceId:Ljava/lang/String;

    .line 97
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->retryQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 98
    new-instance v0, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda6;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    .line 105
    new-instance v0, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda7;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundRenewal:Ljava/lang/Runnable;

    .line 108
    new-instance v0, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda8;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundV3Renewal:Ljava/lang/Runnable;

    .line 112
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    .line 113
    iput-object p2, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 114
    const-string p2, "piupiu_frontend_license"

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    return-void
.end method

.method private static activeCachedLicense()Ljava/lang/String;
    .locals 1

    .line 859
    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->usesCompatibilityProfile()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "cached_license_v2"

    return-object v0

    :cond_0
    const-string v0, "cached_license"

    return-object v0
.end method

.method private static activeDeviceKeyAlias()Ljava/lang/String;
    .locals 1

    .line 863
    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->usesCompatibilityProfile()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "piupiu_frontend_device_v2"

    return-object v0

    :cond_0
    const-string v0, "piupiu_frontend_device_v1"

    return-object v0
.end method

.method private static activeDeviceKeySize()I
    .locals 1

    .line 867
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Lio/piupiu/chat/FrontendLicenseManager;->deviceKeySizeForSdk(I)I

    move-result v0

    return v0
.end method

.method private static activeInstallationId()Ljava/lang/String;
    .locals 1

    .line 855
    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->usesCompatibilityProfile()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "installation_id_v2"

    return-object v0

    :cond_0
    const-string v0, "installation_id"

    return-object v0
.end method

.method private beginStage(Ljava/lang/String;)V
    .locals 3

    .line 217
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 218
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->markChecking(Ljava/lang/String;)V

    .line 219
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 220
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    const-wide/16 v1, 0x3a98

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    :goto_0
    return-void
.end method

.method static businessKeyAlias(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 733
    const-string v0, "piupiu_frontend_license"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 734
    const-string v0, "cached_key_alias_v3"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 735
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    if-eqz p0, :cond_0

    .line 736
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p0}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 738
    :cond_0
    const-string p0, "piupiu_frontend_account_v3"

    return-object p0
.end method

.method static businessLicense(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .line 747
    const-string v0, "piupiu_frontend_license"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 748
    const-string v0, "cached_key_alias_v3"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 749
    :cond_0
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    const-string v2, "cached_license_v3"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    return-object v0
.end method

.method static varargs canonical([Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 936
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 937
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    if-lez v1, :cond_0

    const/16 v2, 0xa

    .line 938
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 939
    :cond_0
    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 941
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static createAttestedDeviceKey(Ljava/lang/String;[B)Ljava/security/KeyPair;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 778
    const-string v0, "RSA"

    const-string v1, "AndroidKeyStore"

    invoke-static {v0, v1}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v0

    .line 780
    new-instance v2, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    const/4 v3, 0x6

    invoke-direct {v2, p0, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x800

    .line 782
    invoke-virtual {v2, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setKeySize(I)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "SHA-1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "SHA-256"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    .line 783
    invoke-virtual {v2, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setDigests([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "OAEPPadding"

    aput-object v4, v3, v5

    .line 784
    invoke-virtual {v2, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "PKCS1"

    aput-object v4, v3, v5

    .line 785
    invoke-virtual {v2, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setSignaturePaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v2

    .line 786
    invoke-virtual {v2, p1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setAttestationChallenge([B)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    .line 787
    invoke-virtual {p1, v5}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setUserAuthenticationRequired(Z)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    .line 788
    invoke-virtual {p1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    move-result-object p1

    .line 789
    invoke-virtual {v0, p1}, Ljava/security/KeyPairGenerator;->initialize(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 790
    invoke-virtual {v0}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    .line 791
    invoke-static {v1}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object p1

    const/4 v0, 0x0

    .line 792
    invoke-virtual {p1, v0}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 793
    invoke-static {p1, p0}, Lio/piupiu/chat/FrontendLicenseManager;->readDeviceKey(Ljava/security/KeyStore;Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object p0

    return-object p0
.end method

.method private deleteDeviceKey(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 803
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v1, 0x0

    .line 804
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 805
    invoke-virtual {v0, p1}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static deviceKeySizeForSdk(I)I
    .locals 0

    .line 871
    invoke-static {p0}, Lio/piupiu/chat/FrontendLicenseManager;->usesCompatibilityProfile(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 p0, 0x800

    return p0

    :cond_0
    const/16 p0, 0xc00

    return p0
.end method

.method private diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    if-nez p2, :cond_0

    .line 555
    const-string p2, "none"

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    .line 556
    :goto_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v0

    .line 557
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xc

    if-le v1, v2, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 558
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "event="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " bundle="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " error="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "PiuPiuFrontendLicense"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 797
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v1, 0x0

    .line 798
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 799
    invoke-virtual {v0, p1}, Ljava/security/KeyStore;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;

    move-result-object p1

    return-object p1
.end method

.method private getCurrentAppSignatureSha256()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 876
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 877
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    .line 878
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/high16 v3, 0x8000000

    .line 877
    invoke-virtual {v0, v1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 879
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signingInfo:Landroid/content/pm/SigningInfo;

    invoke-virtual {v0}, Landroid/content/pm/SigningInfo;->getApkContentsSigners()[Landroid/content/pm/Signature;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    goto :goto_0

    .line 882
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    .line 883
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x40

    .line 882
    invoke-virtual {v0, v1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 884
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    .line 887
    :goto_0
    invoke-static {v0}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getExistingDeviceKey(Ljava/lang/String;)Ljava/security/KeyPair;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 809
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v1, 0x0

    .line 810
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 811
    invoke-virtual {v0, p1}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    .line 812
    :cond_0
    invoke-static {v0, p1}, Lio/piupiu/chat/FrontendLicenseManager;->readDeviceKey(Ljava/security/KeyStore;Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object p1

    return-object p1
.end method

.method static getOrCreateDeviceKey(Ljava/lang/String;I)Ljava/security/KeyPair;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 754
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    const/4 v2, 0x0

    .line 755
    invoke-virtual {v1, v2}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 756
    invoke-virtual {v1, p0}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 757
    const-string v3, "RSA"

    invoke-static {v3, v0}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v0

    .line 758
    new-instance v3, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    const/4 v4, 0x6

    invoke-direct {v3, p0, v4}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    .line 761
    invoke-virtual {v3, p1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setKeySize(I)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "SHA-1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "SHA-256"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    .line 762
    invoke-virtual {p1, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setDigests([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "OAEPPadding"

    aput-object v4, v3, v5

    .line 763
    invoke-virtual {p1, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "PKCS1"

    aput-object v4, v3, v5

    .line 764
    invoke-virtual {p1, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setSignaturePaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    .line 765
    invoke-virtual {p1, v5}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setUserAuthenticationRequired(Z)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object p1

    .line 766
    invoke-virtual {p1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    move-result-object p1

    .line 767
    invoke-virtual {v0, p1}, Ljava/security/KeyPairGenerator;->initialize(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 768
    invoke-virtual {v0}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    .line 769
    invoke-virtual {v1, v2}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 771
    :cond_0
    invoke-static {v1, p0}, Lio/piupiu/chat/FrontendLicenseManager;->readDeviceKey(Ljava/security/KeyStore;Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object p0

    return-object p0
.end method

.method private getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 838
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 839
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    return-object v0

    .line 840
    :cond_1
    :goto_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 841
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-object v0
.end method

.method static isAccountSessionError(Ljava/lang/String;)Z
    .locals 1

    .line 549
    const-string v0, "session_invalid"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "session_missing"

    .line 550
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "account_auth_required"

    .line 551
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method static isAttestedV3Alias(Ljava/lang/String;)Z
    .locals 1

    .line 465
    const-string v0, "piupiu_frontend_attested_a_v3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "piupiu_frontend_attested_b_v3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method static isSignatureCheckEnabled(Ljava/lang/Object;)Z
    .locals 1

    .line 461
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private synthetic lambda$new$0()V
    .locals 4

    .line 99
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    if-eqz v0, :cond_0

    .line 100
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    const-string v1, "PiuPiuFrontendLicense"

    const-string v2, "Frontend license startup timed out"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const-string v1, "\u89e3\u9501\u8017\u65f6\u8f83\u957f\uff0c\u8bf7\u91cd\u8bd5"

    invoke-interface {v0, v1, v3}, Lio/piupiu/chat/FrontendLicenseManager$Callback;->onFailure(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method private synthetic lambda$new$1()V
    .locals 1

    const/4 v0, 0x0

    .line 106
    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshLicense(Z)V

    return-void
.end method

.method private synthetic lambda$new$2()V
    .locals 2

    .line 106
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda0;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private synthetic lambda$new$3()V
    .locals 1

    const/4 v0, 0x0

    .line 109
    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshV3(Z)V

    return-void
.end method

.method private synthetic lambda$new$4()V
    .locals 2

    .line 109
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda1;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private synthetic lambda$requestFreshV3$9(Z)V
    .locals 0

    .line 449
    invoke-direct {p0, p1}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshV3(Z)V

    return-void
.end method

.method private synthetic lambda$retry$6()V
    .locals 1

    const/4 v0, 0x1

    .line 192
    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshLicense(Z)V

    return-void
.end method

.method private synthetic lambda$retryV3$8()V
    .locals 2

    .line 286
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->retryQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 287
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 288
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 289
    const-string v0, "\u6b63\u5728\u8fde\u63a5\u6388\u6743\u670d\u52a1..."

    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->beginStage(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 290
    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshV3(Z)V

    return-void
.end method

.method private synthetic lambda$start$5()V
    .locals 11

    .line 128
    const-string v1, "PiuPiuFrontendLicense"

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 131
    :try_start_0
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->readCachedAttestedLicense()[B

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v0, :cond_0

    .line 135
    :try_start_1
    invoke-direct {p0, v0, v2}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_1} :catch_0

    move v0, v2

    move v3, v0

    goto :goto_0

    :catch_0
    move-exception v0

    move v3, v2

    goto :goto_1

    :catch_1
    move-exception v0

    move v3, v2

    goto :goto_2

    :cond_0
    move v0, v3

    :goto_0
    move v4, v0

    goto :goto_3

    :catch_2
    move-exception v0

    :goto_1
    move v4, v3

    .line 141
    const-string v5, "Cached attested license runtime is incompatible"

    invoke-static {v1, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    :catch_3
    move-exception v0

    :goto_2
    move v4, v3

    .line 138
    const-string v5, "Cached attested frontend license was rejected"

    invoke-static {v1, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 139
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v5, "attestation_cached_license_v1"

    invoke-interface {v0, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v5, "attestation_active_alias_v1"

    invoke-interface {v0, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_3
    if-nez v3, :cond_1

    .line 145
    :try_start_2
    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->activeCachedLicense()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->activeInstallationId()Ljava/lang/String;

    move-result-object v7

    .line 146
    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->activeDeviceKeyAlias()Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->activeDeviceKeySize()I

    move-result v10
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/lang/LinkageError; {:try_start_2 .. :try_end_2} :catch_8

    const/4 v9, 0x1

    move-object v5, p0

    .line 145
    :try_start_3
    invoke-direct/range {v5 .. v10}, Lio/piupiu/chat/FrontendLicenseManager;->readCachedLicense(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)[B

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_3} :catch_6

    if-eqz v0, :cond_2

    .line 149
    :try_start_4
    invoke-direct {p0, v0, v2}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/LinkageError; {:try_start_4 .. :try_end_4} :catch_4

    move v3, v2

    goto :goto_6

    :catch_4
    move-exception v0

    move v3, v2

    goto :goto_4

    :catch_5
    move-exception v0

    move v3, v2

    goto :goto_5

    :catch_6
    move-exception v0

    goto :goto_4

    :catch_7
    move-exception v0

    goto :goto_5

    :catch_8
    move-exception v0

    move-object v5, p0

    .line 156
    :goto_4
    const-string v6, "Cached frontend license runtime is incompatible"

    invoke-static {v1, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    :catch_9
    move-exception v0

    move-object v5, p0

    .line 153
    :goto_5
    const-string v6, "Cached frontend license was rejected"

    invoke-static {v1, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 154
    iget-object v0, v5, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->activeCachedLicense()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_6

    :cond_1
    move-object v5, p0

    :cond_2
    :goto_6
    if-nez v3, :cond_3

    .line 160
    invoke-static {}, Lio/piupiu/chat/FrontendLicenseManager;->usesCompatibilityProfile()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 162
    :try_start_5
    const-string v6, "cached_license"

    const-string v7, "installation_id"

    const-string v8, "piupiu_frontend_device_v1"

    const/4 v9, 0x0

    const/16 v10, 0xc00

    invoke-direct/range {v5 .. v10}, Lio/piupiu/chat/FrontendLicenseManager;->readCachedLicense(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)[B

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_d
    .catch Ljava/lang/LinkageError; {:try_start_5 .. :try_end_5} :catch_c

    if-eqz v0, :cond_3

    .line 166
    :try_start_6
    invoke-direct {p0, v0, v2}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_b
    .catch Ljava/lang/LinkageError; {:try_start_6 .. :try_end_6} :catch_a

    move v3, v2

    goto :goto_9

    :catch_a
    move-exception v0

    move v3, v2

    goto :goto_7

    :catch_b
    move-exception v0

    move v3, v2

    goto :goto_8

    :catch_c
    move-exception v0

    .line 171
    :goto_7
    const-string v6, "Legacy cached frontend license runtime is incompatible"

    invoke-static {v1, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    :catch_d
    move-exception v0

    .line 169
    :goto_8
    const-string v6, "Legacy cached frontend license was rejected"

    invoke-static {v1, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_9
    if-nez v3, :cond_4

    .line 175
    invoke-direct {p0, v2}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshLicense(Z)V

    goto :goto_a

    :cond_4
    if-eqz v4, :cond_5

    .line 176
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->shouldRenewCachedAttestedLicense()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 177
    :cond_5
    iget-object v0, v5, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, v5, Lio/piupiu/chat/FrontendLicenseManager;->backgroundRenewal:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_6
    :goto_a
    return-void
.end method

.method private synthetic lambda$startV3$7()V
    .locals 5

    .line 255
    const-string v0, "\u6b63\u5728\u8bfb\u53d6\u672c\u5730\u6388\u6743..."

    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->beginStage(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 257
    :try_start_0
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->readCachedV3License()[B

    move-result-object v1

    if-eqz v1, :cond_4

    .line 259
    iget-object v2, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "cached_key_alias_v3"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 260
    iget-object v3, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    invoke-static {v3, v2}, Lio/piupiu/chat/FrontendLicenseManager;->businessLicense(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 261
    const-string v4, "piupiu_frontend_unverified_v3"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    if-eqz v3, :cond_0

    const-string v2, "account"

    const-string v4, "verification_level"

    .line 262
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v0

    .line 263
    :goto_1
    const-string v3, "LIC_V3_CACHE_HIT"

    const/4 v4, 0x0

    invoke-direct {p0, v3, v4}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 264
    invoke-direct {p0, v1, v0}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V

    if-nez v2, :cond_3

    .line 268
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->shouldRenewV3License()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    return-void

    .line 269
    :cond_3
    :goto_2
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v2, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundV3Renewal:Ljava/lang/Runnable;

    const-wide/16 v3, 0x7530

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 274
    const-string v2, "LIC_V3_CACHE_REJECT"

    invoke-direct {p0, v2, v1}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 279
    :cond_4
    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->requestFreshV3(Z)V

    return-void
.end method

.method private varargs postForm(Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 891
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    .line 892
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_1

    .line 893
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0x26

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 894
    :cond_0
    aget-object v3, p2, v2

    const-string v4, "UTF-8"

    invoke-static {v3, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x3d

    .line 895
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v2, 0x1

    .line 896
    aget-object v3, p2, v3

    invoke-static {v3, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 898
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 899
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 901
    :try_start_0
    const-string v2, "POST"

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v2, 0xfa0

    .line 902
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 903
    const-string v3, "https://www.piupiuchan.top/includes/frontend_v3_issue.php"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "https://www.piupiuchan.top/includes/frontend_attestation_issue.php"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const/16 v2, 0x1f40

    :cond_3
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 905
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const/4 p1, 0x1

    .line 906
    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 907
    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 908
    const-string v2, "Content-Type"

    const-string v3, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 909
    array-length v2, p2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 910
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    invoke-virtual {v2, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_4

    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 911
    :cond_4
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p2

    const/16 v2, 0xc8

    if-lt p2, v2, :cond_5

    const/16 v3, 0x190

    if-ge p2, v3, :cond_5

    .line 912
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    goto :goto_1

    :cond_5
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    .line 913
    :goto_1
    invoke-static {v3}, Lio/piupiu/chat/FrontendLicenseManager;->readUtf8(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    .line 914
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    if-lt p2, v2, :cond_7

    const/16 v2, 0x12c

    if-ge p2, v2, :cond_7

    .line 915
    const-string v2, "success"

    const-string v3, "status"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-nez v2, :cond_6

    goto :goto_2

    .line 921
    :cond_6
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v4

    .line 916
    :cond_7
    :goto_2
    :try_start_3
    new-instance v2, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;

    const-string v3, "message"

    const-string v5, "\u6b63\u7248\u9a8c\u8bc1\u5931\u8d25"

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x191

    if-eq p2, v5, :cond_8

    const/16 v5, 0x193

    if-ne p2, v5, :cond_9

    :cond_8
    move v1, p1

    :cond_9
    const-string p1, "code"

    const-string p2, ""

    .line 917
    invoke-virtual {v4, p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, v3, v1, p1}, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catchall_0
    move-exception p1

    if-eqz v2, :cond_a

    .line 910
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p2

    :try_start_5
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_3
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    .line 921
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 922
    throw p1
.end method

.method static previousBusinessKeyAlias(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 742
    const-string v0, "piupiu_frontend_license"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "migration_from_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    .line 743
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private readCachedAttestedLicense()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 668
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "attestation_cached_license_v1"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 669
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "attestation_active_alias_v1"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 670
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 671
    :cond_0
    const-string v3, "piupiu_frontend_unverified_v1"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v2

    .line 672
    :cond_1
    invoke-direct {p0, v1}, Lio/piupiu/chat/FrontendLicenseManager;->getExistingDeviceKey(Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object v1

    if-nez v1, :cond_2

    return-object v2

    .line 674
    :cond_2
    const-string v2, "attestation_installation_id_v1"

    invoke-direct {p0, v2}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 675
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v0

    .line 676
    invoke-virtual {v1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v1

    invoke-interface {v1}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v1

    invoke-static {v1}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v1

    .line 675
    invoke-direct {p0, v3, v0, v1, v2}, Lio/piupiu/chat/FrontendLicenseManager;->verifyAndUnwrapLicense(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    :cond_3
    :goto_0
    return-object v2
.end method

.method private readCachedLicense(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 659
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 660
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    if-eqz p4, :cond_1

    .line 661
    invoke-static {p3, p5}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateDeviceKey(Ljava/lang/String;I)Ljava/security/KeyPair;

    move-result-object p3

    goto :goto_0

    :cond_1
    invoke-direct {p0, p3}, Lio/piupiu/chat/FrontendLicenseManager;->getExistingDeviceKey(Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object p3

    :goto_0
    if-nez p3, :cond_2

    return-object v0

    .line 663
    :cond_2
    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object p1

    .line 664
    invoke-virtual {p3}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object p3

    invoke-interface {p3}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object p3

    invoke-static {p3}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p2}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 663
    invoke-direct {p0, p4, p1, p3, p2}, Lio/piupiu/chat/FrontendLicenseManager;->verifyAndUnwrapLicense(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object p1

    return-object p1

    :cond_3
    :goto_1
    return-object v0
.end method

.method private readCachedV3License()[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 469
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "cached_license_v3"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 470
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "cached_key_alias_v3"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 471
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 475
    :cond_0
    invoke-direct {p0, v1}, Lio/piupiu/chat/FrontendLicenseManager;->getExistingDeviceKey(Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v2

    .line 477
    :cond_1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 478
    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v5

    invoke-virtual {v1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v0

    invoke-interface {v0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v0

    invoke-static {v0}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v6

    const-string v0, "installation_id_v3"

    .line 479
    invoke-direct {p0, v0}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "verification_level"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v3, p0

    .line 478
    invoke-direct/range {v3 .. v8}, Lio/piupiu/chat/FrontendLicenseManager;->verifyAndUnwrapV3License(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    :cond_2
    :goto_0
    return-object v2
.end method

.method private static readDeviceKey(Ljava/security/KeyStore;Ljava/lang/String;)Ljava/security/KeyPair;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 816
    invoke-virtual {p0, p1, v0}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v0

    check-cast v0, Ljava/security/PrivateKey;

    .line 817
    invoke-virtual {p0, p1}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object p0

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 819
    new-instance p1, Ljava/security/KeyPair;

    invoke-virtual {p0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object p0

    invoke-direct {p1, p0, v0}, Ljava/security/KeyPair;-><init>(Ljava/security/PublicKey;Ljava/security/PrivateKey;)V

    return-object p1

    .line 818
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Device license key unavailable"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private readLicenseServerPublicKey()Ljava/security/PublicKey;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 823
    const-string v0, ""

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lio/piupiu/chat/R$raw;->frontend_license_public:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 824
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v3, 0x1000

    .line 825
    :try_start_1
    new-array v3, v3, [B

    .line 827
    :cond_0
    :goto_0
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, 0x0

    if-ltz v4, :cond_1

    if-lez v4, :cond_0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 828
    :cond_1
    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "-----BEGIN PUBLIC KEY-----"

    .line 829
    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "-----END PUBLIC KEY-----"

    .line 830
    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\s+"

    .line 831
    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 832
    const-string v3, "RSA"

    invoke-static {v3}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v3

    new-instance v4, Ljava/security/spec/X509EncodedKeySpec;

    .line 833
    invoke-static {v0, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 832
    invoke-virtual {v3, v4}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 834
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_2
    return-object v0

    :catchall_0
    move-exception v0

    .line 823
    :try_start_3
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz v1, :cond_3

    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v0
.end method

.method private static readUtf8(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p0, :cond_0

    .line 926
    const-string p0, "{}"

    return-object p0

    .line 927
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v1, 0x1000

    .line 928
    :try_start_1
    new-array v1, v1, [B

    .line 930
    :cond_1
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-ltz v2, :cond_2

    if-lez v2, :cond_1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 931
    :cond_2
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 932
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_3
    return-object v1

    :catchall_0
    move-exception v1

    .line 927
    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz p0, :cond_4

    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p0

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    throw v0
.end method

.method private reportAccountInvalid(Ljava/lang/String;)V
    .locals 3

    .line 539
    const-string v0, ""

    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    .line 540
    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountDeviceId:Ljava/lang/String;

    .line 541
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 542
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 543
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_1

    .line 544
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 545
    :cond_1
    const-string p1, "\u767b\u5f55\u72b6\u6001\u5df2\u5931\u6548\uff0c\u8bf7\u91cd\u65b0\u767b\u5f55"

    .line 544
    :cond_2
    invoke-interface {v0, p1}, Lio/piupiu/chat/FrontendLicenseManager$Callback;->onAccountInvalid(Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private reportAccountRequired()V
    .locals 3

    .line 532
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 533
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 534
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    if-eqz v0, :cond_1

    .line 535
    invoke-interface {v0}, Lio/piupiu/chat/FrontendLicenseManager$Callback;->onAccountRequired()V

    :cond_1
    :goto_0
    return-void
.end method

.method private reportFailure(Ljava/lang/String;Z)V
    .locals 3

    .line 651
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 652
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 653
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    if-eqz v0, :cond_1

    .line 654
    invoke-interface {v0, p1, p2}, Lio/piupiu/chat/FrontendLicenseManager$Callback;->onFailure(Ljava/lang/String;Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method private reportUnlocked([BZ)V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 640
    :try_start_0
    const-string v2, "\u6b63\u5728\u6821\u9a8c\u5e94\u7528\u8d44\u6e90..."

    invoke-direct {p0, v2}, Lio/piupiu/chat/FrontendLicenseManager;->beginStage(Ljava/lang/String;)V

    .line 641
    iget-object v2, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    if-eqz v2, :cond_0

    .line 642
    invoke-interface {v2, p1, p2}, Lio/piupiu/chat/FrontendLicenseManager$Callback;->onUnlocked([BZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 644
    :cond_0
    invoke-static {p1, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 645
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 646
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object p2, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p2

    .line 644
    invoke-static {p1, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 645
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 646
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 647
    throw p2
.end method

.method private requestFreshLicense(Z)V
    .locals 26

    move-object/from16 v1, p0

    .line 562
    const-string v0, "piupiu_frontend_attested_a_v1"

    const-string v2, "challenge_id"

    const-string v3, "bundle_sha256"

    const-string v4, "bundle_version"

    const-string v5, "attestation_installation_id_v1"

    const-string v6, "installation_id"

    const-string v7, "PiuPiuFrontendLicense"

    iget-object v8, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v8

    if-nez v8, :cond_0

    goto/16 :goto_5

    .line 564
    :cond_0
    :try_start_0
    const-string v8, "https://www.piupiuchan.top/includes/frontend_attestation_challenge.php"

    const/4 v11, 0x6

    new-array v12, v11, [Ljava/lang/String;

    aput-object v6, v12, v9

    .line 565
    invoke-direct {v1, v5}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v10

    const/4 v13, 0x2

    aput-object v4, v12, v13

    iget-object v14, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 566
    invoke-virtual {v14}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    aput-object v14, v12, v15

    const/4 v14, 0x4

    aput-object v3, v12, v14

    move/from16 v16, v10

    iget-object v10, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 567
    invoke-virtual {v10}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v10

    const/16 v17, 0x5

    aput-object v10, v12, v17

    .line 564
    invoke-direct {v1, v8, v12}, Lio/piupiu/chat/FrontendLicenseManager;->postForm(Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 569
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 570
    const-string v12, "challenge"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    move/from16 v18, v11

    .line 571
    invoke-static {v12, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v11

    move/from16 v19, v14

    .line 572
    array-length v14, v11

    move/from16 v20, v15

    const/16 v15, 0x20

    if-ne v14, v15, :cond_5

    .line 574
    const-string v14, "signature_check_enabled"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lio/piupiu/chat/FrontendLicenseManager;->isSignatureCheckEnabled(Ljava/lang/Object;)Z

    move-result v8

    .line 577
    new-instance v14, Lorg/json/JSONArray;

    invoke-direct {v14}, Lorg/json/JSONArray;-><init>()V
    :try_end_0
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move/from16 v21, v9

    .line 578
    const-string v9, "attestation_active_alias_v1"

    if-nez v8, :cond_1

    .line 579
    :try_start_1
    const-string v0, "piupiu_frontend_unverified_v1"

    const/16 v8, 0x800

    .line 580
    invoke-static {v0, v8}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateDeviceKey(Ljava/lang/String;I)Ljava/security/KeyPair;

    move-result-object v8

    :goto_0
    move-object/from16 v24, v2

    goto :goto_2

    .line 582
    :cond_1
    iget-object v8, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v15, ""

    invoke-interface {v8, v9, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 583
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 584
    const-string v0, "piupiu_frontend_attested_b_v1"

    .line 585
    :cond_2
    invoke-direct {v1, v0}, Lio/piupiu/chat/FrontendLicenseManager;->deleteDeviceKey(Ljava/lang/String;)V

    .line 586
    invoke-static {v0, v11}, Lio/piupiu/chat/FrontendLicenseManager;->createAttestedDeviceKey(Ljava/lang/String;[B)Ljava/security/KeyPair;

    move-result-object v8

    .line 587
    invoke-direct {v1, v0}, Lio/piupiu/chat/FrontendLicenseManager;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;

    move-result-object v11

    if-eqz v11, :cond_4

    .line 588
    array-length v15, v11

    if-lt v15, v13, :cond_4

    array-length v15, v11

    const/16 v13, 0x8

    if-gt v15, v13, :cond_4

    .line 591
    array-length v13, v11

    move/from16 v15, v21

    :goto_1
    if-ge v15, v13, :cond_3

    aget-object v24, v11, v15

    move-object/from16 v25, v0

    .line 592
    invoke-virtual/range {v24 .. v24}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v0

    move-object/from16 v24, v2

    const/4 v2, 0x2

    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v2, v24

    move-object/from16 v0, v25

    goto :goto_1

    :cond_3
    move-object/from16 v25, v0

    goto :goto_0

    .line 596
    :goto_2
    invoke-direct {v1, v5}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 597
    invoke-virtual {v8}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v5

    invoke-interface {v5}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v5

    const/4 v11, 0x2

    invoke-static {v5, v11}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    .line 598
    invoke-virtual {v8}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v11

    invoke-interface {v11}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v11

    invoke-static {v11}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x7

    .line 599
    new-array v15, v13, [Ljava/lang/String;

    const-string v25, "android-key-attestation-v1"

    aput-object v25, v15, v21

    aput-object v10, v15, v16

    const/16 v23, 0x2

    aput-object v12, v15, v23

    aput-object v2, v15, v20

    iget-object v12, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 600
    invoke-virtual {v12}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v15, v19

    iget-object v12, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v12}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v15, v17

    aput-object v11, v15, v18

    .line 599
    invoke-static {v15}, Lio/piupiu/chat/FrontendLicenseManager;->canonical([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 601
    const-string v15, "SHA256withRSA"

    invoke-static {v15}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v15

    move/from16 v25, v13

    .line 602
    invoke-virtual {v8}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v13

    invoke-virtual {v15, v13}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 603
    sget-object v13, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v12

    invoke-virtual {v15, v12}, Ljava/security/Signature;->update([B)V

    .line 604
    invoke-virtual {v15}, Ljava/security/Signature;->sign()[B

    move-result-object v12

    const/4 v13, 0x2

    invoke-static {v12, v13}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v12

    .line 606
    const-string v15, "https://www.piupiuchan.top/includes/frontend_attestation_issue.php"

    move/from16 v23, v13

    const/16 v13, 0xe

    new-array v13, v13, [Ljava/lang/String;

    aput-object v24, v13, v21

    aput-object v10, v13, v16

    aput-object v6, v13, v23

    aput-object v2, v13, v20

    aput-object v4, v13, v19

    iget-object v4, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 609
    invoke-virtual {v4}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v13, v17

    aput-object v3, v13, v18

    iget-object v3, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 610
    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v13, v25

    const-string v3, "device_public_key"

    const/16 v22, 0x8

    aput-object v3, v13, v22

    const/16 v3, 0x9

    aput-object v5, v13, v3

    const-string v3, "device_signature"

    const/16 v4, 0xa

    aput-object v3, v13, v4

    const/16 v3, 0xb

    aput-object v12, v13, v3

    const-string v3, "attestation_chain"

    const/16 v4, 0xc

    aput-object v3, v13, v4

    .line 613
    invoke-virtual {v14}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xd

    aput-object v3, v13, v4

    .line 606
    invoke-direct {v1, v15, v13}, Lio/piupiu/chat/FrontendLicenseManager;->postForm(Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 615
    invoke-virtual {v8}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v4

    invoke-direct {v1, v3, v4, v11, v2}, Lio/piupiu/chat/FrontendLicenseManager;->verifyAndUnwrapLicense(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 616
    iget-object v4, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "attestation_cached_license_v1"

    .line 617
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 618
    invoke-interface {v3, v9, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 619
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    move/from16 v3, v21

    .line 620
    invoke-direct {v1, v2, v3}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V
    :try_end_1
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 634
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void

    .line 589
    :cond_4
    :try_start_2
    new-instance v0, Ljava/lang/SecurityException;

    const-string v2, "Hardware attestation certificate chain unavailable"

    invoke-direct {v0, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 572
    :cond_5
    new-instance v0, Ljava/lang/SecurityException;

    const-string v2, "Invalid attestation challenge"

    invoke-direct {v0, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v0

    goto :goto_6

    :catch_0
    move-exception v0

    .line 631
    :try_start_3
    const-string v2, "Frontend license request failed"

    invoke-static {v7, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p1, :cond_6

    .line 632
    :try_start_4
    const-string v0, "\u65e0\u6cd5\u8fde\u63a5\u6388\u6743\u670d\u52a1\u5668\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v3, 0x0

    :try_start_5
    invoke-direct {v1, v0, v3}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V

    goto :goto_3

    :catch_1
    move-exception v0

    .line 628
    const-string v2, "Frontend license runtime is incompatible with this Android version"

    invoke-static {v7, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz p1, :cond_6

    .line 629
    :try_start_6
    const-string v0, "\u5f53\u524d\u7cfb\u7edf\u7248\u672c\u6682\u4e0d\u517c\u5bb9\uff0c\u8bf7\u66f4\u65b0\u5e94\u7528\u540e\u91cd\u8bd5"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    const/4 v3, 0x0

    :try_start_7
    invoke-direct {v1, v0, v3}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    :catchall_1
    move-exception v0

    const/4 v3, 0x0

    goto :goto_6

    :cond_6
    const/4 v3, 0x0

    .line 634
    :goto_3
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    :goto_4
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_5

    :catch_2
    move-exception v0

    .line 622
    :try_start_8
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Frontend license request rejected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_7

    .line 623
    invoke-virtual {v0}, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    iget-boolean v0, v0, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->rejected:Z

    invoke-direct {v1, v2, v0}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 634
    :cond_7
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    goto :goto_4

    :goto_5
    return-void

    :goto_6
    iget-object v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 635
    throw v0
.end method

.method private requestFreshV3(Z)V
    .locals 40

    move-object/from16 v1, p0

    .line 295
    const-string v0, "android_id"

    iget-object v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {v2, v8, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_1a

    .line 296
    :cond_0
    iget-boolean v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->forceAccountMode:Z

    iget-object v3, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    xor-int/2addr v3, v9

    invoke-static {v2, v3}, Lio/piupiu/chat/FrontendLicenseManager;->selectV3Mode(ZZ)Ljava/lang/String;

    move-result-object v2

    .line 297
    iget-object v3, v1, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    iget-object v4, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v10, "cached_key_alias_v3"

    const-string v11, ""

    invoke-interface {v4, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lio/piupiu/chat/FrontendLicenseManager;->businessLicense(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 298
    iget-boolean v4, v1, Lio/piupiu/chat/FrontendLicenseManager;->forceAccountMode:Z

    const-wide/16 v5, 0x0

    const-string v12, "expires_at"

    const-string v13, "verification_level"

    const-string v14, "hardware"

    if-nez v4, :cond_1

    if-eqz v3, :cond_1

    invoke-virtual {v3, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 299
    invoke-virtual {v3, v12, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    const-wide/16 v17, 0x3e8

    div-long v15, v15, v17

    const-wide/16 v17, 0x12c

    add-long v15, v15, v17

    cmp-long v3, v3, v15

    if-lez v3, :cond_1

    move-object v2, v14

    .line 303
    :cond_1
    const-string v3, "account"

    if-eqz p1, :cond_2

    :try_start_0
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_0 .. :try_end_0} :catch_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_13
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_12
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v4, :cond_2

    .line 307
    :try_start_1
    iget-object v4, v1, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    iget-object v15, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v15, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v4, v15}, Lio/piupiu/chat/FrontendLicenseManager;->businessLicense(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 308
    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 309
    invoke-direct {v1}, Lio/piupiu/chat/FrontendLicenseManager;->readCachedV3License()[B

    move-result-object v4

    if-eqz v4, :cond_2

    .line 310
    invoke-direct {v1, v4, v9}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_1 .. :try_end_1} :catch_14
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_1} :catch_12
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 446
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void

    .line 314
    :catch_0
    :cond_2
    :try_start_2
    const-string v4, "installation_id_v3"
    :try_end_2
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_2 .. :try_end_2} :catch_14
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_13
    .catch Ljava/lang/LinkageError; {:try_start_2 .. :try_end_2} :catch_12
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    invoke-direct {v1, v4}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateInstallationId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 315
    iget-object v15, v1, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v15

    invoke-static {v15, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_15

    .line 316
    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_15

    .line 320
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16
    :try_end_3
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_3 .. :try_end_3} :catch_11
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_13
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_3} :catch_12
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move/from16 v17, v9

    const-string v9, "piupiu_frontend_account_v3"

    const/4 v6, 0x2

    if-eqz v16, :cond_3

    const/16 v5, 0x800

    .line 321
    :try_start_4
    invoke-static {v9, v5}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateDeviceKey(Ljava/lang/String;I)Ljava/security/KeyPair;

    move-result-object v5

    .line 322
    invoke-virtual {v5}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v20
    :try_end_4
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move/from16 v21, v8

    :try_start_5
    invoke-interface/range {v20 .. v20}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v8

    invoke-static {v8, v6}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v8
    :try_end_5
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_5 .. :try_end_5} :catch_14
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_c
    .catch Ljava/lang/LinkageError; {:try_start_5 .. :try_end_5} :catch_b
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_1

    :catchall_0
    move-exception v0

    move/from16 v21, v8

    goto/16 :goto_1b

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    :goto_0
    move/from16 v21, v8

    goto/16 :goto_d

    :catch_3
    move-exception v0

    move/from16 v21, v8

    goto/16 :goto_15

    :cond_3
    move/from16 v21, v8

    move-object v8, v11

    const/4 v5, 0x0

    :goto_1
    move/from16 v20, v6

    .line 324
    :try_start_6
    const-string v6, "\u6b63\u5728\u8fde\u63a5\u6388\u6743\u670d\u52a1..."

    invoke-direct {v1, v6}, Lio/piupiu/chat/FrontendLicenseManager;->beginStage(Ljava/lang/String;)V

    .line 325
    const-string v6, "https://www.piupiuchan.top/includes/frontend_v3_challenge.php"

    move-object/from16 v22, v4

    const/16 v4, 0x10

    new-array v4, v4, [Ljava/lang/String;

    const-string v23, "installation_id"

    aput-object v23, v4, v21

    aput-object v22, v4, v17

    const-string v23, "bundle_version"

    aput-object v23, v4, v20

    move-object/from16 v23, v5

    iget-object v5, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 327
    invoke-virtual {v5}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v24, v5

    const/4 v5, 0x3

    aput-object v24, v4, v5

    const-string v24, "bundle_sha256"

    const/16 v25, 0x4

    aput-object v24, v4, v25

    iget-object v5, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 328
    invoke-virtual {v5}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v5

    const/16 v26, 0x5

    aput-object v5, v4, v26

    const/4 v5, 0x6

    aput-object v13, v4, v5

    const/16 v27, 0x7

    aput-object v2, v4, v27

    move/from16 v28, v5

    const/16 v5, 0x8

    aput-object v0, v4, v5

    const/16 v29, 0x9

    aput-object v15, v4, v29

    const-string v30, "device_public_key"

    const/16 v31, 0xa

    aput-object v30, v4, v31

    const/16 v5, 0xb

    aput-object v8, v4, v5

    const-string v8, "account_access_token"

    const/16 v32, 0xc

    aput-object v8, v4, v32

    iget-object v8, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    const/16 v32, 0xd

    aput-object v8, v4, v32

    const-string v8, "account_device_id"

    const/16 v32, 0xe

    aput-object v8, v4, v32

    iget-object v8, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountDeviceId:Ljava/lang/String;

    const/16 v32, 0xf

    aput-object v8, v4, v32

    .line 325
    invoke-direct {v1, v6, v4}, Lio/piupiu/chat/FrontendLicenseManager;->postForm(Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 334
    const-string v6, "protocol_version"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const/4 v8, 0x3

    if-ne v6, v8, :cond_14

    iget-object v6, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 335
    invoke-virtual {v6}, Lio/piupiu/chat/ProtectedFrontendManager;->getKeyId()Ljava/lang/String;

    move-result-object v6

    const-string v8, "key_id"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 336
    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 339
    const-string v6, "signature_check_enabled"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lio/piupiu/chat/FrontendLicenseManager;->isSignatureCheckEnabled(Ljava/lang/Object;)Z

    move-result v8

    .line 341
    const-string v6, "challenge_id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 342
    const-string v5, "challenge"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v33, v6

    move/from16 v34, v8

    move/from16 v6, v21

    .line 343
    invoke-static {v5, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v8

    .line 344
    array-length v6, v8

    move-object/from16 v35, v5

    const/16 v5, 0x20

    if-ne v6, v5, :cond_13

    .line 347
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V
    :try_end_6
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_c
    .catch Ljava/lang/LinkageError; {:try_start_6 .. :try_end_6} :catch_b
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    if-nez v34, :cond_4

    .line 351
    :try_start_7
    const-string v6, "piupiu_frontend_unverified_v3"

    const/16 v8, 0x800

    .line 352
    invoke-static {v6, v8}, Lio/piupiu/chat/FrontendLicenseManager;->getOrCreateDeviceKey(Ljava/lang/String;I)Ljava/security/KeyPair;

    move-result-object v8

    .line 353
    const-string v12, "LIC_V3_VERIFICATION_DISABLED"

    move-object/from16 v18, v6

    const/4 v6, 0x0

    invoke-direct {v1, v12, v6}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_7 .. :try_end_7} :catch_14
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_c
    .catch Ljava/lang/LinkageError; {:try_start_7 .. :try_end_7} :catch_b
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-object/from16 v23, v8

    move-object/from16 v36, v9

    move-object/from16 v37, v13

    move-object v9, v14

    move-object/from16 v7, v18

    goto/16 :goto_b

    :cond_4
    const/4 v6, 0x0

    .line 354
    :try_start_8
    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16
    :try_end_8
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_8 .. :try_end_8} :catch_d
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_c
    .catch Ljava/lang/LinkageError; {:try_start_8 .. :try_end_8} :catch_b
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    if-eqz v16, :cond_d

    .line 355
    :try_start_9
    iget-object v6, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v6, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 356
    iget-object v7, v1, Lio/piupiu/chat/FrontendLicenseManager;->context:Landroid/content/Context;

    move-object/from16 v36, v9

    if-nez v6, :cond_5

    move-object v9, v11

    goto :goto_2

    :cond_5
    move-object v9, v6

    :goto_2
    invoke-static {v7, v9}, Lio/piupiu/chat/FrontendLicenseManager;->businessLicense(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7
    :try_end_9
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_9 .. :try_end_9} :catch_6
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    .catch Ljava/lang/LinkageError; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    if-eqz v6, :cond_7

    .line 357
    :try_start_a
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_6

    goto :goto_3

    :cond_6
    invoke-direct {v1, v6}, Lio/piupiu/chat/FrontendLicenseManager;->getExistingDeviceKey(Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object v9
    :try_end_a
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_a .. :try_end_a} :catch_14
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_c
    .catch Ljava/lang/LinkageError; {:try_start_a .. :try_end_a} :catch_b
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_4

    :cond_7
    :goto_3
    const/4 v9, 0x0

    .line 358
    :goto_4
    :try_start_b
    invoke-static {v6}, Lio/piupiu/chat/FrontendLicenseManager;->isAttestedV3Alias(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_8

    if-eqz v9, :cond_8

    if-eqz v7, :cond_8

    move-object/from16 v23, v9

    .line 359
    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9
    :try_end_b
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_b .. :try_end_b} :catch_6
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5
    .catch Ljava/lang/LinkageError; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    if-eqz v9, :cond_8

    move-object/from16 v37, v13

    move-object v9, v14

    const-wide/16 v13, 0x0

    .line 360
    :try_start_c
    invoke-virtual {v7, v12, v13, v14}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    const-wide/16 v38, 0x3e8

    div-long v18, v18, v38

    const-wide/16 v38, 0x12c

    add-long v18, v18, v38

    cmp-long v7, v12, v18

    if-lez v7, :cond_9

    goto :goto_7

    :cond_8
    move-object/from16 v37, v13

    move-object v9, v14

    .line 367
    :cond_9
    const-string v7, "piupiu_frontend_attested_a_v3"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 368
    const-string v6, "piupiu_frontend_attested_b_v3"

    goto :goto_5

    :cond_a
    const-string v6, "piupiu_frontend_attested_a_v3"

    .line 369
    :goto_5
    invoke-direct {v1, v6}, Lio/piupiu/chat/FrontendLicenseManager;->deleteDeviceKey(Ljava/lang/String;)V

    .line 370
    const-string v7, "\u6b63\u5728\u9a8c\u8bc1\u8bbe\u5907..."

    invoke-direct {v1, v7}, Lio/piupiu/chat/FrontendLicenseManager;->beginStage(Ljava/lang/String;)V

    .line 371
    invoke-static {v6, v8}, Lio/piupiu/chat/FrontendLicenseManager;->createAttestedDeviceKey(Ljava/lang/String;[B)Ljava/security/KeyPair;

    move-result-object v7

    .line 372
    invoke-direct {v1, v6}, Lio/piupiu/chat/FrontendLicenseManager;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;

    move-result-object v8

    if-eqz v8, :cond_c

    .line 373
    array-length v12, v8

    move/from16 v13, v20

    if-lt v12, v13, :cond_c

    array-length v12, v8

    const/16 v13, 0x8

    if-gt v12, v13, :cond_c

    .line 375
    array-length v12, v8

    const/4 v13, 0x0

    :goto_6
    if-ge v13, v12, :cond_b

    aget-object v14, v8, v13

    .line 376
    invoke-virtual {v14}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v14

    move-object/from16 v18, v6

    const/4 v6, 0x2

    invoke-static {v14, v6}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v6, v18

    goto :goto_6

    :cond_b
    move-object/from16 v18, v6

    move-object/from16 v23, v7

    :goto_7
    move-object v7, v6

    goto :goto_b

    .line 374
    :cond_c
    new-instance v0, Ljava/lang/SecurityException;

    const-string v3, "Hardware attestation certificate chain unavailable"

    invoke-direct {v0, v3}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_c
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_c .. :try_end_c} :catch_7
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9
    .catch Ljava/lang/LinkageError; {:try_start_c .. :try_end_c} :catch_8
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :catch_4
    move-exception v0

    goto :goto_8

    :catch_5
    move-exception v0

    :goto_8
    move-object v9, v14

    :goto_9
    move-object v6, v2

    goto/16 :goto_12

    :catch_6
    move-exception v0

    move-object v9, v14

    :goto_a
    move/from16 v7, p1

    move-object v6, v2

    goto/16 :goto_16

    :cond_d
    move-object/from16 v36, v9

    move-object/from16 v37, v13

    move-object v9, v14

    move-object/from16 v7, v36

    .line 383
    :goto_b
    :try_start_d
    invoke-virtual/range {v23 .. v23}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v6

    invoke-interface {v6}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v6

    const/4 v13, 0x2

    invoke-static {v6, v13}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v6

    .line 384
    invoke-virtual/range {v23 .. v23}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v8

    invoke-interface {v8}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v8

    invoke-static {v8}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v8

    .line 386
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_d
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_d .. :try_end_d} :catch_a
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_9
    .catch Ljava/lang/LinkageError; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    if-eqz v3, :cond_e

    .line 387
    :try_start_e
    new-instance v3, Ljava/lang/String;

    const-string v12, "proof_payload"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v12, 0x0

    invoke-static {v4, v12}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v12}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_e
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_e .. :try_end_e} :catch_7
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/LinkageError; {:try_start_e .. :try_end_e} :catch_8
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    goto :goto_c

    :catch_7
    move-exception v0

    goto :goto_a

    :cond_e
    const/16 v3, 0xb

    .line 391
    :try_start_f
    new-array v4, v3, [Ljava/lang/String;

    const-string v3, "3"

    const/16 v21, 0x0

    aput-object v3, v4, v21

    aput-object v33, v4, v17

    const/16 v20, 0x2

    aput-object v35, v4, v20

    const/16 v24, 0x3

    aput-object v22, v4, v24

    iget-object v3, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 392
    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v25

    iget-object v3, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v26

    iget-object v3, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getKeyId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v28

    aput-object v2, v4, v27

    const/16 v30, 0x8

    aput-object v8, v4, v30

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 393
    invoke-virtual {v15, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-static {v3}, Lio/piupiu/chat/FrontendLicenseManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v29

    aput-object v11, v4, v31

    .line 391
    invoke-static {v4}, Lio/piupiu/chat/FrontendLicenseManager;->canonical([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 395
    :goto_c
    const-string v4, "SHA256withRSA"

    invoke-static {v4}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v4

    .line 396
    invoke-virtual/range {v23 .. v23}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 397
    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v12}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/security/Signature;->update([B)V

    .line 398
    invoke-virtual {v4}, Ljava/security/Signature;->sign()[B

    move-result-object v3

    const/4 v13, 0x2

    invoke-static {v3, v13}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    .line 400
    const-string v4, "\u6b63\u5728\u83b7\u53d6\u89e3\u5bc6\u5bc6\u94a5..."

    invoke-direct {v1, v4}, Lio/piupiu/chat/FrontendLicenseManager;->beginStage(Ljava/lang/String;)V

    .line 401
    const-string v4, "https://www.piupiuchan.top/includes/frontend_v3_issue.php"

    const/16 v12, 0x16

    new-array v12, v12, [Ljava/lang/String;

    const-string v13, "challenge_id"

    const/16 v21, 0x0

    aput-object v13, v12, v21

    aput-object v33, v12, v17

    const-string v13, "installation_id"

    const/16 v20, 0x2

    aput-object v13, v12, v20

    const/16 v24, 0x3

    aput-object v22, v12, v24

    const-string v13, "bundle_version"

    aput-object v13, v12, v25

    iget-object v13, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 404
    invoke-virtual {v13}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v26

    const-string v13, "bundle_sha256"

    aput-object v13, v12, v28

    iget-object v13, v1, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 405
    invoke-virtual {v13}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v27

    const/16 v30, 0x8

    aput-object v37, v12, v30

    aput-object v2, v12, v29

    aput-object v0, v12, v31

    const/16 v32, 0xb

    aput-object v15, v12, v32

    const-string v0, "device_public_key"

    const/16 v13, 0xc

    aput-object v0, v12, v13

    const/16 v0, 0xd

    aput-object v6, v12, v0

    const-string v0, "device_signature"

    const/16 v6, 0xe

    aput-object v0, v12, v6

    const/16 v0, 0xf

    aput-object v3, v12, v0

    const-string v0, "attestation_chain"

    const/16 v3, 0x10

    aput-object v0, v12, v3

    .line 410
    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x11

    aput-object v0, v12, v3

    const-string v0, "account_access_token"

    const/16 v3, 0x12

    aput-object v0, v12, v3

    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    const/16 v3, 0x13

    aput-object v0, v12, v3

    const-string v0, "account_device_id"

    const/16 v3, 0x14

    aput-object v0, v12, v3

    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountDeviceId:Ljava/lang/String;

    const/16 v3, 0x15

    aput-object v0, v12, v3

    .line 401
    invoke-direct {v1, v4, v12}, Lio/piupiu/chat/FrontendLicenseManager;->postForm(Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 413
    invoke-virtual/range {v23 .. v23}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v3
    :try_end_f
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_f .. :try_end_f} :catch_a
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_9
    .catch Ljava/lang/LinkageError; {:try_start_f .. :try_end_f} :catch_8
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    move-object v6, v2

    move-object v4, v8

    move-object/from16 v5, v22

    move-object v2, v0

    const/4 v0, 0x0

    :try_start_10
    invoke-direct/range {v1 .. v6}, Lio/piupiu/chat/FrontendLicenseManager;->verifyAndUnwrapV3License(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v3
    :try_end_10
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_10 .. :try_end_10} :catch_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_f
    .catch Ljava/lang/LinkageError; {:try_start_10 .. :try_end_10} :catch_e
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 416
    :try_start_11
    iget-object v4, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v4, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_f

    .line 417
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_10

    :cond_f
    iget-object v5, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_10

    move-object/from16 v5, v36

    .line 418
    invoke-direct {v1, v5}, Lio/piupiu/chat/FrontendLicenseManager;->getExistingDeviceKey(Ljava/lang/String;)Ljava/security/KeyPair;

    move-result-object v8

    if-eqz v8, :cond_10

    move-object v4, v5

    .line 419
    :cond_10
    iget-object v5, v1, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v8, "cached_license_v3"

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v8, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 420
    invoke-interface {v2, v10, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    if-eqz v34, :cond_11

    .line 421
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    if-eqz v4, :cond_11

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_11

    .line 422
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_11

    .line 424
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "migration_from_"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 426
    :cond_11
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 427
    const-string v2, "LIC_V3_ISSUE_OK"

    invoke-direct {v1, v2, v0}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v12, 0x0

    .line 428
    invoke-direct {v1, v3, v12}, Lio/piupiu/chat/FrontendLicenseManager;->reportUnlocked([BZ)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 431
    :try_start_12
    invoke-static {v3, v12}, Ljava/util/Arrays;->fill([BB)V
    :try_end_12
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_12 .. :try_end_12} :catch_10
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_f
    .catch Ljava/lang/LinkageError; {:try_start_12 .. :try_end_12} :catch_e
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 446
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto/16 :goto_1a

    .line 426
    :cond_12
    :try_start_13
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Unable to persist verified license"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    :catchall_1
    move-exception v0

    const/4 v12, 0x0

    .line 431
    :try_start_14
    invoke-static {v3, v12}, Ljava/util/Arrays;->fill([BB)V

    .line 432
    throw v0

    :catch_8
    move-exception v0

    goto/16 :goto_9

    :catch_9
    move-exception v0

    goto/16 :goto_9

    :catch_a
    move-exception v0

    move-object v6, v2

    goto :goto_f

    :cond_13
    move-object v6, v2

    move-object v9, v14

    .line 344
    new-instance v0, Ljava/lang/SecurityException;

    const-string v2, "Invalid V3 challenge"

    invoke-direct {v0, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    move-object v6, v2

    move-object v9, v14

    .line 337
    new-instance v0, Ljava/lang/SecurityException;

    const-string v2, "V3 challenge downgrade or identity mismatch"

    invoke-direct {v0, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_b
    move-exception v0

    goto :goto_d

    :catch_c
    move-exception v0

    :goto_d
    move-object v6, v2

    goto :goto_11

    :catch_d
    move-exception v0

    move-object v6, v2

    goto :goto_e

    :cond_15
    move-object v6, v2

    move/from16 v17, v9

    move-object v9, v14

    .line 316
    new-instance v0, Ljava/lang/SecurityException;

    const-string v2, "Android ID unavailable"

    invoke-direct {v0, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_14
    .catch Lio/piupiu/chat/FrontendLicenseManager$LicenseException; {:try_start_14 .. :try_end_14} :catch_10
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_f
    .catch Ljava/lang/LinkageError; {:try_start_14 .. :try_end_14} :catch_e
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    :catch_e
    move-exception v0

    goto :goto_12

    :catch_f
    move-exception v0

    goto :goto_12

    :catch_10
    move-exception v0

    goto :goto_f

    :catch_11
    move-exception v0

    move-object v6, v2

    move/from16 v17, v9

    :goto_e
    move-object v9, v14

    :goto_f
    move/from16 v7, p1

    goto :goto_16

    :catchall_2
    move-exception v0

    goto/16 :goto_1b

    :catch_12
    move-exception v0

    goto :goto_10

    :catch_13
    move-exception v0

    :goto_10
    move-object v6, v2

    move/from16 v17, v9

    :goto_11
    move-object v9, v14

    .line 442
    :goto_12
    :try_start_15
    const-string v2, "LIC_V3_FAIL"

    invoke-direct {v1, v2, v0}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz p1, :cond_16

    .line 443
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    if-nez v0, :cond_16

    move/from16 v0, v17

    const/4 v12, 0x0

    goto :goto_14

    :cond_16
    if-eqz p1, :cond_17

    .line 444
    :try_start_16
    const-string v0, "\u65e0\u6cd5\u8fde\u63a5\u6388\u6743\u670d\u52a1\u5668\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    const/4 v12, 0x0

    :try_start_17
    invoke-direct {v1, v0, v12}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_2

    goto :goto_13

    :catchall_3
    move-exception v0

    const/4 v12, 0x0

    goto/16 :goto_1b

    :cond_17
    const/4 v12, 0x0

    :goto_13
    move v0, v12

    .line 446
    :goto_14
    iget-object v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz v0, :cond_1c

    .line 447
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_1c

    move/from16 v2, v17

    .line 448
    iput-boolean v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->forceAccountMode:Z

    .line 449
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda5;

    move/from16 v7, p1

    invoke-direct {v2, v1, v7}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda5;-><init>(Lio/piupiu/chat/FrontendLicenseManager;Z)V

    goto :goto_19

    :catch_14
    move-exception v0

    :goto_15
    move/from16 v7, p1

    move-object v6, v2

    move-object v9, v14

    .line 434
    :goto_16
    :try_start_18
    const-string v2, "LIC_V3_REJECT"

    invoke-direct {v1, v2, v0}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz v7, :cond_1b

    .line 436
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    iget-object v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_18

    const/4 v0, 0x1

    goto :goto_18

    .line 437
    :cond_18
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-direct {v1}, Lio/piupiu/chat/FrontendLicenseManager;->reportAccountRequired()V

    goto :goto_17

    .line 438
    :cond_19
    iget-object v2, v0, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->code:Ljava/lang/String;

    invoke-static {v2}, Lio/piupiu/chat/FrontendLicenseManager;->isAccountSessionError(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-virtual {v0}, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lio/piupiu/chat/FrontendLicenseManager;->reportAccountInvalid(Ljava/lang/String;)V

    goto :goto_17

    .line 439
    :cond_1a
    invoke-virtual {v0}, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    iget-boolean v0, v0, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->rejected:Z

    invoke-direct {v1, v2, v0}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_2

    :cond_1b
    :goto_17
    const/4 v0, 0x0

    .line 446
    :goto_18
    iget-object v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v12, 0x0

    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz v0, :cond_1c

    .line 447
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_1c

    const/4 v2, 0x1

    .line 448
    iput-boolean v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->forceAccountMode:Z

    .line 449
    iget-object v0, v1, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda5;

    invoke-direct {v2, v1, v7}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda5;-><init>(Lio/piupiu/chat/FrontendLicenseManager;Z)V

    :goto_19
    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_1c
    :goto_1a
    return-void

    .line 446
    :goto_1b
    iget-object v2, v1, Lio/piupiu/chat/FrontendLicenseManager;->requestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v12, 0x0

    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 451
    throw v0
.end method

.method private retryV3()V
    .locals 3

    .line 284
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->retryQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 285
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda3;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method static selectV3Mode(ZZ)Ljava/lang/String;
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 455
    const-string p0, "account"

    return-object p0

    :cond_0
    const-string p0, "hardware"

    return-object p0
.end method

.method private static sha256Hex([B)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 945
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    .line 946
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 947
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v5, "%02x"

    invoke-static {v4, v5, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 948
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private shouldRenewCachedAttestedLicense()Z
    .locals 7

    const/4 v0, 0x1

    .line 681
    :try_start_0
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v2, "attestation_cached_license_v1"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 682
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 683
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "expires_at"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 684
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sub-long/2addr v1, v3

    const-wide/32 v3, 0xa8c0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    return v0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    return v0

    :catch_0
    move-exception v1

    .line 687
    const-string v2, "PiuPiuFrontendLicense"

    const-string v3, "Unable to inspect cached attested license expiry"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method private shouldRenewV3License()Z
    .locals 7

    const/4 v0, 0x1

    .line 484
    :try_start_0
    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->preferences:Landroid/content/SharedPreferences;

    const-string v2, "cached_license_v3"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 485
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 486
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "expires_at"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sub-long/2addr v1, v3

    const-wide/32 v3, 0xa8c0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    return v0

    :cond_1
    const/4 v0, 0x0

    :catch_0
    :cond_2
    :goto_0
    return v0
.end method

.method private startV3()V
    .locals 4

    .line 249
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 250
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 251
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundRenewal:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 252
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundV3Renewal:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 253
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3a98

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 254
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda2;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static usesCompatibilityProfile()Z
    .locals 1

    .line 847
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Lio/piupiu/chat/FrontendLicenseManager;->usesCompatibilityProfile(I)Z

    move-result v0

    return v0
.end method

.method static usesCompatibilityProfile(I)Z
    .locals 1

    const/16 v0, 0x1d

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private verifyAndUnwrapLicense(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 694
    const-string v2, "license_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 695
    const-string v3, "installation_id"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 696
    const-string v4, "device_public_key_sha256"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 697
    const-string v5, "key_id"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 698
    const-string v6, "bundle_version"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 699
    const-string v7, "bundle_sha256"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 700
    const-string v8, "issued_at"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 701
    const-string v10, "expires_at"

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 702
    const-string v12, "wrapped_key"

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 703
    const-string v13, "license_signature"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v13, p4

    .line 705
    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    move-object/from16 v13, p3

    .line 706
    invoke-virtual {v13, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    iget-object v13, v0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 707
    invoke-virtual {v13}, Lio/piupiu/chat/ProtectedFrontendManager;->getKeyId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    iget-object v13, v0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 708
    invoke-virtual {v13}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    iget-object v13, v0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 709
    invoke-virtual {v13}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 712
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long/2addr v13, v15

    const-wide/16 v15, 0x12c

    add-long/2addr v15, v13

    cmp-long v15, v8, v15

    if-gtz v15, :cond_2

    cmp-long v13, v10, v13

    if-lez v13, :cond_2

    const/16 v13, 0x9

    .line 715
    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object v2, v13, v14

    const/4 v2, 0x1

    aput-object v3, v13, v2

    const/4 v2, 0x2

    aput-object v4, v13, v2

    const/4 v3, 0x3

    aput-object v5, v13, v3

    const/4 v3, 0x4

    aput-object v6, v13, v3

    const/4 v3, 0x5

    aput-object v7, v13, v3

    const/4 v3, 0x6

    .line 716
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v13, v3

    const/4 v3, 0x7

    .line 717
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v13, v3

    const/16 v3, 0x8

    aput-object v12, v13, v3

    .line 715
    invoke-static {v13}, Lio/piupiu/chat/FrontendLicenseManager;->canonical([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 718
    const-string v4, "SHA256withRSA"

    invoke-static {v4}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v4

    .line 719
    invoke-direct {v0}, Lio/piupiu/chat/FrontendLicenseManager;->readLicenseServerPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 720
    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/security/Signature;->update([B)V

    .line 721
    invoke-static {v1, v14}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/security/Signature;->verify([B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 725
    const-string v1, "RSA/ECB/OAEPWithSHA-1AndMGF1Padding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    move-object/from16 v3, p2

    .line 726
    invoke-virtual {v1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 727
    invoke-static {v12, v14}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 728
    array-length v2, v1

    const/16 v3, 0x20

    if-ne v2, v3, :cond_0

    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "Frontend license returned an invalid key"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 722
    :cond_1
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "Frontend license signature mismatch"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 713
    :cond_2
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "Frontend license expired"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 710
    :cond_3
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "Frontend license identity mismatch"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private verifyAndUnwrapV3License(Lorg/json/JSONObject;Ljava/security/PrivateKey;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 494
    const-string v2, "protocol_version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    .line 495
    const-string v2, "license_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 496
    const-string v4, "verification_level"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 497
    const-string v5, "bundle_version"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 498
    const-string v6, "bundle_sha256"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 499
    const-string v7, "key_id"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 500
    const-string v8, "installation_id"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 501
    const-string v9, "device_public_key_sha256"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 502
    const-string v10, "account_subject"

    const-string v11, ""

    invoke-virtual {v1, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 503
    const-string v11, "issued_at"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v11

    .line 504
    const-string v13, "expires_at"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v13

    .line 505
    const-string v15, "wrapped_key"

    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move/from16 v16, v3

    move-object/from16 v3, p5

    .line 506
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    move-object/from16 v3, p4

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    move-object/from16 v3, p3

    .line 507
    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, v0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 508
    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, v0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 509
    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getBundleSha256()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, v0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 510
    invoke-virtual {v3}, Lio/piupiu/chat/ProtectedFrontendManager;->getKeyId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 513
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    const-wide/16 v19, 0x3e8

    div-long v17, v17, v19

    const-wide/16 v19, 0x12c

    add-long v19, v17, v19

    cmp-long v3, v11, v19

    if-gtz v3, :cond_2

    cmp-long v3, v13, v17

    if-lez v3, :cond_2

    const/16 v3, 0xc

    .line 515
    new-array v3, v3, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object v2, v3, v0

    const/4 v2, 0x1

    const-string v17, "3"

    aput-object v17, v3, v2

    const/4 v2, 0x2

    aput-object v4, v3, v2

    aput-object v5, v3, v16

    const/4 v4, 0x4

    aput-object v6, v3, v4

    const/4 v4, 0x5

    aput-object v7, v3, v4

    const/4 v4, 0x6

    aput-object v8, v3, v4

    const/4 v4, 0x7

    aput-object v9, v3, v4

    const/16 v4, 0x8

    aput-object v10, v3, v4

    const/16 v4, 0x9

    .line 517
    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0xa

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0xb

    aput-object v15, v3, v4

    .line 515
    invoke-static {v3}, Lio/piupiu/chat/FrontendLicenseManager;->canonical([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 518
    const-string v4, "SHA256withRSA"

    invoke-static {v4}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v4

    .line 519
    invoke-direct/range {p0 .. p0}, Lio/piupiu/chat/FrontendLicenseManager;->readLicenseServerPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 520
    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/security/Signature;->update([B)V

    .line 521
    const-string v3, "license_signature"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/security/Signature;->verify([B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 524
    const-string v1, "RSA/ECB/OAEPWithSHA-1AndMGF1Padding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    move-object/from16 v3, p2

    .line 525
    invoke-virtual {v1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 526
    invoke-static {v15, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 527
    array-length v1, v0

    const/16 v2, 0x20

    if-ne v1, v2, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "V3 license returned an invalid key"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 522
    :cond_1
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "V3 license signature mismatch"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 514
    :cond_2
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "V3 license expired"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 511
    :cond_3
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "V3 license identity mismatch"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 494
    :cond_4
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "V3 license downgrade"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method restoreAccountSession(Ljava/lang/String;)V
    .locals 4

    .line 204
    const-string v0, ""

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x4000

    if-le v1, v2, :cond_0

    goto :goto_0

    .line 206
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 207
    const-string p1, "accessToken"

    const-string v2, "access_token"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 208
    const-string v2, "deviceId"

    const-string v3, "device_id"

    invoke-virtual {v1, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 209
    const-string v1, "^[A-Za-z0-9_-]{16,512}$"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x80

    if-gt v1, v2, :cond_1

    .line 210
    iput-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    .line 211
    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountDeviceId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method retry()V
    .locals 4

    .line 183
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    if-nez v0, :cond_0

    return-void

    .line 184
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->getFormatVersion()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_1

    .line 185
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->retryV3()V

    return-void

    .line 188
    :cond_1
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 189
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 190
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundRenewal:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 191
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3a98

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 192
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda9;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method shutdown()V
    .locals 2

    .line 196
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 197
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundRenewal:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 198
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundV3Renewal:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 199
    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    return-void
.end method

.method start(Lio/piupiu/chat/FrontendLicenseManager$Callback;)V
    .locals 3

    .line 118
    iput-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->callback:Lio/piupiu/chat/FrontendLicenseManager$Callback;

    .line 119
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->getFormatVersion()I

    move-result p1

    const/4 v0, 0x3

    if-lt p1, v0, :cond_0

    .line 120
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->startV3()V

    return-void

    .line 123
    :cond_0
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupCompleted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 124
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 125
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->backgroundRenewal:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 126
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->mainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->startupWatchdog:Ljava/lang/Runnable;

    const-wide/16 v1, 0x3a98

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 127
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lio/piupiu/chat/FrontendLicenseManager$$ExternalSyntheticLambda4;-><init>(Lio/piupiu/chat/FrontendLicenseManager;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method submitAccountSession(Ljava/lang/String;)V
    .locals 6

    .line 224
    const-string v0, ""

    const-string v1, "\u767b\u5f55\u72b6\u6001\u65e0\u6548\uff0c\u8bf7\u91cd\u65b0\u767b\u5f55"

    iget-object v2, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->getFormatVersion()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x4000

    if-le v2, v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 226
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 227
    const-string p1, "accessToken"

    const-string v4, "access_token"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 228
    const-string v4, "deviceId"

    const-string v5, "device_id"

    invoke-virtual {v3, v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 229
    const-string v3, "^[A-Za-z0-9_-]{16,512}$"

    invoke-virtual {p1, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x80

    if-le v3, v4, :cond_1

    goto :goto_0

    .line 233
    :cond_1
    iput-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountAccessToken:Ljava/lang/String;

    .line 234
    iput-object v0, p0, Lio/piupiu/chat/FrontendLicenseManager;->accountDeviceId:Ljava/lang/String;

    .line 240
    iget-object p1, p0, Lio/piupiu/chat/FrontendLicenseManager;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->markChecking()V

    .line 241
    const-string p1, "LIC_V3_ACCOUNT_SESSION_ACCEPTED"

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/piupiu/chat/FrontendLicenseManager;->diagnostic(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 242
    invoke-direct {p0}, Lio/piupiu/chat/FrontendLicenseManager;->retryV3()V

    return-void

    .line 230
    :cond_2
    :goto_0
    invoke-direct {p0, v1, v2}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 244
    :catch_0
    invoke-direct {p0, v1, v2}, Lio/piupiu/chat/FrontendLicenseManager;->reportFailure(Ljava/lang/String;Z)V

    :cond_3
    :goto_1
    return-void
.end method
