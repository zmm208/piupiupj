.class final Lio/piupiu/chat/BusinessRequestSigner$ProofRejected;
.super Ljava/lang/SecurityException;
.source "BusinessRequestSigner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/BusinessRequestSigner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProofRejected"
.end annotation


# instance fields
.field final code:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 156
    const-string v0, "verification rejected"

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lio/piupiu/chat/BusinessRequestSigner$ProofRejected;->code:Ljava/lang/String;

    return-void
.end method
