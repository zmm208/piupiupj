package com.getcapacitor.community.database.sqlite.SQLite;

import android.util.Log;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import net.zetetic.database.sqlcipher.SQLiteCursor;

/* JADX INFO: loaded from: classes.dex */
public class UtilsDrop {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsDrop";

    public List<String> getTablesNames(Database db) throws Exception {
        ArrayList arrayList = new ArrayList();
        SQLiteCursor sQLiteCursor = null;
        try {
            try {
                SQLiteCursor sQLiteCursor2 = (SQLiteCursor) db.getDb().query(("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sync_table' AND name NOT LIKE '_temp_%' AND name NOT LIKE 'sqlite_%' AND name NOT LIKE 'android_%' ") + "ORDER BY rootpage DESC;");
                try {
                    sQLiteCursor2.moveToFirst();
                    while (!sQLiteCursor2.isAfterLast()) {
                        arrayList.add(sQLiteCursor2.getString(0));
                        sQLiteCursor2.moveToNext();
                    }
                    sQLiteCursor2.close();
                    return arrayList;
                } catch (Exception e) {
                    e = e;
                    throw new Exception("GetTablesNames failed " + e);
                } catch (Throwable unused) {
                    sQLiteCursor = sQLiteCursor2;
                    sQLiteCursor.close();
                    return arrayList;
                }
            } catch (Throwable unused2) {
            }
        } catch (Exception e2) {
            e = e2;
        }
    }

    public List<String> getViewNames(Database db) throws Exception {
        ArrayList arrayList = new ArrayList();
        SQLiteCursor sQLiteCursor = null;
        try {
            try {
                SQLiteCursor sQLiteCursor2 = (SQLiteCursor) db.getDb().query("SELECT name FROM sqlite_master WHERE type='view' AND name NOT LIKE 'sqlite_%' ORDER BY rootpage DESC;");
                try {
                    sQLiteCursor2.moveToFirst();
                    while (!sQLiteCursor2.isAfterLast()) {
                        arrayList.add(sQLiteCursor2.getString(0));
                        sQLiteCursor2.moveToNext();
                    }
                    sQLiteCursor2.close();
                    return arrayList;
                } catch (Exception e) {
                    e = e;
                    sQLiteCursor = sQLiteCursor2;
                    throw new Exception("GetTablesNames failed " + e);
                } catch (Throwable unused) {
                    sQLiteCursor = sQLiteCursor2;
                    sQLiteCursor.close();
                    return arrayList;
                }
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Throwable unused2) {
        }
    }

    public void dropTables(Database db) throws Exception {
        try {
            Iterator<String> it = getTablesNames(db).iterator();
            while (it.hasNext()) {
                db.getDb().execSQL("DROP TABLE IF EXISTS " + it.next() + " ;");
            }
        } catch (Exception e) {
            String str = "DropAllTables failed: " + e;
            Log.d(TAG, str);
            throw new Exception(str);
        }
    }

    public void dropViews(Database db) throws Exception {
        try {
            Iterator<String> it = getViewNames(db).iterator();
            while (it.hasNext()) {
                db.getDb().execSQL("DROP VIEW IF EXISTS " + it.next() + " ;");
            }
        } catch (Exception e) {
            String str = "DropAllViews failed: " + e;
            Log.d(TAG, str);
            throw new Exception(str);
        }
    }

    public List<String> getIndexesNames(Database db) {
        ArrayList arrayList = new ArrayList();
        SQLiteCursor sQLiteCursor = (SQLiteCursor) db.getDb().query("SELECT name FROM sqlite_master WHERE type='index' AND name NOT LIKE 'sqlite_%';");
        sQLiteCursor.moveToFirst();
        while (!sQLiteCursor.isAfterLast()) {
            arrayList.add(sQLiteCursor.getString(0));
            sQLiteCursor.moveToNext();
        }
        sQLiteCursor.close();
        return arrayList;
    }

    public void dropIndexes(Database db) throws Exception {
        try {
            Iterator<String> it = getIndexesNames(db).iterator();
            while (it.hasNext()) {
                db.getDb().execSQL("DROP INDEX IF EXISTS " + it.next());
            }
        } catch (Exception e) {
            String str = "DropAllIndexes failed: " + e;
            Log.d(TAG, str);
            throw new Exception(str);
        }
    }

    public List<String> getTriggersNames(Database db) {
        ArrayList arrayList = new ArrayList();
        SQLiteCursor sQLiteCursor = (SQLiteCursor) db.getDb().query("SELECT name FROM sqlite_master WHERE type='trigger';");
        sQLiteCursor.moveToFirst();
        while (!sQLiteCursor.isAfterLast()) {
            arrayList.add(sQLiteCursor.getString(0));
            sQLiteCursor.moveToNext();
        }
        sQLiteCursor.close();
        return arrayList;
    }

    public void dropTriggers(Database db) throws Exception {
        try {
            Iterator<String> it = getTriggersNames(db).iterator();
            while (it.hasNext()) {
                db.getDb().execSQL("DROP TRIGGER IF EXISTS " + it.next());
            }
        } catch (Exception e) {
            String str = "DropAllTriggers failed: " + e;
            Log.d(TAG, str);
            throw new Exception(str);
        }
    }

    public void dropAll(Database db) throws Exception {
        Boolean bool = false;
        try {
            try {
                db.beginTransaction();
                dropTables(db);
                dropIndexes(db);
                dropTriggers(db);
                dropViews(db);
                db.commitTransaction();
                Boolean bool2 = true;
                if (bool2.booleanValue()) {
                    db.rollbackTransaction();
                }
                try {
                    db.getDb().execSQL("VACUUM;");
                } catch (Exception e) {
                    String str = "DropAll VACUUM failed: " + e;
                    Log.d(TAG, str);
                    throw new Exception(str);
                }
            } catch (Exception e2) {
                String str2 = "DropAll failed: " + e2;
                Log.d(TAG, str2);
                throw new Exception(str2);
            }
        } catch (Throwable th) {
            if (bool.booleanValue()) {
                db.rollbackTransaction();
            }
            try {
                db.getDb().execSQL("VACUUM;");
                throw th;
            } catch (Exception e3) {
                String str3 = "DropAll VACUUM failed: " + e3;
                Log.d(TAG, str3);
                throw new Exception(str3);
            }
        }
    }

    public void dropTempTables(Database db, Dictionary<String, List<String>> alterTables) throws Exception {
        Integer num = -1;
        num.intValue();
        try {
            List<String> dictStringKeys = getDictStringKeys(alterTables);
            ArrayList arrayList = new ArrayList();
            Iterator<String> it = dictStringKeys.iterator();
            while (it.hasNext()) {
                arrayList.add("DROP TABLE IF EXISTS _temp_" + it.next() + ";");
            }
            if (arrayList.size() > 0) {
                Integer num2 = 0;
                if (db.execute((String[]) arrayList.toArray(new String[0]), new Boolean[0]).getInteger("changes").intValue() >= num2.intValue()) {
                } else {
                    throw new Exception("DropTempTables failed");
                }
            }
        } catch (Exception e) {
            String str = "DropTempTables failed: " + e;
            Log.d(TAG, str);
            throw new Exception(str);
        }
    }

    public List<String> getDictStringKeys(Dictionary<String, List<String>> dict) {
        ArrayList arrayList = new ArrayList();
        Enumeration<String> enumerationKeys = dict.keys();
        while (enumerationKeys.hasMoreElements()) {
            arrayList.add(enumerationKeys.nextElement());
        }
        return arrayList;
    }
}
