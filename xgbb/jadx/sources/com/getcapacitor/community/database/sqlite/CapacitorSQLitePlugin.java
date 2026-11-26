package com.getcapacitor.community.database.sqlite;

import android.content.Context;
import android.os.Process;
import android.util.Log;
import androidx.core.app.NotificationCompat;
import com.capacitorjs.plugins.localnotifications.LocalNotificationManager;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.community.database.sqlite.SQLite.SqliteConfig;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Dictionary;
import java.util.Hashtable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
@CapacitorPlugin(name = "CapacitorSQLite")
public class CapacitorSQLitePlugin extends Plugin {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin";
    private SqliteConfig config;
    private CapacitorSQLite implementation;
    private final Dictionary<String, Dictionary<Integer, JSONObject>> versionUpgrades = new Hashtable();
    private final RetHandler rHandler = new RetHandler();
    private String passphrase = null;
    private String oldpassphrase = null;
    private String loadMessage = "";
    private final ArrayList<String> modeList = new ArrayList<>(Arrays.asList("no-encryption", "encryption", "secret", "decryption", "wrongsecret"));

    @Override // com.getcapacitor.Plugin
    public void load() {
        Context context = getContext();
        try {
            this.config = getSqliteConfig();
            AddObserversToNotificationCenter();
            this.implementation = new CapacitorSQLite(context, this.config);
        } catch (Exception e) {
            this.implementation = null;
            String str = "CapacitorSQLitePlugin: " + e.getMessage();
            this.loadMessage = str;
            Log.e(TAG, str);
        }
    }

    @PluginMethod
    public void echo(PluginCall call) {
        String string = call.getString("value");
        if (this.implementation != null) {
            try {
                JSObject jSObject = new JSObject();
                jSObject.put("value", this.implementation.echo(string));
                call.resolve(jSObject);
                return;
            } catch (Exception e) {
                call.reject(e.getMessage());
                return;
            }
        }
        call.reject(this.loadMessage);
    }

    @PluginMethod
    public void isSecretStored(PluginCall call) {
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isSecretStored(), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "IsSecretStored: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void setEncryptionSecret(PluginCall call) {
        if (!call.getData().has("passphrase")) {
            this.rHandler.retResult(call, null, "SetEncryptionSecret: Must provide a passphrase");
            return;
        }
        String string = call.getString("passphrase");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.setEncryptionSecret(string);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "SetEncryptionSecret: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void changeEncryptionSecret(final PluginCall call) {
        if (!call.getData().has("passphrase")) {
            this.rHandler.retResult(call, null, "SetEncryptionSecret: Must provide a passphrase");
            return;
        }
        this.passphrase = call.getString("passphrase");
        if (!call.getData().has("oldpassphrase")) {
            this.rHandler.retResult(call, null, "SetEncryptionSecret: Must provide a oldpassphrase");
            return;
        }
        this.oldpassphrase = call.getString("oldpassphrase");
        if (this.implementation != null) {
            getActivity().runOnUiThread(new Runnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$changeEncryptionSecret$0(call);
                }
            });
        } else {
            this.rHandler.retResult(call, null, this.loadMessage);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$changeEncryptionSecret$0(PluginCall pluginCall) {
        try {
            this.implementation.changeEncryptionSecret(pluginCall, this.passphrase, this.oldpassphrase);
            this.rHandler.retResult(pluginCall, null, null);
        } catch (Exception e) {
            this.rHandler.retResult(pluginCall, null, "ChangeEncryptionSecret: " + e.getMessage());
        }
    }

    @PluginMethod
    public void clearEncryptionSecret(PluginCall call) {
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.clearEncryptionSecret();
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "ClearEncryptionSecret: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void checkEncryptionSecret(PluginCall call) {
        if (!call.getData().has("passphrase")) {
            this.rHandler.retResult(call, null, "checkEncryptionSecret: Must provide a passphrase");
            return;
        }
        String string = call.getString("passphrase");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.checkEncryptionSecret(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CheckEncryptionSecret: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void getNCDatabasePath(PluginCall call) {
        if (!call.getData().has("path")) {
            this.rHandler.retPath(call, null, "getNCDatabasePath: Must provide a folder path");
            return;
        }
        String string = call.getString("path");
        if (!call.getData().has("database")) {
            this.rHandler.retPath(call, null, "getNCDatabasePath: Must provide a database name");
            return;
        }
        String string2 = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retPath(call, capacitorSQLite.getNCDatabasePath(string, string2), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "getNCDatabasePath: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void createNCConnection(PluginCall call) {
        if (!call.getData().has("databasePath")) {
            this.rHandler.retResult(call, null, "CreateNCConnection: Must provide a database path");
            return;
        }
        if (this.implementation != null) {
            try {
                this.implementation.createNCConnection(call.getString("databasePath"), call.getInt("version", 1).intValue());
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CreateNCConnection: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void createConnection(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "CreateConnection: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        int iIntValue = call.getInt("version", 1).intValue();
        Boolean bool = call.getBoolean("encrypted", false);
        String string2 = "no-encryption";
        if (bool.booleanValue()) {
            string2 = call.getString("mode", "no-encryption");
            if (!this.modeList.contains(string2)) {
                this.rHandler.retResult(call, null, "CreateConnection: inMode must be in ['encryption','secret', 'decryption'] ");
                return;
            }
        }
        String str = string2;
        boolean zBooleanValue = call.getBoolean("readonly", false).booleanValue();
        Dictionary<Integer, JSONObject> dictionary = this.versionUpgrades.get(string);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.createConnection(string, bool.booleanValue(), str, iIntValue, dictionary, Boolean.valueOf(zBooleanValue));
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CreateConnection: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void open(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "Open: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.open(string, bool);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "Open: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void close(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "Close: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.close(string, bool);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "Close: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void beginTransaction(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "BeginTransaction: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.beginTransaction(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "BeginTransaction: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void commitTransaction(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "CommitTransaction: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.commitTransaction(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "CommitTransaction: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void rollbackTransaction(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "RollbackTransaction: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.rollbackTransaction(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "RollbackTransaction: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void isTransactionActive(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "Must provide a database name");
            return;
        }
        String string = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isTransactionActive(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "IsTransactionActive: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void getUrl(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retUrl(call, null, "GetUrl: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retUrl(call, capacitorSQLite.getUrl(string, bool), null);
                return;
            } catch (Exception e) {
                this.rHandler.retUrl(call, null, "GetUrl: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retUrl(call, null, this.loadMessage);
    }

    @PluginMethod
    public void getVersion(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retVersion(call, null, "GetVersion: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retVersion(call, capacitorSQLite.getVersion(string, bool), null);
                return;
            } catch (Exception e) {
                this.rHandler.retVersion(call, null, "GetVersion: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retVersion(call, null, this.loadMessage);
    }

    @PluginMethod
    public void closeNCConnection(PluginCall call) {
        if (!call.getData().has("databasePath")) {
            this.rHandler.retResult(call, null, "CloseNCConnection: Must provide a database path");
            return;
        }
        String string = call.getString("databasePath");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.closeNCConnection(string);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CloseNCConnection: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void closeConnection(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "CloseConnection: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.closeConnection(string, bool);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CloseConnection: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void checkConnectionsConsistency(PluginCall call) {
        if (!call.getData().has("dbNames")) {
            this.rHandler.retResult(call, null, "CheckConnectionsConsistency: Must provide a connection Array");
            return;
        }
        JSArray array = call.getArray("dbNames");
        if (!call.getData().has("openModes")) {
            this.rHandler.retResult(call, null, "CheckConnectionsConsistency: Must provide a openModes Array");
            return;
        }
        JSArray array2 = call.getArray("openModes");
        if (array == null || array2 == null) {
            this.rHandler.retResult(call, null, "CheckConnectionsConsistency: No dbNames or openModes given");
            return;
        }
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.checkConnectionsConsistency(array, array2), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CheckConnectionsConsistency: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void isDatabase(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "Must provide a database name");
            return;
        }
        String string = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isDatabase(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "isDatabase: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void isDatabaseEncrypted(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "Must provide a database name");
            return;
        }
        String string = call.getString("database");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isDatabaseEncrypted(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "isDatabaseEncrypted: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void isInConfigEncryption(PluginCall call) {
        this.rHandler.retResult(call, Boolean.valueOf(this.config.getIsEncryption()), null);
    }

    @PluginMethod
    public void isInConfigBiometricAuth(PluginCall call) {
        this.rHandler.retResult(call, Boolean.valueOf(this.config.getBiometricAuth()), null);
    }

    @PluginMethod
    public void isNCDatabase(PluginCall call) {
        if (!call.getData().has("databasePath")) {
            this.rHandler.retResult(call, null, "Must provide a database path");
            return;
        }
        String string = call.getString("databasePath");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isNCDatabase(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "isNCDatabase: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void isTableExists(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("table")) {
            this.rHandler.retResult(call, null, "Must provide a table name");
            return;
        }
        String string2 = call.getString("table");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isTableExists(string, string2, bool), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "isTableExists: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void getDatabaseList(PluginCall call) {
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retValues(call, capacitorSQLite.getDatabaseList(), null);
                return;
            } catch (Exception e) {
                this.rHandler.retValues(call, new JSArray(), "getDatabaseList: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retValues(call, new JSArray(), this.loadMessage);
    }

    @PluginMethod
    public void getMigratableDbList(PluginCall call) {
        String string;
        if (!call.getData().has("folderPath")) {
            string = LocalNotificationManager.DEFAULT_NOTIFICATION_CHANNEL_ID;
        } else {
            string = call.getString("folderPath");
        }
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retValues(call, capacitorSQLite.getMigratableDbList(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retValues(call, new JSArray(), "getMigratableDbList: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retValues(call, new JSArray(), this.loadMessage);
    }

    @PluginMethod
    public void addSQLiteSuffix(PluginCall call) {
        String string;
        if (!call.getData().has("folderPath")) {
            string = LocalNotificationManager.DEFAULT_NOTIFICATION_CHANNEL_ID;
        } else {
            string = call.getString("folderPath");
        }
        JSArray array = !call.getData().has("dbNameList") ? null : call.getArray("dbNameList");
        if (array == null) {
            this.rHandler.retResult(call, null, "AddSQLiteSuffix: dbNameList not given or empty");
            return;
        }
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.addSQLiteSuffix(string, array);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "addSQLiteSuffix: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void deleteOldDatabases(PluginCall call) {
        String string;
        if (!call.getData().has("folderPath")) {
            string = LocalNotificationManager.DEFAULT_NOTIFICATION_CHANNEL_ID;
        } else {
            string = call.getString("folderPath");
        }
        JSArray array = !call.getData().has("dbNameList") ? null : call.getArray("dbNameList");
        if (array == null) {
            this.rHandler.retResult(call, null, "deleteOldDatabases: dbNameList not given or empty");
            return;
        }
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.deleteOldDatabases(string, array);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "deleteOldDatabases: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void moveDatabasesAndAddSuffix(PluginCall call) {
        String string;
        if (!call.getData().has("folderPath")) {
            string = LocalNotificationManager.DEFAULT_NOTIFICATION_CHANNEL_ID;
        } else {
            string = call.getString("folderPath");
        }
        JSArray array = !call.getData().has("dbNameList") ? null : call.getArray("dbNameList");
        if (array == null) {
            this.rHandler.retResult(call, null, "moveDatabasesAndAddSuffix: dbNameList not given or empty");
            return;
        }
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.moveDatabasesAndAddSuffix(string, array);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "moveDatabasesAndAddSuffix: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void execute(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "Execute: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("statements")) {
            this.rHandler.retChanges(call, jSObject, "Execute: Must provide raw SQL statements");
            return;
        }
        String string2 = call.getString("statements");
        Boolean bool = call.getBoolean("transaction", true);
        Boolean bool2 = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.execute(string, string2, bool, bool2), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "Execute: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void executeSet(PluginCall call) throws Exception {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "ExecuteSet: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("set")) {
            this.rHandler.retChanges(call, jSObject, "ExecuteSet: Must provide a set of SQL statements");
            return;
        }
        JSArray array = call.getArray("set");
        if (array == null) {
            this.rHandler.retChanges(call, jSObject, "ExecuteSet: Must provide a set of SQL statements");
            return;
        }
        if (array.length() == 0) {
            this.rHandler.retChanges(call, jSObject, "ExecuteSet: Must provide a non-empty set of SQL statements");
            return;
        }
        for (int i = 0; i < array.length(); i++) {
            JSONArray jSONArrayNames = array.getJSONObject(i).names();
            for (int i2 = 0; i2 < jSONArrayNames.length(); i2++) {
                String string2 = jSONArrayNames.getString(i2);
                if (!string2.equals("statement") && !string2.equals("values")) {
                    this.rHandler.retChanges(call, jSObject, "ExecuteSet: Must provide a set as Array of {statement,values}");
                    return;
                }
            }
        }
        Boolean bool = call.getBoolean("transaction", true);
        Boolean bool2 = call.getBoolean("readonly", false);
        String string3 = call.getString("returnMode", "no");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.executeSet(string, array, bool, bool2, string3), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "ExecuteSet: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void run(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "Run: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("statement")) {
            this.rHandler.retChanges(call, jSObject, "Run: Must provide a SQL statement");
            return;
        }
        String string2 = call.getString("statement");
        if (!call.getData().has("values")) {
            this.rHandler.retChanges(call, jSObject, "Run: Must provide an Array of values");
            return;
        }
        JSArray array = call.getArray("values");
        if (array == null) {
            this.rHandler.retChanges(call, jSObject, "Run: Must provide an Array of values");
            return;
        }
        Boolean bool = call.getBoolean("transaction", true);
        Boolean bool2 = call.getBoolean("readonly", false);
        String string3 = call.getString("returnMode", "no");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.run(string, string2, array, bool, bool2, string3), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "Run: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void query(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retValues(call, new JSArray(), "Query: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("statement")) {
            this.rHandler.retValues(call, new JSArray(), "Query: Must provide a SQL statement");
            return;
        }
        String string2 = call.getString("statement");
        if (!call.getData().has("values")) {
            this.rHandler.retValues(call, new JSArray(), "Query: Must provide an Array of Strings");
            return;
        }
        JSArray array = call.getArray("values");
        if (array == null) {
            this.rHandler.retValues(call, new JSArray(), "Query: Must provide an Array of values");
            return;
        }
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retValues(call, capacitorSQLite.query(string, string2, array, bool), null);
                return;
            } catch (Exception e) {
                this.rHandler.retValues(call, new JSArray(), "Query: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retValues(call, new JSArray(), this.loadMessage);
    }

    @PluginMethod
    public void getTableList(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retValues(call, new JSArray(), "getTableList: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retValues(call, capacitorSQLite.getTableList(string, bool), null);
                return;
            } catch (Exception e) {
                this.rHandler.retValues(call, new JSArray(), "GetTableList: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retValues(call, new JSArray(), this.loadMessage);
    }

    @PluginMethod
    public void isDBExists(PluginCall call) {
        if (call.getData().has("database")) {
            String string = call.getString("database");
            Boolean bool = call.getBoolean("readonly", false);
            CapacitorSQLite capacitorSQLite = this.implementation;
            if (capacitorSQLite != null) {
                try {
                    this.rHandler.retResult(call, capacitorSQLite.isDBExists(string, bool), null);
                    return;
                } catch (Exception e) {
                    this.rHandler.retResult(call, false, "isDBExists: " + e.getMessage());
                    return;
                }
            }
            this.rHandler.retResult(call, null, this.loadMessage);
            return;
        }
        this.rHandler.retResult(call, false, "isDBExists: Must provide a database name");
    }

    @PluginMethod
    public void isDBOpen(PluginCall call) {
        if (call.getData().has("database")) {
            String string = call.getString("database");
            Boolean bool = call.getBoolean("readonly", false);
            CapacitorSQLite capacitorSQLite = this.implementation;
            if (capacitorSQLite != null) {
                try {
                    this.rHandler.retResult(call, capacitorSQLite.isDBOpen(string, bool), null);
                    return;
                } catch (Exception e) {
                    this.rHandler.retResult(call, false, "isDBOpen: " + e.getMessage());
                    return;
                }
            }
            this.rHandler.retResult(call, null, this.loadMessage);
            return;
        }
        this.rHandler.retResult(call, false, "isDBOpen: Must provide a database name");
    }

    @PluginMethod
    public void deleteDatabase(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "deleteDatabase: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.deleteDatabase(string, bool);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "deleteDatabase: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void createSyncTable(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("database")) {
            this.rHandler.retChanges(call, jSObject, "CreateSyncTable: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.createSyncTable(string, bool), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "CreateSyncTable: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void setSyncDate(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "SetSyncDate: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("syncdate")) {
            this.rHandler.retResult(call, null, "SetSyncDate : Must provide a sync date");
            return;
        }
        String string2 = call.getString("syncdate");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.setSyncDate(string, string2, bool);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "SetSyncDate: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void getSyncDate(PluginCall call) {
        JSObject jSObject = new JSObject();
        if (!call.getData().has("database")) {
            jSObject.put("changes", (Object) (-1));
            this.rHandler.retSyncDate(call, 0L, "GetSyncDate : Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite == null) {
            this.rHandler.retSyncDate(call, 0L, this.loadMessage);
            return;
        }
        try {
            this.rHandler.retSyncDate(call, Long.valueOf(capacitorSQLite.getSyncDate(string, bool).longValue()), null);
        } catch (Exception e) {
            this.rHandler.retSyncDate(call, 0L, "GetSyncDate: " + e.getMessage());
        }
    }

    @PluginMethod
    public void addUpgradeStatement(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "AddUpgradeStatement: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("upgrade")) {
            this.rHandler.retResult(call, null, "AddUpgradeStatement: Must provide an array with upgrade statement");
            return;
        }
        JSArray array = call.getArray("upgrade");
        if (array == null) {
            this.rHandler.retResult(call, null, "AddUpgradeStatement: Must provide an array with upgrade statement");
            return;
        }
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                Dictionary<Integer, JSONObject> dictionaryAddUpgradeStatement = capacitorSQLite.addUpgradeStatement(array);
                if (this.versionUpgrades.get(string) != null) {
                    for (Integer num : Collections.list(dictionaryAddUpgradeStatement.keys())) {
                        this.versionUpgrades.get(string).put(num, dictionaryAddUpgradeStatement.get(num));
                    }
                } else {
                    this.versionUpgrades.put(string, dictionaryAddUpgradeStatement);
                }
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "AddUpgradeStatement: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void isJsonValid(PluginCall call) {
        if (!call.getData().has("jsonstring")) {
            this.rHandler.retResult(call, false, "IsJsonValid: Must provide a Stringify Json Object");
            return;
        }
        String string = call.getString("jsonstring");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retResult(call, capacitorSQLite.isJsonValid(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, false, "IsJsonValid: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void importFromJson(PluginCall call) {
        JSObject jSObject = new JSObject();
        jSObject.put("changes", (Object) (-1));
        if (!call.getData().has("jsonstring")) {
            this.rHandler.retChanges(call, jSObject, "ImportFromJson: Must provide a Stringify Json Object");
            return;
        }
        String string = call.getString("jsonstring");
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retChanges(call, capacitorSQLite.importFromJson(string), null);
                return;
            } catch (Exception e) {
                this.rHandler.retChanges(call, jSObject, "ImportFromJson: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retChanges(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void exportToJson(PluginCall call) {
        JSObject jSObject = new JSObject();
        if (!call.getData().has("database")) {
            this.rHandler.retJSObject(call, jSObject, "ExportToJson: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        if (!call.getData().has("jsonexportmode")) {
            this.rHandler.retJSObject(call, jSObject, "ExportToJson: Must provide an export mode");
            return;
        }
        String string2 = call.getString("jsonexportmode");
        if (!string2.equals("full") && !string2.equals("partial")) {
            this.rHandler.retJSObject(call, jSObject, "ExportToJson: Json export mode should be 'full' or 'partial'");
            return;
        }
        Boolean bool = call.getBoolean("readonly", false);
        Boolean bool2 = call.getBoolean("encrypted", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                this.rHandler.retJSObject(call, capacitorSQLite.exportToJson(string, string2, bool, bool2), null);
                return;
            } catch (Exception e) {
                this.rHandler.retJSObject(call, jSObject, "ExportToJson: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retJSObject(call, jSObject, this.loadMessage);
    }

    @PluginMethod
    public void deleteExportedRows(PluginCall call) {
        if (!call.getData().has("database")) {
            this.rHandler.retResult(call, null, "DeleteExportedRows: Must provide a database name");
            return;
        }
        String string = call.getString("database");
        Boolean bool = call.getBoolean("readonly", false);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.deleteExportedRows(string, bool);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "DeleteExportedRows: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void copyFromAssets(PluginCall call) {
        Boolean boolValueOf = Boolean.valueOf(call.getData().has("overwrite") ? call.getBoolean("overwrite").booleanValue() : true);
        CapacitorSQLite capacitorSQLite = this.implementation;
        if (capacitorSQLite != null) {
            try {
                capacitorSQLite.copyFromAssets(boolValueOf);
                this.rHandler.retResult(call, null, null);
                return;
            } catch (Exception e) {
                this.rHandler.retResult(call, null, "CopyFromAssets: " + e.getMessage());
                return;
            }
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    @PluginMethod
    public void getFromHTTPRequest(final PluginCall call) {
        if (!call.getData().has("url")) {
            this.rHandler.retResult(call, null, "GetFromHTTPRequest: Must provide a database url");
            return;
        }
        final String string = call.getString("url");
        if (this.implementation != null) {
            Thread thread = new Thread(new Runnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$getFromHTTPRequest$3(string, call);
                }
            });
            thread.start();
            while (thread.isAlive()) {
            }
            System.out.println("Thread Exiting!");
            return;
        }
        this.rHandler.retResult(call, null, this.loadMessage);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getFromHTTPRequest$3(String str, final PluginCall pluginCall) {
        Process.setThreadPriority(10);
        try {
            this.implementation.getFromHTTPRequest(str);
            getActivity().runOnUiThread(new Runnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$getFromHTTPRequest$1(pluginCall);
                }
            });
        } catch (Exception e) {
            getActivity().runOnUiThread(new Runnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.lambda$getFromHTTPRequest$2(e, pluginCall);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getFromHTTPRequest$1(PluginCall pluginCall) {
        this.rHandler.retResult(pluginCall, null, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getFromHTTPRequest$2(Exception exc, PluginCall pluginCall) {
        this.rHandler.retResult(pluginCall, null, "GetFromHTTPRequest: " + exc.getMessage());
    }

    private void AddObserversToNotificationCenter() {
        NotificationCenter.defaultCenter().addMethodForNotification("importJsonProgress", new MyRunnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin.1
            @Override // com.getcapacitor.community.database.sqlite.MyRunnable, java.lang.Runnable
            public void run() {
                JSObject jSObject = new JSObject();
                jSObject.put(NotificationCompat.CATEGORY_PROGRESS, getInfo().get(NotificationCompat.CATEGORY_PROGRESS));
                CapacitorSQLitePlugin.this.notifyListeners("sqliteImportProgressEvent", jSObject);
            }
        });
        NotificationCenter.defaultCenter().addMethodForNotification("exportJsonProgress", new MyRunnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin.2
            @Override // com.getcapacitor.community.database.sqlite.MyRunnable, java.lang.Runnable
            public void run() {
                JSObject jSObject = new JSObject();
                jSObject.put(NotificationCompat.CATEGORY_PROGRESS, getInfo().get(NotificationCompat.CATEGORY_PROGRESS));
                CapacitorSQLitePlugin.this.notifyListeners("sqliteExportProgressEvent", jSObject);
            }
        });
        NotificationCenter.defaultCenter().addMethodForNotification("biometricResults", new MyRunnable() { // from class: com.getcapacitor.community.database.sqlite.CapacitorSQLitePlugin.3
            @Override // com.getcapacitor.community.database.sqlite.MyRunnable, java.lang.Runnable
            public void run() {
                JSObject jSObject = new JSObject();
                jSObject.put("result", getInfo().get("result"));
                jSObject.put("message", getInfo().get("message"));
                CapacitorSQLitePlugin.this.notifyListeners("sqliteBiometricEvent", jSObject);
            }
        });
    }

    private SqliteConfig getSqliteConfig() throws JSONException {
        boolean biometricAuth;
        String biometricTitle;
        String biometricSubTitle;
        SqliteConfig sqliteConfig = new SqliteConfig();
        JSONObject configJSON = getConfig().getConfigJSON();
        boolean z = configJSON.has("androidIsEncryption") ? configJSON.getBoolean("androidIsEncryption") : sqliteConfig.getIsEncryption();
        sqliteConfig.setIsEncryption(z);
        JSONObject jSONObject = configJSON.has("androidBiometric") ? configJSON.getJSONObject("androidBiometric") : null;
        if (jSONObject != null) {
            if (jSONObject.has("biometricAuth") && z) {
                biometricAuth = jSONObject.getBoolean("biometricAuth");
            } else {
                biometricAuth = sqliteConfig.getBiometricAuth();
            }
            sqliteConfig.setBiometricAuth(biometricAuth);
            if (jSONObject.has("biometricTitle")) {
                biometricTitle = jSONObject.getString("biometricTitle");
            } else {
                biometricTitle = sqliteConfig.getBiometricTitle();
            }
            sqliteConfig.setBiometricTitle(biometricTitle);
            if (jSONObject.has("biometricSubTitle")) {
                biometricSubTitle = jSONObject.getString("biometricSubTitle");
            } else {
                biometricSubTitle = sqliteConfig.getBiometricSubTitle();
            }
            sqliteConfig.setBiometricSubTitle(biometricSubTitle);
        }
        return sqliteConfig;
    }
}
