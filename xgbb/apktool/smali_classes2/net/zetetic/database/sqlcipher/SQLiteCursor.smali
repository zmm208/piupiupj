.class public Lnet/zetetic/database/sqlcipher/SQLiteCursor;
.super Lnet/zetetic/database/AbstractWindowedCursor;
.source "SQLiteCursor.java"


# static fields
.field private static CURSOR_WINDOW_NEEDS_RECREATED:Z = false

.field private static final DEFAULT_CURSOR_WINDOW_SIZE:I = -0x1

.field static final NO_COUNT:I = -0x1

.field public static PREFERRED_CURSOR_WINDOW_SIZE:I = -0x1

.field static final TAG:Ljava/lang/String; = "SQLiteCursor"


# instance fields
.field private mColumnNameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mColumns:[Ljava/lang/String;

.field private mCount:I

.field private mCursorWindowCapacity:I

.field private final mDriver:Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;

.field private final mEditTable:Ljava/lang/String;

.field private final mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteQuery;)V
    .locals 1

    .line 97
    invoke-direct {p0}, Lnet/zetetic/database/AbstractWindowedCursor;-><init>()V

    const/4 v0, -0x1

    .line 59
    iput v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    if-eqz p3, :cond_0

    .line 101
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mDriver:Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;

    .line 102
    iput-object p2, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mEditTable:Ljava/lang/String;

    const/4 p1, 0x0

    .line 103
    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumnNameMap:Ljava/util/Map;

    .line 104
    iput-object p3, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;

    .line 106
    invoke-virtual {p3}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getColumnNames()[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumns:[Ljava/lang/String;

    return-void

    .line 99
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "query object cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lnet/zetetic/database/sqlcipher/SQLiteDatabase;Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteQuery;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 84
    invoke-direct {p0, p2, p3, p4}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;-><init>(Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;Ljava/lang/String;Lnet/zetetic/database/sqlcipher/SQLiteQuery;)V

    return-void
.end method

.method private awc_clearOrCreateWindow(Ljava/lang/String;)V
    .locals 2

    .line 147
    sget v0, Lnet/zetetic/database/CursorWindow;->PREFERRED_CURSOR_WINDOW_SIZE:I

    .line 148
    sget-boolean v1, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->CURSOR_WINDOW_NEEDS_RECREATED:Z

    if-eqz v1, :cond_0

    .line 149
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->awc_closeWindow()V

    const/4 v1, 0x0

    .line 150
    sput-boolean v1, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->CURSOR_WINDOW_NEEDS_RECREATED:Z

    .line 152
    :cond_0
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getWindow()Lnet/zetetic/database/CursorWindow;

    move-result-object v1

    if-nez v1, :cond_1

    .line 154
    new-instance v1, Lnet/zetetic/database/CursorWindow;

    invoke-direct {v1, p1, v0}, Lnet/zetetic/database/CursorWindow;-><init>(Ljava/lang/String;I)V

    .line 155
    invoke-virtual {p0, v1}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->setWindow(Lnet/zetetic/database/CursorWindow;)V

    return-void

    .line 157
    :cond_1
    invoke-virtual {v1}, Lnet/zetetic/database/CursorWindow;->clear()V

    return-void
.end method

.method private awc_closeWindow()V
    .locals 1

    const/4 v0, 0x0

    .line 162
    invoke-virtual {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->setWindow(Lnet/zetetic/database/CursorWindow;)V

    return-void
.end method

.method private fillWindow(I)V
    .locals 6

    .line 166
    const-string v0, "SQLiteCursor"

    .line 0
    const-string v1, "received count(*) from native_fill_window: "

    .line 166
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->getDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->awc_clearOrCreateWindow(Ljava/lang/String;)V

    .line 169
    :try_start_0
    iget v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-ne v2, v3, :cond_1

    .line 170
    invoke-static {p1, v4}, Lnet/zetetic/database/DatabaseUtils;->cursorPickFillWindowStartPosition(II)I

    move-result v2

    .line 171
    iget-object v3, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;

    iget-object v4, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v2, p1, v5}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->fillWindow(Lnet/zetetic/database/CursorWindow;IIZ)I

    move-result p1

    iput p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    .line 172
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    invoke-virtual {p1}, Lnet/zetetic/database/CursorWindow;->getNumRows()I

    move-result p1

    iput p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCursorWindowCapacity:I

    const/4 p1, 0x3

    .line 173
    invoke-static {v0, p1}, Lnet/zetetic/database/Logger;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 174
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lnet/zetetic/database/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void

    .line 177
    :cond_1
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCursorWindowCapacity:I

    invoke-static {p1, v0}, Lnet/zetetic/database/DatabaseUtils;->cursorPickFillWindowStartPosition(II)I

    move-result v0

    .line 179
    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;

    iget-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    invoke-virtual {v1, v2, v0, p1, v4}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->fillWindow(Lnet/zetetic/database/CursorWindow;IIZ)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 186
    invoke-direct {p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->awc_closeWindow()V

    .line 187
    throw p1
.end method

.method public static resetCursorWindowSize()V
    .locals 1

    const/16 v0, 0x4000

    .line 142
    sput v0, Lnet/zetetic/database/CursorWindow;->PREFERRED_CURSOR_WINDOW_SIZE:I

    const/4 v0, 0x1

    .line 143
    sput-boolean v0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->CURSOR_WINDOW_NEEDS_RECREATED:Z

    return-void
.end method

.method public static setCursorWindowSize(I)V
    .locals 0

    .line 137
    sput p0, Lnet/zetetic/database/CursorWindow;->PREFERRED_CURSOR_WINDOW_SIZE:I

    const/4 p0, 0x1

    .line 138
    sput-boolean p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->CURSOR_WINDOW_NEEDS_RECREATED:Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 233
    invoke-super {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->close()V

    .line 234
    monitor-enter p0

    .line 235
    :try_start_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->close()V

    .line 236
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mDriver:Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;

    invoke-interface {v0}, Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;->cursorClosed()V

    .line 237
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public deactivate()V
    .locals 1

    .line 227
    invoke-super {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->deactivate()V

    .line 228
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mDriver:Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;

    invoke-interface {v0}, Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;->cursorDeactivated()V

    return-void
.end method

.method protected finalize()V
    .locals 1

    .line 289
    :try_start_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    :cond_0
    invoke-super {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->finalize()V

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->finalize()V

    .line 294
    throw v0
.end method

.method public getColumnIndex(Ljava/lang/String;)I
    .locals 6

    .line 194
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumnNameMap:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 195
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumns:[Ljava/lang/String;

    .line 196
    array-length v1, v0

    .line 197
    new-instance v2, Ljava/util/HashMap;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v3}, Ljava/util/HashMap;-><init>(IF)V

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    .line 199
    aget-object v4, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 201
    :cond_0
    iput-object v2, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumnNameMap:Ljava/util/Map;

    :cond_1
    const/16 v0, 0x2e

    .line 205
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 207
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 208
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "requesting column name with table name -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SQLiteCursor"

    invoke-static {v4, v3, v2}, Lnet/zetetic/database/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    add-int/lit8 v0, v0, 0x1

    .line 209
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 212
    :cond_2
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumnNameMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_3

    .line 214
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_3
    return v1
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    .line 222
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 2

    .line 130
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 131
    invoke-direct {p0, v0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->fillWindow(I)V

    .line 133
    :cond_0
    iget v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    return v0
.end method

.method public getDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;
    .locals 1

    .line 114
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public onMove(II)Z
    .locals 1

    .line 120
    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    invoke-virtual {p1}, Lnet/zetetic/database/CursorWindow;->getStartPosition()I

    move-result p1

    if-lt p2, p1, :cond_0

    iget-object p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    .line 121
    invoke-virtual {p1}, Lnet/zetetic/database/CursorWindow;->getStartPosition()I

    move-result p1

    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    invoke-virtual {v0}, Lnet/zetetic/database/CursorWindow;->getNumRows()I

    move-result v0

    add-int/2addr p1, v0

    if-lt p2, p1, :cond_1

    .line 122
    :cond_0
    invoke-direct {p0, p2}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->fillWindow(I)V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public requery()Z
    .locals 5

    .line 242
    invoke-virtual {p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->isClosed()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 246
    :cond_0
    monitor-enter p0

    .line 247
    :try_start_0
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mQuery:Lnet/zetetic/database/sqlcipher/SQLiteQuery;

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteQuery;->getDatabase()Lnet/zetetic/database/sqlcipher/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lnet/zetetic/database/sqlcipher/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_1

    .line 248
    monitor-exit p0

    return v1

    .line 251
    :cond_1
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eqz v0, :cond_2

    .line 252
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    invoke-virtual {v0}, Lnet/zetetic/database/CursorWindow;->clear()V

    :cond_2
    const/4 v0, -0x1

    .line 254
    iput v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mPos:I

    .line 255
    iput v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    .line 257
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mDriver:Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;

    invoke-interface {v0, p0}, Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;->cursorRequeried(Landroid/database/Cursor;)V

    .line 258
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    :try_start_1
    invoke-super {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->requery()Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 264
    const-string v2, "SQLiteCursor"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "requery() failed "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lnet/zetetic/database/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1

    :catchall_0
    move-exception v0

    .line 258
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public setSelectionArguments([Ljava/lang/String;)V
    .locals 1

    .line 279
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mDriver:Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;

    invoke-interface {v0, p1}, Lnet/zetetic/database/sqlcipher/SQLiteCursorDriver;->setBindArguments([Ljava/lang/String;)V

    return-void
.end method

.method public setWindow(Lnet/zetetic/database/CursorWindow;)V
    .locals 0

    .line 271
    invoke-super {p0, p1}, Lnet/zetetic/database/AbstractWindowedCursor;->setWindow(Lnet/zetetic/database/CursorWindow;)V

    const/4 p1, -0x1

    .line 272
    iput p1, p0, Lnet/zetetic/database/sqlcipher/SQLiteCursor;->mCount:I

    return-void
.end method
