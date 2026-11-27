package com.getcapacitor.community.database.sqlite.SQLite;

import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
public class UtilsDelete {
    private final UtilsSQLStatement _statUtil = new UtilsSQLStatement();

    public static class ReferenceResult {
        List<String> retRefs;
        String tableWithRefs;
    }

    public static class ForeignKeyInfo {
        String action;
        List<String> forKeys;
        List<String> refKeys;
        String tableName;

        public ForeignKeyInfo() {
            this.tableName = "";
            this.forKeys = new ArrayList();
            this.refKeys = new ArrayList();
            this.action = "NO ACTION";
        }

        public ForeignKeyInfo(List<String> forKeys, String tableName, List<String> refKeys, String action) {
            this.tableName = tableName;
            this.forKeys = forKeys;
            this.refKeys = refKeys;
            this.action = action;
        }

        public String getTableName() {
            return this.tableName;
        }

        public String getAction() {
            return this.action;
        }

        public List<String> getForKeys() {
            return this.forKeys;
        }

        public List<String> getRefKeys() {
            return this.refKeys;
        }
    }

    public static class UpdateResults {
        private String setStmt;
        private String updWhereStmt;

        public UpdateResults() {
            this.setStmt = "";
            this.updWhereStmt = "";
        }

        public UpdateResults(String setStmt, String updWhereStmt) {
            this.setStmt = setStmt;
            this.updWhereStmt = updWhereStmt;
        }

        public String getSetStmt() {
            return this.setStmt;
        }

        public String getUpdWhereStmt() {
            return this.updWhereStmt;
        }
    }

    /* JADX WARN: Code duplicated, block: B:41:0x00cd  */
    public static boolean findReferencesAndUpdate(Database mDB, String tableName, String whereStmt, String[] initColNames, ArrayList<Object> values) throws Exception {
        try {
            ReferenceResult references = getReferences(mDB, tableName);
            List<String> list = references.retRefs;
            String str = references.tableWithRefs;
            if (list.size() > 0 && !tableName.equals(str)) {
                Iterator<String> it = list.iterator();
                while (it.hasNext()) {
                    ForeignKeyInfo foreignKeyInfoExtractForeignKeyInfo = UtilsSQLStatement.extractForeignKeyInfo(it.next());
                    String str2 = foreignKeyInfoExtractForeignKeyInfo.tableName;
                    if (!str2.isEmpty() && str2.equals(tableName)) {
                        List<String> list2 = foreignKeyInfoExtractForeignKeyInfo.forKeys;
                        List<String> list3 = foreignKeyInfoExtractForeignKeyInfo.refKeys;
                        if (list3.size() != list2.size()) {
                            throw new Error("findReferencesAndUpdate: mismatch length");
                        }
                        String str3 = foreignKeyInfoExtractForeignKeyInfo.action;
                        if (!str3.equals("NO_ACTION")) {
                            UpdateResults updateResults = new UpdateResults();
                            byte b = 0;
                            if (!checkValuesMatch((String[]) list2.toArray(new String[0]), initColNames)) {
                                Map<String, Object> mapSearchForRelatedItems = searchForRelatedItems(mDB, str, tableName, whereStmt, (String[]) list2.toArray(new String[0]), (String[]) list3.toArray(new String[0]), values);
                                if (((List) mapSearchForRelatedItems.get("relatedItems")).size() != 0 || ((String) mapSearchForRelatedItems.get("key")).length() != 0) {
                                    if (!str.equals(tableName)) {
                                        int iHashCode = str3.hashCode();
                                        if (iHashCode != 446081724) {
                                            if (iHashCode == 1272812180 && str3.equals("CASCADE")) {
                                                b = 1;
                                            } else {
                                                b = -1;
                                            }
                                        } else if (!str3.equals("RESTRICT")) {
                                            b = -1;
                                        }
                                        if (b == 0) {
                                            updateResults = upDateWhereForRestrict(mapSearchForRelatedItems);
                                        } else if (b == 1) {
                                            updateResults = upDateWhereForCascade(mapSearchForRelatedItems);
                                        } else {
                                            updateResults = upDateWhereForDefault(list2, mapSearchForRelatedItems);
                                        }
                                    }
                                    if (!updateResults.getSetStmt().isEmpty() && !updateResults.getUpdWhereStmt().isEmpty()) {
                                        executeUpdateForDelete(mDB, str, updateResults.getUpdWhereStmt(), updateResults.getSetStmt(), list2, values);
                                    }
                                }
                            } else {
                                throw new Error("Not implemented. Please transfer your example to the maintainer");
                            }
                        }
                    }
                }
            }
            return true;
        } catch (Exception e) {
            throw new Exception(e.getMessage() != null ? e.getMessage() : e.toString());
        }
    }

    public static ReferenceResult getReferences(Database mDB, String tableName) throws Exception {
        try {
            JSArray jSArraySelectSQL = mDB.selectSQL("SELECT sql FROM sqlite_master WHERE sql LIKE('%FOREIGN KEY%') AND sql LIKE('%REFERENCES%') AND sql LIKE('%" + tableName + "%') AND sql LIKE('%ON DELETE%');", new ArrayList<>());
            ReferenceResult referenceResult = new ReferenceResult();
            List<String> arrayList = new ArrayList<>();
            String str = "";
            if (jSArraySelectSQL.length() > 0) {
                Map<String, Object> refs = getRefs(jSArraySelectSQL.getJSONObject(0).getString("sql"));
                arrayList = (List) refs.get("foreignKeys");
                str = (String) refs.get("tableName");
            }
            referenceResult.tableWithRefs = str;
            referenceResult.retRefs = arrayList;
            return referenceResult;
        } catch (Exception e) {
            throw new Exception("getReferences: " + (e.getMessage() != null ? e.getMessage() : e.toString()));
        }
    }

    public static Map<String, Object> getRefs(String sqlStatement) throws Exception {
        String strGroup;
        HashMap map = new HashMap();
        ArrayList arrayList = new ArrayList();
        String strFlattenMultilineString = UtilsSQLStatement.flattenMultilineString(sqlStatement);
        try {
            Matcher matcher = Pattern.compile("CREATE\\s+TABLE\\s+(\\w+)\\s+\\(").matcher(strFlattenMultilineString);
            if (!matcher.find()) {
                strGroup = "";
            } else {
                strGroup = matcher.group(1);
            }
            Matcher matcher2 = Pattern.compile("FOREIGN\\s+KEY\\s+\\([^)]+\\)\\s+REFERENCES\\s+(\\w+)\\s*\\([^)]+\\)\\s+ON\\s+DELETE\\s+(CASCADE|RESTRICT|SET\\s+DEFAULT|SET\\s+NULL|NO\\s+ACTION)").matcher(strFlattenMultilineString);
            while (matcher2.find()) {
                arrayList.add(matcher2.group(0));
            }
            map.put("tableName", strGroup);
            map.put("foreignKeys", arrayList);
            return map;
        } catch (Exception e) {
            throw new Exception("getRefs: Error creating regular expression: " + e.toString());
        }
    }

    public static boolean checkValuesMatch(String[] array1, String[] array2) {
        for (String str : array1) {
            for (String str2 : array2) {
                if (str.equals(str2)) {
                }
            }
            return false;
        }
        return true;
    }

    public static Map<String, Object> searchForRelatedItems(Database mDB, String updTableName, String tableName, String whStmt, String[] withRefsNames, String[] colNames, ArrayList<Object> values) throws Exception {
        String next;
        ArrayList arrayList = new ArrayList();
        int length = withRefsNames.length;
        String[] strArr = new String[length];
        String[] strArr2 = new String[colNames.length];
        for (int i = 0; i < withRefsNames.length; i++) {
            strArr[i] = "t1." + withRefsNames[i];
            strArr2[i] = "t2." + colNames[i];
        }
        try {
            String strAddPrefixToWhereClause = UtilsSQLStatement.addPrefixToWhereClause(whStmt, colNames, withRefsNames, "t2.");
            if (strAddPrefixToWhereClause.endsWith(";")) {
                strAddPrefixToWhereClause = strAddPrefixToWhereClause.substring(0, strAddPrefixToWhereClause.length() - 1);
            }
            StringBuilder sb = new StringBuilder();
            for (int i2 = 0; i2 < length; i2++) {
                sb.append(strArr[i2]).append(" = ").append(strArr2[i2]);
                if (i2 < length - 1) {
                    sb.append(" AND ");
                }
            }
            JSArray jSArraySelectSQL = mDB.selectSQL("SELECT t1.rowid FROM " + updTableName + " t1 JOIN " + tableName + " t2 ON " + sb.toString() + " WHERE " + strAddPrefixToWhereClause + " AND t1.sql_deleted = 0;", values);
            if (jSArraySelectSQL.length() <= 0) {
                next = "";
            } else {
                List<Map<String, Object>> listJSArrayToJavaListMap = JSArrayToJavaListMap(jSArraySelectSQL);
                next = listJSArrayToJavaListMap.get(0).keySet().iterator().next();
                arrayList.addAll(listJSArrayToJavaListMap);
            }
            HashMap map = new HashMap();
            map.put("key", next);
            map.put("relatedItems", arrayList);
            return map;
        } catch (Exception e) {
            throw new Exception(e.getMessage() != null ? e.getMessage() : e.toString());
        }
    }

    public static List<Map<String, Object>> JSArrayToJavaListMap(JSArray jsArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jsArray.length(); i++) {
            JSObject jSObject = (JSObject) jsArray.get(i);
            HashMap map = new HashMap();
            Iterator<String> itKeys = jSObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                map.put(next, jSObject.get(next));
            }
            arrayList.add(map);
        }
        return arrayList;
    }

    public static UpdateResults upDateWhereForRestrict(Map<String, Object> results) throws Exception {
        try {
            if (((List) results.get("relatedItems")).size() > 0) {
                throw new Exception("Restrict mode related items exist, please delete them first");
            }
            return new UpdateResults();
        } catch (Exception e) {
            throw new Exception(e.getMessage() != null ? e.getMessage() : "");
        }
    }

    public static UpdateResults upDateWhereForCascade(Map<String, Object> results) throws Exception {
        try {
            String str = (String) results.get("key");
            ArrayList arrayList = new ArrayList();
            Iterator it = ((List) results.get("relatedItems")).iterator();
            while (it.hasNext()) {
                Object obj = ((Map) it.next()).get(str);
                if (obj != null) {
                    arrayList.add(obj);
                }
            }
            String str2 = "sql_deleted = 1";
            StringBuilder sb = new StringBuilder("WHERE " + str + " IN (");
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                sb.append(it2.next()).append(",");
            }
            if (sb.toString().endsWith(",")) {
                sb.deleteCharAt(sb.length() - 1);
            }
            sb.append(");");
            return new UpdateResults(str2, sb.toString());
        } catch (Exception e) {
            throw new Exception(e.getMessage() != null ? e.getMessage() : "");
        }
    }

    public static UpdateResults upDateWhereForDefault(List<String> withRefsNames, Map<String, Object> results) throws Exception {
        try {
            String str = (String) results.get("key");
            ArrayList arrayList = new ArrayList();
            Iterator it = ((List) results.get("relatedItems")).iterator();
            while (it.hasNext()) {
                Object obj = ((Map) it.next()).get(str);
                if (obj != null) {
                    arrayList.add(obj);
                }
            }
            Iterator<String> it2 = withRefsNames.iterator();
            String str2 = "";
            while (it2.hasNext()) {
                str2 = str2 + it2.next() + " = NULL, ";
            }
            String str3 = str2 + "sql_deleted = 0";
            StringBuilder sb = new StringBuilder("WHERE " + str + " IN (");
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                sb.append(it3.next()).append(",");
            }
            if (sb.toString().endsWith(",")) {
                sb.deleteCharAt(sb.length() - 1);
            }
            sb.append(");");
            return new UpdateResults(str3, sb.toString());
        } catch (Exception e) {
            throw new Exception(e.getMessage() != null ? e.getMessage() : "");
        }
    }

    public static void executeUpdateForDelete(Database mDB, String tableName, String whereStmt, String setStmt, List<String> colNames, ArrayList<Object> values) throws Exception {
        try {
            if (mDB.prepareSQL("UPDATE " + tableName + " SET " + setStmt + " " + whereStmt, getSelectedValues(values, whereStmt, colNames), false, "no").getLong("lastId") != -1) {
            } else {
                throw new Exception("UPDATE sql_deleted failed for table: " + tableName);
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage() != null ? e.getMessage() : "");
        }
    }

    public static ArrayList<Object> getSelectedValues(ArrayList<Object> values, String whereStmt, List<String> colNames) {
        ArrayList<Object> arrayList = new ArrayList<>();
        if (values.size() > 0) {
            String[] strArrSplit = whereStmt.split("\\?");
            if (strArrSplit[strArrSplit.length - 1].equals(";")) {
                strArrSplit[strArrSplit.length - 1] = "";
            }
            for (int i = 0; i < strArrSplit.length; i++) {
                Iterator<String> it = colNames.iterator();
                while (it.hasNext()) {
                    if (!UtilsSQLStatement.indicesOf(strArrSplit[i], it.next(), 0).isEmpty()) {
                        arrayList.add(values.get(i));
                    }
                }
            }
        }
        return arrayList;
    }
}
