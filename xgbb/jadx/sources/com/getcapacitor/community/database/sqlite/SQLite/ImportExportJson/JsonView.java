package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import android.util.Log;
import com.getcapacitor.JSObject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonView {
    private static final String TAG = "JsonView";
    private static final List<String> keyViewsLevel = new ArrayList(Arrays.asList("name", "value"));
    private String name = "";
    private String value = "";

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }

    public void setName(String newName) {
        this.name = newName;
    }

    public void setValue(String newValue) {
        this.value = newValue;
    }

    public ArrayList<String> getKeys() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (getName().length() > 0) {
            arrayList.add("name");
        }
        if (getValue().length() > 0) {
            arrayList.add("value");
        }
        return arrayList;
    }

    public boolean isView(JSONObject jsObj) {
        if (jsObj == null || jsObj.length() == 0) {
            return false;
        }
        Iterator<String> itKeys = jsObj.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!keyViewsLevel.contains(next)) {
                return false;
            }
            try {
                Object obj = jsObj.get(next);
                if (next.equals("name")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.name = (String) obj;
                }
                if (next.equals("value")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.value = (String) obj;
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public void print() {
        Log.d(TAG, "name: " + getName() + " value: " + getValue());
    }

    public JSObject getViewAsJSObject() {
        JSObject jSObject = new JSObject();
        jSObject.put("name", this.name);
        jSObject.put("value", this.value);
        return jSObject;
    }
}
