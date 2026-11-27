package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import android.content.res.AssetManager;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* JADX INFO: loaded from: classes.dex */
public class UtilsFile {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsFile";

    public Boolean isFileExists(Context context, String dbName) {
        return Boolean.valueOf(context.getDatabasePath(dbName).exists());
    }

    public Boolean isPathExists(String filePath) {
        if (new File(filePath).exists()) {
            return true;
        }
        return false;
    }

    public String getDatabaseDirectoryPath(Context context) {
        return (context == null || context.getDatabasePath("x") == null) ? "" : context.getDatabasePath("x").getParent();
    }

    public String[] getListOfFiles(Context context) {
        String[] strArrDatabaseList = context.databaseList();
        ArrayList arrayList = new ArrayList();
        for (String str : strArrDatabaseList) {
            if (str.endsWith("SQLite.db")) {
                arrayList.add(str);
            }
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    public Boolean deleteDatabase(Context context, String dbName) {
        context.deleteDatabase(dbName);
        if (isFileExists(context, dbName).booleanValue()) {
            return false;
        }
        return true;
    }

    public Boolean deleteFile(Context context, String dbName) {
        return Boolean.valueOf(context.getDatabasePath(dbName).delete());
    }

    public Boolean deleteFile(String filePath, String dbName) {
        return Boolean.valueOf(new File(filePath, dbName).delete());
    }

    public Boolean deleteFile(File file) {
        return Boolean.valueOf(file.delete());
    }

    public void copyFromAssetsToDatabase(Context context, Boolean overwrite) throws Exception {
        AssetManager assets = context.getAssets();
        try {
            String absolutePath = new File(context.getFilesDir().getParentFile(), "databases").getAbsolutePath();
            File file = new File(absolutePath);
            if (!file.isDirectory() && !file.mkdir()) {
                throw new Exception("Cannot create dir" + absolutePath);
            }
            String[] list = assets.list("public/assets/databases");
            if (list.length == 0) {
                throw new Exception("Folder public/assets/databases does not exist or is empty");
            }
            for (String str : list) {
                if (isLast(str, ".db")) {
                    String strAddSQLiteSuffix = addSQLiteSuffix(str);
                    boolean zBooleanValue = isFileExists(context, strAddSQLiteSuffix).booleanValue();
                    if (!zBooleanValue || overwrite.booleanValue()) {
                        if (overwrite.booleanValue() && zBooleanValue) {
                            deleteDatabase(context, strAddSQLiteSuffix);
                        }
                        copyDatabaseFromAssets(assets, "public/assets/databases/" + str, context.getDatabasePath(strAddSQLiteSuffix).getAbsolutePath());
                    }
                }
                if (isLast(str, ".zip")) {
                    unzipCopyDatabase(getDatabaseDirectoryPath(context), assets, "public/assets/databases/" + str, overwrite);
                }
            }
        } catch (IOException e) {
            throw new Exception("in copyFromAssetsToDatabase " + e.getLocalizedMessage());
        }
    }

    public void unzipCopyDatabase(String databasePath, AssetManager asm, String zipPath, Boolean overwrite) throws IOException {
        FileInputStream fileInputStream;
        ZipInputStream zipInputStream;
        byte[] bArr = new byte[1024];
        InputStream inputStream = null;
        try {
            if (asm != null) {
                InputStream inputStreamOpen = asm.open(zipPath);
                zipInputStream = new ZipInputStream(inputStreamOpen);
                inputStream = inputStreamOpen;
                fileInputStream = null;
            } else {
                fileInputStream = new FileInputStream(new File(zipPath));
                zipInputStream = new ZipInputStream(fileInputStream);
            }
            ZipEntry nextEntry = zipInputStream.getNextEntry();
            while (nextEntry != null) {
                String name = nextEntry.getName();
                if (isLast(name, ".db")) {
                    String strAddSQLiteSuffix = addSQLiteSuffix(name);
                    String str = databasePath + File.separator + strAddSQLiteSuffix;
                    boolean zBooleanValue = isPathExists(str).booleanValue();
                    if (!zBooleanValue || overwrite.booleanValue()) {
                        if (overwrite.booleanValue() && zBooleanValue) {
                            deleteFile(databasePath, strAddSQLiteSuffix);
                        }
                        File file = new File(str);
                        System.out.println("Unzipping to " + file.getAbsolutePath());
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        while (true) {
                            int i = zipInputStream.read(bArr);
                            if (i <= 0) {
                                break;
                            } else {
                                fileOutputStream.write(bArr, 0, i);
                            }
                        }
                        fileOutputStream.close();
                    }
                    zipInputStream.closeEntry();
                    nextEntry = zipInputStream.getNextEntry();
                }
            }
            zipInputStream.closeEntry();
            zipInputStream.close();
            if (asm != null && inputStream != null) {
                inputStream.close();
            } else if (fileInputStream != null) {
                fileInputStream.close();
            }
        } catch (IOException e) {
            throw new IOException("in unzipCopyDatabase " + e.getLocalizedMessage());
        }
    }

    public String addSQLiteSuffix(String fileName) {
        return !isLast(fileName, "SQLite.db") ? fileName.substring(0, fileName.length() - 3) + "SQLite.db" : fileName;
    }

    public void copyDatabaseFromAssets(AssetManager asm, String inPath, String outPath) throws IOException {
        try {
            byte[] bArr = new byte[1024];
            InputStream inputStreamOpen = asm.open(inPath);
            FileOutputStream fileOutputStream = new FileOutputStream(outPath);
            while (true) {
                int i = inputStreamOpen.read(bArr);
                if (i > 0) {
                    fileOutputStream.write(bArr, 0, i);
                } else {
                    fileOutputStream.close();
                    fileOutputStream.flush();
                    inputStreamOpen.close();
                    return;
                }
            }
        } catch (IOException e) {
            throw new IOException("in copyDatabaseFromAssets " + e.getLocalizedMessage());
        }
    }

    public boolean isLast(String filename, String ext) {
        int length = ext.length();
        return filename.length() > length && filename.substring(filename.length() - length).equals(ext);
    }

    public Boolean renameFile(Context context, String dbName, String toDbName) {
        return Boolean.valueOf(context.getDatabasePath(dbName).renameTo(context.getDatabasePath(toDbName)));
    }

    public Boolean copyFile(Context context, String dbName, String toDbName) throws Throwable {
        File databasePath = context.getDatabasePath(dbName);
        File databasePath2 = context.getDatabasePath(toDbName);
        try {
            if (!databasePath2.exists() && !databasePath2.createNewFile()) {
                throw new Exception("Cannot create file" + dbName);
            }
            copyFileFromFile(databasePath, databasePath2);
            return true;
        } catch (Exception e) {
            Log.e(TAG, "Error: in copyFile " + e);
            return false;
        }
    }

    public Boolean copyFromNames(Context context, String fromPath, String fromName, String toPath, String toName) throws Throwable {
        File file = new File(fromPath, fromName);
        File databasePath = context.getDatabasePath(toName);
        try {
            if (!databasePath.exists() && !databasePath.createNewFile()) {
                Log.e(TAG, "Error: in toFile " + toName);
                return false;
            }
            copyFileFromFile(file, databasePath);
            return true;
        } catch (Exception e) {
            Log.e(TAG, "Error: in copyFile " + e);
            return false;
        }
    }

    public String getFileExtension(String name) {
        if (name.lastIndexOf(".") != -1 && name.lastIndexOf(".") != 0) {
            return name.substring(name.lastIndexOf(".") + 1);
        }
        return "";
    }

    public Boolean restoreDatabase(Context context, String databaseName) {
        if (isFileExists(context, "backup-" + databaseName).booleanValue()) {
            if (isFileExists(context, databaseName).booleanValue()) {
                if (!deleteFile(context, databaseName).booleanValue()) {
                    Log.e(TAG, "Error: restoreDatabase: delete file " + databaseName);
                    return false;
                }
                if (!copyFile(context, "backup-" + databaseName, databaseName).booleanValue()) {
                    Log.e(TAG, "Error: restoreDatabase: copy file " + databaseName);
                    return false;
                }
                if (!deleteFile(context, "backup-" + databaseName).booleanValue()) {
                    Log.e(TAG, "Error: restoreDatabase: delete file backup-" + databaseName);
                    return false;
                }
                return true;
            }
            Log.e(TAG, "Error: restoreDatabase: database " + databaseName + "does not exists");
            return false;
        }
        Log.e(TAG, ("Error: restoreDB: backup-" + databaseName) + " does not exist");
        return false;
    }

    public Boolean deleteBackupDB(Context context, String databaseName) {
        if (isFileExists(context, "backup-" + databaseName).booleanValue()) {
            if (!deleteFile(context, "backup-" + databaseName).booleanValue()) {
                Log.e(TAG, "Error: deleteBackupDB: delete file backup-" + databaseName);
                return false;
            }
            return true;
        }
        Log.e(TAG, ("Error: deleteBackupDB: backup-" + databaseName) + " does not exist");
        return false;
    }

    public void moveAllDBs(File fromDir, File toDir) throws Exception {
        String absolutePath = fromDir.getAbsolutePath();
        String absolutePath2 = toDir.getAbsolutePath();
        try {
            for (String str : listDatabases(fromDir)) {
                File file = new File(absolutePath2, str);
                if (isPathExists(file.getAbsolutePath()).booleanValue()) {
                    deleteFile(file);
                }
                if (!Boolean.valueOf(new File(absolutePath, str).renameTo(file)).booleanValue()) {
                    throw new Exception("moveAllDBs: move file " + str + " failed");
                }
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public List<String> listDatabases(File fileDir) throws Exception {
        ArrayList arrayList = new ArrayList();
        if (!fileDir.exists()) {
            throw new Exception("File " + fileDir.getAbsolutePath() + " does not exist");
        }
        if (!fileDir.isDirectory()) {
            throw new Exception("File " + fileDir.getAbsolutePath() + " is not a directory");
        }
        for (File file : fileDir.listFiles()) {
            if (file.isFile()) {
                String name = file.getName();
                if (getFileExtension(name).equals("db")) {
                    arrayList.add(name);
                }
            }
        }
        return arrayList;
    }

    private static void copyFileFromFile(File sourceFile, File destFile) throws Throwable {
        Throwable th;
        FileChannel channel;
        if (!destFile.getParentFile().exists() && !destFile.getParentFile().mkdirs()) {
            throw new IOException("failed in creating directory");
        }
        if (!destFile.exists() && !destFile.createNewFile()) {
            throw new IOException("failed in creating new file");
        }
        FileChannel fileChannel = null;
        try {
            FileChannel channel2 = new FileInputStream(sourceFile).getChannel();
            try {
                channel = new FileOutputStream(destFile).getChannel();
                try {
                    channel.transferFrom(channel2, 0L, channel2.size());
                    if (channel2 != null) {
                        channel2.close();
                    }
                    if (channel != null) {
                        channel.close();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileChannel = channel2;
                    if (fileChannel != null) {
                        fileChannel.close();
                    }
                    if (channel != null) {
                        channel.close();
                        throw th;
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                channel = null;
            }
        } catch (Throwable th4) {
            th = th4;
            channel = null;
        }
    }
}
