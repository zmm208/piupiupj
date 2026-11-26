.class public final enum Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
.super Ljava/lang/Enum;
.source "UtilsSQLCipher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

.field public static final enum DOES_NOT_EXIST:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

.field public static final enum ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

.field public static final enum ENCRYPTED_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

.field public static final enum UNENCRYPTED:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

.field public static final enum UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;


# direct methods
.method private static synthetic $values()[Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    .locals 5

    .line 19
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->DOES_NOT_EXIST:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    sget-object v1, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNENCRYPTED:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    sget-object v2, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    sget-object v3, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    sget-object v4, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    const-string v1, "DOES_NOT_EXIST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->DOES_NOT_EXIST:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    .line 21
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    const-string v1, "UNENCRYPTED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNENCRYPTED:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    .line 22
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    const-string v1, "ENCRYPTED_SECRET"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    .line 23
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    const-string v1, "ENCRYPTED_GLOBAL_SECRET"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->ENCRYPTED_GLOBAL_SECRET:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    .line 24
    new-instance v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->UNKNOWN:Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    .line 19
    invoke-static {}, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->$values()[Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    move-result-object v0

    sput-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->$VALUES:[Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 19
    const-class v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    return-object p0
.end method

.method public static values()[Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;
    .locals 1

    .line 19
    sget-object v0, Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->$VALUES:[Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    invoke-virtual {v0}, [Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getcapacitor/community/database/sqlite/SQLite/UtilsSQLCipher$State;

    return-object v0
.end method
