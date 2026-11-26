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
public class JsonTrigger {
    private static final String TAG = "JsonTrigger";
    private static final List<String> keyTriggerLevel = new ArrayList(Arrays.asList("name", "timeevent", "condition", "logic"));
    private String name = null;
    private String timeevent = null;
    private String condition = null;
    private String logic = null;

    public String getName() {
        return this.name;
    }

    public String getTimeevent() {
        return this.timeevent;
    }

    public String getCondition() {
        return this.condition;
    }

    public String getLogic() {
        return this.logic;
    }

    public void setName(String newName) {
        this.name = newName;
    }

    public void setTimeevent(String newTimeevent) {
        this.timeevent = newTimeevent;
    }

    public void setCondition(String newCondition) {
        this.condition = newCondition;
    }

    public void setLogic(String newLogic) {
        this.logic = newLogic;
    }

    public ArrayList<String> getKeys() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (getName() != null && getName().length() > 0) {
            arrayList.add("name");
        }
        if (getTimeevent() != null && getTimeevent().length() > 0) {
            arrayList.add("timeevent");
        }
        if (getCondition() != null && getCondition().length() > 0) {
            arrayList.add("condition");
        }
        if (getLogic() != null && getLogic().length() > 0) {
            arrayList.add("logic");
        }
        return arrayList;
    }

    public boolean isTrigger(JSONObject jsObj) {
        if (jsObj == null || jsObj.length() == 0) {
            return false;
        }
        Iterator<String> itKeys = jsObj.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!keyTriggerLevel.contains(next)) {
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
                if (next.equals("timeevent")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.timeevent = (String) obj;
                }
                if (next.equals("condition")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.condition = (String) obj;
                }
                if (next.equals("logic")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.logic = (String) obj;
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public void print() {
        String str = "name: " + getName() + " timeevent: " + getTimeevent();
        if (getCondition() != null) {
            str = str + " condition: " + getCondition();
        }
        Log.d(TAG, str + " logic: " + getLogic());
    }

    public JSObject getTriggerAsJSObject() {
        JSObject jSObject = new JSObject();
        jSObject.put("name", this.name);
        jSObject.put("timeevent", this.timeevent);
        String str = this.condition;
        if (str != null) {
            jSObject.put("condition", str);
        }
        jSObject.put("logic", this.logic);
        return jSObject;
    }
}
