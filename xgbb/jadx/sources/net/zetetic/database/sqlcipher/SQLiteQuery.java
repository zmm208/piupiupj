package net.zetetic.database.sqlcipher;

import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteException;
import android.os.CancellationSignal;
import net.zetetic.database.CursorWindow;
import net.zetetic.database.Logger;

/* JADX INFO: loaded from: classes2.dex */
public final class SQLiteQuery extends SQLiteProgram {
    private static final String TAG = "SQLiteQuery";
    private final CancellationSignal mCancellationSignal;

    SQLiteQuery(SQLiteDatabase sQLiteDatabase, String str, CancellationSignal cancellationSignal) {
        super(sQLiteDatabase, str, null, cancellationSignal);
        this.mCancellationSignal = cancellationSignal;
    }

    int fillWindow(CursorWindow cursorWindow, int i, int i2, boolean z) {
        acquireReference();
        try {
            try {
                cursorWindow.acquireReference();
                try {
                    try {
                        int iExecuteForCursorWindow = getSession().executeForCursorWindow(getSql(), getBindArgs(), cursorWindow, i, i2, z, getConnectionFlags(), this.mCancellationSignal);
                        cursorWindow.releaseReference();
                        releaseReference();
                        return iExecuteForCursorWindow;
                    } catch (SQLiteDatabaseCorruptException e) {
                        e = e;
                        SQLiteDatabaseCorruptException sQLiteDatabaseCorruptException = e;
                        onCorruption(sQLiteDatabaseCorruptException);
                        throw sQLiteDatabaseCorruptException;
                    } catch (SQLiteException e2) {
                        e = e2;
                        SQLiteException sQLiteException = e;
                        Logger.m109e(TAG, "exception: " + sQLiteException.getMessage() + "; query: " + getSql());
                        throw sQLiteException;
                    }
                } catch (SQLiteDatabaseCorruptException e3) {
                    e = e3;
                } catch (SQLiteException e4) {
                    e = e4;
                } catch (Throwable th) {
                    th = th;
                    Throwable th2 = th;
                    cursorWindow.releaseReference();
                    throw th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            releaseReference();
            throw th4;
        }
    }

    public String toString() {
        return "SQLiteQuery: " + getSql();
    }
}
