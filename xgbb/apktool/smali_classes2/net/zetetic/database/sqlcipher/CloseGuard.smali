.class public final Lnet/zetetic/database/sqlcipher/CloseGuard;
.super Ljava/lang/Object;
.source "CloseGuard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;,
        Lnet/zetetic/database/sqlcipher/CloseGuard$DefaultReporter;
    }
.end annotation


# static fields
.field private static volatile ENABLED:Z

.field private static final NOOP:Lnet/zetetic/database/sqlcipher/CloseGuard;

.field private static volatile REPORTER:Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;


# instance fields
.field private allocationSite:Ljava/lang/Throwable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 116
    new-instance v0, Lnet/zetetic/database/sqlcipher/CloseGuard;

    invoke-direct {v0}, Lnet/zetetic/database/sqlcipher/CloseGuard;-><init>()V

    sput-object v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->NOOP:Lnet/zetetic/database/sqlcipher/CloseGuard;

    const/4 v0, 0x1

    .line 123
    sput-boolean v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->ENABLED:Z

    .line 128
    new-instance v0, Lnet/zetetic/database/sqlcipher/CloseGuard$DefaultReporter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnet/zetetic/database/sqlcipher/CloseGuard$DefaultReporter;-><init>(Lnet/zetetic/database/sqlcipher/CloseGuard-IA;)V

    sput-object v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->REPORTER:Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lnet/zetetic/database/sqlcipher/CloseGuard;
    .locals 1

    .line 137
    sget-boolean v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->ENABLED:Z

    if-nez v0, :cond_0

    .line 138
    sget-object v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->NOOP:Lnet/zetetic/database/sqlcipher/CloseGuard;

    return-object v0

    .line 140
    :cond_0
    new-instance v0, Lnet/zetetic/database/sqlcipher/CloseGuard;

    invoke-direct {v0}, Lnet/zetetic/database/sqlcipher/CloseGuard;-><init>()V

    return-object v0
.end method

.method public static getReporter()Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;
    .locals 1

    .line 166
    sget-object v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->REPORTER:Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;

    return-object v0
.end method

.method public static setEnabled(Z)V
    .locals 0

    .line 148
    sput-boolean p0, Lnet/zetetic/database/sqlcipher/CloseGuard;->ENABLED:Z

    return-void
.end method

.method public static setReporter(Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;)V
    .locals 1

    if-eqz p0, :cond_0

    .line 159
    sput-object p0, Lnet/zetetic/database/sqlcipher/CloseGuard;->REPORTER:Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;

    return-void

    .line 157
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "reporter == null"

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public close()V
    .locals 1

    const/4 v0, 0x0

    .line 200
    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/CloseGuard;->allocationSite:Ljava/lang/Throwable;

    return-void
.end method

.method public open(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_2

    .line 186
    sget-object v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->NOOP:Lnet/zetetic/database/sqlcipher/CloseGuard;

    if-eq p0, v0, :cond_1

    sget-boolean v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->ENABLED:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Explicit termination method \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\' not called"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 190
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lnet/zetetic/database/sqlcipher/CloseGuard;->allocationSite:Ljava/lang/Throwable;

    :cond_1
    :goto_0
    return-void

    .line 183
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "closer == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public warnIfOpen()V
    .locals 3

    .line 210
    iget-object v0, p0, Lnet/zetetic/database/sqlcipher/CloseGuard;->allocationSite:Ljava/lang/Throwable;

    if-eqz v0, :cond_1

    sget-boolean v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->ENABLED:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 218
    :cond_0
    sget-object v0, Lnet/zetetic/database/sqlcipher/CloseGuard;->REPORTER:Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;

    iget-object v1, p0, Lnet/zetetic/database/sqlcipher/CloseGuard;->allocationSite:Ljava/lang/Throwable;

    const-string v2, "A resource was acquired at attached stack trace but never released. See java.io.Closeable for information on avoiding resource leaks."

    invoke-interface {v0, v2, v1}, Lnet/zetetic/database/sqlcipher/CloseGuard$Reporter;->report(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method
