package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import android.util.Log;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
public class JsonSQLite {
    private static final String TAG = "JsonSQLite";
    private static final List<String> keyFirstLevel = new ArrayList(Arrays.asList("database", "version", "overwrite", "encrypted", "mode", "tables", "views"));
    private String database = "";
    private Integer version = 1;
    private Boolean overwrite = false;
    private Boolean encrypted = null;
    private String mode = "";
    private ArrayList<JsonTable> tables = new ArrayList<>();
    private ArrayList<JsonView> views = new ArrayList<>();

    public String getDatabase() {
        return this.database;
    }

    public Integer getVersion() {
        return this.version;
    }

    public Boolean getOverwrite() {
        return this.overwrite;
    }

    public Boolean getEncrypted() {
        return this.encrypted;
    }

    public String getMode() {
        return this.mode;
    }

    public ArrayList<JsonTable> getTables() {
        return this.tables;
    }

    public ArrayList<JsonView> getViews() {
        return this.views;
    }

    public void setDatabase(String newDatabase) {
        this.database = newDatabase;
    }

    public void setVersion(Integer newVersion) {
        this.version = newVersion;
    }

    public void setOverwrite(Boolean newOverwrite) {
        this.overwrite = newOverwrite;
    }

    public void setEncrypted(Boolean newEncrypted) {
        this.encrypted = newEncrypted;
    }

    public void setMode(String newMode) {
        this.mode = newMode;
    }

    public void setTables(ArrayList<JsonTable> newTables) {
        this.tables = newTables;
    }

    public void setViews(ArrayList<JsonView> newViews) {
        this.views = newViews;
    }

    public ArrayList<String> getKeys() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (getDatabase().length() > 0) {
            arrayList.add("database");
        }
        if (getVersion() != null) {
            arrayList.add("version");
        }
        if (getOverwrite() != null) {
            arrayList.add("overwrite");
        }
        if (getEncrypted() != null) {
            arrayList.add("encrypted");
        }
        if (getMode().length() > 0) {
            arrayList.add("mode");
        }
        if (getTables().size() > 0) {
            arrayList.add("tables");
        }
        if (getViews().size() > 0) {
            arrayList.add("views");
        }
        return arrayList;
    }

    public boolean isJsonSQLite(JSObject jsObj, Boolean isEncryption) {
        if (jsObj == null || jsObj.length() == 0) {
            return false;
        }
        Iterator<String> itKeys = jsObj.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!keyFirstLevel.contains(next)) {
                return false;
            }
            try {
                Object obj = jsObj.get(next);
                if (next.equals("database")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.database = (String) obj;
                } else if (next.equals("version")) {
                    if (!(obj instanceof Integer)) {
                        return false;
                    }
                    this.version = (Integer) obj;
                } else if (next.equals("overwrite")) {
                    if (!(obj instanceof Boolean)) {
                        return false;
                    }
                    this.overwrite = jsObj.getBool(next);
                } else if (next.equals("encrypted")) {
                    if (!(obj instanceof Boolean)) {
                        return false;
                    }
                    Boolean bool = jsObj.getBool(next);
                    this.encrypted = bool;
                    if (bool.booleanValue() && !isEncryption.booleanValue()) {
                        return false;
                    }
                } else if (next.equals("mode")) {
                    if (!(obj instanceof String)) {
                        return false;
                    }
                    this.mode = jsObj.getString(next);
                } else if (next.equals("tables")) {
                    if (!(obj instanceof JSONArray)) {
                        Log.d(TAG, "value: not instance of JSONArray 1");
                        return false;
                    }
                    if (obj instanceof JSONArray) {
                        JSONArray jSONArray = jsObj.getJSONArray(next);
                        this.tables = new ArrayList<>();
                        for (int i = 0; i < jSONArray.length(); i++) {
                            JsonTable jsonTable = new JsonTable();
                            if (!jsonTable.isTable(jSONArray.getJSONObject(i))) {
                                return false;
                            }
                            this.tables.add(jsonTable);
                        }
                    } else {
                        Log.d(TAG, "value: not instance of JSONArray 2");
                    }
                } else if (!next.equals("views")) {
                    continue;
                } else {
                    if (!(obj instanceof JSONArray)) {
                        Log.d(TAG, "value: not instance of JSONArray");
                        return false;
                    }
                    JSONArray jSONArray2 = jsObj.getJSONArray(next);
                    this.views = new ArrayList<>();
                    for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                        JsonView jsonView = new JsonView();
                        if (!jsonView.isView(jSONArray2.getJSONObject(i2))) {
                            return false;
                        }
                        this.views.add(jsonView);
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
        Log.d(TAG, "database: " + getDatabase());
        Log.d(TAG, "version: " + getVersion());
        Log.d(TAG, "overwrite: " + getOverwrite());
        Log.d(TAG, "encrypted: " + getEncrypted());
        Log.d(TAG, "mode: " + getMode());
        Log.d(TAG, "number of Tables: " + getTables().size());
        Iterator<JsonTable> it = getTables().iterator();
        while (it.hasNext()) {
            it.next().print();
        }
        if (getViews().size() > 0) {
            Log.d(TAG, "number of Views: " + getViews().size());
            Iterator<JsonView> it2 = getViews().iterator();
            while (it2.hasNext()) {
                it2.next().print();
            }
        }
    }

    public JSArray getTablesAsJSObject() {
        JSArray jSArray = new JSArray();
        Iterator<JsonTable> it = this.tables.iterator();
        while (it.hasNext()) {
            jSArray.put(it.next().getTableAsJSObject());
        }
        return jSArray;
    }

    public JSArray getViewsAsJSObject() {
        JSArray jSArray = new JSArray();
        Iterator<JsonView> it = this.views.iterator();
        while (it.hasNext()) {
            jSArray.put(it.next().getViewAsJSObject());
        }
        return jSArray;
    }
}
