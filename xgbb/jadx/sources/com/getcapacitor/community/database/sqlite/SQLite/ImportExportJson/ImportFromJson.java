package com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson;

import android.database.SQLException;
import androidx.core.app.NotificationCompat;
import androidx.sqlite.p001db.SupportSQLiteDatabase;
import com.getcapacitor.JSObject;
import com.getcapacitor.community.database.sqlite.NotificationCenter;
import com.getcapacitor.community.database.sqlite.SQLite.Database;
import com.getcapacitor.community.database.sqlite.SQLite.Database$$ExternalSyntheticBackport0;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsDrop;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsSQLite;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.function.Function;
import java.util.function.IntFunction;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ImportFromJson {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ImportFromJson";
    private UtilsJson _uJson = new UtilsJson();
    private UtilsDrop _uDrop = new UtilsDrop();
    private UtilsSQLite _uSqlite = new UtilsSQLite();

    public void notifyImportProgressEvent(String msg) {
        NotificationCenter.defaultCenter().postNotification("importJsonProgress", new HashMap<String, Object>(msg) { // from class: com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ImportFromJson.1
            final /* synthetic */ String val$msg;

            {
                this.val$msg = msg;
                put(NotificationCompat.CATEGORY_PROGRESS, "Import: " + msg);
            }
        });
    }

    public Integer createDatabaseSchema(Database db, JsonSQLite jsonSQL) throws Exception {
        Integer num = -1;
        num.intValue();
        db.getDb().setVersion(jsonSQL.getVersion().intValue());
        if (jsonSQL.getMode().equals("full")) {
            try {
                this._uDrop.dropAll(db);
            } catch (Exception e) {
                throw new Exception("CreateDatabaseSchema: " + e.getMessage());
            }
        }
        try {
            int iIntValue = createSchema(db, jsonSQL).intValue();
            notifyImportProgressEvent("Schema creation completed changes: " + iIntValue);
            return Integer.valueOf(iIntValue);
        } catch (Exception e2) {
            throw new Exception("CreateDatabaseSchema: " + e2.getMessage());
        }
    }

    private Integer createSchema(Database mDb, JsonSQLite jsonSQL) throws Exception {
        Integer num = -1;
        int iIntValue = num.intValue();
        SupportSQLiteDatabase db = mDb.getDb();
        try {
            if (mDb != null) {
                try {
                    try {
                        if (mDb.isOpen().booleanValue() && jsonSQL != null) {
                            mDb.beginTransaction();
                            ArrayList<String> arrayListCreateSchemaStatement = createSchemaStatement(jsonSQL);
                            if (arrayListCreateSchemaStatement.size() > 0) {
                                Integer numValueOf = Integer.valueOf(this._uSqlite.dbChanges(db));
                                Iterator<String> it = arrayListCreateSchemaStatement.iterator();
                                while (it.hasNext()) {
                                    db.execSQL(it.next());
                                }
                                iIntValue = this._uSqlite.dbChanges(db) - numValueOf.intValue();
                                if (iIntValue >= 0) {
                                    mDb.commitTransaction();
                                }
                            } else if (jsonSQL.getMode().equals("partial")) {
                                Integer num2 = 0;
                                iIntValue = num2.intValue();
                            }
                            if (db != null && db.inTransaction()) {
                                mDb.rollbackTransaction();
                            }
                            return Integer.valueOf(iIntValue);
                        }
                    } catch (Exception e) {
                        throw new Exception("CreateSchema: " + e.getMessage());
                    }
                } catch (SQLException e2) {
                    throw new Exception("CreateSchema: " + e2.getMessage());
                } catch (IllegalStateException e3) {
                    throw new Exception("CreateSchema: " + e3.getMessage());
                }
            }
            throw new Exception("CreateSchema: Database not opened");
        } catch (Throwable th) {
            if (db != null && db.inTransaction()) {
                mDb.rollbackTransaction();
            }
            throw th;
        }
    }

    private ArrayList<String> createSchemaStatement(JsonSQLite jsonSQL) {
        ArrayList<String> arrayList = new ArrayList<>();
        jsonSQL.getMode();
        for (int i = 0; i < jsonSQL.getTables().size(); i++) {
            String name = jsonSQL.getTables().get(i).getName();
            if (jsonSQL.getTables().get(i).getSchema().size() > 0) {
                ArrayList<JsonColumn> schema = jsonSQL.getTables().get(i).getSchema();
                if (schema.size() > 0) {
                    arrayList.addAll(createTableSchema(schema, name));
                }
            }
            if (jsonSQL.getTables().get(i).getIndexes().size() > 0) {
                ArrayList<JsonIndex> indexes = jsonSQL.getTables().get(i).getIndexes();
                if (indexes.size() > 0) {
                    arrayList.addAll(createTableIndexes(indexes, name));
                }
            }
            if (jsonSQL.getTables().get(i).getTriggers().size() > 0) {
                ArrayList<JsonTrigger> triggers = jsonSQL.getTables().get(i).getTriggers();
                if (triggers.size() > 0) {
                    arrayList.addAll(createTableTriggers(triggers, name));
                }
            }
        }
        return arrayList;
    }

    private ArrayList<String> createTableSchema(ArrayList<JsonColumn> mSchema, String tableName) {
        ArrayList<String> arrayList = new ArrayList<>();
        String str = "CREATE TABLE IF NOT EXISTS " + tableName + " (";
        Boolean bool = false;
        Boolean bool2 = bool;
        for (int i = 0; i < mSchema.size(); i++) {
            if (i == mSchema.size() - 1) {
                if (mSchema.get(i).getColumn() != null) {
                    str = str + mSchema.get(i).getColumn() + " " + mSchema.get(i).getValue();
                    if (mSchema.get(i).getColumn().equals("last_modified")) {
                        bool = true;
                    }
                    if (mSchema.get(i).getColumn().equals("sql_deleted")) {
                        bool2 = true;
                    }
                } else if (mSchema.get(i).getForeignkey() != null) {
                    str = str + "FOREIGN KEY (" + mSchema.get(i).getForeignkey() + ") " + mSchema.get(i).getValue();
                } else if (mSchema.get(i).getConstraint() != null) {
                    str = str + "CONSTRAINT " + mSchema.get(i).getConstraint() + " " + mSchema.get(i).getValue();
                }
            } else if (mSchema.get(i).getColumn() != null) {
                str = str + mSchema.get(i).getColumn() + " " + mSchema.get(i).getValue() + ",";
                if (mSchema.get(i).getColumn().equals("last_modified")) {
                    bool = true;
                }
                if (mSchema.get(i).getColumn().equals("sql_deleted")) {
                    bool2 = true;
                }
            } else if (mSchema.get(i).getForeignkey() != null) {
                str = str + "FOREIGN KEY (" + mSchema.get(i).getForeignkey() + ") " + mSchema.get(i).getValue() + ",";
            } else if (mSchema.get(i).getConstraint() != null) {
                str = str + "CONSTRAINT " + mSchema.get(i).getConstraint() + " " + mSchema.get(i).getValue() + ",";
            }
        }
        arrayList.add(str + ");");
        if (bool.booleanValue() && bool2.booleanValue()) {
            arrayList.add("CREATE TRIGGER IF NOT EXISTS " + tableName + "_trigger_last_modified AFTER UPDATE ON " + tableName + " FOR EACH ROW WHEN NEW.last_modified <= OLD.last_modified BEGIN UPDATE " + tableName + " SET last_modified = (strftime('%s','now')) WHERE id=NEW.id; END;");
        }
        return arrayList;
    }

    private ArrayList<String> createTableIndexes(ArrayList<JsonIndex> mIndexes, String tableName) {
        ArrayList<String> arrayList = new ArrayList<>();
        for (int i = 0; i < mIndexes.size(); i++) {
            String mode = mIndexes.get(i).getMode();
            arrayList.add("CREATE " + (mode.length() > 0 ? mode + " " : "") + "INDEX IF NOT EXISTS " + mIndexes.get(i).getName() + " ON " + tableName + " (" + mIndexes.get(i).getValue() + ");");
        }
        return arrayList;
    }

    private ArrayList<String> createTableTriggers(ArrayList<JsonTrigger> mTriggers, String tableName) {
        ArrayList<String> arrayList = new ArrayList<>();
        for (int i = 0; i < mTriggers.size(); i++) {
            String timeevent = mTriggers.get(i).getTimeevent();
            if (timeevent.toUpperCase().endsWith(" ON")) {
                timeevent = timeevent.substring(0, timeevent.length() - 3);
            }
            StringBuilder sbAppend = new StringBuilder("CREATE TRIGGER IF NOT EXISTS ").append(mTriggers.get(i).getName()).append(" ").append(timeevent).append(" ON ").append(tableName).append(" ");
            if (mTriggers.get(i).getCondition() != null) {
                sbAppend.append(mTriggers.get(i).getCondition()).append(" ");
            }
            sbAppend.append(mTriggers.get(i).getLogic());
            arrayList.add(sbAppend.toString());
        }
        return arrayList;
    }

    public Integer createDatabaseData(Database mDb, JsonSQLite jsonSQL) throws Exception {
        Integer num = -1;
        num.intValue();
        num.intValue();
        SupportSQLiteDatabase db = mDb.getDb();
        try {
            if (mDb != null) {
                try {
                    try {
                        if (mDb.isOpen().booleanValue() && jsonSQL != null) {
                            int iDbChanges = this._uSqlite.dbChanges(db);
                            mDb.beginTransaction();
                            int iDbChanges2 = 0;
                            boolean z = false;
                            for (int i = 0; i < jsonSQL.getTables().size(); i++) {
                                if (jsonSQL.getTables().get(i).getValues().size() > 0) {
                                    try {
                                        createTableData(mDb, jsonSQL.getMode(), jsonSQL.getTables().get(i).getValues(), jsonSQL.getTables().get(i).getName());
                                        notifyImportProgressEvent("Table ".concat(jsonSQL.getTables().get(i).getName()).concat(" data creation completed") + " " + (i + 1) + "/" + jsonSQL.getTables().size() + " ...");
                                        z = true;
                                    } catch (Exception e) {
                                        throw new Exception("CreateDatabaseData: " + e.getMessage());
                                    }
                                }
                            }
                            if (z && (iDbChanges2 = this._uSqlite.dbChanges(db) - iDbChanges) >= 0) {
                                mDb.commitTransaction();
                                notifyImportProgressEvent("Tables data creation completed changes: " + iDbChanges2);
                            }
                            if (db != null && db.inTransaction()) {
                                mDb.rollbackTransaction();
                            }
                            return Integer.valueOf(iDbChanges2);
                        }
                    } catch (Exception e2) {
                        throw new Exception("CreateDatabaseData: " + e2.getMessage());
                    }
                } catch (SQLException e3) {
                    throw new Exception("CreateDatabaseData: " + e3.getMessage());
                } catch (IllegalStateException e4) {
                    throw new Exception("CreateDatabaseData: " + e4.getMessage());
                }
            }
            throw new Exception("CreateDatabaseData: Database not opened");
        } catch (Throwable th) {
            if (db != null && db.inTransaction()) {
                mDb.rollbackTransaction();
            }
            throw th;
        }
    }

    private void createTableData(Database mDb, String mode, ArrayList<ArrayList<Object>> values, String tableName) throws Exception {
        if (!this._uJson.isTableExists(mDb, tableName)) {
            throw new Exception("createTableData: Table " + tableName + "does not exist");
        }
        try {
            JSObject tableColumnNamesTypes = this._uJson.getTableColumnNamesTypes(mDb, tableName);
            if (tableColumnNamesTypes.length() == 0) {
                throw new Exception("CreateTableData: no column names & types returned");
            }
            if (tableColumnNamesTypes.has("names")) {
                ArrayList<String> columnNames = this._uJson.getColumnNames(tableColumnNamesTypes.get("names"));
                if (tableColumnNamesTypes.has("types")) {
                    ArrayList<String> columnNames2 = this._uJson.getColumnNames(tableColumnNamesTypes.get("types"));
                    if (isBlob(columnNames2).booleanValue()) {
                        oldProcessFow(mDb, values, tableName, columnNames, columnNames2, mode);
                        return;
                    } else {
                        newProcessFlow(mDb, values, tableName, columnNames);
                        return;
                    }
                }
                throw new Exception("GetValues: Table " + tableName + " no types");
            }
            throw new Exception("GetValues: Table " + tableName + " no names");
        } catch (JSONException e) {
            throw new Exception("CreateTableData: " + e.getMessage());
        } catch (Exception e2) {
            throw new Exception("CreateTableData: " + e2.getMessage());
        }
    }

    private void oldProcessFow(Database mDb, ArrayList<ArrayList<Object>> values, String tableName, ArrayList<String> tColNames, ArrayList<String> tColTypes, String mode) throws Exception {
        ArrayList<Object> arrayList;
        for (int i = 0; i < values.size(); i++) {
            try {
                ArrayList<Object> arrayListCreateRowValues = createRowValues(values.get(i));
                Boolean.valueOf(true);
                String strCreateRowStatement = createRowStatement(mDb, tColNames, tColTypes, arrayListCreateRowValues, i, tableName, mode);
                if (checkUpdate(mDb, strCreateRowStatement, arrayList, tableName, tColNames, tColTypes).booleanValue()) {
                    if (strCreateRowStatement.substring(0, 6).toUpperCase().equals("DELETE")) {
                        arrayList = arrayListCreateRowValues;
                        arrayList = new ArrayList<>();
                    }
                    arrayList = arrayListCreateRowValues;
                    if (mDb.prepareSQL(strCreateRowStatement, arrayList, true, "no").getLong("lastId") < 0) {
                        throw new Exception("CreateTableData: lastId < 0");
                    }
                } else {
                    arrayList = arrayListCreateRowValues;
                }
            } catch (JSONException e) {
                throw new Exception("oldProcessFlow: " + e.getMessage());
            } catch (Exception e2) {
                throw new Exception("oldProcessFlow: " + e2.getMessage());
            }
        }
    }

    private ArrayList<Object> createRowValues(ArrayList<Object> row) throws Exception {
        for (int i = 0; i < row.size(); i++) {
            try {
                Object obj = row.get(i);
                if (obj instanceof JSONArray) {
                    row.set(i, jsonArrayToByteArray((JSONArray) obj));
                }
            } catch (JSONException e) {
                throw new Exception("createRowValues: " + e.getMessage());
            } catch (Exception e2) {
                throw new Exception("createRowValues: " + e2.getMessage());
            }
        }
        return row;
    }

    private byte[] jsonArrayToByteArray(JSONArray jsonArray) throws JSONException {
        byte[] bArr = new byte[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++) {
            bArr[i] = (byte) jsonArray.getInt(i);
        }
        return bArr;
    }

    private void newProcessFlow(Database mDb, ArrayList<ArrayList<Object>> values, String tableName, ArrayList<String> tColNames) throws Exception {
        long j;
        try {
            JSONObject jSONObjectGenerateInsertAndDeletedStrings = generateInsertAndDeletedStrings(tColNames, values);
            String strConvertToString = this._uJson.convertToString(tColNames, ',');
            if (jSONObjectGenerateInsertAndDeletedStrings.has("insert")) {
                j = 0;
                if (mDb.prepareSQL("INSERT OR REPLACE INTO " + tableName + "(" + strConvertToString + ") " + jSONObjectGenerateInsertAndDeletedStrings.get("insert") + ";", new ArrayList<>(), true, "no").getLong("lastId") < 0) {
                    throw new Exception("CreateTableData: INSERT lastId < 0");
                }
            } else {
                j = 0;
            }
            if (jSONObjectGenerateInsertAndDeletedStrings.has("delete") && mDb.prepareSQL("DELETE FROM " + tableName + " WHERE " + tColNames.get(0) + " " + jSONObjectGenerateInsertAndDeletedStrings.get("delete") + ";", new ArrayList<>(), true, "no").getLong("lastId") < j) {
                throw new Exception("newProcessFlow: INSERT lastId < 0");
            }
        } catch (JSONException e) {
            throw new Exception("newProcessFlow: " + e.getMessage());
        } catch (Exception e2) {
            throw new Exception("newProcessFlow: " + e2.getMessage());
        }
    }

    private Boolean isBlob(ArrayList<String> tColTypes) {
        boolean z;
        Iterator<String> it = tColTypes.iterator();
        while (it.hasNext()) {
            if (it.next().equalsIgnoreCase("BLOB")) {
                z = true;
                return Boolean.valueOf(z);
            }
        }
        z = false;
        return Boolean.valueOf(z);
    }

    private String createRowStatement(Database mDb, ArrayList<String> tColNames, ArrayList<String> tColTypes, ArrayList<Object> row, int j, String tableName, String mode) throws Exception {
        String string;
        String str = "CreateRowStatement: Table" + tableName + " values row";
        if (tColNames.size() != row.size() || row.size() == 0 || tColNames.size() == 0) {
            throw new Exception(str + j + " not correct length");
        }
        boolean zIsIdExists = this._uJson.isIdExists(mDb, tableName, tColNames.get(0), row.get(0));
        if (mode.equals("full") || (mode.equals("partial") && !zIsIdExists)) {
            String strConvertToString = this._uJson.convertToString(tColNames, ',');
            String strCreateQuestionMarkString = this._uJson.createQuestionMarkString(Integer.valueOf(tColNames.size()));
            if (strCreateQuestionMarkString.length() == 0) {
                throw new Exception(str + j + "questionMarkString is empty");
            }
            return "INSERT INTO " + tableName + "(" + strConvertToString + ") VALUES (" + strCreateQuestionMarkString + ");";
        }
        Boolean bool = true;
        Integer numValueOf = Integer.valueOf(tColNames.indexOf("sql_deleted"));
        if (numValueOf.intValue() >= 0 && row.get(numValueOf.intValue()).equals(1)) {
            bool = false;
            String str2 = tColNames.get(0);
            StringBuilder sbAppend = new StringBuilder("DELETE FROM ").append(tableName).append(" WHERE ").append(tColNames.get(0)).append(" = ");
            if (str2 instanceof Integer) {
                sbAppend.append(row.get(0)).append(";");
            }
            if (str2 instanceof String) {
                sbAppend.append("'").append(row.get(0)).append("';");
            }
            string = sbAppend.toString();
        } else {
            string = "";
        }
        if (!bool.booleanValue()) {
            return string;
        }
        String nameForUpdate = this._uJson.setNameForUpdate(tColNames);
        if (nameForUpdate.length() == 0) {
            throw new Exception(str + j + "setString is empty");
        }
        String str3 = tColNames.get(0);
        StringBuilder sbAppend2 = new StringBuilder("UPDATE ").append(tableName).append(" SET ").append(nameForUpdate).append(" WHERE ").append(tColNames.get(0)).append(" = ");
        if (str3 instanceof Integer) {
            sbAppend2.append(row.get(0)).append(";");
        }
        if (str3 instanceof String) {
            sbAppend2.append("'").append(row.get(0)).append("';");
        }
        return sbAppend2.toString();
    }

    private Boolean checkUpdate(Database mDb, String stmt, ArrayList<Object> values, String tableName, ArrayList<String> tColNames, ArrayList<String> tColTypes) throws Exception {
        if (!stmt.substring(0, 6).equals("UPDATE")) {
            return true;
        }
        StringBuilder sbAppend = new StringBuilder("SELECT * FROM ").append(tableName).append(" WHERE ").append(tColNames.get(0));
        if (values.get(0) instanceof String) {
            sbAppend.append(" = '").append(values.get(0)).append("';");
        } else {
            sbAppend.append(" = ").append(values.get(0)).append(";");
        }
        try {
            ArrayList<ArrayList<Object>> values2 = this._uJson.getValues(mDb, sbAppend.toString(), tableName);
            if (values2.size() > 0) {
                return checkValues(values, values2.get(0));
            }
            throw new Exception("CheckUpdate: CheckUpdate statement returns nothing");
        } catch (Exception e) {
            throw new Exception("CheckUpdate: " + e.getMessage());
        }
    }

    private Boolean checkValues(ArrayList<Object> values, ArrayList<Object> nValues) throws Exception {
        if (values.size() > 0 && nValues.size() > 0 && values.size() == nValues.size()) {
            for (int i = 0; i < values.size(); i++) {
                if (nValues.get(i) instanceof String) {
                    if (!values.get(i).equals(nValues.get(i))) {
                        return true;
                    }
                } else if ((nValues.get(i) instanceof Long) && (values.get(i) instanceof Integer)) {
                    if (((Integer) values.get(i)).intValue() != ((Long) nValues.get(i)).longValue()) {
                        return true;
                    }
                } else if ((nValues.get(i) instanceof Double) && (values.get(i) instanceof Integer)) {
                    if (((Integer) values.get(i)).intValue() != ((Double) nValues.get(i)).doubleValue()) {
                        return true;
                    }
                } else if (values.get(i) != nValues.get(i)) {
                    return true;
                }
            }
            return false;
        }
        throw new Exception("CheckValues: Both arrays not the same length");
    }

    private JSONObject generateInsertAndDeletedStrings(ArrayList<String> tColNames, ArrayList<ArrayList<Object>> values) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        StringBuilder sb = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        for (ArrayList<Object> arrayList : values) {
            int iIndexOf = tColNames.indexOf("sql_deleted");
            if (iIndexOf == -1 || ((Integer) arrayList.get(iIndexOf)).intValue() == 0) {
                sb.append("(").append(Database$$ExternalSyntheticBackport0.m52m(", ", (CharSequence[]) arrayList.stream().map(new Function() { // from class: com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ImportFromJson$$ExternalSyntheticLambda1
                    @Override // java.util.function.Function
                    public final Object apply(Object obj) {
                        return ImportFromJson.lambda$generateInsertAndDeletedStrings$0(obj);
                    }
                }).toArray(new IntFunction() { // from class: com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ImportFromJson$$ExternalSyntheticLambda2
                    @Override // java.util.function.IntFunction
                    public final Object apply(int i) {
                        return ImportFromJson.lambda$generateInsertAndDeletedStrings$1(i);
                    }
                }))).append("), ");
            } else if (((Integer) arrayList.get(iIndexOf)).intValue() == 1) {
                if (!(arrayList.get(0) instanceof String)) {
                    sb2.append(arrayList.get(0)).append(", ");
                } else {
                    sb2.append("'").append(arrayList.get(0)).append("', ");
                }
            }
        }
        if (sb.length() > 0) {
            sb.setLength(sb.length() - 2);
            sb.insert(0, "VALUES ");
        }
        if (sb2.length() > 0) {
            sb2.setLength(sb2.length() - 2);
            sb2.insert(0, "IN (");
            sb2.append(")");
        }
        if (sb.length() > 0) {
            jSONObject.put("insert", sb.toString());
        }
        if (sb2.length() > 0) {
            jSONObject.put("delete", sb2.toString());
        }
        return jSONObject;
    }

    static /* synthetic */ String lambda$generateInsertAndDeletedStrings$0(Object obj) {
        if (obj instanceof String) {
            String strReplace = (String) obj;
            if (strReplace.contains("'")) {
                strReplace = strReplace.replace("'", "''");
            }
            return "'" + strReplace + "'";
        }
        return obj.toString();
    }

    static /* synthetic */ String[] lambda$generateInsertAndDeletedStrings$1(int i) {
        return new String[i];
    }

    public Integer createViews(Database mDb, ArrayList<JsonView> views) throws Exception {
        Integer num = 0;
        num.intValue();
        SupportSQLiteDatabase db = mDb.getDb();
        try {
            if (mDb != null) {
                try {
                    if (mDb.isOpen().booleanValue() && views.size() > 0) {
                        mDb.beginTransaction();
                        Integer numValueOf = Integer.valueOf(this._uSqlite.dbChanges(db));
                        for (JsonView jsonView : views) {
                            if (jsonView.getName().length() > 0 && jsonView.getValue().length() > 0) {
                                db.execSQL("CREATE VIEW IF NOT EXISTS " + jsonView.getName() + " AS " + jsonView.getValue() + " ;");
                            } else {
                                throw new Exception("CreateViews: no name and value");
                            }
                        }
                        int iDbChanges = this._uSqlite.dbChanges(db) - numValueOf.intValue();
                        if (iDbChanges >= 0) {
                            mDb.commitTransaction();
                        }
                        if (db != null && db.inTransaction()) {
                            mDb.rollbackTransaction();
                        }
                        return Integer.valueOf(iDbChanges);
                    }
                } catch (Exception e) {
                    throw new Exception("CreateViews: " + e.getMessage());
                }
            }
            throw new Exception("CreateViews: Database not opened");
        } catch (Throwable th) {
            if (db != null && db.inTransaction()) {
                mDb.rollbackTransaction();
            }
            throw th;
        }
    }
}
