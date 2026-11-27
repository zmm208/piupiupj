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
public class JsonColumn {
    private static final String TAG = "JsonColumn";
    private static final List<String> keySchemaLevel = new ArrayList(Arrays.asList("column", "value", "foreignkey", "constraint"));
    private String column = null;
    private String value = null;
    private String foreignkey = null;
    private String constraint = null;

    public String getColumn() {
        return this.column;
    }

    public String getValue() {
        return this.value;
    }

    public String getForeignkey() {
        return this.foreignkey;
    }

    public String getConstraint() {
        return this.constraint;
    }

    public void setColumn(String newColumn) {
        this.column = newColumn;
    }

    public void setValue(String newValue) {
        this.value = newValue;
    }

    public void setForeignkey(String newForeignkey) {
        this.foreignkey = newForeignkey;
    }

    public void setConstraint(String newConstraint) {
        this.constraint = newConstraint;
    }

    public ArrayList<String> getKeys() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (getColumn() != null && getColumn().length() > 0) {
            arrayList.add("column");
        }
        if (getValue() != null && getValue().length() > 0) {
            arrayList.add("value");
        }
        if (getForeignkey() != null && getForeignkey().length() > 0) {
            arrayList.add("foreignkey");
        }
        if (getConstraint() != null && getConstraint().length() > 0) {
            arrayList.add("constraint");
        }
        return arrayList;
    }

    public boolean isSchema(JSONObject jsObj) {
        if (jsObj == null || jsObj.length() == 0) {
            return false;
        }
        Iterator<String> itKeys = jsObj.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!keySchemaLevel.contains(next)) {
                return false;
            }
            try {
                Object obj = jsObj.get(next);
                if (next.equals("column")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.column = (String) obj;
                }
                if (next.equals("value")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.value = (String) obj;
                }
                if (next.equals("foreignkey")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.foreignkey = (String) obj;
                }
                if (next.equals("constraint")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.constraint = (String) obj;
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public void print() {
        String str = getColumn() != null ? "column: " + getColumn() : "";
        if (getForeignkey() != null) {
            str = str + " foreignkey: " + getForeignkey();
        }
        if (getConstraint() != null) {
            str = str + " constraint: " + getConstraint();
        }
        Log.d(TAG, str + " value: " + getValue());
    }

    public JSObject getColumnAsJSObject() {
        JSObject jSObject = new JSObject();
        String str = this.column;
        if (str != null) {
            jSObject.put("column", str);
        }
        jSObject.put("value", this.value);
        String str2 = this.foreignkey;
        if (str2 != null) {
            jSObject.put("foreignkey", str2);
        }
        String str3 = this.constraint;
        if (str3 != null) {
            jSObject.put("constraint", str3);
        }
        return jSObject;
    }
}
