.class Lio/piupiu/chat/ProtectedFrontendManager$1;
.super Landroid/util/LruCache;
.source "ProtectedFrontendManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/ProtectedFrontendManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache<",
        "Ljava/lang/String;",
        "[B>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lio/piupiu/chat/ProtectedFrontendManager;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 46
    invoke-direct {p0, p2}, Landroid/util/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 46
    check-cast p2, Ljava/lang/String;

    check-cast p3, [B

    check-cast p4, [B

    invoke-virtual {p0, p1, p2, p3, p4}, Lio/piupiu/chat/ProtectedFrontendManager$1;->entryRemoved(ZLjava/lang/String;[B[B)V

    return-void
.end method

.method protected entryRemoved(ZLjava/lang/String;[B[B)V
    .locals 0

    if-eqz p3, :cond_0

    if-eq p3, p4, :cond_0

    .line 49
    invoke-static {p3}, Lio/piupiu/chat/ProtectedFrontendManager;->-$$Nest$smwipe([B)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 46
    check-cast p1, Ljava/lang/String;

    check-cast p2, [B

    invoke-virtual {p0, p1, p2}, Lio/piupiu/chat/ProtectedFrontendManager$1;->sizeOf(Ljava/lang/String;[B)I

    move-result p1

    return p1
.end method

.method protected sizeOf(Ljava/lang/String;[B)I
    .locals 0

    .line 47
    array-length p1, p2

    return p1
.end method
