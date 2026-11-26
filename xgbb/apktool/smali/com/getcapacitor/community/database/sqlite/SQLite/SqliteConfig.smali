.class public Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;
.super Ljava/lang/Object;
.source "SqliteConfig.java"


# instance fields
.field private biometricAuth:Z

.field private biometricSubTitle:Ljava/lang/String;

.field private biometricTitle:Ljava/lang/String;

.field private isEncryption:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricAuth:Z

    .line 6
    const-string v0, "Biometric login for capacitor sqlite"

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricTitle:Ljava/lang/String;

    .line 7
    const-string v0, "Log in using your biometric"

    iput-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricSubTitle:Ljava/lang/String;

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->isEncryption:Z

    return-void
.end method


# virtual methods
.method public getBiometricAuth()Z
    .locals 1

    .line 19
    iget-boolean v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricAuth:Z

    return v0
.end method

.method public getBiometricSubTitle()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricSubTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getBiometricTitle()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getIsEncryption()Z
    .locals 1

    .line 11
    iget-boolean v0, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->isEncryption:Z

    return v0
.end method

.method public setBiometricAuth(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "biometricAuth"
        }
    .end annotation

    .line 23
    iput-boolean p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricAuth:Z

    return-void
.end method

.method public setBiometricSubTitle(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "biometricSubTitle"
        }
    .end annotation

    .line 39
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricSubTitle:Ljava/lang/String;

    return-void
.end method

.method public setBiometricTitle(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "biometricTitle"
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->biometricTitle:Ljava/lang/String;

    return-void
.end method

.method public setIsEncryption(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isEncryption"
        }
    .end annotation

    .line 15
    iput-boolean p1, p0, Lcom/getcapacitor/community/database/sqlite/SQLite/SqliteConfig;->isEncryption:Z

    return-void
.end method
