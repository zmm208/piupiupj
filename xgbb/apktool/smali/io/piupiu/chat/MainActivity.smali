.class public Lio/piupiu/chat/MainActivity;
.super Lcom/getcapacitor/BridgeActivity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/piupiu/chat/MainActivity$WebAppInterface;,
        Lio/piupiu/chat/MainActivity$IntegrityGateResult;
    }
.end annotation


# static fields
.field private static final APP_INTEGRITY_CHECK_URL:Ljava/lang/String; = "https://www.piupiuchan.top/includes/app_integrity_check.php"

.field private static final CHAT_REPLY_NOTIFICATION_BASE_ID:I = 0x7d0

.field private static final CHAT_REPLY_NOTIFICATION_CHANNEL_ID:Ljava/lang/String; = "piupiu_chat_reply_native"

.field private static final NATIVE_BRIDGE_VERSION:Ljava/lang/String; = "chat-reply-notification-v2"

.field private static final OFFICIAL_PACKAGE_NAME:Ljava/lang/String; = "io.piupiu.chat"

.field private static final OFFICIAL_SIGNATURE_SHA256:Ljava/lang/String; = "0290F67FD446FD51D54B8188880523EAFD74CB469CC58A880EE24333ED7AF004"


# instance fields
.field private apkUrlToDownload:Ljava/lang/String;

.field private volatile appInForeground:Z

.field private final businessProofExecutor:Ljava/util/concurrent/ExecutorService;

.field private currentUpdateFile:Ljava/io/File;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

.field private volatile integrityCheckInProgress:Z

.field private volatile integrityGatePassed:Z

.field private volatile integrityRejected:Z

.field private notificationPermissionGranted:Z

.field private pendingLegacyStorageAction:Ljava/lang/Runnable;

.field private protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

.field private final requestInstallPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private final requestLegacyStoragePermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final requestNotificationPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public static synthetic $r8$lambda$5QnEZUiRYQgdp0pHxpe-rHrlZRI(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$downloadWebContentToDownloads$12()V

    return-void
.end method

.method public static synthetic $r8$lambda$Mfgs5CjbZ_EBAPbNhfI7o-tEaLs(Lio/piupiu/chat/MainActivity;Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$new$0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Mm3qNxxsfDkpP1SHzSoHAPSbuEM(Lio/piupiu/chat/MainActivity;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$installApk$18(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic $r8$lambda$N6NgK90b8Dk_JaMQpky1-4bUjoI(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$downloadWebContentToDownloads$8()V

    return-void
.end method

.method public static synthetic $r8$lambda$QujFlVvOI6mwTr5UYvg8ZYkZUs0(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$downloadWebContentToDownloads$10()V

    return-void
.end method

.method public static synthetic $r8$lambda$RKRynWkynQds6IAzLxU5g-k4FM8(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$initializeVerifiedApp$6(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$VE4PD6Ubl6Nz0ZsU3-WRxUjkLqA(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$downloadAndInstall$15()V

    return-void
.end method

.method public static synthetic $r8$lambda$WbGNBvXoyEiqYVrQbKzfTCY34tE(Lio/piupiu/chat/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lio/piupiu/chat/MainActivity;->lambda$downloadWebContentToDownloads$11(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$_VaKHP3ULCwy15TaNrwTrqhFlPg(Lio/piupiu/chat/MainActivity;I)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$downloadAndInstall$14(I)V

    return-void
.end method

.method public static synthetic $r8$lambda$dx9GLewVMKEExsNA488las6nF_Q(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$downloadAndInstall$13()V

    return-void
.end method

.method public static synthetic $r8$lambda$f7TCXDdjL8M7NV5jAmresK2_ABg(Lio/piupiu/chat/MainActivity;Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$new$1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic $r8$lambda$fL11asMmH_0WfbhLXR8CfnMs7Fw(Lio/piupiu/chat/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lio/piupiu/chat/MainActivity;->lambda$initializeVerifiedApp$7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method public static synthetic $r8$lambda$h4wa14GUGj5AG25N4rHqAXOOW1I(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$downloadAndInstall$17(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hQ1UP4pWbbGv4Y2WsYb_OTQX8mc(Lio/piupiu/chat/MainActivity;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/piupiu/chat/MainActivity;->lambda$initializeVerifiedApp$5(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$hv6Y6egxzUo8j74qWqo9Tj3nkns(Lio/piupiu/chat/MainActivity;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$installApk$19(Ljava/lang/Exception;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jxnL046BA97nLVY2kLP-kQBF300(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$downloadWebContentToDownloads$9()V

    return-void
.end method

.method public static synthetic $r8$lambda$nRwt0MfXgnOEj1X3verfJe3njSI(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->lambda$new$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$qCh8ZdAXbgCAg4Q_jHxqvnoka5Y(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$onBackPressed$4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tVJMy4BdHwkP60d8paQ87UDg9z0(Lio/piupiu/chat/MainActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$new$3(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$xmF-_FYsg1AQ5cPrFkec3FmLvjo(Lio/piupiu/chat/MainActivity;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->lambda$downloadAndInstall$16(Ljava/lang/Exception;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetbusinessProofExecutor(Lio/piupiu/chat/MainActivity;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    iget-object p0, p0, Lio/piupiu/chat/MainActivity;->businessProofExecutor:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcurrentUpdateFile(Lio/piupiu/chat/MainActivity;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lio/piupiu/chat/MainActivity;->currentUpdateFile:Ljava/io/File;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetexecutorService(Lio/piupiu/chat/MainActivity;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    iget-object p0, p0, Lio/piupiu/chat/MainActivity;->executorService:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetfrontendLicenseManager(Lio/piupiu/chat/MainActivity;)Lio/piupiu/chat/FrontendLicenseManager;
    .locals 0

    iget-object p0, p0, Lio/piupiu/chat/MainActivity;->frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetprotectedFrontendManager(Lio/piupiu/chat/MainActivity;)Lio/piupiu/chat/ProtectedFrontendManager;
    .locals 0

    iget-object p0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetrequestLegacyStoragePermissionLauncher(Lio/piupiu/chat/MainActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lio/piupiu/chat/MainActivity;->requestLegacyStoragePermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputapkUrlToDownload(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lio/piupiu/chat/MainActivity;->apkUrlToDownload:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputcurrentUpdateFile(Lio/piupiu/chat/MainActivity;Ljava/io/File;)V
    .locals 0

    iput-object p1, p0, Lio/piupiu/chat/MainActivity;->currentUpdateFile:Ljava/io/File;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputintegrityCheckInProgress(Lio/piupiu/chat/MainActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lio/piupiu/chat/MainActivity;->integrityCheckInProgress:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputintegrityRejected(Lio/piupiu/chat/MainActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputpendingLegacyStorageAction(Lio/piupiu/chat/MainActivity;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lio/piupiu/chat/MainActivity;->pendingLegacyStorageAction:Ljava/lang/Runnable;

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckAndDownload(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->checkAndDownload()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcleanupOldUpdateFiles(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->cleanupOldUpdateFiles()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcompleteVerifiedStartup(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->completeVerifiedStartup()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdownloadWebContentToDownloads(Lio/piupiu/chat/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lio/piupiu/chat/MainActivity;->downloadWebContentToDownloads(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mescapeJson(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->escapeJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetCurrentAppSignatureSha256(Lio/piupiu/chat/MainActivity;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->getCurrentAppSignatureSha256()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetCurrentUpdateFile(Lio/piupiu/chat/MainActivity;)Ljava/io/File;
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->getCurrentUpdateFile()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetUpdateFileForUrl(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)Ljava/io/File;
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->getUpdateFileForUrl(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$minstallApk(Lio/piupiu/chat/MainActivity;Ljava/io/File;)Z
    .locals 0

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->installApk(Ljava/io/File;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mretryProtectedFrontendLicense(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->retryProtectedFrontendLicense()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowChatReplyNotificationNative(Lio/piupiu/chat/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/piupiu/chat/MainActivity;->showChatReplyNotificationNative(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 56
    invoke-direct {p0}, Lcom/getcapacitor/BridgeActivity;-><init>()V

    .line 68
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 69
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->businessProofExecutor:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x0

    .line 72
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->notificationPermissionGranted:Z

    const/4 v1, 0x1

    .line 74
    iput-boolean v1, p0, Lio/piupiu/chat/MainActivity;->appInForeground:Z

    .line 75
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityGatePassed:Z

    .line 76
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityCheckInProgress:Z

    .line 77
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    .line 82
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$RequestPermission;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$RequestPermission;-><init>()V

    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda1;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, v0, v1}, Lio/piupiu/chat/MainActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->requestNotificationPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 93
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$RequestPermission;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$RequestPermission;-><init>()V

    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda2;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, v0, v1}, Lio/piupiu/chat/MainActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->requestLegacyStoragePermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 105
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda3;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, v0, v1}, Lio/piupiu/chat/MainActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->requestInstallPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-void
.end method

.method static synthetic access$001(Lio/piupiu/chat/MainActivity;)V
    .locals 0

    .line 56
    invoke-super {p0}, Lcom/getcapacitor/BridgeActivity;->onBackPressed()V

    return-void
.end method

.method private checkAndDownload()V
    .locals 2

    .line 1238
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 1239
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1241
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->requestInstallPermission()V

    return-void

    .line 1246
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->apkUrlToDownload:Ljava/lang/String;

    invoke-direct {p0, v0}, Lio/piupiu/chat/MainActivity;->downloadAndInstall(Ljava/lang/String;)V

    return-void
.end method

.method private cleanupOldUpdateFiles()V
    .locals 1

    const/4 v0, 0x0

    .line 1458
    invoke-direct {p0, v0}, Lio/piupiu/chat/MainActivity;->cleanupOldUpdateFiles(Ljava/io/File;)V

    return-void
.end method

.method private cleanupOldUpdateFiles(Ljava/io/File;)V
    .locals 9

    .line 1462
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->getUpdateCacheDir()Ljava/io/File;

    move-result-object v0

    .line 1463
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 1468
    :cond_0
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_7

    aget-object v4, v0, v3

    .line 1469
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_2

    :cond_1
    if-eqz p1, :cond_2

    .line 1472
    invoke-virtual {v4, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_2

    .line 1476
    :cond_2
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1477
    const-string v6, "update.apk"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    .line 1478
    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    const-string v8, ".apk"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    const-string v7, "PiuPiu"

    .line 1479
    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, "piupiu-update-"

    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_3
    const/4 v5, 0x1

    goto :goto_1

    :cond_4
    move v5, v2

    :goto_1
    if-nez v6, :cond_5

    if-eqz v5, :cond_6

    .line 1482
    :cond_5
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_6

    .line 1483
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Failed to delete old update file: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "PiuPiuUpdate"

    invoke-static {v5, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_7
    :goto_3
    return-void
.end method

.method private completeVerifiedStartup()V
    .locals 2

    .line 413
    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityGatePassed:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 416
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityGatePassed:Z

    .line 417
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->initializeVerifiedApp()V

    .line 418
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 419
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private createChatReplyNotificationChannel()V
    .locals 4

    .line 1155
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 1159
    :cond_0
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "\u804a\u5929\u56de\u590d\u63d0\u9192"

    const/4 v2, 0x4

    const-string v3, "piupiu_chat_reply_native"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 1163
    const-string v1, "AI \u56de\u590d\u5b8c\u6210\u65f6\u63d0\u9192\u4f60\u67e5\u770b"

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 1164
    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    .line 1165
    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->enableLights(Z)V

    .line 1166
    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 1168
    const-class v1, Landroid/app/NotificationManager;

    invoke-virtual {p0, v1}, Lio/piupiu/chat/MainActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    if-eqz v1, :cond_1

    .line 1170
    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private downloadAndInstall(Ljava/lang/String;)V
    .locals 2

    .line 1261
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0, p1}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda8;-><init>(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private downloadWebContentToDownloads(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    if-eqz p1, :cond_2

    .line 516
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 522
    :cond_0
    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda16;

    move-object v2, p0

    move-object v3, p1

    move-object v6, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda16;-><init>(Lio/piupiu/chat/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1d

    if-ge p1, p2, :cond_1

    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 559
    invoke-static {p0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_1

    .line 561
    iput-object v1, v2, Lio/piupiu/chat/MainActivity;->pendingLegacyStorageAction:Ljava/lang/Runnable;

    .line 562
    new-instance p1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda17;

    invoke-direct {p1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda17;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, p1}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 567
    :cond_1
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_2
    :goto_0
    move-object v2, p0

    move-object v3, p1

    .line 517
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "\u4e0d\u652f\u6301\u7684 WebView \u4e0b\u8f7d\u5730\u5740: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "PiuPiuDownload"

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    new-instance p1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda15;

    invoke-direct {p1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda15;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, p1}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    .line 1225
    const-string p1, ""

    return-object p1

    .line 1227
    :cond_0
    const-string v0, "\\"

    const-string v1, "\\\\"

    .line 1228
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\""

    const-string v1, "\\\""

    .line 1229
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\n"

    const-string v1, "\\n"

    .line 1230
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\r"

    const-string v1, "\\r"

    .line 1231
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getCurrentAppSignatureSha256()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1188
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const/4 v2, 0x0

    const-string v3, ""

    if-lt v0, v1, :cond_2

    .line 1189
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 1190
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/high16 v4, 0x8000000

    .line 1189
    invoke-virtual {v0, v1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 1192
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signingInfo:Landroid/content/pm/SigningInfo;

    invoke-virtual {v0}, Landroid/content/pm/SigningInfo;->getApkContentsSigners()[Landroid/content/pm/Signature;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1193
    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_0

    .line 1196
    :cond_0
    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    goto :goto_1

    :cond_1
    :goto_0
    return-object v3

    .line 1199
    :cond_2
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 1200
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v4, 0x40

    .line 1199
    invoke-virtual {v0, v1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 1203
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v0, :cond_4

    .line 1204
    array-length v1, v0

    if-nez v1, :cond_3

    goto :goto_2

    .line 1207
    :cond_3
    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    .line 1210
    :goto_1
    invoke-direct {p0, v0}, Lio/piupiu/chat/MainActivity;->sha256Hex([B)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4
    :goto_2
    return-object v3
.end method

.method private getCurrentUpdateFile()Ljava/io/File;
    .locals 5

    .line 1411
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->currentUpdateFile:Ljava/io/File;

    if-eqz v0, :cond_0

    return-object v0

    .line 1414
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->getUpdateCacheDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "piupiu-update-"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".apk"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->currentUpdateFile:Ljava/io/File;

    return-object v0
.end method

.method private getUpdateCacheDir()Ljava/io/File;
    .locals 1

    .line 1406
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 1407
    :cond_0
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private getUpdateFileForUrl(Ljava/lang/String;)Ljava/io/File;
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1421
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1422
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1423
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1424
    invoke-direct {p0, v1}, Lio/piupiu/chat/MainActivity;->sanitizeApkFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    goto :goto_0

    :catch_0
    move-exception v1

    .line 1428
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to parse APK filename from URL: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "PiuPiuUpdate"

    invoke-static {v2, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 1431
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1432
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "piupiu-update-"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ".apk"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1435
    :cond_2
    new-instance p1, Ljava/io/File;

    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->getUpdateCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object p1
.end method

.method private handleIntegrityDecision(Lio/piupiu/chat/MainActivity$IntegrityGateResult;)V
    .locals 1

    const/4 v0, 0x0

    .line 396
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityCheckInProgress:Z

    .line 397
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 400
    :cond_0
    iget-boolean p1, p1, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->allowed:Z

    if-eqz p1, :cond_1

    .line 401
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->completeVerifiedStartup()V

    return-void

    :cond_1
    const/4 p1, 0x1

    .line 404
    iput-boolean p1, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    .line 405
    invoke-static {p0}, Lio/piupiu/chat/KeepAliveService;->stop(Landroid/content/Context;)V

    .line 406
    iget-object p1, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    if-eqz p1, :cond_2

    .line 407
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 409
    :cond_2
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->finishAffinity()V

    :cond_3
    :goto_0
    return-void
.end method

.method private hideSystemUI()V
    .locals 2

    .line 216
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getWindowInsetsController(Landroid/view/View;)Landroidx/core/view/WindowInsetsControllerCompat;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 219
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->statusBars()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsControllerCompat;->hide(I)V

    const/4 v1, 0x2

    .line 221
    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsControllerCompat;->setSystemBarsBehavior(I)V

    :cond_0
    return-void
.end method

.method private initializeVerifiedApp()V
    .locals 3

    .line 427
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V

    .line 430
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->hideSystemUI()V

    .line 433
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->requestNotificationPermission()V

    .line 437
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    new-instance v2, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda18;

    invoke-direct {v2, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda18;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-static {v0, v2}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 482
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 483
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 484
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 487
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    .line 490
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 493
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 495
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda19;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda19;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    return-void
.end method

.method private installApk(Ljava/io/File;)Z
    .locals 4

    const/4 v0, 0x0

    .line 1366
    :try_start_0
    invoke-static {p1}, Lio/piupiu/chat/ApkUpdateValidator;->validate(Ljava/io/File;)V

    .line 1367
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1368
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1371
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000000

    .line 1372
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1376
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1377
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".fileprovider"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1376
    invoke-static {p0, v2, p1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 1378
    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v2, 0x1

    .line 1379
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1385
    new-instance v3, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0, v1}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda4;-><init>(Lio/piupiu/chat/MainActivity;Landroid/content/Intent;)V

    invoke-virtual {p0, v3}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return v2

    .line 1369
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u66f4\u65b0\u5305\u65e0\u6548\u6216\u4e0e\u5f53\u524d\u5e94\u7528\u4e0d\u5339\u914d\uff0c\u8bf7\u91cd\u65b0\u4e0b\u8f7d"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    .line 1395
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 1396
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1397
    new-instance p1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0, v1}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda5;-><init>(Lio/piupiu/chat/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, p1}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return v0
.end method

.method private isApkDownload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1355
    const-string v0, ""

    if-nez p1, :cond_0

    move-object p1, v0

    goto :goto_0

    :cond_0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    if-nez p2, :cond_1

    move-object p2, v0

    goto :goto_1

    .line 1356
    :cond_1
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    :goto_1
    if-nez p3, :cond_2

    goto :goto_2

    .line 1357
    :cond_2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p3, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 1359
    :goto_2
    const-string p3, ".apk"

    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "application/vnd.android.package-archive"

    .line 1360
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 1361
    invoke-virtual {v0, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_3

    :cond_3
    const/4 p1, 0x0

    return p1

    :cond_4
    :goto_3
    const/4 p1, 0x1

    return p1
.end method

.method private synthetic lambda$downloadAndInstall$13()V
    .locals 3

    .line 1277
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "if(typeof window.updateDownloadProgress===\'function\')window.updateDownloadProgress(-1);"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private synthetic lambda$downloadAndInstall$14(I)V
    .locals 3

    .line 1312
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "if(typeof window.updateDownloadProgress===\'function\')window.updateDownloadProgress("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ");"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private synthetic lambda$downloadAndInstall$15()V
    .locals 3

    .line 1329
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "if(typeof window.updateDownloadProgress===\'function\')window.updateDownloadProgress(100);"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private synthetic lambda$downloadAndInstall$16(Ljava/lang/Exception;)V
    .locals 2

    .line 1341
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u4e0b\u8f7d\u66f4\u65b0\u5931\u8d25: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 1343
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object p1

    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object p1

    const-string v0, "if(typeof window.updateDownloadProgress===\'function\')window.updateDownloadProgress(-2);"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private synthetic lambda$downloadAndInstall$17(Ljava/lang/String;)V
    .locals 17

    move-object/from16 v1, p0

    .line 1262
    const-string v2, "PiuPiuUpdate"

    .line 0
    const-string v0, "File length: "

    const/4 v3, 0x0

    .line 1265
    :try_start_0
    new-instance v4, Ljava/net/URL;

    move-object/from16 v5, p1

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1266
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    const/16 v6, 0x3a98

    .line 1267
    :try_start_1
    invoke-virtual {v4, v6}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v6, 0x7530

    .line 1268
    invoke-virtual {v4, v6}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 1269
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V

    .line 1272
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v6

    .line 1273
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    if-gtz v6, :cond_0

    .line 1276
    :try_start_2
    new-instance v0, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda0;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {v1, v0}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v3, v4

    goto/16 :goto_8

    .line 1283
    :cond_0
    :goto_0
    :try_start_3
    invoke-direct/range {p0 .. p1}, Lio/piupiu/chat/MainActivity;->getUpdateFileForUrl(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 1284
    iput-object v3, v1, Lio/piupiu/chat/MainActivity;->currentUpdateFile:Ljava/io/File;

    .line 1285
    invoke-direct {v1, v3}, Lio/piupiu/chat/MainActivity;->cleanupOldUpdateFiles(Ljava/io/File;)V

    .line 1286
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_7

    if-eqz v0, :cond_1

    .line 1287
    :try_start_4
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_1
    const/16 v0, 0x1000

    .line 1290
    :try_start_5
    new-array v0, v0, [B

    .line 1295
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_7

    .line 1296
    :try_start_6
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    const/4 v8, -0x1

    move v13, v8

    const-wide/16 v11, 0x0

    .line 1298
    :goto_1
    :try_start_7
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v14

    if-eq v14, v8, :cond_4

    const-wide/16 v15, 0x0

    int-to-long v8, v14

    add-long/2addr v11, v8

    const/4 v8, 0x0

    .line 1300
    invoke-virtual {v7, v0, v8, v14}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-lez v6, :cond_3

    const-wide/16 v8, 0x64

    mul-long/2addr v8, v11

    move-object v10, v4

    move-object v14, v5

    int-to-long v4, v6

    .line 1304
    :try_start_8
    div-long/2addr v8, v4

    const-wide/16 v4, 0x63

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    if-le v4, v13, :cond_2

    .line 1308
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Download progress: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, "%"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1311
    new-instance v5, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda11;

    invoke-direct {v5, v1, v4}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda11;-><init>(Lio/piupiu/chat/MainActivity;I)V

    invoke-virtual {v1, v5}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    move v13, v4

    :cond_2
    move-object v4, v10

    move-object v5, v14

    :cond_3
    const/4 v8, -0x1

    goto :goto_1

    :cond_4
    move-object v10, v4

    move-object v14, v5

    const-wide/16 v15, 0x0

    .line 1318
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 1319
    :try_start_9
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-eqz v14, :cond_5

    :try_start_a
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V

    :cond_5
    cmp-long v0, v11, v15

    if-eqz v0, :cond_8

    if-lez v6, :cond_6

    int-to-long v4, v6

    cmp-long v0, v11, v4

    if-nez v0, :cond_8

    .line 1326
    :cond_6
    const-string v0, "Download complete, starting install"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1328
    invoke-direct {v1, v3}, Lio/piupiu/chat/MainActivity;->installApk(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1329
    new-instance v0, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda12;

    invoke-direct {v0, v1}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda12;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {v1, v0}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_9

    :cond_7
    if-eqz v10, :cond_b

    .line 1348
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    .line 1322
    :cond_8
    :try_start_b
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 1323
    new-instance v0, Ljava/io/IOException;

    const-string v4, "\u66f4\u65b0\u5305\u4e0b\u8f7d\u4e0d\u5b8c\u6574\uff0c\u8bf7\u91cd\u8bd5"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_9

    :catchall_1
    move-exception v0

    goto :goto_4

    :catchall_2
    move-exception v0

    goto :goto_2

    :catchall_3
    move-exception v0

    move-object v10, v4

    move-object v14, v5

    :goto_2
    move-object v4, v0

    .line 1295
    :try_start_c
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    goto :goto_3

    :catchall_4
    move-exception v0

    :try_start_d
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :catchall_5
    move-exception v0

    move-object v10, v4

    move-object v14, v5

    :goto_4
    move-object v4, v0

    if-eqz v14, :cond_9

    :try_start_e
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    goto :goto_5

    :catchall_6
    move-exception v0

    :try_start_f
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9
    :goto_5
    throw v4
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    :catch_0
    move-exception v0

    goto :goto_6

    :catchall_7
    move-exception v0

    move-object v10, v4

    goto :goto_7

    :catch_1
    move-exception v0

    move-object v10, v4

    goto :goto_6

    :catchall_8
    move-exception v0

    goto :goto_8

    :catch_2
    move-exception v0

    move-object v10, v3

    :goto_6
    if-eqz v3, :cond_a

    .line 1335
    :try_start_10
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 1337
    :cond_a
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1338
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1340
    new-instance v2, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda13;

    invoke-direct {v2, v1, v0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda13;-><init>(Lio/piupiu/chat/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {v1, v2}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    if-eqz v10, :cond_b

    .line 1348
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_b
    return-void

    :catchall_9
    move-exception v0

    :goto_7
    move-object v3, v10

    :goto_8
    if-eqz v3, :cond_c

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1350
    :cond_c
    throw v0
.end method

.method private synthetic lambda$downloadWebContentToDownloads$10()V
    .locals 2

    .line 553
    const-string v0, "\u4e0b\u8f7d\u6587\u4ef6\u5931\u8d25"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 554
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private synthetic lambda$downloadWebContentToDownloads$11(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 524
    const-string v0, "PiuPiuDownload"

    .line 0
    const-string v1, "\u5df2\u63d0\u4ea4 WebView \u4e0b\u8f7d: "

    .line 524
    :try_start_0
    invoke-static {p1, p2, p3}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 525
    new-instance v2, Landroid/app/DownloadManager$Request;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 526
    invoke-virtual {v2, p2}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 527
    const-string v3, "\u6b63\u5728\u4fdd\u5b58\u5230[\u4e0b\u8f7d]\u6587\u4ef6\u5939"

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    const/4 v3, 0x1

    .line 528
    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 530
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v2, v3, p2}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    if-eqz p3, :cond_0

    .line 532
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 533
    invoke-virtual {v2, p3}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    :cond_0
    if-eqz p4, :cond_1

    .line 535
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_1

    .line 536
    const-string p3, "User-Agent"

    invoke-virtual {v2, p3, p4}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 538
    :cond_1
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object p3

    invoke-virtual {p3, p1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_2

    .line 539
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_2

    .line 540
    const-string p4, "Cookie"

    invoke-virtual {v2, p4, p3}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 543
    :cond_2
    const-string p3, "download"

    invoke-virtual {p0, p3}, Lio/piupiu/chat/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/app/DownloadManager;

    if-eqz p3, :cond_3

    .line 547
    invoke-virtual {p3, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    .line 548
    new-instance p3, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {p3, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda6;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, p3}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 550
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " <- "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 545
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "DownloadManager unavailable"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 552
    const-string p2, "\u63d0\u4ea4 WebView \u4e0b\u8f7d\u5931\u8d25"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 553
    new-instance p1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda7;

    invoke-direct {p1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda7;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, p1}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private synthetic lambda$downloadWebContentToDownloads$12()V
    .locals 2

    .line 562
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->requestLegacyStoragePermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    return-void
.end method

.method private synthetic lambda$downloadWebContentToDownloads$8()V
    .locals 2

    .line 518
    const-string v0, "\u6682\u4e0d\u652f\u6301\u8be5\u4e0b\u8f7d\u5730\u5740"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private synthetic lambda$downloadWebContentToDownloads$9()V
    .locals 2

    .line 548
    const-string v0, "\u6587\u4ef6\u5c06\u4fdd\u5b58\u5230[\u4e0b\u8f7d]\u6587\u4ef6\u5939"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 549
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private synthetic lambda$initializeVerifiedApp$5(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 4

    .line 439
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result p1

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object p1

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    .line 442
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->statusBars()I

    move-result v0

    invoke-virtual {p2, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    iget v0, v0, Landroidx/core/graphics/Insets;->top:I

    .line 443
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->navigationBars()I

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v1

    iget v1, v1, Landroidx/core/graphics/Insets;->bottom:I

    .line 447
    invoke-virtual {p2}, Landroidx/core/view/WindowInsetsCompat;->getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 449
    invoke-virtual {v2}, Landroidx/core/view/DisplayCutoutCompat;->getSafeInsetTop()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 453
    :cond_0
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    div-float/2addr p1, v2

    float-to-int p1, p1

    int-to-float v0, v0

    div-float/2addr v0, v2

    float-to-int v0, v0

    int-to-float v1, v1

    div-float/2addr v1, v2

    float-to-int v1, v1

    .line 463
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "(function(){window.__piupiuWindowInsets={keyboard:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, ",status:"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ",navigation:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "};function apply(){var v=window.__piupiuWindowInsets;if(!v||!document.documentElement||!document.body)return;document.documentElement.style.setProperty(\'--keyboard-height\',v.keyboard+\'px\');document.documentElement.style.setProperty(\'--status-bar-height\',v.status+\'px\');document.documentElement.style.setProperty(\'--nav-bar-height\',v.navigation+\'px\');document.body.classList.toggle(\'keyboard-is-visible\',v.keyboard>0);}if(document.documentElement&&document.body){apply();}else if(!window.__piupiuInsetsReadyListener){window.__piupiuInsetsReadyListener=true;document.addEventListener(\'DOMContentLoaded\',function(){window.__piupiuInsetsReadyListener=false;apply();},{once:true});}})();"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 475
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-object p2
.end method

.method private synthetic lambda$initializeVerifiedApp$6(Ljava/lang/String;)V
    .locals 3

    .line 498
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "if(window.piupiuEmbeddedDownloadStarted){window.piupiuEmbeddedDownloadStarted("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 500
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 498
    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 502
    iput-object p1, p0, Lio/piupiu/chat/MainActivity;->apkUrlToDownload:Ljava/lang/String;

    .line 503
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->checkAndDownload()V

    return-void
.end method

.method private synthetic lambda$initializeVerifiedApp$7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 496
    invoke-direct {p0, p1, p4, p3}, Lio/piupiu/chat/MainActivity;->isApkDownload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p5

    if-eqz p5, :cond_0

    .line 497
    new-instance p2, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda10;

    invoke-direct {p2, p0, p1}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda10;-><init>(Lio/piupiu/chat/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 510
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lio/piupiu/chat/MainActivity;->downloadWebContentToDownloads(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$installApk$18(Landroid/content/Intent;)V
    .locals 2

    .line 1387
    :try_start_0
    invoke-virtual {p0, p1}, Lio/piupiu/chat/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1389
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u8c03\u8d77\u5b89\u88c5\u5931\u8d25: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 1390
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object p1

    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object p1

    const-string v0, "if(typeof window.updateDownloadProgress===\'function\')window.updateDownloadProgress(-2);"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private synthetic lambda$installApk$19(Ljava/lang/Exception;)V
    .locals 2

    .line 1398
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u66f4\u65b0\u5305\u6821\u9a8c\u5931\u8d25: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 1399
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object p1

    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object p1

    const-string v0, "if(typeof window.updateDownloadProgress===\'function\')window.updateDownloadProgress(-2);"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private synthetic lambda$new$0(Ljava/lang/Boolean;)V
    .locals 1

    .line 84
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->notificationPermissionGranted:Z

    .line 85
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const-string v0, "PiuPiuKeepAlive"

    if-eqz p1, :cond_0

    .line 86
    const-string p1, "Notification permission granted"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 88
    :cond_0
    const-string p1, "Notification permission denied - foreground service notification may not show"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private synthetic lambda$new$1(Ljava/lang/Boolean;)V
    .locals 2

    .line 95
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->pendingLegacyStorageAction:Ljava/lang/Runnable;

    const/4 v1, 0x0

    .line 96
    iput-object v1, p0, Lio/piupiu/chat/MainActivity;->pendingLegacyStorageAction:Ljava/lang/Runnable;

    .line 97
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 98
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    .line 99
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    .line 100
    const-string p1, "\u672a\u6388\u4e88\u5b58\u50a8\u6743\u9650\uff0c\u65e0\u6cd5\u4fdd\u5b58\u6587\u4ef6"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method

.method private synthetic lambda$new$2()V
    .locals 2

    .line 117
    const-string v0, "\u672a\u6388\u4e88\u5b89\u88c5\u6743\u9650\uff0c\u65e0\u6cd5\u66f4\u65b0\u5e94\u7528"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private synthetic lambda$new$3(Landroidx/activity/result/ActivityResult;)V
    .locals 1

    .line 108
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p1, v0, :cond_1

    .line 109
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 111
    iget-object p1, p0, Lio/piupiu/chat/MainActivity;->apkUrlToDownload:Ljava/lang/String;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    .line 112
    iget-object p1, p0, Lio/piupiu/chat/MainActivity;->apkUrlToDownload:Ljava/lang/String;

    invoke-direct {p0, p1}, Lio/piupiu/chat/MainActivity;->downloadAndInstall(Ljava/lang/String;)V

    return-void

    .line 116
    :cond_0
    new-instance p1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda9;

    invoke-direct {p1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda9;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {p0, p1}, Lio/piupiu/chat/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method private synthetic lambda$onBackPressed$4(Ljava/lang/String;)V
    .locals 1

    .line 137
    const-string v0, "true"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 141
    :cond_0
    iget-object p1, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 142
    iget-object p1, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    return-void

    .line 144
    :cond_1
    invoke-static {p0}, Lio/piupiu/chat/MainActivity;->access$001(Lio/piupiu/chat/MainActivity;)V

    return-void
.end method

.method private readUtf8Response(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 385
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v1, 0x1000

    .line 386
    :try_start_1
    new-array v1, v1, [B

    .line 388
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    .line 389
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 391
    :cond_0
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 392
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_1
    return-object v1

    :catchall_0
    move-exception v1

    .line 384
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

    if-eqz p1, :cond_2

    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p1

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    throw v0

    .line 382
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Integrity server returned an empty response"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private requestInstallPermission()V
    .locals 4

    .line 1252
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1253
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "package"

    invoke-static {v3, v1, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 1254
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1256
    iget-object v1, p0, Lio/piupiu/chat/MainActivity;->requestInstallPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    return-void
.end method

.method private requestIntegrityDecision(Ljava/lang/String;Ljava/lang/String;Z)Lio/piupiu/chat/MainActivity$IntegrityGateResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 322
    const-string v0, "UTF-8"

    const-string v1, "POST"

    const-string v2, "https://www.piupiuchan.top/includes/app_integrity_check.php"

    .line 0
    const-string v3, "app_platform=android&app_package_name="

    const/4 v4, 0x0

    .line 324
    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 325
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 326
    :try_start_1
    invoke-virtual {v5, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v4, 0xbb8

    .line 327
    invoke-virtual {v5, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 328
    invoke-virtual {v5, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v4, 0x1

    .line 329
    invoke-virtual {v5, v4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const/4 v4, 0x0

    .line 330
    invoke-virtual {v5, v4}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 331
    const-string v6, "Accept"

    const-string v7, "application/json"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    const-string v6, "Content-Type"

    const-string v7, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 335
    invoke-static {p1, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, "&app_signature_sha256="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 336
    invoke-static {p2, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 337
    new-instance p2, Lorg/json/JSONObject;

    new-instance v0, Lio/piupiu/chat/BusinessRequestSigner;

    invoke-direct {v0, p0}, Lio/piupiu/chat/BusinessRequestSigner;-><init>(Landroid/content/Context;)V

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "url"

    .line 338
    invoke-virtual {v3, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "method"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "body"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 337
    invoke-virtual {v0, v1}, Lio/piupiu/chat/BusinessRequestSigner;->sign(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 339
    const-string v0, "error"

    invoke-virtual {p2, v0, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_b

    .line 340
    const-string v0, "headers"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 342
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 343
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 345
    :cond_0
    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 346
    array-length p2, p1

    invoke-virtual {v5, p2}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 347
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 348
    :try_start_2
    invoke-virtual {p2, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p2, :cond_1

    .line 349
    :try_start_3
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    .line 351
    :cond_1
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 p2, 0xc8

    if-lt p1, p2, :cond_2

    const/16 v0, 0x190

    if-ge p1, v0, :cond_2

    .line 353
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_1

    .line 354
    :cond_2
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    .line 355
    :goto_1
    invoke-direct {p0, v0}, Lio/piupiu/chat/MainActivity;->readUtf8Response(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 356
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 357
    const-string v0, "enabled"

    invoke-virtual {v1, v0, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 358
    const-string v2, "valid"

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const/16 v3, 0x1f4

    if-lt p1, v3, :cond_4

    .line 361
    const-string p2, "PiuPiuIntegrity"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Integrity server error "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, "; continuing offline"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    invoke-static {}, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->allow()Lio/piupiu/chat/MainActivity$IntegrityGateResult;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v5, :cond_3

    .line 375
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    return-object p1

    :cond_4
    if-nez v0, :cond_6

    .line 365
    :try_start_4
    invoke-static {}, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->allow()Lio/piupiu/chat/MainActivity$IntegrityGateResult;

    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz v5, :cond_5

    .line 375
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_5
    return-object p1

    :cond_6
    if-lt p1, p2, :cond_8

    const/16 p2, 0x12c

    if-ge p1, p2, :cond_8

    if-eqz v2, :cond_8

    if-eqz p3, :cond_8

    .line 368
    :try_start_5
    invoke-static {}, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->allow()Lio/piupiu/chat/MainActivity$IntegrityGateResult;

    move-result-object p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    if-eqz v5, :cond_7

    .line 375
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_7
    return-object p1

    .line 371
    :cond_8
    :try_start_6
    const-string p1, "message"

    const-string p2, "\u5f53\u524d\u5b89\u88c5\u5305\u4e0d\u662f\u5b98\u65b9\u7248\u672c\uff0c\u8bf7\u91cd\u65b0\u5b89\u88c5\u6b63\u7248\u5e94\u7528"

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 372
    invoke-static {p1}, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->reject(Ljava/lang/String;)Lio/piupiu/chat/MainActivity$IntegrityGateResult;

    move-result-object p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    if-eqz v5, :cond_9

    .line 375
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_9
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p2, :cond_a

    .line 347
    :try_start_7
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p2

    :try_start_8
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_2
    throw p1

    .line 339
    :cond_b
    new-instance p1, Ljava/lang/SecurityException;

    const-string p2, "Device request proof unavailable"

    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception p1

    move-object v4, v5

    goto :goto_3

    :catchall_3
    move-exception p1

    :goto_3
    if-eqz v4, :cond_c

    .line 375
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 377
    :cond_c
    throw p1
.end method

.method private requestNotificationPermission()V
    .locals 4

    .line 189
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x1

    const-string v3, "PiuPiuKeepAlive"

    if-lt v0, v1, :cond_1

    .line 191
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    const-string v1, "Requesting notification permission..."

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    iget-object v1, p0, Lio/piupiu/chat/MainActivity;->requestNotificationPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    return-void

    .line 196
    :cond_0
    iput-boolean v2, p0, Lio/piupiu/chat/MainActivity;->notificationPermissionGranted:Z

    .line 197
    const-string v0, "Notification permission already granted"

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 201
    :cond_1
    iput-boolean v2, p0, Lio/piupiu/chat/MainActivity;->notificationPermissionGranted:Z

    .line 202
    const-string v0, "Notification permission not required (API < 33)"

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private retryProtectedFrontendLicense()V
    .locals 1

    .line 309
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 312
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityCheckInProgress:Z

    const/4 v0, 0x0

    .line 313
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    .line 314
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->markChecking()V

    .line 315
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

    invoke-virtual {v0}, Lio/piupiu/chat/FrontendLicenseManager;->retry()V

    :cond_1
    :goto_0
    return-void
.end method

.method private sanitizeApkFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1439
    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1440
    const-string v0, ""

    if-nez p1, :cond_0

    move-object p1, v0

    .line 1443
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1445
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".apk"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    return-object v3

    .line 1449
    :cond_1
    const-string v1, "[\\\\/:*?\"<>|\\r\\n\\t]"

    const-string v4, "_"

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1450
    const-string v1, "^\\.+"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1451
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    return-object p1

    :cond_3
    :goto_0
    return-object v3
.end method

.method private sanitizeNotificationText(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    .line 1175
    const-string p1, ""

    goto :goto_0

    :cond_0
    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1176
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move-object p2, p1

    .line 1179
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-le p1, p3, :cond_2

    .line 1180
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 p3, p3, -0x1

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\u2026"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    return-object p2
.end method

.method private sha256Hex([B)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1214
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 1215
    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    .line 1216
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1217
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p1, v2

    .line 1218
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "%02X"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1220
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private showChatReplyNotificationNative(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1097
    const-string v0, "PiuPiuChatNotify"

    :try_start_0
    iget-boolean v1, p0, Lio/piupiu/chat/MainActivity;->appInForeground:Z

    if-eqz v1, :cond_0

    .line 1098
    const-string p1, "App is foreground; skip chat reply notification"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1102
    :cond_0
    const-string v1, "PiuPiu\u9171 \u5df2\u56de\u590d"

    const/16 v2, 0x50

    invoke-direct {p0, p1, v1, v2}, Lio/piupiu/chat/MainActivity;->sanitizeNotificationText(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 1103
    const-string v1, "\u65b0\u7684\u56de\u590d\u5df2\u7ecf\u751f\u6210\u5b8c\u6210\u3002"

    const/16 v2, 0xb4

    invoke-direct {p0, p2, v1, v2}, Lio/piupiu/chat/MainActivity;->sanitizeNotificationText(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    .line 1104
    invoke-static {p0, p1, p2}, Lio/piupiu/chat/KeepAliveService;->showReplyCompleted(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 1106
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1

    const-string v1, "android.permission.POST_NOTIFICATIONS"

    .line 1107
    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    .line 1109
    const-string p1, "POST_NOTIFICATIONS permission is not granted; foreground service notification was updated instead"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1114
    :cond_1
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->createChatReplyNotificationChannel()V

    .line 1116
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lio/piupiu/chat/MainActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x14000000

    .line 1117
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/high16 v2, 0xc000000

    const/16 v3, 0x7d0

    .line 1123
    invoke-static {p0, v3, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 1127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/32 v6, 0x186a0

    rem-long/2addr v4, v6

    long-to-int v2, v4

    add-int/2addr v2, v3

    .line 1129
    new-instance v3, Landroidx/core/app/NotificationCompat$Builder;

    const-string v4, "piupiu_chat_reply_native"

    invoke-direct {v3, p0, v4}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 1131
    invoke-virtual {v3, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    .line 1132
    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    new-instance v3, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v3}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 1133
    invoke-virtual {v3, p2}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    sget p2, Lio/piupiu/chat/R$drawable;->ic_launcher_foreground:I

    .line 1134
    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    .line 1135
    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    const/4 p2, 0x1

    .line 1136
    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    .line 1137
    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    const/4 v1, 0x0

    .line 1138
    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    const-string v1, "msg"

    .line 1139
    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    .line 1140
    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setVisibility(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    .line 1142
    const-string p2, "notification"

    invoke-virtual {p0, p2}, Lio/piupiu/chat/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/NotificationManager;

    if-eqz p2, :cond_2

    .line 1144
    invoke-virtual {p1}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {p2, v2, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 1145
    const-string p1, "Chat reply notification posted"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1147
    :cond_2
    const-string p1, "NotificationManager is null"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1150
    const-string p2, "Failed to show chat reply notification"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private startIntegrityGate()V
    .locals 2

    .line 251
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->isProtectedBuild()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 256
    :cond_0
    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityCheckInProgress:Z

    if-eqz v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x1

    .line 259
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityCheckInProgress:Z

    const/4 v0, 0x0

    .line 260
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    .line 261
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->markChecking()V

    .line 262
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

    new-instance v1, Lio/piupiu/chat/MainActivity$1;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$1;-><init>(Lio/piupiu/chat/MainActivity;)V

    invoke-virtual {v0, v1}, Lio/piupiu/chat/FrontendLicenseManager;->start(Lio/piupiu/chat/FrontendLicenseManager$Callback;)V

    return-void

    .line 252
    :cond_2
    :goto_0
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->completeVerifiedStartup()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 3

    .line 124
    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityGatePassed:Z

    if-nez v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->finishAffinity()V

    return-void

    .line 129
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    if-nez v0, :cond_1

    .line 130
    invoke-super {p0}, Lcom/getcapacitor/BridgeActivity;->onBackPressed()V

    return-void

    .line 134
    :cond_1
    new-instance v1, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0}, Lio/piupiu/chat/MainActivity$$ExternalSyntheticLambda14;-><init>(Lio/piupiu/chat/MainActivity;)V

    const-string v2, "(function(){if(window.piupiuCloseOfficialWebModal){window.piupiuCloseOfficialWebModal();return true;}return false;})()"

    invoke-virtual {v0, v2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 228
    invoke-super {p0, p1}, Lcom/getcapacitor/BridgeActivity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    .line 230
    invoke-static {p1}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    .line 232
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    .line 233
    new-instance v0, Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-direct {v0, p0}, Lio/piupiu/chat/ProtectedFrontendManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 234
    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->isProtectedBuild()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    new-instance v1, Lio/piupiu/chat/ProtectedBridgeWebViewClient;

    invoke-virtual {p0}, Lio/piupiu/chat/MainActivity;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v2

    iget-object v3, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-direct {v1, v2, v3}, Lio/piupiu/chat/ProtectedBridgeWebViewClient;-><init>(Lcom/getcapacitor/Bridge;Lio/piupiu/chat/ProtectedFrontendManager;)V

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->setWebViewClient(Lcom/getcapacitor/BridgeWebViewClient;)V

    .line 236
    new-instance v0, Lio/piupiu/chat/FrontendLicenseManager;

    iget-object v1, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-direct {v0, p0, v1}, Lio/piupiu/chat/FrontendLicenseManager;-><init>(Landroid/content/Context;Lio/piupiu/chat/ProtectedFrontendManager;)V

    iput-object v0, p0, Lio/piupiu/chat/MainActivity;->frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

    .line 239
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    new-instance v1, Lio/piupiu/chat/MainActivity$WebAppInterface;

    invoke-direct {v1, p0, p0}, Lio/piupiu/chat/MainActivity$WebAppInterface;-><init>(Lio/piupiu/chat/MainActivity;Landroid/content/Context;)V

    const-string v2, "AndroidDownloader"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 242
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 243
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->startIntegrityGate()V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1500
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->frontendLicenseManager:Lio/piupiu/chat/FrontendLicenseManager;

    if-eqz v0, :cond_0

    .line 1501
    invoke-virtual {v0}, Lio/piupiu/chat/FrontendLicenseManager;->shutdown()V

    .line 1503
    :cond_0
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    if-eqz v0, :cond_1

    .line 1504
    invoke-virtual {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->destroy()V

    .line 1506
    :cond_1
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 1507
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->businessProofExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 1508
    invoke-super {p0}, Lcom/getcapacitor/BridgeActivity;->onDestroy()V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 151
    invoke-super {p0}, Lcom/getcapacitor/BridgeActivity;->onResume()V

    .line 153
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->hideSystemUI()V

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 158
    invoke-super {p0}, Lcom/getcapacitor/BridgeActivity;->onStart()V

    const/4 v0, 0x1

    .line 159
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->appInForeground:Z

    .line 160
    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityGatePassed:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    invoke-static {p0}, Lio/piupiu/chat/KeepAliveService;->stop(Landroid/content/Context;)V

    .line 165
    const-string v0, "PiuPiuKeepAlive"

    const-string v1, "App in foreground, stopping keep-alive service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 4

    .line 170
    invoke-super {p0}, Lcom/getcapacitor/BridgeActivity;->onStop()V

    const/4 v0, 0x0

    .line 171
    iput-boolean v0, p0, Lio/piupiu/chat/MainActivity;->appInForeground:Z

    .line 172
    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityGatePassed:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/piupiu/chat/MainActivity;->integrityRejected:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 176
    :cond_0
    const-string v0, "onStop called, starting keep-alive service..."

    const-string v1, "PiuPiuKeepAlive"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    :try_start_0
    invoke-static {p0}, Lio/piupiu/chat/KeepAliveService;->start(Landroid/content/Context;)V

    .line 179
    const-string v0, "Keep-alive service start command sent"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 181
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to start keep-alive service: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1492
    invoke-super {p0, p1}, Lcom/getcapacitor/BridgeActivity;->onTrimMemory(I)V

    .line 1493
    iget-object v0, p0, Lio/piupiu/chat/MainActivity;->protectedFrontendManager:Lio/piupiu/chat/ProtectedFrontendManager;

    if-eqz v0, :cond_0

    .line 1494
    invoke-virtual {v0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->trimMemory(I)V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 208
    invoke-super {p0, p1}, Lcom/getcapacitor/BridgeActivity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    .line 210
    invoke-direct {p0}, Lio/piupiu/chat/MainActivity;->hideSystemUI()V

    :cond_0
    return-void
.end method
