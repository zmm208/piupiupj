package net.zetetic.database.sqlcipher;

/* JADX INFO: loaded from: classes2.dex */
public class DatabaseObjectNotClosedException extends RuntimeException {

    /* JADX INFO: renamed from: s */
    private static final String f247s = "Application did not close the cursor or database object that was opened here";

    public DatabaseObjectNotClosedException() {
        super(f247s);
    }
}
