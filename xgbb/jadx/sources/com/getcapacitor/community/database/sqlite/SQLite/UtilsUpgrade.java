package com.getcapacitor.community.database.sqlite.SQLite;

import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Dictionary;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class UtilsUpgrade {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsUpgrade";

    public void onUpgrade(Database db, Dictionary<Integer, JSONObject> upgDict, Integer curVersion, Integer targetVersion) throws Exception {
        Log.i(TAG, "UtilsUpgrade.onUpgrade: from " + curVersion + " to " + targetVersion);
        ArrayList<Integer> list = Collections.list(upgDict.keys());
        Collections.sort(list);
        for (Integer num : list) {
            if (num.intValue() > curVersion.intValue() && num.intValue() <= targetVersion.intValue()) {
                Log.i(TAG, "- UtilsUpgrade.onUpgrade toVersion: " + num);
                JSONObject jSONObject = upgDict.get(num);
                JSONArray jSONArray = jSONObject.has("statements") ? jSONObject.getJSONArray("statements") : new JSONArray();
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < jSONArray.length(); i++) {
                    arrayList.add(jSONArray.getString(i));
                }
                if (arrayList.size() == 0) {
                    throw new Exception("Error: onUpgrade statement not given");
                }
                try {
                    executeStatementsProcess(db, (String[]) arrayList.toArray(new String[0]));
                    db.getDb().setVersion(num.intValue());
                } catch (Exception e) {
                    throw new Exception("Error: onUpgrade executeStatementProcess failed " + e);
                }
            }
        }
    }

    private void executeStatementsProcess(Database db, String[] statements) throws Exception {
        db.beginTransaction();
        try {
            try {
                db.execute(statements, false);
                db.commitTransaction();
                db.rollbackTransaction();
            } catch (Exception e) {
                throw new Exception("Error: executeStatementsProcess  failed " + e);
            }
        } catch (Throwable th) {
            db.rollbackTransaction();
            throw th;
        }
    }
}
