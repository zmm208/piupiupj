package io.piupiu.chat;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import androidx.webkit.internal.AssetHelper;
import com.getcapacitor.Bridge;
import com.getcapacitor.BridgeWebViewClient;
import java.io.ByteArrayInputStream;
import java.util.Collections;

/* JADX INFO: loaded from: classes.dex */
final class ProtectedBridgeWebViewClient extends BridgeWebViewClient {
    private static final String TAG = "PiuPiuProtectedFrontend";
    private final ProtectedFrontendManager frontend;
    private final Uri localOrigin;

    ProtectedBridgeWebViewClient(Bridge bridge, ProtectedFrontendManager protectedFrontendManager) {
        super(bridge);
        this.frontend = protectedFrontendManager;
        this.localOrigin = Uri.parse(bridge.getLocalUrl());
    }

    @Override // com.getcapacitor.BridgeWebViewClient, android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView webView, WebResourceRequest webResourceRequest) {
        Uri url = webResourceRequest.getUrl();
        String path = url == null ? "" : url.getPath();
        if (this.frontend.isProtectedBuild() && "GET".equalsIgnoreCase(webResourceRequest.getMethod()) && isLocalOrigin(url)) {
            try {
                ProtectedFrontendManager.DecryptedResource decryptedResourceOpen = this.frontend.open(path);
                if (decryptedResourceOpen != null) {
                    WebResourceResponse webResourceResponse = new WebResourceResponse(decryptedResourceOpen.mime, decryptedResourceOpen.mime.startsWith("text/") ? "UTF-8" : null, decryptedResourceOpen.stream);
                    webResourceResponse.setStatusCodeAndReasonPhrase(200, "OK");
                    webResourceResponse.setResponseHeaders(Collections.singletonMap("Cache-Control", "no-store"));
                    return webResourceResponse;
                }
            } catch (Exception e) {
                Log.e(TAG, "Failed to decrypt " + path, e);
                return new WebResourceResponse(AssetHelper.DEFAULT_MIME_TYPE, "UTF-8", 500, "Protected resource unavailable", Collections.singletonMap("Cache-Control", "no-store"), new ByteArrayInputStream(new byte[0]));
            }
        }
        return super.shouldInterceptRequest(webView, webResourceRequest);
    }

    private boolean isLocalOrigin(Uri uri) {
        return uri != null && ProtectedOriginMatcher.matches(this.localOrigin.getScheme(), this.localOrigin.getHost(), this.localOrigin.getPort(), uri.getScheme(), uri.getHost(), uri.getPort());
    }
}
