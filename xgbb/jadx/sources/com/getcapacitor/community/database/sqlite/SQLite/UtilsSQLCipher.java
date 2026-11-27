package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import net.zetetic.database.DatabaseErrorHandler;
import net.zetetic.database.sqlcipher.SQLiteDatabase;
import net.zetetic.database.sqlcipher.SQLiteDatabaseHook;
import net.zetetic.database.sqlcipher.SQLiteStatement;

/* JADX INFO: loaded from: classes.dex */
public class UtilsSQLCipher {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsSQLCipher";

    public enum State {
        DOES_NOT_EXIST,
        UNENCRYPTED,
        ENCRYPTED_SECRET,
        ENCRYPTED_GLOBAL_SECRET,
        UNKNOWN
    }

    /* JADX WARN: Code duplicated, block: B:39:0x0079  */
    public State getDatabaseState(Context ctxt, File dbPath, SharedPreferences sharedPreferences, GlobalSQLite globVar) throws Throwable {
        SQLiteDatabase sQLiteDatabaseOpenDatabase;
        SQLiteDatabase sQLiteDatabaseOpenDatabase2;
        System.loadLibrary("sqlcipher");
        if (!dbPath.exists()) {
            return State.DOES_NOT_EXIST;
        }
        SQLiteDatabase sQLiteDatabase = null;
        try {
            try {
                sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(dbPath.getAbsolutePath(), "", (SQLiteDatabase.CursorFactory) null, 1, (SQLiteDatabaseHook) null);
                try {
                    try {
                        sQLiteDatabaseOpenDatabase.getVersion();
                        State state = State.UNENCRYPTED;
                        if (sQLiteDatabaseOpenDatabase != null) {
                            sQLiteDatabaseOpenDatabase.close();
                        }
                        return state;
                    } catch (Exception unused) {
                        try {
                            try {
                                String string = sharedPreferences.getString("secret", "");
                                if (string.length() <= 0) {
                                    State state2 = State.UNKNOWN;
                                    if (sQLiteDatabaseOpenDatabase != null) {
                                        sQLiteDatabaseOpenDatabase.close();
                                    }
                                    return state2;
                                }
                                SQLiteDatabase sQLiteDatabaseOpenDatabase3 = SQLiteDatabase.openDatabase(dbPath.getAbsolutePath(), string, (SQLiteDatabase.CursorFactory) null, 1, (SQLiteDatabaseHook) null);
                                sQLiteDatabaseOpenDatabase3.getVersion();
                                State state3 = State.ENCRYPTED_SECRET;
                                if (sQLiteDatabaseOpenDatabase3 != null) {
                                    sQLiteDatabaseOpenDatabase3.close();
                                }
                                return state3;
                            } catch (Exception unused2) {
                                if (globVar.secret.length() <= 0) {
                                    State state4 = State.UNKNOWN;
                                    if (sQLiteDatabaseOpenDatabase != null) {
                                        sQLiteDatabaseOpenDatabase.close();
                                    }
                                    return state4;
                                }
                                sQLiteDatabaseOpenDatabase2 = SQLiteDatabase.openDatabase(dbPath.getAbsolutePath(), globVar.secret, (SQLiteDatabase.CursorFactory) null, 1, (SQLiteDatabaseHook) null);
                                try {
                                    sQLiteDatabaseOpenDatabase2.getVersion();
                                    State state5 = State.ENCRYPTED_GLOBAL_SECRET;
                                    if (sQLiteDatabaseOpenDatabase2 != null) {
                                        sQLiteDatabaseOpenDatabase2.close();
                                    }
                                    return state5;
                                } catch (Exception unused3) {
                                    State state6 = State.UNKNOWN;
                                    if (sQLiteDatabaseOpenDatabase2 != null) {
                                        sQLiteDatabaseOpenDatabase2.close();
                                    }
                                    return state6;
                                }
                            }
                        } catch (Exception unused4) {
                            sQLiteDatabaseOpenDatabase2 = sQLiteDatabaseOpenDatabase;
                            State state7 = State.UNKNOWN;
                            if (sQLiteDatabaseOpenDatabase2 != null) {
                                sQLiteDatabaseOpenDatabase2.close();
                            }
                            return state7;
                        }
                    }
                } catch (Throwable th) {
                    th = th;
                    sQLiteDatabase = sQLiteDatabaseOpenDatabase;
                    if (sQLiteDatabase != null) {
                        sQLiteDatabase.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception unused5) {
            sQLiteDatabaseOpenDatabase = null;
        }
    }

    public void encrypt(Context ctxt, File originalFile, byte[] passphrase) throws IOException {
        System.loadLibrary("sqlcipher");
        if (originalFile.exists()) {
            File fileCreateTempFile = File.createTempFile("sqlcipherutils", "tmp", ctxt.getCacheDir());
            SQLiteDatabase sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(originalFile.getAbsolutePath(), "", (SQLiteDatabase.CursorFactory) null, 0, (SQLiteDatabaseHook) null);
            int version = sQLiteDatabaseOpenDatabase.getVersion();
            sQLiteDatabaseOpenDatabase.close();
            SQLiteDatabase sQLiteDatabaseOpenDatabase2 = SQLiteDatabase.openDatabase(fileCreateTempFile.getAbsolutePath(), passphrase, (SQLiteDatabase.CursorFactory) null, 0, (DatabaseErrorHandler) null, (SQLiteDatabaseHook) null);
            SQLiteStatement sQLiteStatementCompileStatement = sQLiteDatabaseOpenDatabase2.compileStatement("ATTACH DATABASE ? AS plaintext KEY '';");
            sQLiteStatementCompileStatement.bindString(1, originalFile.getAbsolutePath());
            sQLiteStatementCompileStatement.execute();
            sQLiteDatabaseOpenDatabase2.rawExecSQL("SELECT sqlcipher_export('main', 'plaintext');", new Object[0]);
            sQLiteDatabaseOpenDatabase2.rawExecSQL("DETACH DATABASE plaintext;", new Object[0]);
            sQLiteDatabaseOpenDatabase2.setVersion(version);
            sQLiteStatementCompileStatement.close();
            sQLiteDatabaseOpenDatabase2.close();
            if (!originalFile.delete()) {
                throw new FileNotFoundException(originalFile.getAbsolutePath() + " not deleted");
            }
            if (!fileCreateTempFile.renameTo(originalFile)) {
                throw new FileNotFoundException(originalFile.getAbsolutePath() + " not renamed");
            }
            return;
        }
        throw new FileNotFoundException(originalFile.getAbsolutePath() + " not found");
    }

    public void decrypt(Context ctxt, File originalFile, byte[] passphrase) throws IOException {
        System.loadLibrary("sqlcipher");
        if (originalFile.exists()) {
            File fileCreateTempFile = File.createTempFile("sqlcipherutils", "tmp", ctxt.getCacheDir());
            SQLiteDatabase sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(fileCreateTempFile.getAbsolutePath(), "", (SQLiteDatabase.CursorFactory) null, 0, (SQLiteDatabaseHook) null);
            SQLiteDatabase sQLiteDatabaseOpenDatabase2 = SQLiteDatabase.openDatabase(originalFile.getAbsolutePath(), new String(passphrase), (SQLiteDatabase.CursorFactory) null, 0, (SQLiteDatabaseHook) null);
            sQLiteDatabaseOpenDatabase.setVersion(sQLiteDatabaseOpenDatabase2.getVersion());
            sQLiteDatabaseOpenDatabase.close();
            SQLiteStatement sQLiteStatementCompileStatement = sQLiteDatabaseOpenDatabase2.compileStatement("ATTACH DATABASE ? AS plaintext KEY '';");
            sQLiteStatementCompileStatement.bindString(1, fileCreateTempFile.getAbsolutePath());
            sQLiteStatementCompileStatement.execute();
            sQLiteDatabaseOpenDatabase2.rawExecSQL("SELECT sqlcipher_export('plaintext');", new Object[0]);
            sQLiteDatabaseOpenDatabase2.rawExecSQL("DETACH DATABASE plaintext;", new Object[0]);
            sQLiteStatementCompileStatement.close();
            sQLiteDatabaseOpenDatabase2.close();
            if (!originalFile.delete()) {
                throw new FileNotFoundException(originalFile.getAbsolutePath() + " not deleted");
            }
            if (!fileCreateTempFile.renameTo(originalFile)) {
                throw new FileNotFoundException(originalFile.getAbsolutePath() + " not renamed");
            }
            return;
        }
        throw new FileNotFoundException(originalFile.getAbsolutePath() + " not found");
    }

    public void changePassword(Context ctxt, File file, String password, String nwpassword) throws Exception {
        System.loadLibrary("sqlcipher");
        if (file.exists()) {
            SQLiteDatabase sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(file.getAbsolutePath(), password, (SQLiteDatabase.CursorFactory) null, 0, (SQLiteDatabaseHook) null);
            if (!sQLiteDatabaseOpenDatabase.isOpen()) {
                throw new Exception("database " + file.getAbsolutePath() + " open failed");
            }
            sQLiteDatabaseOpenDatabase.changePassword(nwpassword);
            sQLiteDatabaseOpenDatabase.close();
            return;
        }
        throw new FileNotFoundException(file.getAbsolutePath() + " not found");
    }
}
