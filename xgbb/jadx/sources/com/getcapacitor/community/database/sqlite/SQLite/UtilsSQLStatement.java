package com.getcapacitor.community.database.sqlite.SQLite;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class UtilsSQLStatement {
    public static String flattenMultilineString(String input) {
        return Database$$ExternalSyntheticBackport0.m52m(" ", input.split("\\r?\\n"));
    }

    public static String extractTableName(String statement) {
        Matcher matcher = Pattern.compile("(?:INSERT\\s+INTO|UPDATE|DELETE\\s+FROM)\\s+([^\\s]+)", 2).matcher(statement);
        if (!matcher.find() || matcher.groupCount() <= 0) {
            return null;
        }
        return matcher.group(1);
    }

    public static String extractWhereClause(String statement) {
        Matcher matcher = Pattern.compile("WHERE(.+?)(?:ORDER\\s+BY|LIMIT|$)", 2).matcher(statement);
        if (!matcher.find() || matcher.groupCount() <= 0) {
            return null;
        }
        return matcher.group(1).trim();
    }

    public static String addPrefixToWhereClause(String whereClause, String[] colNames, String[] refNames, String prefix) {
        String[] strArrSplit;
        int iIndexOf;
        String str;
        char c = 1;
        char c2 = 2;
        String[] strArr = {"AND", "OR", "NOT"};
        int i = 0;
        while (true) {
            if (i >= 3) {
                strArrSplit = null;
                break;
            }
            String str2 = strArr[i];
            if (whereClause.contains(str2)) {
                strArrSplit = whereClause.split("\\s*" + str2 + "\\s*");
                break;
            }
            i++;
        }
        if (strArrSplit == null) {
            strArrSplit = new String[]{whereClause};
        }
        ArrayList arrayList = new ArrayList();
        int length = strArrSplit.length;
        int i2 = 0;
        while (i2 < length) {
            String strTrim = strArrSplit[i2].trim();
            String[] strArr2 = new String[9];
            strArr2[0] = "=";
            strArr2[c] = "<>";
            strArr2[c2] = "<";
            strArr2[3] = "<=";
            strArr2[4] = ">";
            strArr2[5] = ">=";
            strArr2[6] = "IN";
            strArr2[7] = "BETWEEN";
            strArr2[8] = "LIKE";
            int i3 = 0;
            int i4 = -1;
            while (true) {
                if (i3 >= 9) {
                    iIndexOf = i4;
                    str = null;
                    break;
                }
                str = strArr2[i3];
                iIndexOf = strTrim.indexOf(str);
                if (iIndexOf != -1) {
                    break;
                }
                i3++;
                i4 = iIndexOf;
            }
            if (str == null) {
                arrayList.add(strTrim);
            } else {
                String strTrim2 = strTrim.substring(0, iIndexOf).trim();
                String strTrim3 = strTrim.substring(iIndexOf + str.length()).trim();
                int iFindIndexOfStringInArray = findIndexOfStringInArray(strTrim2, refNames);
                if (iFindIndexOfStringInArray != -1) {
                    strTrim2 = getStringAtIndex(colNames, iFindIndexOfStringInArray);
                }
                arrayList.add((prefix + strTrim2) + " " + str + " " + strTrim3);
            }
            i2++;
            c = 1;
            c2 = 2;
        }
        String str3 = strArr[0];
        for (int i5 = 0; i5 < 3; i5++) {
            String str4 = strArr[i5];
            if (whereClause.contains(str4)) {
                str3 = str4;
                break;
            }
        }
        return Database$$ExternalSyntheticBackport0.m51m(" " + str3 + " ", arrayList);
    }

    public static int findIndexOfStringInArray(String target, String[] array) {
        for (int i = 0; i < array.length; i++) {
            if (array[i].equals(target)) {
                return i;
            }
        }
        return -1;
    }

    public static String getStringAtIndex(String[] array, int index) {
        if (index < 0 || index >= array.length) {
            return null;
        }
        return array[index];
    }

    public static UtilsDelete.ForeignKeyInfo extractForeignKeyInfo(String sqlStatement) throws Exception {
        Matcher matcher = Pattern.compile("\\bFOREIGN\\s+KEY\\s*\\(([^)]+)\\)\\s+REFERENCES\\s+(\\w+)\\s*\\(([^)]+)\\)\\s+(ON\\s+DELETE\\s+(RESTRICT|CASCADE|SET\\s+NULL|SET\\s+DEFAULT|NO\\s+ACTION))?").matcher(sqlStatement);
        if (matcher.find()) {
            String[] strArrSplit = matcher.group(1).split(",");
            return new UtilsDelete.ForeignKeyInfo(new ArrayList(Arrays.asList(strArrSplit)), matcher.group(2), new ArrayList(Arrays.asList(matcher.group(3).split(","))), matcher.group(5) != null ? matcher.group(5) : "NO ACTION");
        }
        throw new Exception("extractForeignKeyInfo: No FOREIGN KEY found");
    }

    public static List<String> extractColumnNames(String whereClause) {
        HashSet hashSet = new HashSet(Arrays.asList("AND", "OR", "IN", "VALUES", "LIKE", "BETWEEN", "NOT"));
        Matcher matcher = Pattern.compile("\\b[a-zA-Z]\\w*\\b(?=\\s*(?:<=?|>=?|<>?|=|AND|OR|BETWEEN|NOT|IN|LIKE))|\\b[a-zA-Z]\\w*\\b\\s+BETWEEN\\s+'[^']+'\\s+AND\\s+'[^']+'|\\(([^)]+)\\)\\s+IN\\s+\\(\\s*VALUES\\s*\\(").matcher(whereClause);
        ArrayList arrayList = new ArrayList();
        while (matcher.find()) {
            String strGroup = matcher.group(1);
            if (strGroup != null) {
                for (String str : strGroup.split(",")) {
                    arrayList.add(str.trim());
                }
            } else {
                String strGroup2 = matcher.group();
                if (!hashSet.contains(strGroup2.trim().toUpperCase())) {
                    arrayList.add(strGroup2.trim());
                }
            }
        }
        return arrayList;
    }

    public static List<Integer> indicesOf(String str, String searchStr, int fromIndex) {
        ArrayList arrayList = new ArrayList();
        int iIndexOf = str.indexOf(searchStr, fromIndex);
        while (iIndexOf != -1) {
            arrayList.add(Integer.valueOf(iIndexOf));
            iIndexOf = str.indexOf(searchStr, iIndexOf + 1);
        }
        return arrayList;
    }
}
