package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class UtilsDownloadFromHTTP {
    private static final int BUFFER_SIZE = 4096;
    private static final String TAG = "com.getcapacitor.community.database.sqlite.SQLite.UtilsDownloadFromHTTP";
    private final UtilsFile _uFile = new UtilsFile();

    /* JADX WARN: Code duplicated, block: B:16:0x003a  */
    public void download(Context context, String fileUrl) throws Exception {
        byte b;
        Boolean bool = false;
        try {
            String[] fileDetails = getFileDetails(fileUrl);
            String str = fileDetails[0];
            String str2 = fileDetails[1];
            if (!str.contains("SQLite.db")) {
                int iHashCode = str2.hashCode();
                if (iHashCode != 3198) {
                    if (iHashCode == 120609 && str2.equals("zip")) {
                        b = 1;
                    } else {
                        b = -1;
                    }
                } else if (str2.equals("db")) {
                    b = 0;
                } else {
                    b = -1;
                }
                if (b == 0) {
                    str = str.substring(0, str.length() - 3) + "SQLite.db";
                } else {
                    if (b != 1) {
                        throw new Exception("Unknown file type. Filename: " + str);
                    }
                    bool = true;
                }
            }
            File cacheDir = context.getCacheDir();
            String absolutePath = cacheDir.getAbsolutePath();
            String str3 = absolutePath + File.separator + str;
            File file = new File(this._uFile.getDatabaseDirectoryPath(context));
            try {
                if (this._uFile.isPathExists(str3).booleanValue()) {
                    this._uFile.deleteFile(absolutePath, str);
                }
                downloadFileToCache(fileUrl, str, absolutePath);
                if (bool.booleanValue()) {
                    this._uFile.unzipCopyDatabase(absolutePath, null, str3, true);
                    this._uFile.deleteFile(absolutePath, str);
                }
                this._uFile.moveAllDBs(cacheDir, file);
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        } catch (Exception e2) {
            throw new Exception(e2.getMessage());
        }
    }

    public static String[] getFileDetails(String url) throws Exception {
        try {
            String strDecode = URLDecoder.decode(new URL(url).getPath(), StandardCharsets.UTF_8.toString());
            String strSubstring = strDecode.substring(strDecode.lastIndexOf(47) + 1);
            String fileExtension = getFileExtension(strSubstring);
            if (fileExtension == null) {
                throw new Exception("extension db or zip not found");
            }
            return new String[]{strSubstring, fileExtension};
        } catch (MalformedURLException e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public static String getFileExtension(String filename) {
        Matcher matcher = Pattern.compile("\\.([a-zA-Z0-9]+)(?:[\\?#]|$)").matcher(filename);
        if (matcher.find()) {
            return matcher.group(1).toLowerCase();
        }
        return null;
    }

    /* JADX WARN: Code duplicated, block: B:56:0x00cf A[EXC_TOP_SPLITTER, SYNTHETIC] */
    public static void downloadFileToCache(String fileURL, String fileName, String cacheDir) throws Exception {
        HttpURLConnection httpURLConnection = null;
        try {
            try {
                HttpURLConnection httpURLConnection2 = (HttpURLConnection) new URL(fileURL).openConnection();
                try {
                    httpURLConnection2.setRequestMethod("GET");
                    int responseCode = httpURLConnection2.getResponseCode();
                    if (responseCode != 200) {
                        throw new IOException("No file to download. Server replied HTTP code: " + responseCode);
                    }
                    int contentLength = httpURLConnection2.getContentLength();
                    String str = cacheDir + File.separator + ((fileName.contains("SQLite.db") || !fileName.substring(fileName.length() + (-3)).equals(".db")) ? fileName : fileName.substring(0, fileName.length() - 3) + "SQLite.db");
                    InputStream inputStream = httpURLConnection2.getInputStream();
                    try {
                        FileOutputStream fileOutputStream = new FileOutputStream(str);
                        try {
                            byte[] bArr = new byte[1024];
                            while (true) {
                                int i = inputStream.read(bArr);
                                if (i == -1) {
                                    break;
                                } else {
                                    fileOutputStream.write(bArr, 0, i);
                                }
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (Throwable th) {
                                        th.addSuppressed(th);
                                    }
                                }
                                throw th;
                            }
                            fileOutputStream.close();
                            inputStream.close();
                            System.out.println("File " + fileName + " downloaded (" + contentLength + ")");
                            fileOutputStream.close();
                            if (inputStream != null) {
                                inputStream.close();
                            }
                            if (httpURLConnection2 != null) {
                                httpURLConnection2.disconnect();
                            }
                        } catch (Throwable th2) {
                            try {
                                fileOutputStream.close();
                            } catch (Throwable th3) {
                                th2.addSuppressed(th3);
                            }
                            throw th2;
                        }
                    } catch (Throwable th4) {
                        if (inputStream != null) {
                            inputStream.close();
                        }
                        throw th4;
                    }
                } catch (IOException e) {
                    e = e;
                    throw new Exception(e);
                } catch (Throwable th5) {
                    th = th5;
                    httpURLConnection = httpURLConnection2;
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    throw th;
                }
            } catch (Throwable th6) {
                th = th6;
            }
        } catch (IOException e2) {
            e = e2;
        }
    }
}
