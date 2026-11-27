package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import android.util.Log;
import com.getcapacitor.JSObject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonTable {
    private static final String TAG = "JsonTable";
    private static final List<String> keyTableLevel = new ArrayList(Arrays.asList("name", "schema", "indexes", "triggers", "values"));
    private String name = "";
    private ArrayList<JsonColumn> schema = new ArrayList<>();
    private ArrayList<JsonIndex> indexes = new ArrayList<>();
    private ArrayList<JsonTrigger> triggers = new ArrayList<>();
    private ArrayList<ArrayList<Object>> values = new ArrayList<>();

    public String getName() {
        return this.name;
    }

    public ArrayList<JsonColumn> getSchema() {
        return this.schema;
    }

    public ArrayList<JsonIndex> getIndexes() {
        return this.indexes;
    }

    public ArrayList<JsonTrigger> getTriggers() {
        return this.triggers;
    }

    public ArrayList<ArrayList<Object>> getValues() {
        return this.values;
    }

    public void setName(String newName) {
        this.name = newName;
    }

    public void setSchema(ArrayList<JsonColumn> newSchema) {
        this.schema = newSchema;
    }

    public void setIndexes(ArrayList<JsonIndex> newIndexes) {
        this.indexes = newIndexes;
    }

    public void setTriggers(ArrayList<JsonTrigger> newTriggers) {
        this.triggers = newTriggers;
    }

    public void setValues(ArrayList<ArrayList<Object>> newValues) {
        this.values = newValues;
    }

    public ArrayList<String> getKeys() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (getName().length() > 0) {
            arrayList.add("names");
        }
        if (getSchema().size() > 0) {
            arrayList.add("schema");
        }
        if (getIndexes().size() > 0) {
            arrayList.add("indexes");
        }
        if (getTriggers().size() > 0) {
            arrayList.add("triggers");
        }
        if (getValues().size() > 0) {
            arrayList.add("values");
        }
        return arrayList;
    }

    public boolean isTable(JSONObject jsObj) {
        if (jsObj == null || jsObj.length() == 0) {
            return false;
        }
        Iterator<String> itKeys = jsObj.keys();
        int i = 0;
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!keyTableLevel.contains(next)) {
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
                if (next.equals("schema")) {
                    if (!(obj instanceof JSONArray) && !(obj instanceof ArrayList)) {
                        return false;
                    }
                    this.schema = new ArrayList<>();
                    JSONArray jSONArray = jsObj.getJSONArray(next);
                    int i2 = 0;
                    for (int i3 = 0; i3 < jSONArray.length(); i3++) {
                        JsonColumn jsonColumn = new JsonColumn();
                        boolean zIsSchema = jsonColumn.isSchema(jSONArray.getJSONObject(i3));
                        if (jsonColumn.getColumn() != null) {
                            i2++;
                        }
                        if (!zIsSchema) {
                            return false;
                        }
                        this.schema.add(jsonColumn);
                    }
                    i = i2;
                }
                if (next.equals("indexes")) {
                    if (!(obj instanceof JSONArray) && !(obj instanceof ArrayList)) {
                        return false;
                    }
                    this.indexes = new ArrayList<>();
                    JSONArray jSONArray2 = jsObj.getJSONArray(next);
                    for (int i4 = 0; i4 < jSONArray2.length(); i4++) {
                        JsonIndex jsonIndex = new JsonIndex();
                        if (!jsonIndex.isIndexes(jSONArray2.getJSONObject(i4))) {
                            return false;
                        }
                        this.indexes.add(jsonIndex);
                    }
                }
                if (next.equals("triggers")) {
                    if (!(obj instanceof JSONArray) && !(obj instanceof ArrayList)) {
                        return false;
                    }
                    this.triggers = new ArrayList<>();
                    JSONArray jSONArray3 = jsObj.getJSONArray(next);
                    for (int i5 = 0; i5 < jSONArray3.length(); i5++) {
                        JsonTrigger jsonTrigger = new JsonTrigger();
                        if (!jsonTrigger.isTrigger(jSONArray3.getJSONObject(i5))) {
                            return false;
                        }
                        this.triggers.add(jsonTrigger);
                    }
                }
                if (next.equals("values")) {
                    if (!(obj instanceof JSONArray) && !(obj instanceof ArrayList)) {
                        return false;
                    }
                    this.values = new ArrayList<>();
                    JSONArray jSONArray4 = jsObj.getJSONArray(next);
                    for (int i6 = 0; i6 < jSONArray4.length(); i6++) {
                        JSONArray jSONArray5 = jSONArray4.getJSONArray(i6);
                        ArrayList<Object> arrayList = new ArrayList<>();
                        for (int i7 = 0; i7 < jSONArray5.length(); i7++) {
                            if (i > 0 && jSONArray5.length() != i) {
                                return false;
                            }
                            arrayList.add(jSONArray5.get(i7));
                        }
                        this.values.add(arrayList);
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public void print() {
        Log.d(TAG, "name: " + getName());
        Log.d(TAG, "number of Schema: " + getSchema().size());
        Iterator<JsonColumn> it = getSchema().iterator();
        while (it.hasNext()) {
            it.next().print();
        }
        Log.d(TAG, "number of Indexes: " + getIndexes().size());
        Iterator<JsonIndex> it2 = getIndexes().iterator();
        while (it2.hasNext()) {
            it2.next().print();
        }
        Log.d(TAG, "number of Triggers: " + getTriggers().size());
        Iterator<JsonTrigger> it3 = getTriggers().iterator();
        while (it3.hasNext()) {
            it3.next().print();
        }
        Log.d(TAG, "number of Values: " + getValues().size());
        Iterator<ArrayList<Object>> it4 = getValues().iterator();
        while (it4.hasNext()) {
            Log.d(TAG, "row: " + it4.next());
        }
    }

    public JSObject getTableAsJSObject() {
        JSObject jSObject = new JSObject();
        jSObject.put("name", getName());
        JSONArray jSONArray = new JSONArray();
        if (this.schema.size() > 0) {
            Iterator<JsonColumn> it = this.schema.iterator();
            while (it.hasNext()) {
                jSONArray.put(it.next().getColumnAsJSObject());
            }
            jSObject.put("schema", (Object) jSONArray);
        }
        JSONArray jSONArray2 = new JSONArray();
        if (this.indexes.size() > 0) {
            Iterator<JsonIndex> it2 = this.indexes.iterator();
            while (it2.hasNext()) {
                jSONArray2.put(it2.next().getIndexAsJSObject());
            }
            jSObject.put("indexes", (Object) jSONArray2);
        }
        JSONArray jSONArray3 = new JSONArray();
        if (this.triggers.size() > 0) {
            Iterator<JsonTrigger> it3 = this.triggers.iterator();
            while (it3.hasNext()) {
                jSONArray3.put(it3.next().getTriggerAsJSObject());
            }
            jSObject.put("triggers", (Object) jSONArray3);
        }
        JSONArray jSONArray4 = new JSONArray();
        if (this.values.size() > 0) {
            for (ArrayList<Object> arrayList : this.values) {
                JSONArray jSONArray5 = new JSONArray();
                for (Object obj : arrayList) {
                    if (obj instanceof String) {
                        jSONArray5.put(obj.toString());
                    } else {
                        jSONArray5.put(obj);
                    }
                }
                jSONArray4.put(jSONArray5);
            }
            jSObject.put("values", (Object) jSONArray4);
        }
        return jSObject;
    }
}
