.class final Lio/piupiu/chat/ProtectedFrontendManager$Segment;
.super Ljava/lang/Object;
.source "ProtectedFrontendManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/ProtectedFrontendManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Segment"
.end annotation


# instance fields
.field final iv:Ljava/lang/String;

.field final length:I

.field final offset:J

.field final plaintextLength:I

.field final tag:Ljava/lang/String;


# direct methods
.method constructor <init>(JIILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 422
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 423
    iput-wide p1, p0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->offset:J

    iput p3, p0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->length:I

    iput p4, p0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->plaintextLength:I

    iput-object p5, p0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->iv:Ljava/lang/String;

    iput-object p6, p0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->tag:Ljava/lang/String;

    return-void
.end method
