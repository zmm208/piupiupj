.class public abstract Lnet/zetetic/database/AbstractWindowedCursor;
.super Lnet/zetetic/database/AbstractCursor;
.source "AbstractWindowedCursor.java"


# instance fields
.field protected mWindow:Lnet/zetetic/database/CursorWindow;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lnet/zetetic/database/AbstractCursor;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkPosition()V
    .locals 2

    .line 107
    invoke-super {p0}, Lnet/zetetic/database/AbstractCursor;->checkPosition()V

    .line 108
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eqz v0, :cond_0

    return-void

    .line 109
    :cond_0
    new-instance v0, Landroid/database/StaleDataException;

    const-string v1, "Attempting to access a closed CursorWindow.Most probable cause: cursor is deactivated prior to calling this method."

    invoke-direct {v0, v1}, Landroid/database/StaleDataException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected clearOrCreateWindow(Ljava/lang/String;)V
    .locals 1

    .line 165
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-nez v0, :cond_0

    .line 166
    new-instance v0, Lnet/zetetic/database/CursorWindow;

    invoke-direct {v0, p1}, Lnet/zetetic/database/CursorWindow;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    return-void

    .line 168
    :cond_0
    invoke-virtual {v0}, Lnet/zetetic/database/CursorWindow;->clear()V

    return-void
.end method

.method protected closeWindow()V
    .locals 1

    .line 152
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eqz v0, :cond_0

    .line 153
    invoke-virtual {v0}, Lnet/zetetic/database/CursorWindow;->close()V

    const/4 v0, 0x0

    .line 154
    iput-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    :cond_0
    return-void
.end method

.method public copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V
    .locals 2

    .line 62
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1, p2}, Lnet/zetetic/database/CursorWindow;->copyStringToBuffer(IILandroid/database/CharArrayBuffer;)V

    return-void
.end method

.method public getBlob(I)[B
    .locals 2

    .line 50
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 51
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getBlob(II)[B

    move-result-object p1

    return-object p1
.end method

.method public getDouble(I)D
    .locals 2

    .line 91
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 92
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getDouble(II)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(I)F
    .locals 2

    .line 85
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 86
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getFloat(II)F

    move-result p1

    return p1
.end method

.method public getInt(I)I
    .locals 2

    .line 73
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 74
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getInt(II)I

    move-result p1

    return p1
.end method

.method public getLong(I)J
    .locals 2

    .line 79
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 80
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getLong(II)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShort(I)S
    .locals 2

    .line 67
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 68
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getShort(II)S

    move-result p1

    return p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2

    .line 56
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->checkPosition()V

    .line 57
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getString(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getType(I)I
    .locals 2

    .line 102
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getType(II)I

    move-result p1

    return p1
.end method

.method public getWindow()Lnet/zetetic/database/CursorWindow;
    .locals 1

    .line 115
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    return-object v0
.end method

.method public hasWindow()Z
    .locals 1

    .line 144
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNull(I)Z
    .locals 2

    .line 97
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    iget v1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mPos:I

    invoke-virtual {v0, v1, p1}, Lnet/zetetic/database/CursorWindow;->getType(II)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onDeactivateOrClose()V
    .locals 0

    .line 174
    invoke-super {p0}, Lnet/zetetic/database/AbstractCursor;->onDeactivateOrClose()V

    .line 175
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->closeWindow()V

    return-void
.end method

.method public setWindow(Lnet/zetetic/database/CursorWindow;)V
    .locals 1

    .line 132
    iget-object v0, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    if-eq p1, v0, :cond_0

    .line 133
    invoke-virtual {p0}, Lnet/zetetic/database/AbstractWindowedCursor;->closeWindow()V

    .line 134
    iput-object p1, p0, Lnet/zetetic/database/AbstractWindowedCursor;->mWindow:Lnet/zetetic/database/CursorWindow;

    :cond_0
    return-void
.end method
