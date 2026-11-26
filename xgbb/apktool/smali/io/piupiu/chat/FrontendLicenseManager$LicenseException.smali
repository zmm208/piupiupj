.class final Lio/piupiu/chat/FrontendLicenseManager$LicenseException;
.super Ljava/lang/Exception;
.source "FrontendLicenseManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/FrontendLicenseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LicenseException"
.end annotation


# instance fields
.field final code:Ljava/lang/String;

.field final rejected:Z


# direct methods
.method constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 955
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 956
    iput-boolean p2, p0, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->rejected:Z

    if-nez p3, :cond_0

    .line 957
    const-string p3, ""

    :cond_0
    iput-object p3, p0, Lio/piupiu/chat/FrontendLicenseManager$LicenseException;->code:Ljava/lang/String;

    return-void
.end method
