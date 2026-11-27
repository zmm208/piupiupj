.class final Lio/piupiu/chat/MainActivity$IntegrityGateResult;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IntegrityGateResult"
.end annotation


# instance fields
.field final allowed:Z

.field final message:Ljava/lang/String;


# direct methods
.method private constructor <init>(ZLjava/lang/String;)V
    .locals 0

    .line 574
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 575
    iput-boolean p1, p0, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->allowed:Z

    .line 576
    iput-object p2, p0, Lio/piupiu/chat/MainActivity$IntegrityGateResult;->message:Ljava/lang/String;

    return-void
.end method

.method static allow()Lio/piupiu/chat/MainActivity$IntegrityGateResult;
    .locals 3

    .line 580
    new-instance v0, Lio/piupiu/chat/MainActivity$IntegrityGateResult;

    const/4 v1, 0x1

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lio/piupiu/chat/MainActivity$IntegrityGateResult;-><init>(ZLjava/lang/String;)V

    return-object v0
.end method

.method static reject(Ljava/lang/String;)Lio/piupiu/chat/MainActivity$IntegrityGateResult;
    .locals 2

    .line 584
    new-instance v0, Lio/piupiu/chat/MainActivity$IntegrityGateResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lio/piupiu/chat/MainActivity$IntegrityGateResult;-><init>(ZLjava/lang/String;)V

    return-object v0
.end method
