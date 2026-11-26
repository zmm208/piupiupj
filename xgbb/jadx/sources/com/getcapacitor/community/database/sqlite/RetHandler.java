package com.getcapacitor.community.database.sqlite;

import android.util.Log;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.PluginCall;

/* JADX INFO: loaded from: classes.dex */
public class RetHandler {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.RetHandler";

    public void retResult(PluginCall call, Boolean res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else if (res != null) {
            jSObject.put("result", (Object) res);
            call.resolve(jSObject);
        } else {
            call.resolve();
        }
    }

    public void retVersion(PluginCall call, Integer res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else if (res != null) {
            jSObject.put("version", (Object) res);
            call.resolve(jSObject);
        } else {
            call.resolve();
        }
    }

    public void retChanges(PluginCall call, JSObject res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else {
            jSObject.put("changes", (Object) res);
            call.resolve(jSObject);
        }
    }

    public void retValues(PluginCall call, JSArray res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else {
            jSObject.put("values", (Object) res);
            call.resolve(jSObject);
        }
    }

    public void retSyncDate(PluginCall call, Long res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else {
            jSObject.put("syncDate", (Object) res);
            call.resolve(jSObject);
        }
    }

    public void retJSObject(PluginCall call, JSObject res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else {
            jSObject.put("export", (Object) res);
            call.resolve(jSObject);
        }
    }

    public void retPath(PluginCall call, String res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else if (res != null) {
            jSObject.put("path", res);
            call.resolve(jSObject);
        } else {
            call.resolve();
        }
    }

    public void retUrl(PluginCall call, String res, String message) {
        JSObject jSObject = new JSObject();
        if (message != null) {
            jSObject.put("message", message);
            Log.v(TAG, "*** ERROR " + message);
            call.reject(message);
        } else if (res != null) {
            jSObject.put("url", res);
            call.resolve(jSObject);
        } else {
            call.resolve();
        }
    }
}
