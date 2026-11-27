.class final Lio/piupiu/chat/ProtectedBridgeWebViewClient;
.super Lcom/getcapacitor/BridgeWebViewClient;
.source "ProtectedBridgeWebViewClient.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PiuPiuProtectedFrontend"


# instance fields
.field private final frontend:Lio/piupiu/chat/ProtectedFrontendManager;

.field private final localOrigin:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/getcapacitor/Bridge;Lio/piupiu/chat/ProtectedFrontendManager;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/getcapacitor/BridgeWebViewClient;-><init>(Lcom/getcapacitor/Bridge;)V

    .line 21
    iput-object p2, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    .line 22
    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getLocalUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->localOrigin:Landroid/net/Uri;

    return-void
.end method

.method private isLocalOrigin(Landroid/net/Uri;)Z
    .locals 7

    if-eqz p1, :cond_0

    .line 54
    iget-object v0, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->localOrigin:Landroid/net/Uri;

    .line 55
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->localOrigin:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->localOrigin:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v3

    .line 56
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Landroid/net/Uri;->getPort()I

    move-result v6

    .line 54
    invoke-static/range {v1 .. v6}, Lio/piupiu/chat/ProtectedOriginMatcher;->matches(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 10

    .line 27
    const-string v1, "no-store"

    const-string v2, "Cache-Control"

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    .line 28
    const-string v3, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 29
    :goto_0
    iget-object v4, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v4}, Lio/piupiu/chat/ProtectedFrontendManager;->isProtectedBuild()Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v4, "GET"

    .line 30
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 31
    invoke-direct {p0, v0}, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->isLocalOrigin(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 33
    :try_start_0
    iget-object v0, p0, Lio/piupiu/chat/ProtectedBridgeWebViewClient;->frontend:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-virtual {v0, v3}, Lio/piupiu/chat/ProtectedFrontendManager;->open(Ljava/lang/String;)Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 35
    new-instance p1, Landroid/webkit/WebResourceResponse;

    iget-object p2, v0, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;->mime:Ljava/lang/String;

    .line 37
    iget-object v4, v0, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;->mime:Ljava/lang/String;

    const-string v5, "text/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "UTF-8"

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    iget-object v0, v0, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;->stream:Ljava/io/InputStream;

    invoke-direct {p1, p2, v4, v0}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 39
    const-string p2, "OK"

    const/16 v0, 0xc8

    invoke-virtual {p1, v0, p2}, Landroid/webkit/WebResourceResponse;->setStatusCodeAndReasonPhrase(ILjava/lang/String;)V

    .line 40
    invoke-static {v2, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebResourceResponse;->setResponseHeaders(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 44
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Failed to decrypt "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "PiuPiuProtectedFrontend"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    new-instance v3, Landroid/webkit/WebResourceResponse;

    .line 46
    invoke-static {v2, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v8

    new-instance v9, Ljava/io/ByteArrayInputStream;

    const/4 p1, 0x0

    new-array p1, p1, [B

    invoke-direct {v9, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v4, "text/plain"

    const-string v5, "UTF-8"

    const/16 v6, 0x1f4

    const-string v7, "Protected resource unavailable"

    invoke-direct/range {v3 .. v9}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    return-object v3

    .line 50
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/getcapacitor/BridgeWebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method
