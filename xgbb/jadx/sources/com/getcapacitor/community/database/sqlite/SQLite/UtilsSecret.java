package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class UtilsSecret {
    private static final String TAG = UtilsFile.class.getName();
    private static SharedPreferences sharedPreferences;
    private Context context;
    private UtilsFile uFile = new UtilsFile();
    private GlobalSQLite globVar = new GlobalSQLite();
    private UtilsSQLCipher uCipher = new UtilsSQLCipher();

    public UtilsSecret(Context context, SharedPreferences sharedPreferences2) {
        this.context = context;
        sharedPreferences = sharedPreferences2;
    }

    public void setEncryptionSecret(String passphrase) throws Exception {
        try {
            if (TextUtils.isEmpty(passphrase)) {
                throw new Exception("passphrase must not be empty");
            }
            String passphrase2 = getPassphrase();
            if (passphrase2 != null && passphrase2.length() > 0) {
                throw new Exception("a passphrase has already been set ");
            }
            setPassphrase(passphrase);
            String[] listOfFiles = this.uFile.getListOfFiles(this.context);
            if (listOfFiles.length > 0) {
                for (String str : listOfFiles) {
                    File databasePath = this.context.getDatabasePath(str);
                    UtilsSQLCipher.State databaseState = this.uCipher.getDatabaseState(this.context, databasePath, sharedPreferences, this.globVar);
                    if (databaseState == UtilsSQLCipher.State.ENCRYPTED_GLOBAL_SECRET) {
                        this.uCipher.changePassword(this.context, databasePath, this.globVar.secret, passphrase);
                    } else if (databaseState == UtilsSQLCipher.State.DOES_NOT_EXIST || databaseState == UtilsSQLCipher.State.UNKNOWN) {
                        throw new Exception("State for: " + str + " not correct");
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void changeEncryptionSecret(String passphrase, String oldPassphrase) throws Exception {
        try {
            if (TextUtils.isEmpty(passphrase) || TextUtils.isEmpty(oldPassphrase)) {
                throw new Exception("Passphrase and/or oldpassphrase must not be empty");
            }
            String passphrase2 = getPassphrase();
            if (passphrase2 == null || passphrase2.length() == 0) {
                throw new Exception("Encryption secret has not been set");
            }
            if (!passphrase2.equals(oldPassphrase)) {
                throw new Exception("Oldpassphrase is wrong secret");
            }
            String[] listOfFiles = this.uFile.getListOfFiles(this.context);
            if (listOfFiles.length > 0) {
                for (String str : listOfFiles) {
                    File databasePath = this.context.getDatabasePath(str);
                    UtilsSQLCipher.State databaseState = this.uCipher.getDatabaseState(this.context, databasePath, sharedPreferences, this.globVar);
                    if (databaseState == UtilsSQLCipher.State.ENCRYPTED_SECRET) {
                        this.uCipher.changePassword(this.context, databasePath, oldPassphrase, passphrase);
                    } else if (databaseState == UtilsSQLCipher.State.DOES_NOT_EXIST || databaseState == UtilsSQLCipher.State.ENCRYPTED_GLOBAL_SECRET || databaseState == UtilsSQLCipher.State.UNKNOWN) {
                        throw new Exception("State for: " + str + " not correct");
                    }
                }
            }
            setPassphrase(passphrase);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void clearEncryptionSecret() throws Exception {
        try {
            String passphrase = getPassphrase();
            if (passphrase == null || passphrase.length() <= 0) {
                return;
            }
            clearPassphrase();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public Boolean checkEncryptionSecret(String passphrase) throws Exception {
        try {
            if (TextUtils.isEmpty(passphrase)) {
                throw new Exception("passphrase must not be empty");
            }
            String passphrase2 = getPassphrase();
            if (passphrase2.isEmpty()) {
                throw new Exception("no passphrase stored  in sharedPreferences");
            }
            if (!passphrase2.equals(passphrase)) {
                return false;
            }
            return true;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public void setPassphrase(String passphrase) {
        sharedPreferences.edit().putString("secret", passphrase).apply();
    }

    public static String getPassphrase() {
        return sharedPreferences.getString("secret", "");
    }

    public void clearPassphrase() {
        sharedPreferences.edit().remove("secret").commit();
    }

    public static Boolean isPassphrase() {
        if (!getPassphrase().isEmpty()) {
            return true;
        }
        return false;
    }
}
