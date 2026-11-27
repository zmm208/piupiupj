package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import com.capacitorjs.plugins.localnotifications.LocalNotificationManager;
import java.io.File;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class UtilsMigrate {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsMigrate";
    private UtilsFile uFile = new UtilsFile();

    public String[] getMigratableList(Context context, String folderPath) throws Exception {
        String absolutePath = new File(context.getFilesDir().getParentFile(), "databases").getAbsolutePath();
        File file = new File(absolutePath);
        if (!file.isDirectory() && !file.mkdir()) {
            throw new Exception("Cannot create dir" + absolutePath);
        }
        File file2 = new File(getFolder(context, folderPath));
        if (!file2.exists()) {
            throw new Exception("Folder " + file2 + " does not exist");
        }
        return file2.list();
    }

    /* JADX WARN: Code duplicated, block: B:33:0x00b7  */
    /* JADX WARN: Code duplicated, block: B:41:0x00ed  */
    public void addSQLiteSuffix(Context context, String folderPath, ArrayList<String> dbList) throws Exception {
        Context context2;
        String strReplace;
        String absolutePath = new File(context.getFilesDir().getParentFile(), "databases").getAbsolutePath();
        File file = new File(absolutePath);
        if (!file.isDirectory() && !file.mkdir()) {
            throw new Exception("Cannot create dir" + absolutePath);
        }
        String folder = getFolder(context, folderPath);
        File file2 = new File(folder);
        if (!file2.exists()) {
            throw new Exception("Folder " + file2 + " does not exist");
        }
        String[] list = file2.list();
        if (!absolutePath.equals(folder) && list.length == 0) {
            throw new Exception("Folder " + file2 + " no database files");
        }
        int length = list.length;
        int i = 0;
        while (i < length) {
            String str = list[i];
            if (str.contains("SQLite.db")) {
                context2 = context;
            } else {
                if (dbList.size() > 0) {
                    if (dbList.contains(str)) {
                        if (this.uFile.getFileExtension(str).equals("db")) {
                            strReplace = str.replace(".db", "SQLite.db");
                        } else {
                            strReplace = str.concat("SQLite.db");
                        }
                    } else {
                        strReplace = "";
                    }
                } else if (this.uFile.getFileExtension(str).equals("db")) {
                    strReplace = str.replace(".db", "SQLite.db");
                } else {
                    strReplace = "";
                }
                String str2 = strReplace;
                if (str2.length() > 0) {
                    context2 = context;
                    if (!this.uFile.copyFromNames(context2, folder, str, absolutePath, str2).booleanValue()) {
                        throw new Exception("Failed in copy " + str + " to " + str);
                    }
                } else {
                    context2 = context;
                }
            }
            i++;
            context = context2;
        }
    }

    public String getFolder(Context context, String folderPath) throws Exception {
        String absolutePath = context.getFilesDir().getAbsolutePath();
        String absolutePath2 = new File(context.getFilesDir().getParentFile(), "databases").getAbsolutePath();
        if (folderPath.equals(LocalNotificationManager.DEFAULT_NOTIFICATION_CHANNEL_ID)) {
            return absolutePath2;
        }
        if (folderPath.equalsIgnoreCase("cache")) {
            return context.getCacheDir().getAbsolutePath();
        }
        String[] strArrSplit = folderPath.split("/", 2);
        if (strArrSplit.length != 2) {
            return absolutePath;
        }
        if (strArrSplit[0].equals("files")) {
            return absolutePath.concat("/").concat(strArrSplit[1]);
        }
        if (strArrSplit[0].equals("databases")) {
            return absolutePath2.concat("/").concat(strArrSplit[1]);
        }
        throw new Exception("Folder " + folderPath + " not allowed");
    }

    public void deleteOldDatabases(Context context, String folderPath, ArrayList<String> dbList) throws Exception {
        String folder = getFolder(context, folderPath);
        File file = new File(folder);
        if (!file.exists()) {
            throw new Exception("Folder " + file + " does not exist");
        }
        String[] list = file.list();
        int length = list.length;
        for (int i = 0; i < length; i++) {
            String str = list[i];
            if (!str.contains("SQLite.db")) {
                str = dbList.size() > 0 ? "" : "";
                if (str.length() > 0 && !this.uFile.deleteFile(folder, str).booleanValue()) {
                    throw new Exception("Failed in delete " + str);
                }
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:34:0x00b9  */
    public void moveDatabasesAndAddSuffix(Context context, String folderPath, ArrayList<String> dbList) throws Exception {
        String strReplace;
        String absolutePath = new File(context.getFilesDir().getParentFile(), "databases").getAbsolutePath();
        File file = new File(absolutePath);
        if (!file.isDirectory() && !file.mkdir()) {
            throw new Exception("Cannot create dir" + absolutePath);
        }
        String folder = getFolder(context, folderPath);
        File file2 = new File(folder);
        if (!file2.exists()) {
            throw new Exception("Folder " + file2 + " does not exist");
        }
        String[] list = file2.list();
        if (!absolutePath.equals(folder) && list.length == 0) {
            throw new Exception("Folder " + file2 + " no database files");
        }
        for (String str : list) {
            if (!str.contains("SQLite.db")) {
                if (dbList.size() > 0) {
                    if (dbList.contains(str)) {
                        if (this.uFile.getFileExtension(str).equals("db")) {
                            strReplace = str.replace(".db", "SQLite.db");
                        } else {
                            strReplace = str.concat("SQLite.db");
                        }
                    } else {
                        strReplace = "";
                    }
                } else if (this.uFile.getFileExtension(str).equals("db")) {
                    strReplace = str.replace(".db", "SQLite.db");
                } else {
                    strReplace = "";
                }
                if (strReplace.length() > 0 && !new File(folder, str).renameTo(new File(absolutePath, strReplace))) {
                    throw new Exception("Failed in move " + str + " to " + str);
                }
            }
        }
    }
}
