.class final Lio/piupiu/chat/ProtectedOriginMatcher;
.super Ljava/lang/Object;
.source "ProtectedOriginMatcher.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static effectivePort(Ljava/lang/String;I)I
    .locals 0

    if-ltz p1, :cond_0

    return p1

    .line 18
    :cond_0
    const-string p1, "https"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p0, 0x1bb

    return p0

    .line 19
    :cond_1
    const-string p1, "http"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/16 p0, 0x50

    return p0

    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method static matches(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    if-eqz p3, :cond_1

    if-nez p4, :cond_0

    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 12
    invoke-virtual {p1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 13
    invoke-static {p0, p2}, Lio/piupiu/chat/ProtectedOriginMatcher;->effectivePort(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p3, p5}, Lio/piupiu/chat/ProtectedOriginMatcher;->effectivePort(Ljava/lang/String;I)I

    move-result p1

    if-ne p0, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    return v0
.end method
