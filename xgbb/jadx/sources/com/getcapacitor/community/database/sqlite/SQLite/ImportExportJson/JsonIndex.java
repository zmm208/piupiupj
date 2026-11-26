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
public class JsonIndex {
    private static final String TAG = "JsonIndex";
    private static final List<String> keyIndexesLevel = new ArrayList(Arrays.asList("name", "value", "mode"));
    private String name = "";
    private String value = "";
    private String mode = "";

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }

    public String getMode() {
        return this.mode;
    }

    public void setName(String newName) {
        this.name = newName;
    }

    public void setValue(String newValue) {
        this.value = newValue;
    }

    public void setMode(String newMode) {
        if (newMode.equalsIgnoreCase("UNIQUE")) {
            this.mode = newMode.toUpperCase();
        }
    }

    public ArrayList<String> getKeys() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (getName().length() > 0) {
            arrayList.add("name");
        }
        if (getValue().length() > 0) {
            arrayList.add("value");
        }
        if (getMode().length() > 0 && getMode().equalsIgnoreCase("UNIQUE")) {
            arrayList.add("mode");
        }
        return arrayList;
    }

    public boolean isIndexes(JSONObject jsObj) {
        if (jsObj == null || jsObj.length() == 0) {
            return false;
        }
        Iterator<String> itKeys = jsObj.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!keyIndexesLevel.contains(next)) {
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
                if (next.equals("mode")) {
                    if ((obj instanceof String) && ((String) obj).equalsIgnoreCase("UNIQUE")) {
                        this.mode = (String) obj;
                    }
                    return false;
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public void print() {
        String str = "name: " + getName() + " value: " + getValue();
        if (getMode().length() > 0) {
            str = str + " mode: " + getMode();
        }
        Log.d(TAG, str);
    }

    public JSObject getIndexAsJSObject() {
        JSObject jSObject = new JSObject();
        jSObject.put("name", this.name);
        jSObject.put("value", this.value);
        if (this.mode.length() > 0) {
            jSObject.put("mode", this.mode);
        }
        return jSObject;
    }
}
