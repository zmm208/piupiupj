package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.DatabaseUtils;
import android.util.Log;
import androidx.sqlite.p001db.SimpleSQLiteQuery;
import androidx.sqlite.p001db.SupportSQLiteDatabase;
import androidx.sqlite.p001db.SupportSQLiteStatement;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ExportToJson;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.ImportFromJson;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.JsonSQLite;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.UtilsEncryption;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.UtilsJson;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Dictionary;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import net.zetetic.database.DatabaseErrorHandler;
import net.zetetic.database.sqlcipher.SQLiteCursor;
import net.zetetic.database.sqlcipher.SQLiteDatabase;
import net.zetetic.database.sqlcipher.SQLiteDatabaseHook;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class Database {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.Database";
    private final Context _context;
    private final String _dbName;
    private final Boolean _encrypted;
    private final File _file;
    private final Boolean _isEncryption;
    private final String _mode;
    private final Boolean _readOnly;
    private final UtilsSQLCipher _uCipher;
    private final UtilsDrop _uDrop;
    private final UtilsFile _uFile;
    private final UtilsJson _uJson;
    private final UtilsSecret _uSecret;
    private final UtilsSQLite _uSqlite;
    private final UtilsUpgrade _uUpg;
    private final Dictionary<Integer, JSONObject> _vUpgObject;
    private final int _version;
    private Boolean ncDB;
    private Boolean _isOpen = false;
    private SupportSQLiteDatabase _db = null;
    private final ImportFromJson fromJson = new ImportFromJson();
    private final ExportToJson toJson = new ExportToJson();
    private boolean isAvailableTransaction = false;

    public Database(Context context, String dbName, Boolean encrypted, String mode, int version, Boolean isEncryption, Dictionary<Integer, JSONObject> vUpgObject, SharedPreferences sharedPreferences, Boolean readonly) {
        this.ncDB = false;
        this._context = context;
        this._dbName = dbName;
        this._mode = mode;
        this._encrypted = encrypted;
        this._isEncryption = isEncryption;
        this._version = version;
        this._vUpgObject = vUpgObject;
        this._readOnly = readonly;
        if (dbName.contains("/") && dbName.endsWith("SQLite.db")) {
            this.ncDB = true;
            this._file = new File(dbName);
        } else {
            this._file = context.getDatabasePath(dbName);
        }
        this._uSqlite = new UtilsSQLite();
        this._uCipher = new UtilsSQLCipher();
        this._uFile = new UtilsFile();
        this._uJson = new UtilsJson();
        this._uUpg = new UtilsUpgrade();
        this._uDrop = new UtilsDrop();
        this._uSecret = isEncryption.booleanValue() ? new UtilsSecret(context, sharedPreferences) : null;
        InitializeSQLCipher();
        if (!((File) Objects.requireNonNull(this._file.getParentFile())).exists() && !this._file.getParentFile().mkdirs()) {
            System.out.println("Failed to create parent directories.");
        }
        Log.v(TAG, "&&& file path " + this._file.getAbsolutePath());
    }

    private void InitializeSQLCipher() {
        System.loadLibrary("sqlcipher");
    }

    public SupportSQLiteDatabase getDb() {
        return this._db;
    }

    public Boolean isOpen() {
        return this._isOpen;
    }

    public Boolean isNCDB() {
        return this.ncDB;
    }

    public boolean isAvailTrans() {
        return this._db.inTransaction();
    }

    public Integer beginTransaction() throws Exception {
        if (this._db.isOpen()) {
            try {
                if (isAvailTrans()) {
                    throw new Exception("Already in transaction");
                }
                this._db.beginTransaction();
                return 0;
            } catch (Exception e) {
                String str = "Failed in beginTransaction" + e.getMessage();
                Log.v(TAG, str);
                throw new Exception(str);
            }
        }
        throw new Exception("Database not opened");
    }

    public Integer commitTransaction() throws Exception {
        try {
            if (this._db.isOpen()) {
                try {
                    if (!isAvailTrans()) {
                        throw new Exception("No transaction active");
                    }
                    this._db.setTransactionSuccessful();
                    this._db.endTransaction();
                    return 0;
                } catch (Exception e) {
                    String str = "Failed in commitTransaction" + e.getMessage();
                    Log.v(TAG, str);
                    throw new Exception(str);
                }
            }
            throw new Exception("Database not opened");
        } catch (Throwable th) {
            this._db.endTransaction();
            throw th;
        }
    }

    public Integer rollbackTransaction() throws Exception {
        if (this._db.isOpen()) {
            try {
                if (isAvailTrans()) {
                    this._db.endTransaction();
                }
                return 0;
            } catch (Exception e) {
                String str = "Failed in rollbackTransaction" + e.getMessage();
                Log.v(TAG, str);
                throw new Exception(str);
            }
        }
        throw new Exception("Database not opened");
    }

    public String getUrl() {
        return "file://" + this._file.getAbsolutePath();
    }

    public void open() throws Exception {
        String passphrase;
        Dictionary<Integer, JSONObject> dictionary;
        String str = "";
        if (!this._encrypted.booleanValue() || (!this._mode.equals("secret") && !this._mode.equals("encryption") && !this._mode.equals("decryption"))) {
            passphrase = "";
        } else {
            if (!UtilsSecret.isPassphrase().booleanValue()) {
                throw new Exception("No Passphrase stored");
            }
            passphrase = UtilsSecret.getPassphrase();
        }
        if (this._mode.equals("encryption")) {
            if (this._isEncryption.booleanValue()) {
                try {
                    this._uCipher.encrypt(this._context, this._file, passphrase.getBytes(StandardCharsets.UTF_8));
                } catch (Exception e) {
                    String str2 = "Failed in encryption " + e.getMessage();
                    Log.v(TAG, str2);
                    throw new Exception(str2);
                }
            } else {
                throw new Exception("No Encryption set in capacitor.config");
            }
        }
        if (!this._mode.equals("decryption")) {
            str = passphrase;
        } else if (this._isEncryption.booleanValue()) {
            try {
                this._uCipher.decrypt(this._context, this._file, passphrase.getBytes());
            } catch (Exception e2) {
                String str3 = "Failed in decryption " + e2.getMessage();
                Log.v(TAG, str3);
                throw new Exception(str3);
            }
        } else {
            throw new Exception("No Encryption set in capacitor.config");
        }
        try {
            if (!isNCDB().booleanValue() && !this._readOnly.booleanValue()) {
                this._db = SQLiteDatabase.openOrCreateDatabase(this._file, str, (SQLiteDatabase.CursorFactory) null, (DatabaseErrorHandler) null);
            } else {
                this._db = SQLiteDatabase.openDatabase(String.valueOf(this._file), str, (SQLiteDatabase.CursorFactory) null, 1, (SQLiteDatabaseHook) null);
            }
            SupportSQLiteDatabase supportSQLiteDatabase = this._db;
            if (supportSQLiteDatabase != null) {
                if (supportSQLiteDatabase.isOpen()) {
                    try {
                        this._db.setForeignKeyConstraintsEnabled(true);
                        if (isNCDB().booleanValue() || this._readOnly.booleanValue()) {
                            this._isOpen = true;
                            return;
                        }
                        try {
                            int version = this._db.getVersion();
                            if (this._version > version && (dictionary = this._vUpgObject) != null && dictionary.size() > 0) {
                                try {
                                    this._uFile.copyFile(this._context, this._dbName, "backup-" + this._dbName);
                                    this._uUpg.onUpgrade(this, this._vUpgObject, Integer.valueOf(version), Integer.valueOf(this._version));
                                    if (!this._uFile.deleteBackupDB(this._context, this._dbName).booleanValue()) {
                                        Log.v(TAG, "Failed in deleteBackupDB backup-\" + _dbName");
                                        close();
                                        this._db = null;
                                        throw new Exception("Failed in deleteBackupDB backup-\" + _dbName");
                                    }
                                } catch (Exception e3) {
                                    boolean zBooleanValue = this._uFile.restoreDatabase(this._context, this._dbName).booleanValue();
                                    String message = e3.getMessage();
                                    if (!zBooleanValue) {
                                        message = message + "Failed in restoreDatabase " + this._dbName;
                                    }
                                    Log.v(TAG, message);
                                    close();
                                    this._db = null;
                                    throw new Exception(message);
                                }
                            }
                            this._isOpen = true;
                            return;
                        } catch (IllegalStateException e4) {
                            String str4 = "Failed in get/setVersion " + e4.getMessage();
                            Log.v(TAG, str4);
                            close();
                            this._db = null;
                            throw new Exception(str4);
                        }
                    } catch (IllegalStateException e5) {
                        String str5 = "Failed in setForeignKeyConstraintsEnabled " + e5.getMessage();
                        Log.v(TAG, str5);
                        close();
                        this._db = null;
                        throw new Exception(str5);
                    }
                }
                this._isOpen = false;
                this._db = null;
                throw new Exception("Database not opened");
            }
            this._isOpen = false;
            this._db = null;
            throw new Exception("No database returned");
        } catch (Exception e6) {
            String str6 = "Error in creating the database" + e6.getMessage();
            this._isOpen = false;
            this._db = null;
            throw new Exception(str6);
        }
    }

    public void close() throws Exception {
        if (this._db.isOpen()) {
            try {
                this._db.close();
                this._isOpen = false;
                return;
            } catch (Exception e) {
                String str = "Failed in database close" + e.getMessage();
                Log.v(TAG, str);
                throw new Exception(str);
            }
        }
        throw new Exception("Database not opened");
    }

    public Integer getVersion() throws Exception {
        if (this._db.isOpen()) {
            try {
                return Integer.valueOf(this._db.getVersion());
            } catch (Exception e) {
                String str = "Failed in database getVersion" + e.getMessage();
                Log.v(TAG, str);
                throw new Exception(str);
            }
        }
        throw new Exception("Database not opened");
    }

    public boolean isDBExists() {
        return this._file.exists();
    }

    public JSObject execute(String[] statements, Boolean... others) throws Exception {
        Boolean boolValueOf = Boolean.valueOf(others.length == 1 ? others[0].booleanValue() : true);
        JSObject jSObject = new JSObject();
        Integer.valueOf(-1);
        try {
            try {
                SupportSQLiteDatabase supportSQLiteDatabase = this._db;
                if (supportSQLiteDatabase != null && supportSQLiteDatabase.isOpen()) {
                    Integer numValueOf = Integer.valueOf(this._uSqlite.dbChanges(this._db));
                    if (boolValueOf.booleanValue()) {
                        beginTransaction();
                    }
                    int length = statements.length;
                    for (int i = 0; i < length; i++) {
                        String strDeleteSQL = statements[i];
                        if (!strDeleteSQL.endsWith(";")) {
                            strDeleteSQL = strDeleteSQL + ";";
                        }
                        if (strDeleteSQL.trim().substring(0, Math.min(strDeleteSQL.trim().length(), 11)).toUpperCase().equals("DELETE FROM") && strDeleteSQL.toLowerCase().contains("WHERE".toLowerCase())) {
                            strDeleteSQL = deleteSQL(this, strDeleteSQL.trim(), new ArrayList<>());
                        }
                        this._db.execSQL(strDeleteSQL);
                    }
                    Integer numValueOf2 = Integer.valueOf(this._uSqlite.dbChanges(this._db) - numValueOf.intValue());
                    if (numValueOf2.intValue() != -1) {
                        if (boolValueOf.booleanValue()) {
                            commitTransaction();
                        }
                        jSObject.put("changes", (Object) numValueOf2);
                    }
                    if (this._db != null && boolValueOf.booleanValue() && this._db.inTransaction()) {
                        rollbackTransaction();
                    }
                    return jSObject;
                }
                throw new Exception("Database not opened");
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        } catch (Throwable th) {
            if (this._db != null && boolValueOf.booleanValue() && this._db.inTransaction()) {
                rollbackTransaction();
            }
            throw th;
        }
    }

    public JSObject executeSet(JSArray set, Boolean transaction, String returnMode) throws Exception {
        JSObject jSObjectOneRowStatement;
        JSObject jSObject = new JSObject();
        Integer.valueOf(-1);
        JSObject jSObject2 = new JSObject();
        try {
            try {
                SupportSQLiteDatabase supportSQLiteDatabase = this._db;
                if (supportSQLiteDatabase != null && supportSQLiteDatabase.isOpen()) {
                    int iDbChanges = this._uSqlite.dbChanges(this._db);
                    if (transaction.booleanValue()) {
                        beginTransaction();
                    }
                    Long l = -1L;
                    int i = 0;
                    while (i < set.length()) {
                        JSONObject jSONObject = set.getJSONObject(i);
                        new JSObject();
                        String string = jSONObject.getString("statement");
                        JSONArray jSONArray = jSONObject.getJSONArray("values");
                        if (Boolean.valueOf(jSONArray.length() > 0 ? this._uSqlite.parse(jSONArray.get(0)).booleanValue() : false).booleanValue()) {
                            jSObjectOneRowStatement = multipleRowsStatement(string, jSONArray, returnMode);
                        } else {
                            jSObjectOneRowStatement = oneRowStatement(string, jSONArray, returnMode);
                        }
                        Long lValueOf = Long.valueOf(jSObjectOneRowStatement.getLong("lastId"));
                        if (lValueOf.equals(-1L)) {
                            l = lValueOf;
                            break;
                        }
                        jSObject2 = addToResponse(jSObject2, jSObjectOneRowStatement);
                        i++;
                        l = lValueOf;
                    }
                    if (l.equals(-1L)) {
                        throw new Exception("lastId equals -1");
                    }
                    if (transaction.booleanValue()) {
                        commitTransaction();
                    }
                    jSObject.put("changes", (Object) Integer.valueOf(this._uSqlite.dbChanges(this._db) - iDbChanges));
                    jSObject.put("lastId", (Object) l);
                    jSObject.put("values", (Object) jSObject2.getJSONArray("values"));
                    if (this._db != null && transaction.booleanValue() && this._db.inTransaction()) {
                        rollbackTransaction();
                    }
                    return jSObject;
                }
                throw new Exception("Database not opened");
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        } catch (Throwable th) {
            if (this._db != null && transaction.booleanValue() && this._db.inTransaction()) {
                rollbackTransaction();
            }
            throw th;
        }
    }

    public JSObject multipleRowsStatement(String statement, JSONArray valuesJson, String returnMode) throws Exception {
        String strValueOf;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < valuesJson.length(); i++) {
            try {
                JSONArray jSONArray = valuesJson.getJSONArray(i);
                StringBuilder sb2 = new StringBuilder();
                for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                    Object obj = jSONArray.get(i2);
                    if (obj instanceof String) {
                        strValueOf = DatabaseUtils.sqlEscapeString((String) obj);
                    } else {
                        strValueOf = String.valueOf(obj);
                    }
                    sb2.append(strValueOf);
                    if (i2 < jSONArray.length() - 1) {
                        sb2.append(",");
                    }
                }
                sb.append("(").append(sb2.toString()).append(")");
                if (i < valuesJson.length() - 1) {
                    sb.append(",");
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return prepareSQL(replacePlaceholders(statement, sb.toString()), new ArrayList<>(), false, returnMode);
    }

    public String replacePlaceholders(String stmt, String sqlBuilder) {
        if (extractQuestionMarkValues(stmt) == null) {
            return stmt;
        }
        Matcher matcher = Pattern.compile("(?i)VALUES\\s*\\((\\s*\\?\\s*(?:,\\s*\\?\\s*)*)\\)").matcher(stmt);
        if (matcher.find()) {
            return matcher.replaceAll("VALUES " + Matcher.quoteReplacement(sqlBuilder));
        }
        throw new IllegalArgumentException("The statement does not contain a valid VALUES clause with placeholders.");
    }

    public String extractQuestionMarkValues(String input) {
        Matcher matcher = Pattern.compile("(?i)VALUES \\((\\?(?:,\\s*\\?\\s*)*)\\)").matcher(input);
        if (!matcher.find()) {
            return null;
        }
        return "(" + matcher.group(1).replaceAll("\\s*,\\s*", ",") + ")";
    }

    public JSObject oneRowStatement(String statement, JSONArray valuesJson, String returnMode) throws Exception {
        ArrayList<Object> arrayList = new ArrayList<>();
        for (int i = 0; i < valuesJson.length(); i++) {
            arrayList.add(valuesJson.get(i));
        }
        try {
            return prepareSQL(statement, arrayList, false, returnMode);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public JSObject addToResponse(JSObject response, JSObject respSet) throws JSONException {
        long j = respSet.getLong("lastId");
        JSONArray jSONArray = respSet.getJSONArray("values");
        if (response.keys().hasNext()) {
            JSONArray jSONArray2 = respSet.getJSONArray("values");
            jSONArray = response.getJSONArray("values");
            mergeJSONArrays(jSONArray, jSONArray2);
        }
        response.put("lastId", j);
        response.put("values", (Object) jSONArray);
        return response;
    }

    public static void mergeJSONArrays(JSONArray target, JSONArray source) throws JSONException {
        for (int i = 0; i < source.length(); i++) {
            target.put(source.get(i));
        }
    }

    public boolean inTransaction() {
        return this._db.inTransaction();
    }

    public JSObject runSQL(String statement, ArrayList<Object> values, Boolean transaction, String returnMode) throws Exception {
        JSObject jSObject = new JSObject();
        try {
            try {
                SupportSQLiteDatabase supportSQLiteDatabase = this._db;
                if (supportSQLiteDatabase != null && supportSQLiteDatabase.isOpen() && statement.length() > 0) {
                    int iDbChanges = this._uSqlite.dbChanges(this._db);
                    if (transaction.booleanValue()) {
                        beginTransaction();
                    }
                    JSObject jSObjectPrepareSQL = prepareSQL(statement, values, false, returnMode);
                    long j = jSObjectPrepareSQL.getLong("lastId");
                    if (j != -1 && transaction.booleanValue()) {
                        commitTransaction();
                    }
                    jSObject.put("changes", this._uSqlite.dbChanges(this._db) - iDbChanges);
                    jSObject.put("lastId", j);
                    jSObject.put("values", (Object) jSObjectPrepareSQL.getJSONArray("values"));
                    if (this._db != null && transaction.booleanValue() && this._db.inTransaction()) {
                        rollbackTransaction();
                    }
                    return jSObject;
                }
                throw new Exception("Database not opened");
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        } catch (Throwable th) {
            if (this._db != null && transaction.booleanValue() && this._db.inTransaction()) {
                rollbackTransaction();
            }
            throw th;
        }
    }

    /* JADX WARN: Code duplicated, block: B:83:0x0166  */
    public JSObject prepareSQL(String statement, ArrayList<Object> values, Boolean fromJson, String returnMode) throws Exception {
        SupportSQLiteStatement supportSQLiteStatement;
        String string = statement;
        String str = returnMode;
        int i = 0;
        String upperCase = string.trim().split("\\s+")[0].toUpperCase();
        JSArray jSArray = new JSArray();
        JSObject jSObject = new JSObject();
        if (!str.equals("no")) {
            str = "wA" + str;
        }
        String string2 = "";
        if (str.equals("no") || str.substring(0, Math.min(str.length(), 2)).equals("wA")) {
            try {
                JSObject stmtAndRetColNames = getStmtAndRetColNames(string, str);
                string = stmtAndRetColNames.getString("stmt", string);
                string2 = stmtAndRetColNames.getString("names", "");
            } catch (JSONException e) {
                throw new Exception(e.getMessage());
            }
        }
        SupportSQLiteStatement supportSQLiteStatement2 = null;
        try {
            try {
                if (!fromJson.booleanValue()) {
                    try {
                        if (upperCase.equals("DELETE")) {
                            string = deleteSQL(this, string, values);
                        }
                    } catch (Exception e2) {
                        e = e2;
                    }
                }
                if (string != null) {
                    SupportSQLiteStatement supportSQLiteStatementCompileStatement = this._db.compileStatement(string);
                    if (values != null) {
                        try {
                            if (values.size() > 0) {
                                Object[] objArr = new Object[values.size()];
                                while (i < values.size()) {
                                    if (values.get(i) == null) {
                                        objArr[i] = supportSQLiteStatement2;
                                        supportSQLiteStatement = supportSQLiteStatement2;
                                    } else {
                                        supportSQLiteStatement = supportSQLiteStatement2;
                                        if (JSONObject.NULL == values.get(i)) {
                                            objArr[i] = supportSQLiteStatement;
                                        } else {
                                            objArr[i] = values.get(i);
                                        }
                                    }
                                    i++;
                                    supportSQLiteStatement2 = supportSQLiteStatement;
                                }
                                SimpleSQLiteQuery.bind(supportSQLiteStatementCompileStatement, objArr);
                            }
                        } catch (Exception e3) {
                            e = e3;
                        } catch (Throwable th) {
                            th = th;
                            supportSQLiteStatement2 = supportSQLiteStatementCompileStatement;
                            if (supportSQLiteStatement2 != null) {
                                supportSQLiteStatement2.close();
                            }
                            throw th;
                        }
                    }
                    long jDbLastId = this._uSqlite.dbLastId(this._db);
                    if (upperCase.equals("INSERT")) {
                        supportSQLiteStatementCompileStatement.executeInsert();
                    } else {
                        if (str.startsWith("wA") && string2.length() > 0 && upperCase.equals("DELETE")) {
                            jSArray = getUpdDelReturnedValues(this, string, string2);
                        }
                        supportSQLiteStatementCompileStatement.executeUpdateDelete();
                    }
                    Long lValueOf = Long.valueOf(this._uSqlite.dbLastId(this._db));
                    if (str.startsWith("wA") && string2.length() > 0) {
                        if (upperCase.equals("INSERT")) {
                            String strExtractTableName = UtilsSQLStatement.extractTableName(string);
                            if (strExtractTableName != null) {
                                jSArray = getInsertReturnedValues(this, string2, strExtractTableName, Long.valueOf(jDbLastId), lValueOf, str);
                            }
                        } else {
                            String str2 = string2;
                            if (upperCase.equals("UPDATE")) {
                                jSArray = getUpdDelReturnedValues(this, string, str2);
                            }
                        }
                    }
                    jSObject.put("lastId", (Object) lValueOf);
                    jSObject.put("values", (Object) jSArray);
                    if (supportSQLiteStatementCompileStatement != null) {
                        supportSQLiteStatementCompileStatement.close();
                    }
                    return jSObject;
                }
                try {
                    throw new Exception("sqlStmt is null");
                } catch (Exception e4) {
                    e = e4;
                } catch (Throwable th2) {
                    th = th2;
                    supportSQLiteStatement2 = null;
                    if (supportSQLiteStatement2 != null) {
                        supportSQLiteStatement2.close();
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Exception e5) {
            e = e5;
        } catch (Throwable th4) {
            th = th4;
        }
        throw new Exception(e.getMessage());
    }

    private JSObject getStmtAndRetColNames(String sqlStmt, String retMode) throws JSONException {
        JSObject jSObject = new JSObject();
        JSObject jSObjectIsReturning = isReturning(sqlStmt);
        Boolean boolValueOf = Boolean.valueOf(jSObjectIsReturning.getBoolean("isReturning"));
        String string = jSObjectIsReturning.getString("stmt");
        String string2 = jSObjectIsReturning.getString("names");
        jSObject.put("stmt", string);
        String lowerCase = "";
        jSObject.put("names", "");
        if (boolValueOf.booleanValue() && retMode.startsWith("wA")) {
            if (string2 != null) {
                lowerCase = string2.toLowerCase();
            }
            int iIndexOf = lowerCase.indexOf("returning");
            if (iIndexOf != -1) {
                jSObject.put("names", getNames(string2.substring(iIndexOf + "returning".length()).trim()));
            }
        }
        return jSObject;
    }

    private String getNames(String input) {
        int iIndexOf = input.indexOf(";");
        int iIndexOf2 = input.indexOf("--");
        int iIndexOf3 = input.indexOf("/*");
        int length = input.length();
        if (iIndexOf != -1) {
            length = Math.min(length, iIndexOf);
        }
        if (iIndexOf2 != -1) {
            length = Math.min(length, iIndexOf2);
        }
        if (iIndexOf3 != -1) {
            length = Math.min(length, iIndexOf3);
        }
        return input.substring(0, length).trim();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private JSObject isReturning(String sqlStmt) {
        JSObject jSObject = new JSObject();
        String strTrim = sqlStmt.trim();
        if (strTrim.endsWith(";")) {
            strTrim = strTrim.substring(0, strTrim.length() - 1).trim();
        }
        jSObject.put("isReturning", false);
        jSObject.put("stmt", sqlStmt);
        jSObject.put("names", "");
        String upperCase = sqlStmt.trim().split("\\s+")[0].toUpperCase();
        upperCase.hashCode();
        switch (upperCase) {
            case "INSERT":
                int iIndexOf = strTrim.toUpperCase().indexOf("VALUES");
                if (iIndexOf != -1) {
                    int length = strTrim.length() - 1;
                    while (true) {
                        if (length < iIndexOf) {
                            length = -1;
                        } else if (strTrim.charAt(length) != ')') {
                            length--;
                        }
                    }
                    if (length != -1) {
                        int i = length + 1;
                        String str = strTrim.substring(0, i).trim() + ";";
                        String strTrim2 = strTrim.substring(i).trim();
                        if (strTrim2.length() > 0 && !strTrim2.endsWith(";")) {
                            strTrim2 = strTrim2 + ";";
                        }
                        if (strTrim2.toLowerCase().contains("returning")) {
                            jSObject.put("isReturning", true);
                            jSObject.put("stmt", str);
                            jSObject.put("names", strTrim2);
                        }
                    }
                }
                return jSObject;
            case "UPDATE":
            case "DELETE":
                String[] strArrSplit = strTrim.split("\\s+");
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                for (String str2 : strArrSplit) {
                    if (str2.toLowerCase().equals("returning")) {
                        arrayList2.add(str2);
                        arrayList2.addAll(wordsAfter(str2, strArrSplit));
                        String str3 = Database$$ExternalSyntheticBackport0.m51m(" ", arrayList) + ";";
                        String strM51m = Database$$ExternalSyntheticBackport0.m51m(" ", arrayList2);
                        if (strM51m.length() > 0 && !strM51m.endsWith(";")) {
                            strM51m = strM51m + ";";
                        }
                        jSObject.put("isReturning", true);
                        jSObject.put("stmt", str3);
                        jSObject.put("names", strM51m);
                        return jSObject;
                    }
                    arrayList.add(str2);
                }
                return jSObject;
            default:
                return jSObject;
        }
    }

    private List<String> wordsAfter(String word, String[] words) {
        List listAsList = Arrays.asList(words);
        int iIndexOf = listAsList.indexOf(word);
        if (iIndexOf == -1) {
            return new ArrayList();
        }
        return new ArrayList(listAsList.subList(iIndexOf + 1, listAsList.size()));
    }

    private JSArray getInsertReturnedValues(Database mDB, String colNames, String tableName, Long iLastId, Long lastId, String rMode) throws Exception {
        JSArray jSArray = new JSArray();
        if (iLastId.longValue() < 0 || colNames.length() == 0) {
            return jSArray;
        }
        Long lValueOf = Long.valueOf(iLastId.longValue() + 1);
        StringBuilder sbAppend = new StringBuilder("SELECT ").append(colNames).append(" FROM ");
        sbAppend.append(tableName).append(" WHERE rowid ");
        if (rMode.equals("wAone")) {
            sbAppend.append("= ").append(lValueOf);
        }
        if (rMode.equals("wAall")) {
            sbAppend.append("BETWEEN ").append(lValueOf).append(" AND ").append(lastId);
        }
        sbAppend.append(";");
        return mDB.selectSQL(sbAppend.toString(), new ArrayList<>());
    }

    private JSArray getUpdDelReturnedValues(Database mDB, String stmt, String colNames) throws Exception {
        JSArray jSArray = new JSArray();
        String strExtractTableName = UtilsSQLStatement.extractTableName(stmt);
        String strExtractWhereClause = UtilsSQLStatement.extractWhereClause(stmt);
        if (strExtractWhereClause == null || strExtractTableName == null) {
            return jSArray;
        }
        StringBuilder sbAppend = new StringBuilder("SELECT ").append(colNames).append(" FROM ");
        sbAppend.append(strExtractTableName).append(" WHERE ").append(strExtractWhereClause).append(";");
        return mDB.selectSQL(sbAppend.toString(), new ArrayList<>());
    }

    public String deleteSQL(Database mDB, String statement, ArrayList<Object> values) throws Exception {
        try {
            boolean zIsLastModified = this._uJson.isLastModified(mDB);
            boolean zIsSqlDeleted = this._uJson.isSqlDeleted(mDB);
            if (zIsLastModified && zIsSqlDeleted) {
                String strExtractWhereClause = UtilsSQLStatement.extractWhereClause(statement);
                if (strExtractWhereClause == null) {
                    throw new Exception("deleteSQL: cannot find a WHERE clause");
                }
                String strExtractTableName = UtilsSQLStatement.extractTableName(statement);
                if (strExtractTableName == null) {
                    throw new Exception("deleteSQL: cannot find a WHERE clause");
                }
                String[] strArr = (String[]) UtilsSQLStatement.extractColumnNames(strExtractWhereClause).toArray(new String[0]);
                if (strArr.length == 0) {
                    throw new Exception("deleteSQL: Did not find column names in the WHERE Statement");
                }
                if (UtilsDelete.findReferencesAndUpdate(mDB, strExtractTableName, strExtractWhereClause, strArr, values)) {
                    if (strExtractWhereClause.endsWith(";")) {
                        strExtractWhereClause = strExtractWhereClause.substring(0, strExtractWhereClause.length() - 1);
                    }
                    return "UPDATE " + strExtractTableName + " SET sql_deleted = 1 WHERE " + strExtractWhereClause + " AND sql_deleted = 0;";
                }
                return "";
            }
            return statement;
        } catch (Exception e) {
            throw new Exception("DeleteSQL " + (e.getMessage() != null ? e.getMessage() : e.toString()));
        }
    }

    public JSArray selectSQL(String statement, ArrayList<Object> values) throws Exception {
        JSArray jSArray = new JSArray();
        SupportSQLiteDatabase supportSQLiteDatabase = this._db;
        if (supportSQLiteDatabase != null) {
            SQLiteCursor sQLiteCursor = null;
            try {
                try {
                    SQLiteCursor sQLiteCursor2 = (SQLiteCursor) supportSQLiteDatabase.query(statement, values.toArray(new Object[0]));
                    while (sQLiteCursor2.moveToNext()) {
                        try {
                            JSObject jSObject = new JSObject();
                            for (int i = 0; i < sQLiteCursor2.getColumnCount(); i++) {
                                String columnName = sQLiteCursor2.getColumnName(i);
                                int columnIndex = sQLiteCursor2.getColumnIndex(columnName);
                                int type = sQLiteCursor2.getType(i);
                                if (type == 0) {
                                    jSObject.put(columnName, JSONObject.NULL);
                                } else if (type == 1) {
                                    jSObject.put(columnName, sQLiteCursor2.getLong(columnIndex));
                                } else if (type == 2) {
                                    jSObject.put(columnName, sQLiteCursor2.getDouble(columnIndex));
                                } else if (type == 3) {
                                    jSObject.put(columnName, sQLiteCursor2.getString(columnIndex));
                                } else if (type == 4) {
                                    jSObject.put(columnName, (Object) this._uSqlite.ByteArrayToJSArray(sQLiteCursor2.getBlob(columnIndex)));
                                }
                            }
                            jSArray.put(jSObject);
                        } catch (Exception e) {
                            e = e;
                            throw new Exception("in selectSQL cursor " + e.getMessage());
                        } catch (Throwable th) {
                            th = th;
                            sQLiteCursor = sQLiteCursor2;
                            if (sQLiteCursor != null) {
                                sQLiteCursor.close();
                            }
                            throw th;
                        }
                    }
                    if (sQLiteCursor2 != null) {
                        sQLiteCursor2.close();
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Exception e2) {
                e = e2;
            }
        }
        return jSArray;
    }

    public JSArray getTableNames() throws Exception {
        JSArray jSArray = new JSArray();
        try {
            List<String> tablesNames = this._uDrop.getTablesNames(this);
            for (int i = 0; i < tablesNames.size(); i++) {
                jSArray.put(tablesNames.get(i));
            }
            return jSArray;
        } catch (Exception e) {
            throw new Exception("in getTableNames " + e.getMessage());
        }
    }

    public void deleteDB(String dbName) throws Exception {
        try {
            if (this._file.exists() && !this._isOpen.booleanValue()) {
                open();
            }
            if (this._isOpen.booleanValue()) {
                close();
            }
            if (this._file.exists()) {
                if (this._uFile.deleteDatabase(this._context, dbName).booleanValue()) {
                    this._isOpen = false;
                    return;
                }
                throw new Exception("Failed in deleteDB ");
            }
        } catch (Exception e) {
            throw new Exception("Failed in deleteDB " + e.getMessage());
        }
    }

    public JSObject createSyncTable() throws Exception {
        JSObject jSObject = new JSObject();
        if (!this._uJson.isTableExists(this, "sync_table")) {
            boolean zIsLastModified = this._uJson.isLastModified(this);
            boolean zIsSqlDeleted = this._uJson.isSqlDeleted(this);
            if (zIsLastModified && zIsSqlDeleted) {
                try {
                    return execute(new String[]{"CREATE TABLE IF NOT EXISTS sync_table (id INTEGER PRIMARY KEY NOT NULL,sync_date INTEGER);", "INSERT INTO sync_table (sync_date) VALUES ('" + (new Date().getTime() / 1000) + "');"}, new Boolean[0]);
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("No last_modified/sql_deleted columns in tables");
        }
        jSObject.put("changes", (Object) 0);
        return jSObject;
    }

    public Long getSyncDate() throws Exception {
        try {
            if (!this._uJson.isTableExists(this, "sync_table")) {
                throw new Exception("No sync_table available");
            }
            return Long.valueOf(this.toJson.getSyncDate(this).longValue());
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void setSyncDate(String syncDate) throws Exception {
        new JSObject();
        try {
            if (!this._uJson.isTableExists(this, "sync_table")) {
                throw new Exception("No sync_table available");
            }
            if (execute(new String[]{"UPDATE sync_table SET sync_date = " + (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(syncDate.replaceAll("Z$", "+0000")).getTime() / 1000) + " WHERE id = 1;"}, new Boolean[0]).getInteger("changes") == -1) {
                throw new Exception("changes < 0");
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public JSObject importFromJson(JsonSQLite jsonSQL) throws Exception {
        JSObject jSObject = new JSObject();
        Integer num = 0;
        int iIntValue = num.intValue();
        try {
            this._db.setForeignKeyConstraintsEnabled(false);
            if (jsonSQL.getTables().size() > 0 && (iIntValue = this.fromJson.createDatabaseSchema(this, jsonSQL).intValue()) != -1) {
                iIntValue += this.fromJson.createDatabaseData(this, jsonSQL).intValue();
            }
            if (jsonSQL.getViews().size() > 0) {
                iIntValue += this.fromJson.createViews(this, jsonSQL.getViews()).intValue();
            }
            this._db.setForeignKeyConstraintsEnabled(true);
            jSObject.put("changes", iIntValue);
            return jSObject;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public JSObject exportToJson(String mode, Boolean isEncrypted) throws Exception {
        JsonSQLite jsonSQLite = new JsonSQLite();
        JSObject jSObject = new JSObject();
        String str = this._dbName;
        jsonSQLite.setDatabase(str.substring(0, str.length() - 9));
        jsonSQLite.setVersion(Integer.valueOf(this._version));
        jsonSQLite.setEncrypted(this._encrypted);
        jsonSQLite.setMode(mode);
        try {
            if (this._uJson.isTableExists(this, "sync_table")) {
                this.toJson.setLastExportDate(this, Long.valueOf(new Date().getTime() / 1000));
            } else if (jsonSQLite.getMode().equals("partial")) {
                throw new Exception("No sync_table available");
            }
            JsonSQLite jsonSQLiteCreateExportObject = this.toJson.createExportObject(this, jsonSQLite);
            ArrayList<String> keys = jsonSQLiteCreateExportObject.getKeys();
            if (keys.contains("tables") && jsonSQLiteCreateExportObject.getTables().size() > 0) {
                jSObject.put("database", jsonSQLiteCreateExportObject.getDatabase());
                jSObject.put("version", (Object) jsonSQLiteCreateExportObject.getVersion());
                jSObject.put("encrypted", (Object) jsonSQLiteCreateExportObject.getEncrypted());
                jSObject.put("mode", jsonSQLiteCreateExportObject.getMode());
                jSObject.put("tables", (Object) jsonSQLiteCreateExportObject.getTablesAsJSObject());
                if (keys.contains("views") && jsonSQLiteCreateExportObject.getViews().size() > 0) {
                    jSObject.put("views", (Object) jsonSQLiteCreateExportObject.getViewsAsJSObject());
                }
            }
            if (!this._encrypted.booleanValue() || !this._isEncryption.booleanValue() || !isEncrypted.booleanValue()) {
                return jSObject;
            }
            jSObject.put("encrypted", true);
            jSObject.put("overwrite", true);
            String strEncryptJSONObject = UtilsEncryption.encryptJSONObject(this._context, jSObject);
            JSObject jSObject2 = new JSObject();
            jSObject2.put("expData", strEncryptJSONObject);
            return jSObject2;
        } catch (Exception e) {
            Log.e(TAG, "Error: exportToJson " + e.getMessage());
            throw new Exception(e.getMessage());
        }
    }

    public void deleteExportedRows() throws Exception {
        try {
            this.toJson.delExportedRows(this);
        } catch (Exception e) {
            Log.e(TAG, "Error: exportToJson " + e.getMessage());
            throw new Exception(e.getMessage());
        }
    }
}
