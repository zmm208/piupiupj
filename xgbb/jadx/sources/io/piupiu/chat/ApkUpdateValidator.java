package io.piupiu.chat;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* JADX INFO: loaded from: classes.dex */
final class ApkUpdateValidator {
    ApkUpdateValidator() {
    }

    static void validate(File file) throws IOException {
        if (!file.isFile() || file.length() == 0) {
            throw new IOException("更新包为空，请重新下载");
        }
        ZipFile zipFile = new ZipFile(file);
        try {
            ZipEntry entry = zipFile.getEntry("AndroidManifest.xml");
            if (entry == null || entry.isDirectory() || entry.getSize() <= 0) {
                throw new IOException("下载内容不是有效的 APK");
            }
            byte[] bArr = new byte[32768];
            Enumeration<? extends ZipEntry> enumerationEntries = zipFile.entries();
            while (enumerationEntries.hasMoreElements()) {
                ZipEntry zipEntryNextElement = enumerationEntries.nextElement();
                if (!zipEntryNextElement.isDirectory()) {
                    CRC32 crc32 = new CRC32();
                    InputStream inputStream = zipFile.getInputStream(zipEntryNextElement);
                    long j = 0;
                    while (true) {
                        try {
                            int i = inputStream.read(bArr);
                            if (i == -1) {
                                break;
                            }
                            crc32.update(bArr, 0, i);
                            j += (long) i;
                        } catch (Throwable th) {
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (Throwable th2) {
                                    th.addSuppressed(th2);
                                }
                            }
                            throw th;
                        }
                        try {
                            zipFile.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                        throw th;
                    }
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (j != zipEntryNextElement.getSize() || crc32.getValue() != zipEntryNextElement.getCrc()) {
                        throw new IOException("更新包损坏，请重新下载");
                    }
                }
            }
            zipFile.close();
        } catch (Throwable th4) {
            zipFile.close();
            throw th4;
        }
    }
}
