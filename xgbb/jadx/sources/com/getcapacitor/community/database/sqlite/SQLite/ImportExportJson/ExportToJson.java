package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import androidx.core.app.NotificationCompat;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.community.database.sqlite.NotificationCenter;
import com.getcapacitor.community.database.sqlite.SQLite.Database;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsDrop;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ExportToJson {
    private static final String TAG = ImportFromJson.class.getName();
    private final UtilsJson uJson = new UtilsJson();
    private final UtilsDrop _uDrop = new UtilsDrop();

    public void notifyExportProgressEvent(String msg) {
        NotificationCenter.defaultCenter().postNotification("exportJsonProgress", new HashMap<String, Object>("Export: " + msg) { // from class: com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ExportToJson.1
            final /* synthetic */ String val$message;

            {
                this.val$message = val$message;
                put(NotificationCompat.CATEGORY_PROGRESS, val$message);
            }
        });
    }

    /* JADX WARN: Code duplicated, block: B:10:0x0034  */
    public Long getLastExportDate(Database mDb) throws Exception {
        long j;
        try {
            if (!this.uJson.isTableExists(mDb, "sync_table")) {
                throw new Exception("GetSyncDate: No sync_table available");
            }
            List list = mDb.selectSQL("SELECT sync_date FROM sync_table WHERE id = 2;", new ArrayList<>()).toList();
            if (list.size() == 1) {
                j = ((JSObject) list.get(0)).getLong("sync_date");
                if (j <= 0) {
                    j = -1;
                }
            } else {
                j = -1;
            }
            return Long.valueOf(j);
        } catch (Exception e) {
            throw new Exception("GetSyncDate: " + e.getMessage());
        }
    }

    public void setLastExportDate(Database mDb, Long sTime) throws Exception {
        String str;
        try {
            if (!this.uJson.isTableExists(mDb, "sync_table")) {
                throw new Exception("SetLastExportDate: No sync_table available");
            }
            if (getLastExportDate(mDb).longValue() > 0) {
                str = "UPDATE sync_table SET sync_date = " + sTime + " WHERE id = 2;";
            } else {
                str = "INSERT INTO sync_table (sync_date) VALUES (" + sTime + ");";
            }
            if (mDb.prepareSQL(str, new ArrayList<>(), false, "no").getLong("lastId") < 0) {
                throw new Exception("SetLastExportDate: lastId < 0");
            }
        } catch (Exception e) {
            throw new Exception("SetLastExportDate: " + e.getMessage());
        }
    }

    public void delExportedRows(Database mDb) throws Exception {
        try {
            if (!this.uJson.isTableExists(mDb, "sync_table")) {
                throw new Exception("DelExportedRows: No sync_table available");
            }
            long jLongValue = getLastExportDate(mDb).longValue();
            if (jLongValue < 0) {
                throw new Exception("DelExportedRows: No last exported date available");
            }
            List<String> tablesNames = this._uDrop.getTablesNames(mDb);
            if (tablesNames.size() == 0) {
                throw new Exception("DelExportedRows: No table's names returned");
            }
            Iterator<String> it = tablesNames.iterator();
            while (it.hasNext()) {
                if (mDb.prepareSQL("DELETE FROM " + it.next() + " WHERE sql_deleted = 1 AND last_modified < " + jLongValue + ";", new ArrayList<>(), true, "no").getLong("lastId") < 0) {
                    throw new Exception("SetLastExportDate: lastId < 0");
                }
            }
        } catch (Exception e) {
            throw new Exception("DelExportedRows: " + e.getMessage());
        }
    }

    /* JADX WARN: Code duplicated, block: B:30:0x00e2  */
    public JsonSQLite createExportObject(Database db, JsonSQLite sqlObj) throws Exception {
        ArrayList<JsonTable> tablesPartial;
        JsonSQLite jsonSQLite = new JsonSQLite();
        ArrayList<JsonView> arrayList = new ArrayList<>();
        try {
            JSArray jSArraySelectSQL = db.selectSQL("SELECT name,sql FROM sqlite_master WHERE type = 'view' AND name NOT LIKE 'sqlite_%';", new ArrayList<>());
            byte b = 0;
            if (jSArraySelectSQL.length() > 0) {
                for (int i = 0; i < jSArraySelectSQL.length(); i++) {
                    JSONObject jSONObject = jSArraySelectSQL.getJSONObject(i);
                    JsonView jsonView = new JsonView();
                    String str = (String) jSONObject.get("sql");
                    String strSubstring = str.substring(str.indexOf("AS ") + 3);
                    jsonView.setName((String) jSONObject.get("name"));
                    jsonView.setValue(strSubstring);
                    arrayList.add(jsonView);
                }
            }
            JSArray jSArraySelectSQL2 = db.selectSQL((("SELECT name,sql FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%' AND ") + "name NOT LIKE 'android_%' AND ") + "name NOT LIKE 'sync_table';", new ArrayList<>());
            if (jSArraySelectSQL2.length() == 0) {
                throw new Exception("CreateExportObject: table's names failed");
            }
            if (!this.uJson.isTableExists(db, "sync_table") && sqlObj.getMode().equals("partial")) {
                throw new Exception("No sync_table available");
            }
            String mode = sqlObj.getMode();
            int iHashCode = mode.hashCode();
            if (iHashCode != -792934015) {
                if (iHashCode == 3154575 && mode.equals("full")) {
                    b = 1;
                } else {
                    b = -1;
                }
            } else if (!mode.equals("partial")) {
                b = -1;
            }
            if (b == 0) {
                tablesPartial = getTablesPartial(db, jSArraySelectSQL2);
            } else if (b == 1) {
                tablesPartial = getTablesFull(db, jSArraySelectSQL2);
            } else {
                throw new Exception("CreateExportObject: expMode " + sqlObj.getMode() + " not defined");
            }
            if (tablesPartial.size() > 0) {
                jsonSQLite.setDatabase(sqlObj.getDatabase());
                jsonSQLite.setVersion(sqlObj.getVersion());
                jsonSQLite.setEncrypted(sqlObj.getEncrypted());
                jsonSQLite.setMode(sqlObj.getMode());
                jsonSQLite.setTables(tablesPartial);
                if (arrayList.size() > 0) {
                    jsonSQLite.setViews(arrayList);
                }
            }
            return jsonSQLite;
        } catch (Exception e) {
            throw new Exception("CreateExportObject: " + e.getMessage());
        }
    }

    private ArrayList<JsonTable> getTablesFull(Database mDb, JSArray resTables) throws Exception {
        String str = "sql";
        String str2 = "name";
        ArrayList<JsonTable> arrayList = new ArrayList<>();
        try {
            List list = resTables.toList();
            int i = 0;
            while (i < list.size()) {
                if (((JSObject) list.get(i)).has(str2)) {
                    String string = ((JSObject) list.get(i)).getString(str2);
                    if (string == null) {
                        throw new Exception("GetTablesFull: no name");
                    }
                    if (((JSObject) list.get(i)).has(str)) {
                        String string2 = ((JSObject) list.get(i)).getString(str);
                        JsonTable jsonTable = new JsonTable();
                        ArrayList<JsonColumn> schema = getSchema(string2);
                        if (schema.size() == 0) {
                            throw new Exception("GetTablesFull: no Schema returned");
                        }
                        this.uJson.checkSchemaValidity(schema);
                        ArrayList<JsonIndex> indexes = getIndexes(mDb, string);
                        if (indexes.size() > 0) {
                            this.uJson.checkIndexesValidity(indexes);
                        }
                        ArrayList<JsonTrigger> triggers = getTriggers(mDb, string);
                        if (triggers.size() > 0) {
                            this.uJson.checkTriggersValidity(triggers);
                        }
                        String str3 = str2;
                        ArrayList<ArrayList<Object>> values = this.uJson.getValues(mDb, "SELECT * FROM " + string + ";", string);
                        jsonTable.setName(string);
                        if (schema.size() != 0) {
                            jsonTable.setSchema(schema);
                            if (indexes.size() != 0) {
                                jsonTable.setIndexes(indexes);
                            }
                            if (triggers.size() != 0) {
                                jsonTable.setTriggers(triggers);
                            }
                            i++;
                            notifyExportProgressEvent("Full: Table ".concat(string).concat(" schema export completed") + " " + i + "/" + list.size() + " ...");
                            if (values.size() != 0) {
                                jsonTable.setValues(values);
                            }
                            if (jsonTable.getKeys().size() <= 1) {
                                throw new Exception("GetTablesFull: table " + string + " is not a jsonTable");
                            }
                            arrayList.add(jsonTable);
                            notifyExportProgressEvent("Full: Table ".concat(string).concat(" data export completed") + " " + i + "/" + list.size() + " ...");
                            str = str;
                            str2 = str3;
                        } else {
                            throw new Exception("GetTablesFull: must contain schema");
                        }
                    } else {
                        throw new Exception("GetTablesFull: no sql");
                    }
                } else {
                    throw new Exception("GetTablesFull: no name");
                }
            }
            notifyExportProgressEvent("Full: Table's export completed");
            return arrayList;
        } catch (Exception e) {
            notifyExportProgressEvent("Full: Table's export failed");
            throw new Exception("GetTablesFull: " + e.getMessage());
        }
    }

    /* JADX WARN: Code duplicated, block: B:20:0x00bf  */
    /* JADX WARN: Code duplicated, block: B:28:0x00de A[SYNTHETIC] */
    private String modEmbeddedParentheses(String sqlStmt) throws Exception {
        String strSubstring;
        int i;
        String strSubstring2;
        List<Integer> indices = getIndices(sqlStmt, "(");
        List<Integer> indices2 = getIndices(sqlStmt, ")");
        if (indices.size() != indices2.size()) {
            throw new Exception("ModEmbeddedParentheses: Not same number of opening and closing parentheses");
        }
        if (indices.size() == 0) {
            return sqlStmt;
        }
        int i2 = 0;
        StringBuilder sb = new StringBuilder(sqlStmt.substring(0, indices.get(0).intValue() - 1));
        while (i2 < indices.size()) {
            if (i2 < indices.size() - 1) {
                i = i2 + 1;
                if (indices.get(i).intValue() < indices2.get(i2).intValue()) {
                    strSubstring2 = sqlStmt.substring(indices.get(i2).intValue() - 1, indices2.get(i).intValue());
                } else {
                    strSubstring = sqlStmt.substring(indices.get(i2).intValue() - 1, indices2.get(i2).intValue());
                }
                sb.append(strSubstring2.replaceAll(",", "§"));
                if (i < indices.size() - 1) {
                    sb.append(sqlStmt.substring(indices2.get(i).intValue(), indices.get(i + 1).intValue() - 1));
                }
                i2 = i + 1;
            } else {
                strSubstring = sqlStmt.substring(indices.get(i2).intValue() - 1, indices2.get(i2).intValue());
            }
            String str = strSubstring;
            i = i2;
            strSubstring2 = str;
            sb.append(strSubstring2.replaceAll(",", "§"));
            if (i < indices.size() - 1) {
                sb.append(sqlStmt.substring(indices2.get(i).intValue(), indices.get(i + 1).intValue() - 1));
            }
            i2 = i + 1;
        }
        sb.append(sqlStmt.substring(indices2.get(indices2.size() - 1).intValue()));
        return sb.toString();
    }

    private List<Integer> getIndices(String textString, String search) {
        ArrayList arrayList = new ArrayList();
        int iIndexOf = 0;
        while (iIndexOf != -1) {
            iIndexOf = textString.indexOf(search, iIndexOf);
            if (iIndexOf != -1) {
                arrayList.add(Integer.valueOf(iIndexOf));
                iIndexOf++;
            }
        }
        return arrayList;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:21:0x0089  */
    private ArrayList<JsonColumn> getSchema(String sqlStmt) throws Exception {
        int i;
        char c;
        int i2;
        ArrayList<JsonColumn> arrayList = new ArrayList<>();
        try {
            String[] strArrSplit = modEmbeddedParentheses(sqlStmt.substring(sqlStmt.indexOf("(") + 1, sqlStmt.lastIndexOf(")"))).split(",");
            int length = strArrSplit.length;
            int i3 = 0;
            int i4 = 0;
            while (i4 < length) {
                String strTrim = strArrSplit[i4].replaceAll("\n", "").trim();
                String[] strArrSplit2 = strTrim.trim().split("\\s+", 2);
                JsonColumn jsonColumn = new JsonColumn();
                String upperCase = strArrSplit2[i3].toUpperCase();
                int i5 = i3;
                switch (strArrSplit2[i3].toUpperCase()) {
                    case "UNIQUE":
                        i = 2;
                        break;
                    case "FOREIGN":
                        i = i5;
                        break;
                    case "CONSTRAINT":
                        i = 3;
                        break;
                    case "PRIMARY":
                        i = 1;
                        break;
                    default:
                        i = -1;
                        break;
                }
                if (i != 0) {
                    if (i == 1 || i == 2) {
                        String str = upperCase.equals("PRIMARY") ? "CPK_" : "CUN_";
                        int iIndexOf = strTrim.indexOf("(");
                        int iIndexOf2 = strTrim.indexOf(")");
                        String str2 = str + strTrim.substring(iIndexOf + 1, iIndexOf2).replaceAll("§", "_");
                        strArrSplit2[i5] = str2;
                        strArrSplit2[i5] = str2.replaceAll("_ ", "_");
                        strArrSplit2[1] = strTrim.substring(i5, iIndexOf2 + 1);
                        jsonColumn.setConstraint(strArrSplit2[i5]);
                        i2 = 0;
                    } else {
                        if (i == 3) {
                            String[] strArrSplit3 = strArrSplit2[1].trim().split(" ", 2);
                            String str3 = strArrSplit3[i5];
                            strArrSplit2[i5] = str3;
                            jsonColumn.setConstraint(str3);
                            strArrSplit2[1] = strArrSplit3[1];
                        } else {
                            jsonColumn.setColumn(strArrSplit2[i5]);
                        }
                        i2 = i5;
                    }
                    c = 1;
                } else {
                    int iIndexOf3 = strTrim.indexOf("(");
                    int iIndexOf4 = strTrim.indexOf(")");
                    c = 1;
                    i2 = 0;
                    strArrSplit2[0] = strTrim.substring(iIndexOf3 + 1, iIndexOf4).replaceAll("§", ",");
                    strArrSplit2[1] = strTrim.substring(iIndexOf4 + 2);
                    jsonColumn.setForeignkey(strArrSplit2[0]);
                }
                jsonColumn.setValue(strArrSplit2[c].replaceAll("§", ","));
                arrayList.add(jsonColumn);
                i4++;
                i3 = i2;
                strArrSplit = strArrSplit;
            }
            return arrayList;
        } catch (JSONException e) {
            throw new Exception("GetSchema: " + e.getMessage());
        }
    }

    private ArrayList<JsonIndex> getIndexes(Database mDb, String tableName) throws Exception {
        ArrayList<JsonIndex> arrayList = new ArrayList<>();
        try {
            List list = mDb.selectSQL(("SELECT name,tbl_name,sql FROM sqlite_master WHERE type = 'index' AND tbl_name = '" + tableName) + "' AND sql NOTNULL;", new ArrayList<>()).toList();
            if (list.size() > 0) {
                for (int i = 0; i < list.size(); i++) {
                    JsonIndex jsonIndex = new JsonIndex();
                    if (Objects.equals(((JSObject) list.get(i)).getString("tbl_name"), tableName)) {
                        jsonIndex.setName(((JSObject) list.get(i)).getString("name"));
                        String string = ((JSObject) list.get(i)).getString("sql");
                        if (string != null && string.contains("UNIQUE")) {
                            jsonIndex.setMode("UNIQUE");
                        }
                        if (string != null) {
                            jsonIndex.setValue(string.substring(string.lastIndexOf("(") + 1, string.lastIndexOf(")")));
                            arrayList.add(jsonIndex);
                        } else {
                            throw new Exception("GetIndexes: sql statement is null");
                        }
                    } else {
                        throw new Exception("GetIndexes: table name doesn't match");
                    }
                }
            }
            return arrayList;
        } catch (JSONException e) {
            throw new Exception("GetIndexes: " + e.getMessage());
        }
    }

    private ArrayList<JsonTrigger> getTriggers(Database mDb, String tableName) throws Exception {
        String strTrim;
        ArrayList<JsonTrigger> arrayList = new ArrayList<>();
        try {
            List list = mDb.selectSQL(("SELECT name,tbl_name,sql FROM sqlite_master WHERE type = 'trigger' AND tbl_name = '" + tableName) + "' AND sql NOTNULL;", new ArrayList<>()).toList();
            if (list.size() > 0) {
                for (int i = 0; i < list.size(); i++) {
                    JsonTrigger jsonTrigger = new JsonTrigger();
                    if (Objects.equals(((JSObject) list.get(i)).getString("tbl_name"), tableName)) {
                        String string = ((JSObject) list.get(i)).getString("name");
                        String string2 = ((JSObject) list.get(i)).getString("sql");
                        if (string2 == null || string == null) {
                            throw new Exception("Error: getTriggers sql statement or name is null");
                        }
                        String[] strArrSplit = string2.split(string);
                        if (strArrSplit.length != 2) {
                            throw new Exception("Error: getTriggers sql split name does not return 2 values");
                        }
                        if (!strArrSplit[1].contains(tableName)) {
                            throw new Exception("Error: getTriggers sql split does not contains " + tableName);
                        }
                        String strTrim2 = strArrSplit[1].split(tableName)[0].trim();
                        String[] strArrSplit2 = strArrSplit[1].split(strTrim2 + ' ' + tableName);
                        if (strArrSplit2.length != 2) {
                            throw new Exception("Error: getTriggers sql split tableName does not return 2 values");
                        }
                        String strTrim3 = "";
                        if (!strArrSplit2[1].trim().substring(0, 5).equalsIgnoreCase("BEGIN")) {
                            String[] strArrSplit3 = strArrSplit2[1].trim().split("BEGIN");
                            if (strArrSplit3.length != 2) {
                                throw new Exception("Error: getTriggers sql split BEGIN does not return 2 values");
                            }
                            strTrim3 = strArrSplit3[0].trim();
                            strTrim = "BEGIN" + strArrSplit3[1];
                        } else {
                            strTrim = strArrSplit2[1].trim();
                        }
                        if (strTrim2.toUpperCase().endsWith(" ON")) {
                            strTrim2 = strTrim2.substring(0, strTrim2.length() - 3);
                        }
                        jsonTrigger.setName(string);
                        jsonTrigger.setTimeevent(strTrim2);
                        jsonTrigger.setLogic(strTrim);
                        if (strTrim3.length() > 0) {
                            jsonTrigger.setCondition(strTrim3);
                        }
                        arrayList.add(jsonTrigger);
                    } else {
                        throw new Exception("Error: getTriggers table name doesn't match");
                    }
                }
            }
            return arrayList;
        } catch (JSONException e) {
            throw new Exception("Error: getTriggers " + e.getMessage());
        }
    }

    private ArrayList<JsonTable> getTablesPartial(Database mDb, JSArray resTables) throws Exception {
        String str;
        ArrayList<String> arrayList;
        List list;
        ArrayList<JsonTable> arrayList2;
        ArrayList<JsonColumn> arrayList3;
        ArrayList<JsonTrigger> arrayList4;
        String str2;
        String str3 = "Create";
        String str4 = "sql";
        String str5 = "name";
        ArrayList<JsonTable> arrayList5 = new ArrayList<>();
        try {
            JSObject partialModeData = getPartialModeData(mDb, resTables);
            if (partialModeData.has("syncDate")) {
                long j = partialModeData.getLong("syncDate");
                if (partialModeData.has("modTables")) {
                    JSObject jSObject = partialModeData.getJSObject("modTables");
                    if (jSObject == null) {
                        throw new Exception("GetTablesPartial: no modTables");
                    }
                    ArrayList<String> jSObjectKeys = this.uJson.getJSObjectKeys(jSObject);
                    List list2 = resTables.toList();
                    int i = 0;
                    ArrayList<JsonTable> arrayList6 = arrayList5;
                    while (i < list2.size()) {
                        if (((JSObject) list2.get(i)).has(str5)) {
                            String string = ((JSObject) list2.get(i)).getString(str5);
                            if (string == null) {
                                throw new Exception("GetTablesPartial: no name");
                            }
                            String str6 = str5;
                            if (((JSObject) list2.get(i)).has(str4)) {
                                String string2 = ((JSObject) list2.get(i)).getString(str4);
                                if (jSObjectKeys.size() == 0 || !jSObjectKeys.contains(string)) {
                                    str = str4;
                                    arrayList = jSObjectKeys;
                                } else {
                                    str = str4;
                                    arrayList = jSObjectKeys;
                                    if (!Objects.equals(jSObject.getString(string), "No")) {
                                        JsonTable jsonTable = new JsonTable();
                                        jsonTable.setName(string);
                                        ArrayList<JsonColumn> arrayList7 = new ArrayList<>();
                                        ArrayList<JsonIndex> arrayList8 = new ArrayList<>();
                                        ArrayList<JsonTrigger> arrayList9 = new ArrayList<>();
                                        if (Objects.equals(jSObject.getString(string), str3)) {
                                            ArrayList<JsonColumn> schema = getSchema(string2);
                                            if (schema.size() > 0) {
                                                this.uJson.checkSchemaValidity(schema);
                                            }
                                            arrayList8 = getIndexes(mDb, string);
                                            if (arrayList8.size() > 0) {
                                                this.uJson.checkIndexesValidity(arrayList8);
                                            }
                                            ArrayList<JsonTrigger> triggers = getTriggers(mDb, string);
                                            if (triggers.size() > 0) {
                                                this.uJson.checkTriggersValidity(triggers);
                                            }
                                            arrayList3 = schema;
                                            arrayList4 = triggers;
                                        } else {
                                            arrayList3 = arrayList7;
                                            arrayList4 = arrayList9;
                                        }
                                        ArrayList<JsonIndex> arrayList10 = arrayList8;
                                        list = list2;
                                        str3 = str3;
                                        jSObject = jSObject;
                                        if (Objects.equals(jSObject.getString(string), str3)) {
                                            str2 = "SELECT * FROM " + string + ";";
                                        } else {
                                            str2 = "SELECT * FROM " + string + " WHERE last_modified >= " + j + ";";
                                        }
                                        ArrayList<ArrayList<Object>> values = this.uJson.getValues(mDb, str2, string);
                                        jsonTable.setName(string);
                                        if (arrayList3.size() != 0) {
                                            jsonTable.setSchema(arrayList3);
                                        }
                                        if (arrayList10.size() != 0) {
                                            jsonTable.setIndexes(arrayList10);
                                        }
                                        if (arrayList4.size() != 0) {
                                            jsonTable.setTriggers(arrayList4);
                                        }
                                        int i2 = i + 1;
                                        notifyExportProgressEvent("Partial: Table ".concat(string).concat(" schema export completed") + " " + i2 + "/" + list.size() + " ...");
                                        if (values.size() != 0) {
                                            jsonTable.setValues(values);
                                        }
                                        if (jsonTable.getKeys().size() <= 1) {
                                            throw new Exception("GetTablesPartial: table " + string + " is not a jsonTable");
                                        }
                                        arrayList2 = arrayList6;
                                        arrayList2.add(jsonTable);
                                        notifyExportProgressEvent("Partial: Table ".concat(string).concat(" data export completed") + " " + i2 + "/" + list.size() + " ...");
                                    }
                                    i++;
                                    arrayList6 = arrayList2;
                                    str4 = str;
                                    str5 = str6;
                                    jSObjectKeys = arrayList;
                                    list2 = list;
                                    str3 = str3;
                                    jSObject = jSObject;
                                }
                                list = list2;
                                arrayList2 = arrayList6;
                                i++;
                                arrayList6 = arrayList2;
                                str4 = str;
                                str5 = str6;
                                jSObjectKeys = arrayList;
                                list2 = list;
                                str3 = str3;
                                jSObject = jSObject;
                            } else {
                                throw new Exception("GetTablesPartial: no sql");
                            }
                        } else {
                            throw new Exception("GetTablesPartial: no name");
                        }
                    }
                    ArrayList<JsonTable> arrayList11 = arrayList6;
                    notifyExportProgressEvent("Partial: Table's export completed");
                    return arrayList11;
                }
                throw new Exception("GetTablesPartial: no modTables");
            }
            throw new Exception("GetTablesPartial: no syncDate");
        } catch (Exception e) {
            notifyExportProgressEvent("Partial: Table's export failed");
            throw new Exception("GetTablesPartial: " + e.getMessage());
        }
    }

    private JSObject getPartialModeData(Database mDb, JSArray resTables) throws Exception {
        JSObject jSObject = new JSObject();
        try {
            Long syncDate = getSyncDate(mDb);
            if (syncDate.longValue() == -1) {
                throw new Exception("GetPartialModeData: did not find a sync_date");
            }
            JSObject tablesModified = getTablesModified(mDb, resTables, syncDate);
            jSObject.put("syncDate", (Object) syncDate);
            jSObject.put("modTables", (Object) tablesModified);
            return jSObject;
        } catch (Exception e) {
            throw new Exception("GetPartialModeData: " + e.getMessage());
        }
    }

    /* JADX WARN: Code duplicated, block: B:10:0x0034  */
    public Long getSyncDate(Database mDb) throws Exception {
        long j;
        try {
            if (!this.uJson.isTableExists(mDb, "sync_table")) {
                throw new Exception("No sync_table available");
            }
            List list = mDb.selectSQL("SELECT sync_date FROM sync_table WHERE id = 1;", new ArrayList<>()).toList();
            if (list.size() == 1) {
                j = ((JSObject) list.get(0)).getLong("sync_date");
                if (j <= 0) {
                    j = -1;
                }
            } else {
                j = -1;
            }
            return Long.valueOf(j);
        } catch (Exception e) {
            throw new Exception("GetSyncDate: " + e.getMessage());
        }
    }

    private JSObject getTablesModified(Database mDb, JSArray resTables, Long syncDate) throws Exception {
        String str;
        JSObject jSObject = new JSObject();
        try {
            List list = resTables.toList();
            for (int i = 0; i < list.size(); i++) {
                if (((JSObject) list.get(i)).has("name")) {
                    String string = ((JSObject) list.get(i)).getString("name");
                    List list2 = mDb.selectSQL("SELECT count(*) AS count FROM " + string + ";", new ArrayList<>()).toList();
                    if (list2.size() != 1) {
                        break;
                    }
                    long j = ((JSObject) list2.get(0)).getLong("count");
                    List list3 = mDb.selectSQL("SELECT count(*) AS count FROM " + string + " WHERE last_modified >= " + syncDate + ";", new ArrayList<>()).toList();
                    if (list3.size() != 1) {
                        break;
                    }
                    long j2 = ((JSObject) list3.get(0)).getLong("count");
                    if (j2 == 0) {
                        str = "No";
                    } else if (j == j2) {
                        str = "Create";
                    } else {
                        str = "Modified";
                    }
                    jSObject.put(string, str);
                } else {
                    throw new Exception("GetTablesModified: no name");
                }
            }
            return jSObject;
        } catch (Exception e) {
            throw new Exception("GetTablesModified: " + e.getMessage());
        }
    }
}
