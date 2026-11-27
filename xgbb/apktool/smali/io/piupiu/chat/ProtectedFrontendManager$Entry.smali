.class final Lio/piupiu/chat/ProtectedFrontendManager$Entry;
.super Ljava/lang/Object;
.source "ProtectedFrontendManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/ProtectedFrontendManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field final legacySha256:Ljava/lang/String;

.field final mime:Ljava/lang/String;

.field final plaintextLength:J

.field final segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;


# direct methods
.method constructor <init>(JLjava/lang/String;[Lio/piupiu/chat/ProtectedFrontendManager$Segment;Ljava/lang/String;)V
    .locals 0

    .line 416
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 417
    iput-wide p1, p0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->plaintextLength:J

    iput-object p3, p0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->mime:Ljava/lang/String;

    iput-object p4, p0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    iput-object p5, p0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->legacySha256:Ljava/lang/String;

    return-void
.end method
