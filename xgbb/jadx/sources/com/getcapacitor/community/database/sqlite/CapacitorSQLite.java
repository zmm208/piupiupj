package com.getcapacitor.community.database.sqlite;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.Toast;
import androidx.biometric.BiometricManager;
import androidx.biometric.BiometricPrompt;
import androidx.security.crypto.EncryptedSharedPreferences;
import androidx.security.crypto.MasterKey;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.PluginCall;
import com.getcapacitor.community.database.sqlite.SQLite.BiometricListener;
import com.getcapacitor.community.database.sqlite.SQLite.Database;
import com.getcapacitor.community.database.sqlite.SQLite.GlobalSQLite;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.JsonSQLite;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.UtilsEncryption;
import com.getcapacitor.community.database.sqlite.SQLite.ImportExportJson.UtilsJson;
import com.getcapacitor.community.database.sqlite.SQLite.SqliteConfig;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsBiometric;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsDownloadFromHTTP;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsFile;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsMigrate;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsNCDatabase;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsSQLCipher;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsSQLite;
import com.getcapacitor.community.database.sqlite.SQLite.UtilsSecret;
import java.io.File;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Objects;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class CapacitorSQLite {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.CapacitorSQLite";
    private final Boolean biometricAuth;
    private BiometricManager biometricManager;
    private final String biometricSubTitle;
    private final String biometricTitle;
    private final Context context;
    private final Boolean isEncryption;
    private MasterKey masterKeyAlias;
    private UtilsSecret uSecret;
    private final Dictionary<String, Database> dbDict = new Hashtable();
    private final UtilsSQLite uSqlite = new UtilsSQLite();
    private final UtilsFile uFile = new UtilsFile();
    private final UtilsJson uJson = new UtilsJson();
    private final UtilsMigrate uMigrate = new UtilsMigrate();
    private final UtilsNCDatabase uNCDatabase = new UtilsNCDatabase();
    private final UtilsDownloadFromHTTP uHTTP = new UtilsDownloadFromHTTP();
    private final GlobalSQLite globVar = new GlobalSQLite();
    private final UtilsSQLCipher uCipher = new UtilsSQLCipher();
    private SharedPreferences sharedPreferences = null;
    private final int VALIDITY_DURATION = 5;
    private final RetHandler rHandler = new RetHandler();
    private PluginCall call = this.call;
    private PluginCall call = this.call;

    public String echo(String value) {
        return value;
    }

    public CapacitorSQLite(final Context context, SqliteConfig config) throws Exception {
        this.context = context;
        Boolean boolValueOf = Boolean.valueOf(config.getIsEncryption());
        this.isEncryption = boolValueOf;
        Boolean boolValueOf2 = Boolean.valueOf(config.getBiometricAuth());
        this.biometricAuth = boolValueOf2;
        String biometricTitle = config.getBiometricTitle();
        this.biometricTitle = biometricTitle;
        String biometricSubTitle = config.getBiometricSubTitle();
        this.biometricSubTitle = biometricSubTitle;
        try {
            if (boolValueOf.booleanValue()) {
                if (boolValueOf2.booleanValue()) {
                    this.biometricManager = BiometricManager.from(context);
                    UtilsBiometric utilsBiometric = new UtilsBiometric(context, this.biometricManager, new BiometricListener() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLite.1
                        @Override // com.getcapacitor.community.database.sqlite.SQLite.BiometricListener
                        public void onSuccess(BiometricPrompt.AuthenticationResult result) {
                            try {
                                KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
                                keyStore.load(null);
                                if (keyStore.aliases().hasMoreElements()) {
                                    CapacitorSQLite.this.masterKeyAlias = new MasterKey.Builder(context).setKeyScheme(MasterKey.KeyScheme.AES256_GCM).setUserAuthenticationRequired(true, 5).build();
                                } else {
                                    CapacitorSQLite.this.masterKeyAlias = new MasterKey.Builder(context).setKeyScheme(MasterKey.KeyScheme.AES256_GCM).build();
                                }
                                CapacitorSQLite.this.setSharedPreferences();
                                CapacitorSQLite.this.notifyBiometricEvent(true, null);
                            } catch (Exception e) {
                                String message = e.getMessage();
                                Log.e("MY_APP_TAG", message);
                                CapacitorSQLite.this.notifyBiometricEvent(false, message);
                            }
                        }

                        @Override // com.getcapacitor.community.database.sqlite.SQLite.BiometricListener
                        public void onFailed() {
                            Log.e("MY_APP_TAG", "Error in authenticating biometric");
                            CapacitorSQLite.this.notifyBiometricEvent(false, "Error in authenticating biometric");
                        }
                    });
                    if (utilsBiometric.checkBiometricIsAvailable()) {
                        utilsBiometric.showBiometricDialog(biometricTitle, biometricSubTitle);
                        return;
                    } else {
                        this.masterKeyAlias = new MasterKey.Builder(context).setKeyScheme(MasterKey.KeyScheme.AES256_GCM).build();
                        setSharedPreferences();
                        return;
                    }
                }
                this.masterKeyAlias = new MasterKey.Builder(context).setKeyScheme(MasterKey.KeyScheme.AES256_GCM).build();
                setSharedPreferences();
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyBiometricEvent(Boolean ret, String msg) {
        HashMap<String, Object> map = new HashMap<String, Object>(ret, msg) { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLite.2
            final /* synthetic */ String val$msg;
            final /* synthetic */ Boolean val$ret;

            {
                this.val$ret = ret;
                this.val$msg = msg;
                put("result", ret);
                put("message", msg);
            }
        };
        Log.v(TAG, "$$$$$ in notifyBiometricEvent " + map);
        NotificationCenter.defaultCenter().postNotification("biometricResults", map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSharedPreferences() throws Exception {
        try {
            this.sharedPreferences = EncryptedSharedPreferences.create(this.context, "sqlite_encrypted_shared_prefs", this.masterKeyAlias, EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV, EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM);
            this.uSecret = new UtilsSecret(this.context, this.sharedPreferences);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public Boolean isSecretStored() throws Exception {
        if (this.isEncryption.booleanValue()) {
            try {
                return Boolean.valueOf(UtilsSecret.getPassphrase().length() > 0);
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No Encryption set in capacitor.config");
    }

    public void setEncryptionSecret(String passphrase) throws Exception {
        if (this.isEncryption.booleanValue()) {
            try {
                closeAllConnections();
                this.uSecret.setEncryptionSecret(passphrase);
                return;
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No Encryption set in capacitor.config");
    }

    public void changeEncryptionSecret(final PluginCall call, final String passphrase, final String oldPassphrase) throws Exception {
        this.call = call;
        if (this.isEncryption.booleanValue()) {
            try {
                closeAllConnections();
                if (this.biometricAuth.booleanValue()) {
                    UtilsBiometric utilsBiometric = new UtilsBiometric(this.context, this.biometricManager, new BiometricListener() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLite.3
                        @Override // com.getcapacitor.community.database.sqlite.SQLite.BiometricListener
                        public void onSuccess(BiometricPrompt.AuthenticationResult result) {
                            try {
                                CapacitorSQLite.this.uSecret.changeEncryptionSecret(passphrase, oldPassphrase);
                                CapacitorSQLite.this.rHandler.retResult(call, null, null);
                            } catch (Exception e) {
                                String message = e.getMessage();
                                Log.e("MY_APP_TAG", message);
                                Toast.makeText(CapacitorSQLite.this.context, message, 1).show();
                                CapacitorSQLite.this.rHandler.retResult(call, null, e.getMessage());
                            }
                        }

                        @Override // com.getcapacitor.community.database.sqlite.SQLite.BiometricListener
                        public void onFailed() {
                            Log.e("MY_APP_TAG", "Error in authenticating biometric");
                            Toast.makeText(CapacitorSQLite.this.context, "Error in authenticating biometric", 1).show();
                            CapacitorSQLite.this.rHandler.retResult(call, null, "Error in authenticating biometric");
                        }
                    });
                    if (utilsBiometric.checkBiometricIsAvailable()) {
                        utilsBiometric.showBiometricDialog(this.biometricTitle, this.biometricSubTitle);
                        return;
                    }
                    throw new Exception("Biometric features are currently unavailable.");
                }
                this.uSecret.changeEncryptionSecret(passphrase, oldPassphrase);
                return;
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No Encryption set in capacitor.config");
    }

    public void clearEncryptionSecret() throws Exception {
        if (this.isEncryption.booleanValue()) {
            try {
                closeAllConnections();
                this.uSecret.clearEncryptionSecret();
                return;
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No Encryption set in capacitor.config");
    }

    public Boolean checkEncryptionSecret(String passphrase) throws Exception {
        if (this.isEncryption.booleanValue()) {
            try {
                closeAllConnections();
                return this.uSecret.checkEncryptionSecret(passphrase);
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No Encryption set in capacitor.config");
    }

    public String getNCDatabasePath(String folderPath, String database) throws Exception {
        try {
            return this.uNCDatabase.getNCDatabasePath(this.context, folderPath, database);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void createConnection(String dbName, boolean encrypted, String mode, int version, Dictionary<Integer, JSONObject> vUpgObject, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        String string = (readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString();
        if (this.dbDict.get(string) != null) {
            throw new Exception("Connection " + databaseName + " already exists");
        }
        if (encrypted && !this.isEncryption.booleanValue()) {
            throw new Exception("Database cannot be encrypted as 'No Encryption' set in capacitor.config");
        }
        try {
            this.dbDict.put(string, new Database(this.context, databaseName + "SQLite.db", Boolean.valueOf(encrypted), mode, version, this.isEncryption, vUpgObject, this.sharedPreferences, readonly));
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void createNCConnection(String dbPath, int version) throws Exception {
        String str = "RO_" + dbPath;
        if (this.dbDict.get(str) != null) {
            throw new Exception("Connection " + dbPath + " already exists");
        }
        try {
            if (!this.uFile.isPathExists(dbPath).booleanValue()) {
                throw new Exception("Database " + dbPath + " does not exist");
            }
            this.dbDict.put(str, new Database(this.context, dbPath, false, "no-encryption", version, this.isEncryption, new Hashtable(), this.sharedPreferences, true));
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void open(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            try {
                database.open();
                return;
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void close(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            if (database.isOpen().booleanValue()) {
                if (!database.inTransaction()) {
                    try {
                        database.close();
                        return;
                    } catch (Exception e) {
                        throw new Exception(e.getMessage());
                    }
                }
                throw new Exception("database " + databaseName + " failed to close still in transaction");
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSObject beginTransaction(String dbName) throws Exception {
        JSObject jSObject = new JSObject();
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                try {
                    jSObject.put("changes", (Object) database.beginTransaction());
                    return jSObject;
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSObject commitTransaction(String dbName) throws Exception {
        JSObject jSObject = new JSObject();
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                try {
                    jSObject.put("changes", (Object) database.commitTransaction());
                    return jSObject;
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSObject rollbackTransaction(String dbName) throws Exception {
        JSObject jSObject = new JSObject();
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                try {
                    jSObject.put("changes", (Object) database.rollbackTransaction());
                    return jSObject;
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public Boolean isTransactionActive(String dbName) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                try {
                    return Boolean.valueOf(database.isAvailTrans());
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public String getUrl(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            try {
                return database.getUrl();
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public Integer getVersion(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            try {
                return database.getVersion();
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void closeNCConnection(String dbPath) throws Exception {
        String str = "RO_" + dbPath;
        Database database = this.dbDict.get(str);
        if (database != null) {
            if (database.isOpen().booleanValue()) {
                try {
                    database.close();
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            this.dbDict.remove(str);
            return;
        }
        throw new Exception("No available connection for database " + dbPath);
    }

    public void closeConnection(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        String string = (readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString();
        Database database = this.dbDict.get(string);
        if (database != null) {
            if (database.isOpen().booleanValue()) {
                try {
                    database.close();
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            this.dbDict.remove(string);
            return;
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void getFromHTTPRequest(String url) throws Exception {
        try {
            this.uHTTP.download(this.context, url);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public Boolean checkConnectionsConsistency(JSArray dbNames, JSArray openModes) throws Exception {
        HashSet<String> hashSet = new HashSet(Collections.list(this.dbDict.keys()));
        JSArray jSArray = new JSArray();
        for (int i = 0; i < dbNames.length(); i++) {
            jSArray.put(openModes.getString(i) + "_" + dbNames.getString(i));
        }
        HashSet hashSet2 = new HashSet(this.uSqlite.stringJSArrayToArrayList(jSArray));
        try {
            if (hashSet2.size() == 0) {
                closeAllConnections();
                return false;
            }
            if (hashSet.size() < hashSet2.size()) {
                closeAllConnections();
                return false;
            }
            if (hashSet.size() > hashSet2.size()) {
                for (String str : hashSet) {
                    if (!hashSet2.contains(str)) {
                        this.dbDict.remove(str);
                    }
                }
            }
            HashSet hashSet3 = new HashSet(Collections.list(this.dbDict.keys()));
            if (hashSet3.size() == hashSet2.size()) {
                HashSet hashSet4 = new HashSet(hashSet3);
                hashSet4.addAll(hashSet2);
                HashSet hashSet5 = new HashSet(hashSet3);
                hashSet5.retainAll(hashSet2);
                hashSet4.removeAll(hashSet5);
                if (hashSet4.size() == 0) {
                    return true;
                }
                closeAllConnections();
                return false;
            }
            closeAllConnections();
            return false;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public Boolean isDatabase(String dbName) {
        return this.uFile.isFileExists(this.context, getDatabaseName(dbName) + "SQLite.db");
    }

    public Boolean isDatabaseEncrypted(String dbName) throws Exception {
        String databaseName = getDatabaseName(dbName);
        File databasePath = this.context.getDatabasePath(databaseName + "SQLite.db");
        if (this.uFile.isFileExists(this.context, databaseName + "SQLite.db").booleanValue()) {
            UtilsSQLCipher.State databaseState = this.uCipher.getDatabaseState(this.context, databasePath, this.sharedPreferences, this.globVar);
            if (databaseState == UtilsSQLCipher.State.ENCRYPTED_GLOBAL_SECRET || databaseState == UtilsSQLCipher.State.ENCRYPTED_SECRET) {
                return true;
            }
            if (databaseState == UtilsSQLCipher.State.UNENCRYPTED) {
                return false;
            }
            throw new Exception("Database unknown");
        }
        throw new Exception("Database does not exist");
    }

    public Boolean isNCDatabase(String dbPath) {
        return this.uFile.isPathExists(dbPath);
    }

    public Boolean isTableExists(String dbName, String tableName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            return Boolean.valueOf(this.uJson.isTableExists(database, tableName));
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSArray getDatabaseList() throws Exception {
        String[] listOfFiles = this.uFile.getListOfFiles(this.context);
        JSArray jSArray = new JSArray();
        for (String str : listOfFiles) {
            if (str.contains("SQLite")) {
                jSArray.put(str);
            }
        }
        if (jSArray.length() > 0) {
            return jSArray;
        }
        throw new Exception("No databases available ");
    }

    public JSArray getMigratableDbList(String folderPath) throws Exception {
        String[] migratableList = this.uMigrate.getMigratableList(this.context, folderPath);
        JSArray jSArray = new JSArray();
        for (String str : migratableList) {
            if (!str.contains("SQLite")) {
                jSArray.put(str);
            }
        }
        if (jSArray.length() > 0) {
            return jSArray;
        }
        throw new Exception("No databases available ");
    }

    public void addSQLiteSuffix(String folderPath, JSArray dbList) throws Exception {
        try {
            this.uMigrate.addSQLiteSuffix(this.context, folderPath, this.uSqlite.stringJSArrayToArrayList(dbList));
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void deleteOldDatabases(String folderPath, JSArray dbList) throws Exception {
        try {
            this.uMigrate.deleteOldDatabases(this.context, folderPath, this.uSqlite.stringJSArrayToArrayList(dbList));
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void moveDatabasesAndAddSuffix(String folderPath, JSArray dbList) throws Exception {
        try {
            this.uMigrate.moveDatabasesAndAddSuffix(this.context, folderPath, this.uSqlite.stringJSArrayToArrayList(dbList));
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public JSObject execute(String dbName, String statements, Boolean transaction, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                try {
                    return database.execute(this.uSqlite.getStatementsArray(statements), transaction);
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSObject executeSet(String dbName, JSArray set, Boolean transaction, Boolean readonly, String returnMode) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                try {
                    return database.executeSet(set, transaction, returnMode);
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSObject run(String dbName, String statement, JSArray values, Boolean transaction, Boolean readonly, String returnMode) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            if (!database.isNCDB().booleanValue() && database.isOpen().booleanValue()) {
                if (values.length() > 0) {
                    try {
                        return database.runSQL(statement, this.uSqlite.objectJSArrayToArrayList(values), transaction, returnMode);
                    } catch (Exception e) {
                        throw new Exception(e.getMessage());
                    }
                }
                try {
                    return database.runSQL(statement, new ArrayList<>(), transaction, returnMode);
                } catch (Exception e2) {
                    throw new Exception(e2.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSArray query(String dbName, String statement, JSArray values, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            if (database.isOpen().booleanValue()) {
                if (values.length() > 0) {
                    try {
                        return database.selectSQL(statement, this.uSqlite.objectJSArrayToArrayList(values));
                    } catch (Exception e) {
                        throw new Exception(e.getMessage());
                    }
                }
                try {
                    return database.selectSQL(statement, new ArrayList<>());
                } catch (Exception e2) {
                    throw new Exception(e2.getMessage());
                }
            }
            throw new Exception("database " + databaseName + " not opened");
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSArray getTableList(String dbName, Boolean readonly) throws Exception {
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(dbName).toString());
        if (database != null) {
            if (database.isOpen().booleanValue()) {
                return database.getTableNames();
            }
            throw new Exception("database " + dbName + " not opened");
        }
        throw new Exception("No available connection for database " + dbName);
    }

    public Boolean isDBExists(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        if (this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString()) != null) {
            return Boolean.valueOf(this.context.getDatabasePath(databaseName + "SQLite.db").exists());
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public Boolean isDBOpen(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            return database.isOpen();
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void deleteDatabase(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            try {
                database.deleteDB(databaseName + "SQLite.db");
                return;
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public JSObject createSyncTable(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            try {
                if (!database.isOpen().booleanValue()) {
                    throw new Exception("CreateSyncTable: db not opened");
                }
                return database.createSyncTable();
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void setSyncDate(String dbName, String syncDate, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            try {
                if (!database.isOpen().booleanValue()) {
                    throw new Exception("SetSyncDate: db not opened");
                }
                database.setSyncDate(syncDate);
                return;
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public Long getSyncDate(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            try {
                if (!database.isOpen().booleanValue()) {
                    throw new Exception("GetSyncDate: db not opened");
                }
                return database.getSyncDate();
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public Dictionary<Integer, JSONObject> addUpgradeStatement(JSArray upgrade) throws Exception {
        Hashtable hashtable = new Hashtable();
        for (int i = 0; i < upgrade.length(); i++) {
            try {
                JSONObject jSONObject = (JSONObject) upgrade.get(i);
                if (jSONObject == null || !jSONObject.has("toVersion") || !jSONObject.has("statements")) {
                    throw new Exception("Must provide an upgrade statement {toVersion,statement}");
                }
                try {
                    hashtable.put(Integer.valueOf(jSONObject.getInt("toVersion")), jSONObject);
                } catch (Exception e) {
                    throw new Exception("Must provide toVersion as Integer" + e.getMessage());
                }
            } catch (Exception e2) {
                throw new Exception("Must provide an upgrade statement " + e2.getMessage());
            }
        }
        return hashtable;
    }

    public Boolean isJsonValid(String parsingData) throws Exception {
        try {
            return Boolean.valueOf(new JsonSQLite().isJsonSQLite(new JSObject(parsingData), this.isEncryption));
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public JSObject importFromJson(String parsingData) throws Exception {
        try {
            JSObject jSObject = new JSObject(parsingData);
            if (jSObject.has("expData")) {
                jSObject = UtilsEncryption.decryptJSONObject(this.context, jSObject.getString("expData"));
            }
            JsonSQLite jsonSQLite = new JsonSQLite();
            if (!jsonSQLite.isJsonSQLite(jSObject, this.isEncryption)) {
                throw new Exception("Stringify Json Object not Valid");
            }
            String str = getDatabaseName(jsonSQLite.getDatabase()) + "SQLite.db";
            Integer version = jsonSQLite.getVersion();
            String mode = jsonSQLite.getMode();
            Boolean overwrite = jsonSQLite.getOverwrite();
            Boolean encrypted = jsonSQLite.getEncrypted();
            Database database = new Database(this.context, str, encrypted, encrypted.booleanValue() ? "secret" : "no-encryption", version.intValue(), this.isEncryption, new Hashtable(), this.sharedPreferences, false);
            if (overwrite.booleanValue() && mode.equals("full") && this.uFile.isFileExists(this.context, str).booleanValue()) {
                this.uFile.deleteFile(this.context, str);
            }
            database.open();
            if (!database.isOpen().booleanValue()) {
                throw new Exception(str + "SQLite.db not opened");
            }
            JSArray tableNames = database.getTableNames();
            if (mode.equals("full") && tableNames.length() > 0) {
                Integer version2 = database.getVersion();
                if (version.intValue() < version2.intValue()) {
                    throw new Exception("ImportFromJson: Cannot import a version lower than" + version2);
                }
                if (version2.equals(version)) {
                    JSObject jSObject2 = new JSObject();
                    jSObject2.put("changes", (Object) 0);
                    return jSObject2;
                }
            }
            JSObject jSObjectImportFromJson = database.importFromJson(jsonSQLite);
            database.close();
            if (Objects.equals(jSObjectImportFromJson.getInteger("changes"), -1)) {
                throw new Exception("importFromJson: import JsonObject not successful");
            }
            return jSObjectImportFromJson;
        } catch (Exception e) {
            throw new Exception("importFromJson : " + e.getMessage());
        }
    }

    public JSObject exportToJson(String dbName, String expMode, Boolean readonly, Boolean encrypted) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get((readonly.booleanValue() ? new StringBuilder("RO_") : new StringBuilder("RW_")).append(databaseName).toString());
        if (database != null) {
            try {
                if (!database.isOpen().booleanValue()) {
                    throw new Exception("ExportToJson: db not opened");
                }
                JSObject jSObjectExportToJson = database.exportToJson(expMode, encrypted);
                if (jSObjectExportToJson.length() == 0) {
                    throw new Exception("ExportToJson: : return Object is empty No data to synchronize");
                }
                if ((jSObjectExportToJson.length() != 1 || !jSObjectExportToJson.has("expData")) && jSObjectExportToJson.length() != 5 && jSObjectExportToJson.length() != 6 && jSObjectExportToJson.length() != 7) {
                    throw new Exception("ExportToJson: return Obj is not a JsonSQLite Obj");
                }
                return jSObjectExportToJson;
            } catch (Exception e) {
                throw new Exception("ExportToJson " + e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void deleteExportedRows(String dbName, Boolean readonly) throws Exception {
        String databaseName = getDatabaseName(dbName);
        Database database = this.dbDict.get("RW_" + databaseName);
        if (database != null) {
            if (readonly.booleanValue()) {
                throw new Exception("not allowed in read-only mode");
            }
            try {
                if (!database.isOpen().booleanValue()) {
                    throw new Exception("deleteExportedRows: db not opened");
                }
                database.deleteExportedRows();
                return;
            } catch (Exception e) {
                throw new Exception("DeleteExportedRows " + e.getMessage());
            }
        }
        throw new Exception("No available connection for database " + databaseName);
    }

    public void copyFromAssets(Boolean overwrite) throws Exception {
        try {
            this.uFile.copyFromAssetsToDatabase(this.context, overwrite);
        } catch (Exception e) {
            throw new Exception("copy failed : " + e.getMessage());
        }
    }

    private String getDatabaseName(String dbName) {
        return (dbName.contains("/") || !dbName.endsWith(".db")) ? dbName : dbName.substring(0, dbName.length() - 3);
    }

    private void closeAllConnections() throws Exception {
        try {
            Enumeration<String> enumerationKeys = this.dbDict.keys();
            while (enumerationKeys.hasMoreElements()) {
                String strNextElement = enumerationKeys.nextElement();
                closeConnection(strNextElement.substring(3), Boolean.valueOf(strNextElement.startsWith("RO_")));
            }
        } catch (Exception e) {
            throw new Exception("close all connections " + e.getMessage());
        }
    }
}
