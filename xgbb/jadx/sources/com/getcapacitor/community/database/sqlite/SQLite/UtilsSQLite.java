package com.getcapacitor.community.database.sqlite.SQLite;

import androidx.sqlite.p001db.SupportSQLiteDatabase;
import com.getcapacitor.JSArray;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import net.zetetic.database.sqlcipher.SQLiteCursor;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class UtilsSQLite {
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsSQLite";

    public int dbChanges(SupportSQLiteDatabase db) {
        Boolean.valueOf(true);
        Integer num = -1;
        int iIntValue = num.intValue();
        SQLiteCursor sQLiteCursor = (SQLiteCursor) db.query("SELECT total_changes()", (Object[]) null);
        if (sQLiteCursor != null && sQLiteCursor.moveToFirst()) {
            iIntValue = Integer.parseInt(sQLiteCursor.getString(0));
        }
        sQLiteCursor.close();
        return iIntValue;
    }

    public long dbLastId(SupportSQLiteDatabase db) {
        Boolean.valueOf(true);
        SQLiteCursor sQLiteCursor = (SQLiteCursor) db.query("SELECT last_insert_rowid()", (Object[]) null);
        long j = sQLiteCursor.moveToFirst() ? Long.parseLong(sQLiteCursor.getString(0)) : -1L;
        sQLiteCursor.close();
        return j;
    }

    public String[] getStatementsArray(String statements) {
        String[] strArrDealWithTriggers = dealWithTriggers(statements.replace("end;", "END;").split(";\n"));
        for (int i = 0; i < strArrDealWithTriggers.length; i++) {
            String[] strArrSplit = strArrDealWithTriggers[i].split("\n");
            StringBuilder sb = new StringBuilder();
            for (String str : strArrSplit) {
                String strTrim = str.trim();
                int iIndexOf = strTrim.indexOf("--");
                if (iIndexOf > -1) {
                    strTrim = strTrim.substring(0, iIndexOf);
                }
                if (strTrim.length() > 0) {
                    if (sb.length() > 0) {
                        sb.append(" ");
                    }
                    sb.append(strTrim);
                }
            }
            strArrDealWithTriggers[i] = sb.toString();
        }
        return strArrDealWithTriggers[strArrDealWithTriggers.length + (-1)].trim().length() == 0 ? (String[]) Arrays.copyOf(strArrDealWithTriggers, strArrDealWithTriggers.length - 1) : strArrDealWithTriggers;
    }

    private String[] dealWithTriggers(String[] sqlCmdArray) {
        Object[] array = concatRemoveEnd(trimArray(Arrays.asList(sqlCmdArray))).toArray();
        return (String[]) Arrays.copyOf(array, array.length, String[].class);
    }

    private List<String> concatRemoveEnd(List<String> listArray) {
        ArrayList arrayList = new ArrayList(listArray);
        if (!arrayList.contains("END")) {
            return arrayList;
        }
        int iIndexOf = arrayList.indexOf("END");
        int i = iIndexOf - 1;
        arrayList.set(i, arrayList.get(i) + "; END");
        arrayList.remove(iIndexOf);
        return concatRemoveEnd(arrayList);
    }

    private List<String> trimArray(List<String> listArray) {
        ArrayList arrayList = new ArrayList();
        Iterator<String> it = listArray.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().trim());
        }
        return arrayList;
    }

    public ArrayList<Object> objectJSArrayToArrayList(JSArray jsArray) throws JSONException {
        ArrayList<Object> arrayList = new ArrayList<>();
        for (int i = 0; i < jsArray.length(); i++) {
            if (jsArray.isNull(i)) {
                arrayList.add(null);
            } else {
                Object obj = jsArray.get(i);
                if (obj.getClass() == JSONObject.class) {
                    JSONObject jSONObject = (JSONObject) obj;
                    if (jSONObject.getString("type").equals("Buffer")) {
                        arrayList.add(JSONArrayToByteArray(jSONObject.getJSONArray("data")));
                    } else {
                        throw new JSONException("Object not implemented");
                    }
                } else {
                    arrayList.add(obj);
                }
            }
        }
        return arrayList;
    }

    public ArrayList<String> stringJSArrayToArrayList(JSArray jsArray) throws JSONException {
        ArrayList<String> arrayList = new ArrayList<>();
        for (int i = 0; i < jsArray.length(); i++) {
            if (jsArray.get(i) instanceof String) {
                arrayList.add(jsArray.getString(i));
            } else {
                return new ArrayList<>();
            }
        }
        return arrayList;
    }

    public byte[] JSONArrayToByteArray(JSONArray arr) throws JSONException {
        byte[] bArr = new byte[arr.length()];
        for (int i = 0; i < arr.length(); i++) {
            bArr[i] = (byte) (((Integer) arr.get(i)).intValue() & 255);
        }
        return bArr;
    }

    public Boolean parse(Object mVar) {
        return Boolean.valueOf(mVar instanceof JSONArray);
    }

    public int ByteToInt(byte BVal) {
        int i = Integer.parseInt(((int) BVal) + "");
        return i < 0 ? i + 256 : i;
    }

    public JSArray ByteArrayToJSArray(byte[] BArr) {
        JSArray jSArray = new JSArray();
        for (byte b : BArr) {
            jSArray.put(ByteToInt(b));
        }
        return jSArray;
    }
}
