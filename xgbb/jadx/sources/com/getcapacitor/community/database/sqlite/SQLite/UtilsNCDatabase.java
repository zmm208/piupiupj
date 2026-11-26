package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class UtilsNCDatabase {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsNCDatabase";
    private UtilsMigrate uMigrate = new UtilsMigrate();

    public String getNCDatabasePath(Context context, String folderPath, String database) throws Exception {
        String absolutePath = new File(context.getFilesDir().getParentFile(), "databases").getAbsolutePath();
        File file = new File(absolutePath);
        if (!file.isDirectory() && !file.mkdir()) {
            throw new Exception("Cannot create dir" + absolutePath);
        }
        String folder = this.uMigrate.getFolder(context, folderPath);
        File file2 = new File(folder);
        if (!file2.exists()) {
            throw new Exception("Folder " + file2 + " does not exist");
        }
        return folder.concat("/").concat(database);
    }
}
