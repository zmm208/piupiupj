.class final Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;
.super Ljava/lang/Object;
.source "ProtectedFrontendManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/ProtectedFrontendManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DecryptedResource"
.end annotation


# instance fields
.field final mime:Ljava/lang/String;

.field final stream:Ljava/io/InputStream;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 0

    .line 386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;->mime:Ljava/lang/String;

    iput-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;->stream:Ljava/io/InputStream;

    return-void
.end method
