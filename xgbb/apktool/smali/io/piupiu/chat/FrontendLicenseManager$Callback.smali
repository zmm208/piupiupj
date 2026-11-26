.class interface abstract Lio/piupiu/chat/FrontendLicenseManager$Callback;
.super Ljava/lang/Object;
.source "FrontendLicenseManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/FrontendLicenseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onAccountInvalid(Ljava/lang/String;)V
.end method

.method public abstract onAccountRequired()V
.end method

.method public abstract onFailure(Ljava/lang/String;Z)V
.end method

.method public abstract onUnlocked([BZ)V
.end method
