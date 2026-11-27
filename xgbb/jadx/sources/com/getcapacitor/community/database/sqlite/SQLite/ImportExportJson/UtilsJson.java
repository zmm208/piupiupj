package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.community.database.sqlite.SQLite.Database;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsDrop;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class UtilsJson {
    private JsonColumn uJCol = new JsonColumn();
    private JsonIndex uJIdx = new JsonIndex();
    private JsonTrigger uJTrg = new JsonTrigger();
    private JsonView uJView = new JsonView();
    private UtilsDrop _uDrop = new UtilsDrop();

    public boolean isLastModified(Database db) throws Exception {
        if (!db.isOpen().booleanValue()) {
            throw new Exception("isLastModified: Database not opened");
        }
        try {
            for (String str : this._uDrop.getTablesNames(db)) {
                JSObject tableColumnNamesTypes = getTableColumnNamesTypes(db, str);
                new ArrayList();
                if (tableColumnNamesTypes.has("names")) {
                    ArrayList<String> columnNames = getColumnNames(tableColumnNamesTypes.get("names"));
                    if (columnNames.size() > 0 && columnNames.contains("last_modified")) {
                        return true;
                    }
                } else {
                    throw new Exception("isLastModified: Table " + str + " no names");
                }
            }
            return false;
        } catch (Exception e) {
            throw new Exception("isLastModified: " + e.getMessage());
        }
    }

    public ArrayList<String> getColumnNames(Object obj) {
        return obj instanceof ArrayList ? (ArrayList) obj : new ArrayList<>();
    }

    public boolean isSqlDeleted(Database db) throws Exception {
        if (!db.isOpen().booleanValue()) {
            throw new Exception("isSqlDeleted: Database not opened");
        }
        try {
            for (String str : this._uDrop.getTablesNames(db)) {
                JSObject tableColumnNamesTypes = getTableColumnNamesTypes(db, str);
                new ArrayList();
                if (!tableColumnNamesTypes.has("names")) {
                    throw new Exception("isSqlDeleted: Table " + str + " no names");
                }
                if (getColumnNames(tableColumnNamesTypes.get("names")).contains("sql_deleted")) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            throw new Exception("isSqlDeleted: " + e.getMessage());
        }
    }

    public boolean isTableExists(Database db, String tableName) throws Exception {
        try {
            return db.selectSQL(new StringBuilder("SELECT name FROM sqlite_master WHERE type='table' AND name='").append(tableName).append("';").toString(), new ArrayList<>()).length() > 0;
        } catch (Exception e) {
            throw new Exception("isTableExists: " + e.getMessage());
        }
    }

    public boolean isViewExists(Database db, String viewName) throws Exception {
        try {
            return db.selectSQL(new StringBuilder("SELECT name FROM sqlite_master WHERE type='view' AND name='").append(viewName).append("';").toString(), new ArrayList<>()).length() > 0;
        } catch (Exception e) {
            throw new Exception("isViewExists: " + e.getMessage());
        }
    }

    public boolean isIdExists(Database mDb, String tableName, String firstColumnName, Object key) throws Exception {
        StringBuilder sbAppend = new StringBuilder("SELECT ").append(firstColumnName).append(" FROM ").append(tableName).append(" WHERE ").append(firstColumnName);
        if (key instanceof String) {
            sbAppend.append(" = '").append(key).append("';");
        } else {
            sbAppend.append(" = ").append(key).append(";");
        }
        try {
            return mDb.selectSQL(sbAppend.toString(), new ArrayList<>()).length() == 1;
        } catch (Exception e) {
            throw new Exception("isIdExists: " + e.getMessage());
        }
    }

    public String convertToString(ArrayList<String> arr, char sep) {
        StringBuilder sb = new StringBuilder();
        Iterator<String> it = arr.iterator();
        while (it.hasNext()) {
            sb.append(it.next());
            sb.append(sep);
        }
        sb.setLength(sb.length() - 1);
        return sb.toString();
    }

    public JSArray convertToJSArray(ArrayList<Object> row) {
        JSArray jSArray = new JSArray();
        for (int i = 0; i < row.size(); i++) {
            jSArray.put(row.get(i));
        }
        return jSArray;
    }

    public String createQuestionMarkString(Integer length) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length.intValue(); i++) {
            sb.append("?,");
        }
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }

    public String setNameForUpdate(ArrayList<String> names) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < names.size(); i++) {
            sb.append("(" + names.get(i) + ") = ? ,");
        }
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }

    public boolean checkColumnTypes(ArrayList<String> types, ArrayList<Object> values) {
        boolean zIsType = true;
        for (int i = 0; i < values.size(); i++) {
            zIsType = isType(types.get(i), values.get(i));
            if (!zIsType) {
                return zIsType;
            }
        }
        return zIsType;
    }

    private boolean isType(String type, Object value) {
        String upperCase = String.valueOf(value).toUpperCase();
        if (upperCase.equals("NULL") || upperCase.contains("BASE64") || value == null) {
            return true;
        }
        boolean z = type.equals("NULL") && (value instanceof JSONObject);
        if (type.equals("TEXT") && (value instanceof String)) {
            z = true;
        }
        if (type.equals("INTEGER") && (value instanceof Integer)) {
            z = true;
        }
        if (type.equals("INTEGER") && (value instanceof Long)) {
            z = true;
        }
        if (type.equals("REAL") && ((value instanceof Double) || (value instanceof Integer))) {
            z = true;
        }
        if (type.equals("BLOB") && (value instanceof Blob)) {
            return true;
        }
        return z;
    }

    public JSObject getTableColumnNamesTypes(Database mDb, String tableName) throws Exception {
        JSObject jSObject = new JSObject();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        try {
            List<JSObject> list = mDb.selectSQL("PRAGMA table_info('" + tableName + "');", new ArrayList<>()).toList();
            if (list.size() > 0) {
                for (JSObject jSObject2 : list) {
                    arrayList.add(jSObject2.getString("name"));
                    arrayList2.add(jSObject2.getString("type"));
                }
                jSObject.put("names", (Object) arrayList);
                jSObject.put("types", (Object) arrayList2);
            }
            return jSObject;
        } catch (JSONException e) {
            throw new Exception("GetTableColumnNamesTypes: " + e.getMessage());
        } catch (Exception e2) {
            throw new Exception("GetTableColumnNamesTypes: " + e2.getMessage());
        }
    }

    public ArrayList<String> getJSObjectKeys(JSObject jsonObject) {
        ArrayList<String> arrayList = new ArrayList<>();
        Iterator<String> itKeys = jsonObject.keys();
        while (itKeys.hasNext()) {
            arrayList.add(itKeys.next());
        }
        return arrayList;
    }

    public void checkRowValidity(Database mDb, ArrayList<String> tColNames, ArrayList<String> tColTypes, ArrayList<Object> row, int j, String tableName) throws Exception {
        if (tColNames.size() != row.size() || row.size() == 0 || tColNames.size() == 0) {
            throw new Exception("checkRowValidity: Table" + tableName + " values row " + j + " not correct length");
        }
        if (!checkColumnTypes(tColTypes, row)) {
            throw new Exception("checkRowValidity: Table" + tableName + " values row " + j + " not correct types");
        }
    }

    public void checkSchemaValidity(ArrayList<JsonColumn> schema) throws Exception {
        for (int i = 0; i < schema.size(); i++) {
            JSONObject jSONObject = new JSONObject();
            ArrayList<String> keys = schema.get(i).getKeys();
            if (keys.contains("column")) {
                jSONObject.put("column", schema.get(i).getColumn());
            }
            if (keys.contains("value")) {
                jSONObject.put("value", schema.get(i).getValue());
            }
            if (keys.contains("foreignkey")) {
                jSONObject.put("foreignkey", schema.get(i).getForeignkey());
            }
            if (keys.contains("constraint")) {
                jSONObject.put("constraint", schema.get(i).getConstraint());
            }
            if (!this.uJCol.isSchema(jSONObject)) {
                throw new Exception("checkSchemaValidity: schema[" + i + "] not valid");
            }
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:596)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public void checkIndexesValidity(ArrayList<JsonIndex> indexes) throws Exception {
        for (int i = 0; i < indexes.size(); i++) {
            JSONObject jSONObject = new JSONObject();
            ArrayList<String> keys = indexes.get(i).getKeys();
            if (keys.contains("value")) {
                jSONObject.put("value", indexes.get(i).getValue());
            }
            if (keys.contains("name")) {
                jSONObject.put("name", indexes.get(i).getName());
            }
            if (keys.contains("mode")) {
                String mode = indexes.get(i).getMode();
                if (mode.length() > 0 && mode.equals("UNIQUE")) {
                    jSONObject.put("mode", mode);
                }
            }
            if (!this.uJIdx.isIndexes(jSONObject)) {
                throw new Exception("checkIndexesValidity: indexes[" + i + "] not valid");
            }
        }
    }

    public void checkTriggersValidity(ArrayList<JsonTrigger> triggers) throws Exception {
        for (int i = 0; i < triggers.size(); i++) {
            JSONObject jSONObject = new JSONObject();
            ArrayList<String> keys = triggers.get(i).getKeys();
            if (keys.contains("name")) {
                jSONObject.put("name", triggers.get(i).getName());
            }
            if (keys.contains("timeevent")) {
                jSONObject.put("timeevent", triggers.get(i).getTimeevent());
            }
            if (keys.contains("condition")) {
                jSONObject.put("condition", triggers.get(i).getCondition());
            }
            if (keys.contains("logic")) {
                jSONObject.put("logic", triggers.get(i).getLogic());
            }
            if (!this.uJTrg.isTrigger(jSONObject)) {
                throw new Exception("checkTriggersValidity: triggers[" + i + "] not valid");
            }
        }
    }

    public void checkViewsValidity(ArrayList<JsonView> views) throws Exception {
        for (int i = 0; i < views.size(); i++) {
            JSONObject jSONObject = new JSONObject();
            ArrayList<String> keys = views.get(i).getKeys();
            if (keys.contains("value")) {
                jSONObject.put("value", views.get(i).getValue());
            }
            if (keys.contains("name")) {
                jSONObject.put("name", views.get(i).getName());
            }
            if (!this.uJView.isView(jSONObject)) {
                throw new Exception("checkViewsValidity: views[" + i + "] not valid");
            }
        }
    }

    public ArrayList<ArrayList<Object>> getValues(Database mDb, String query, String tableName) throws Exception {
        ArrayList<ArrayList<Object>> arrayList = new ArrayList<>();
        try {
            try {
                JSObject tableColumnNamesTypes = getTableColumnNamesTypes(mDb, tableName);
                new ArrayList();
                new ArrayList();
                if (tableColumnNamesTypes.has("names")) {
                    ArrayList<String> columnNames = getColumnNames(tableColumnNamesTypes.get("names"));
                    if (tableColumnNamesTypes.has("types")) {
                        ArrayList<String> columnNames2 = getColumnNames(tableColumnNamesTypes.get("types"));
                        List<JSObject> list = mDb.selectSQL(query, new ArrayList<>()).toList();
                        if (list.size() > 0) {
                            for (int i = 0; i < list.size(); i++) {
                                arrayList.add(createRowValues(list, i, columnNames, columnNames2));
                            }
                        }
                        return arrayList;
                    }
                    throw new Exception("GetValues: Table " + tableName + " no types");
                }
                throw new Exception("GetValues: Table " + tableName + " no names");
            } catch (Exception e) {
                throw new Exception("GetValues: " + e.getMessage());
            }
        } catch (Throwable unused) {
        }
    }

    public ArrayList<Object> createRowValues(List<JSObject> values, int pos, ArrayList<String> rowNames, ArrayList<String> rowTypes) throws Exception {
        ArrayList<Object> arrayList = new ArrayList<>();
        for (int i = 0; i < rowNames.size(); i++) {
            rowTypes.get(i);
            String str = rowNames.get(i);
            if (values.get(pos).has(str)) {
                Object obj = values.get(pos).get(str);
                if (obj.toString().equals("null")) {
                    arrayList.add(JSONObject.NULL);
                } else if (obj instanceof Long) {
                    arrayList.add(Long.valueOf(values.get(pos).getLong(str)));
                } else if (obj instanceof String) {
                    arrayList.add(values.get(pos).getString(str));
                } else if (obj instanceof Double) {
                    arrayList.add(Double.valueOf(values.get(pos).getDouble(str)));
                }
            } else {
                throw new Exception("CreateRowValues: value is not (string, nsnull,int64,double");
            }
        }
        return arrayList;
    }
}
