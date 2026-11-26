.class final Lio/piupiu/chat/ProtectedFrontendManager;
.super Ljava/lang/Object;
.source "ProtectedFrontendManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/piupiu/chat/ProtectedFrontendManager$Segment;,
        Lio/piupiu/chat/ProtectedFrontendManager$Entry;,
        Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;,
        Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;
    }
.end annotation


# static fields
.field private static final CACHEABLE_ENTRY_MAX_BYTES:I = 0x80000

.field private static final DECRYPTED_CACHE_MAX_BYTES:I = 0x800000

.field private static final FORMAT_V2:I = 0x2

.field private static final FORMAT_V3:I = 0x3

.field private static final MANIFEST_ASSET:Ljava/lang/String; = "public/frontend-code-manifest.json"

.field private static final PAK_ASSET:Ljava/lang/String; = "public/frontend-code.pak"

.field private static final TAG:Ljava/lang/String; = "PiuPiuProtectedFrontend"


# instance fields
.field private bundleSha256:Ljava/lang/String;

.field private bundleVersion:Ljava/lang/String;

.field private volatile contentKey:[B

.field private final context:Landroid/content/Context;

.field private final decryptedCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private final decryptedCacheLock:Ljava/lang/Object;

.field private final entries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/piupiu/chat/ProtectedFrontendManager$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private formatVersion:I

.field private keyId:Ljava/lang/String;

.field private volatile message:Ljava/lang/String;

.field private volatile pakVerified:Z

.field private volatile pathIndexKey:[B

.field private final protectedBuild:Z

.field private startup:Lorg/json/JSONObject;

.field private volatile status:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$mdecryptSegment(Lio/piupiu/chat/ProtectedFrontendManager;Ljava/lang/String;ILio/piupiu/chat/ProtectedFrontendManager$Segment;[B)[B
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lio/piupiu/chat/ProtectedFrontendManager;->decryptSegment(Ljava/lang/String;ILio/piupiu/chat/ProtectedFrontendManager$Segment;[B)[B

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mreadPakRange(Lio/piupiu/chat/ProtectedFrontendManager;JI)[B
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lio/piupiu/chat/ProtectedFrontendManager;->readPakRange(JI)[B

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smwipe([B)V
    .locals 0

    invoke-static {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 30

    move-object/from16 v1, p0

    .line 65
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->entries:Ljava/util/Map;

    .line 45
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCacheLock:Ljava/lang/Object;

    .line 46
    new-instance v0, Lio/piupiu/chat/ProtectedFrontendManager$1;

    const/high16 v2, 0x800000

    invoke-direct {v0, v1, v2}, Lio/piupiu/chat/ProtectedFrontendManager$1;-><init>(Lio/piupiu/chat/ProtectedFrontendManager;I)V

    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    .line 53
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->startup:Lorg/json/JSONObject;

    .line 54
    const-string v0, ""

    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->bundleVersion:Ljava/lang/String;

    .line 55
    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    .line 56
    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->keyId:Ljava/lang/String;

    .line 61
    const-string v2, "checking"

    iput-object v2, v1, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    .line 62
    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    .line 66
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->context:Landroid/content/Context;

    .line 67
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    const/4 v4, 0x0

    .line 70
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    const-string v5, "public/frontend-code-manifest.json"

    invoke-direct {v1, v5}, Lio/piupiu/chat/ProtectedFrontendManager;->readAssetText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 71
    const-string v5, "formatVersion"

    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, v1, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v6, 0x2

    const/4 v7, 0x3

    if-eq v5, v6, :cond_1

    if-ne v5, v7, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v5, "Unsupported protected frontend format"

    invoke-direct {v0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    goto/16 :goto_4

    .line 75
    :cond_1
    :goto_0
    :try_start_2
    const-string v5, "bundleVersion"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lio/piupiu/chat/ProtectedFrontendManager;->bundleVersion:Ljava/lang/String;

    .line 76
    const-string v5, "bundleSha256"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    .line 77
    const-string v5, "keyId"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lio/piupiu/chat/ProtectedFrontendManager;->keyId:Ljava/lang/String;

    .line 78
    const-string v5, "startup"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    iput-object v5, v1, Lio/piupiu/chat/ProtectedFrontendManager;->startup:Lorg/json/JSONObject;

    .line 79
    const-string v5, "entries"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 81
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v8, 0x1

    if-eqz v6, :cond_4

    .line 82
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    .line 83
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 84
    iget v10, v1, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    const-string v11, "mime"

    const-string v12, "tag"

    const-string v13, "iv"

    const-string v14, "length"

    const-string v15, "offset"

    if-ne v10, v7, :cond_3

    .line 85
    :try_start_3
    const-string v8, "segments"

    invoke-virtual {v9, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 86
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v10
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move/from16 p1, v4

    :try_start_4
    new-array v4, v10, [Lio/piupiu/chat/ProtectedFrontendManager$Segment;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move/from16 v7, p1

    move-object/from16 v22, v0

    .line 87
    :goto_2
    const-string v0, "plaintextLength"

    if-ge v7, v10, :cond_2

    move-object/from16 v20, v4

    .line 88
    :try_start_5
    invoke-virtual {v8, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 89
    new-instance v23, Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    invoke-virtual {v4, v15}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v24

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v26

    .line 90
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v27

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v23 .. v29}, Lio/piupiu/chat/ProtectedFrontendManager$Segment;-><init>(JIILjava/lang/String;Ljava/lang/String;)V

    aput-object v23, v20, v7

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v4, v20

    goto :goto_2

    :cond_2
    move-object/from16 v20, v4

    .line 92
    iget-object v4, v1, Lio/piupiu/chat/ProtectedFrontendManager;->entries:Ljava/util/Map;

    new-instance v16, Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v17

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const/16 v21, 0x0

    invoke-direct/range {v16 .. v21}, Lio/piupiu/chat/ProtectedFrontendManager$Entry;-><init>(JLjava/lang/String;[Lio/piupiu/chat/ProtectedFrontendManager$Segment;Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-interface {v4, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_3
    move-object/from16 v22, v0

    move/from16 p1, v4

    .line 94
    new-instance v0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    invoke-virtual {v9, v15}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v15

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 95
    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-wide v13, v15

    const/16 v16, -0x1

    move-object v12, v0

    move v15, v4

    invoke-direct/range {v12 .. v18}, Lio/piupiu/chat/ProtectedFrontendManager$Segment;-><init>(JIILjava/lang/String;Ljava/lang/String;)V

    .line 96
    iget-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->entries:Ljava/util/Map;

    new-instance v13, Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    new-array v4, v8, [Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    aput-object v12, v4, p1

    const-string v7, "sha256"

    invoke-virtual {v9, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const-wide/16 v14, -0x1

    move-object/from16 v17, v4

    invoke-direct/range {v13 .. v18}, Lio/piupiu/chat/ProtectedFrontendManager$Entry;-><init>(JLjava/lang/String;[Lio/piupiu/chat/ProtectedFrontendManager$Segment;Ljava/lang/String;)V

    invoke-interface {v0, v6, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3
    move/from16 v4, p1

    move-object/from16 v0, v22

    const/4 v7, 0x3

    goto/16 :goto_1

    :cond_4
    move/from16 p1, v4

    .line 99
    iget-object v0, v1, Lio/piupiu/chat/ProtectedFrontendManager;->entries:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    xor-int/lit8 v4, v0, 0x1

    .line 100
    :try_start_6
    const-string v0, "PF_MANIFEST_OK"

    const/4 v5, 0x0

    invoke-direct {v1, v0, v2, v3, v5}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_5

    :catch_1
    move-exception v0

    move/from16 v4, p1

    goto :goto_4

    :catch_2
    move-exception v0

    move/from16 p1, v4

    .line 102
    :goto_4
    const-string v5, "PF_MANIFEST_MISSING"

    invoke-direct {v1, v5, v2, v3, v0}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V

    .line 104
    :goto_5
    iput-boolean v4, v1, Lio/piupiu/chat/ProtectedFrontendManager;->protectedBuild:Z

    return-void
.end method

.method private canonicalV3Aad(Ljava/lang/String;II)[B
    .locals 2

    .line 358
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "3\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->keyId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 359
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    return-object p1
.end method

.method private clearPlaintextCache()V
    .locals 2

    .line 204
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCacheLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    invoke-virtual {v1}, Landroid/util/LruCache;->evictAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private decryptFully(Ljava/lang/String;)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 220
    invoke-direct {p0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->entryForPath(Ljava/lang/String;)Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 222
    iget v1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    .line 223
    iget-object v1, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    aget-object v1, v1, v3

    .line 224
    iget-wide v4, v1, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->offset:J

    iget v2, v1, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->length:I

    invoke-direct {p0, v4, v5, v2}, Lio/piupiu/chat/ProtectedFrontendManager;->readPakRange(JI)[B

    move-result-object v2

    invoke-direct {p0, p1, v3, v1, v2}, Lio/piupiu/chat/ProtectedFrontendManager;->decryptSegment(Ljava/lang/String;ILio/piupiu/chat/ProtectedFrontendManager$Segment;[B)[B

    move-result-object p1

    .line 225
    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->legacySha256:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    .line 226
    :cond_0
    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 227
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "Protected frontend plaintext hash mismatch"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 231
    :cond_1
    iget-wide v1, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->plaintextLength:J

    const-wide/32 v4, 0x7fffffff

    cmp-long v1, v1, v4

    if-gtz v1, :cond_3

    .line 232
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    iget-wide v4, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->plaintextLength:J

    long-to-int v2, v4

    invoke-direct {v1, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 233
    :goto_0
    iget-object v2, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    array-length v2, v2

    if-ge v3, v2, :cond_2

    .line 234
    iget-object v2, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    aget-object v2, v2, v3

    .line 235
    iget-wide v4, v2, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->offset:J

    iget v6, v2, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->length:I

    invoke-direct {p0, v4, v5, v6}, Lio/piupiu/chat/ProtectedFrontendManager;->readPakRange(JI)[B

    move-result-object v4

    invoke-direct {p0, p1, v3, v2, v4}, Lio/piupiu/chat/ProtectedFrontendManager;->decryptSegment(Ljava/lang/String;ILio/piupiu/chat/ProtectedFrontendManager$Segment;[B)[B

    move-result-object v2

    .line 236
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 238
    :cond_2
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1

    .line 231
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Protected resource is too large"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 221
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "Unknown protected path"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private decryptSegment(Ljava/lang/String;ILio/piupiu/chat/ProtectedFrontendManager$Segment;[B)[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 242
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 243
    iget-object v2, p3, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->tag:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 244
    array-length v4, p4

    array-length v5, v2

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 245
    const-string v5, "AES/GCM/NoPadding"

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v5

    .line 246
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->requireContentKey()[B

    move-result-object v7

    const-string v8, "AES"

    invoke-direct {v6, v7, v8}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v7, Ljavax/crypto/spec/GCMParameterSpec;

    iget-object v8, p3, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->iv:Ljava/lang/String;

    .line 247
    invoke-static {v8, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    const/16 v8, 0x80

    invoke-direct {v7, v8, v3}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    const/4 v3, 0x2

    .line 246
    invoke-virtual {v5, v3, v6, v7}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 248
    iget v3, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    const/4 v6, 0x3

    if-ne v3, v6, :cond_0

    .line 249
    iget v3, p3, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->plaintextLength:I

    invoke-direct {p0, p1, p2, v3}, Lio/piupiu/chat/ProtectedFrontendManager;->canonicalV3Aad(Ljava/lang/String;II)[B

    move-result-object p1

    goto :goto_0

    .line 250
    :cond_0
    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 248
    :goto_0
    invoke-virtual {v5, p1}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 252
    :try_start_0
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {v5, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    .line 253
    iget p2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    if-ne p2, v6, :cond_2

    array-length p2, p1

    iget p3, p3, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->plaintextLength:I

    if-ne p2, p3, :cond_1

    goto :goto_1

    .line 254
    :cond_1
    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Protected segment length mismatch"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 256
    :cond_2
    :goto_1
    const-string p2, "PF_SEGMENT_OK"

    const/4 p3, 0x0

    invoke-direct {p0, p2, v0, v1, p3}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 262
    invoke-static {p4}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    invoke-static {p2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    .line 259
    :try_start_1
    const-string p2, "PF_SEGMENT_FAIL"

    invoke-direct {p0, p2, v0, v1, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V

    .line 260
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 262
    :goto_2
    invoke-static {p4}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    invoke-static {p2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 263
    throw p1
.end method

.method static deriveV3Keys([BLjava/lang/String;)[[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 326
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 327
    const-string v1, "piupiu-frontend-v3\u0000"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 328
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    .line 329
    invoke-static {p1, p0}, Lio/piupiu/chat/ProtectedFrontendManager;->hmacSha256([B[B)[B

    move-result-object p0

    .line 330
    const-string v0, "piupiu/frontend/content/v3"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    const/16 v1, 0x20

    invoke-static {p0, v0, v1}, Lio/piupiu/chat/ProtectedFrontendManager;->hkdfExpand([B[BI)[B

    move-result-object v0

    .line 331
    const-string v2, "piupiu/frontend/path-index/v3"

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-static {p0, v2, v1}, Lio/piupiu/chat/ProtectedFrontendManager;->hkdfExpand([B[BI)[B

    move-result-object v1

    .line 332
    invoke-static {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 333
    filled-new-array {v0, v1}, [[B

    move-result-object p0

    return-object p0
.end method

.method private diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V
    .locals 3

    .line 378
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr v0, p2

    const-wide/32 p2, 0xf4240

    div-long/2addr v0, p2

    .line 379
    iget-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    const/16 p3, 0xc

    if-lt p2, p3, :cond_0

    iget-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p2, v2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    :goto_0
    if-nez p4, :cond_1

    .line 380
    const-string p3, "none"

    goto :goto_1

    :cond_1
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    .line 381
    :goto_1
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v2, "event="

    invoke-direct {p4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p4, " bundle="

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " dur_ms="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " error="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "PiuPiuProtectedFrontend"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private entryForPath(Ljava/lang/String;)Lio/piupiu/chat/ProtectedFrontendManager$Entry;
    .locals 2

    .line 306
    :try_start_0
    iget v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 307
    invoke-direct {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->requireIndexKey()[B

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {v0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->hmacSha256Hex([B[B)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 308
    :cond_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->sha256Hex([B)Ljava/lang/String;

    move-result-object p1

    .line 309
    :goto_0
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->entries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/piupiu/chat/ProtectedFrontendManager$Entry;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private static equalNullable([B[B)Z
    .locals 0

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 374
    :cond_0
    invoke-static {p0, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p0

    return p0

    :cond_1
    :goto_0
    if-ne p0, p1, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method private getOrDecrypt(Ljava/lang/String;Lio/piupiu/chat/ProtectedFrontendManager$Entry;)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 207
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCacheLock:Ljava/lang/Object;

    monitor-enter v0

    .line 208
    :try_start_0
    iget-object v1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    invoke-virtual {v1, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    if-eqz v1, :cond_0

    .line 209
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    monitor-exit v0

    return-object p1

    .line 210
    :cond_0
    invoke-direct {p0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->decryptFully(Ljava/lang/String;)[B

    move-result-object v1

    .line 211
    iget-wide v2, p2, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->plaintextLength:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    iget-wide v2, p2, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->plaintextLength:J

    const-wide/32 v4, 0x80000

    cmp-long p2, v2, v4

    if-gtz p2, :cond_1

    goto :goto_0

    .line 215
    :cond_1
    monitor-exit v0

    return-object v1

    .line 212
    :cond_2
    :goto_0
    iget-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    invoke-virtual {p2, p1, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    .line 216
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private static hex([B)Ljava/lang/String;
    .locals 6

    .line 369
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 370
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v5, "%02x"

    invoke-static {v4, v5, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 371
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static hkdfExpand([B[BI)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 337
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    const/4 v1, 0x0

    .line 338
    new-array v2, v1, [B

    const/4 v3, 0x1

    move v4, v3

    .line 339
    :goto_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    if-ge v5, p2, :cond_0

    .line 340
    const-string v5, "HmacSHA256"

    invoke-static {v5}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v6

    .line 341
    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v7, p0, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v7}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 342
    invoke-virtual {v6, v2}, Ljavax/crypto/Mac;->update([B)V

    invoke-virtual {v6, p1}, Ljavax/crypto/Mac;->update([B)V

    int-to-byte v5, v4

    invoke-virtual {v6, v5}, Ljavax/crypto/Mac;->update(B)V

    .line 343
    invoke-virtual {v6}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v5

    .line 344
    array-length v6, v5

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    sub-int v7, p2, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-virtual {v0, v5, v1, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 345
    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    add-int/2addr v4, v3

    move-object v2, v5

    goto :goto_0

    .line 347
    :cond_0
    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 348
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method private static hmacSha256([B[B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 352
    const-string v0, "HmacSHA256"

    invoke-static {v0}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v1

    .line 353
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v2, p0, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v1, v2}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 354
    invoke-virtual {v1, p1}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object p0

    return-object p0
.end method

.method private static hmacSha256Hex([B[B)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 356
    invoke-static {p0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->hmacSha256([B[B)[B

    move-result-object p0

    invoke-static {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->hex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    .line 363
    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 364
    :goto_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method private readAssetText(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 297
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v1, 0x2000

    .line 298
    :try_start_1
    new-array v1, v1, [B

    .line 299
    :cond_0
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-ltz v2, :cond_1

    if-lez v2, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 300
    :cond_1
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_2
    return-object v1

    :catchall_0
    move-exception v1

    .line 297
    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz p1, :cond_3

    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p1

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v0
.end method

.method private readPakRange(JI)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 267
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "public/frontend-code.pak"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    .line 268
    :try_start_0
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 269
    :try_start_2
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v3

    add-long/2addr v3, p1

    invoke-virtual {v2, v3, v4}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 270
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 271
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 272
    invoke-virtual {v2, p1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result p2

    if-ltz p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Unexpected end of protected frontend package"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 274
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_2

    .line 275
    :try_start_3
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_2
    if-eqz v1, :cond_3

    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    :cond_3
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V

    :cond_4
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz v2, :cond_5

    .line 267
    :try_start_5
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p2

    :try_start_6
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v1, :cond_6

    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p2

    :try_start_8
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_2
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :catchall_4
    move-exception p1

    if-eqz v0, :cond_7

    :try_start_9
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_3

    :catchall_5
    move-exception p2

    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7
    :goto_3
    throw p1
.end method

.method private requireContentKey()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 314
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    if-eqz v0, :cond_0

    return-object v0

    .line 315
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "Protected frontend is locked"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private requireIndexKey()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 320
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B

    if-eqz v0, :cond_0

    return-object v0

    .line 321
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "Protected frontend path index is locked"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static sha256Hex([B)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 367
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    invoke-static {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->hex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private declared-synchronized verifyPakHash()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 279
    :try_start_0
    iget-boolean v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pakVerified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 280
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 281
    const-string v2, "SHA-256"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 282
    iget-object v3, p0, Lio/piupiu/chat/ProtectedFrontendManager;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "public/frontend-code.pak"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/high16 v4, 0x10000

    .line 283
    :try_start_2
    new-array v4, v4, [B

    .line 285
    :cond_1
    :goto_0
    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-ltz v5, :cond_2

    if-lez v5, :cond_1

    const/4 v6, 0x0

    invoke-virtual {v2, v4, v6, v5}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 286
    :cond_2
    invoke-static {v4}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_3

    .line 287
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 288
    :cond_3
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->hex([B)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v2, 0x1

    .line 292
    iput-boolean v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pakVerified:Z

    .line 293
    const-string v2, "PF_PAK_OK"

    const/4 v3, 0x0

    invoke-direct {p0, v2, v0, v1, v3}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 294
    monitor-exit p0

    return-void

    .line 289
    :cond_4
    :try_start_4
    new-instance v2, Ljava/security/GeneralSecurityException;

    const-string v3, "Protected frontend package hash mismatch"

    invoke-direct {v2, v3}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 290
    const-string v3, "PF_PAK_FAIL"

    invoke-direct {p0, v3, v0, v1, v2}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_0
    move-exception v0

    if-eqz v3, :cond_5

    .line 282
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    :try_start_6
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    throw v0

    :catchall_2
    move-exception v0

    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v0
.end method

.method private static wipe([B)V
    .locals 1

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 376
    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_0
    return-void
.end method


# virtual methods
.method declared-synchronized destroy()V
    .locals 1

    monitor-enter p0

    .line 199
    :try_start_0
    invoke-direct {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->clearPlaintextCache()V

    .line 200
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    invoke-static {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B

    invoke-static {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    const/4 v0, 0x0

    .line 201
    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B

    const-string v0, "destroyed"

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method getBootstrapState()Lorg/json/JSONObject;
    .locals 3

    .line 175
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 177
    :try_start_0
    const-string v1, "status"

    iget-boolean v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->protectedBuild:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v2, "unprotected"

    :goto_0
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 178
    const-string v1, "message"

    iget-object v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    invoke-virtual {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "startup"

    iget-object v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->startup:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-object v0
.end method

.method getBundleSha256()Ljava/lang/String;
    .locals 1

    .line 109
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->bundleSha256:Ljava/lang/String;

    return-object v0
.end method

.method getBundleVersion()Ljava/lang/String;
    .locals 1

    .line 108
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->bundleVersion:Ljava/lang/String;

    return-object v0
.end method

.method getFormatVersion()I
    .locals 1

    .line 111
    iget v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    return v0
.end method

.method getKeyId()Ljava/lang/String;
    .locals 1

    .line 110
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->keyId:Ljava/lang/String;

    return-object v0
.end method

.method isProtectedBuild()Z
    .locals 1

    .line 107
    iget-boolean v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->protectedBuild:Z

    return v0
.end method

.method isReady()Z
    .locals 2

    .line 112
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    if-eqz v0, :cond_1

    iget v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B

    if-eqz v0, :cond_1

    :cond_0
    const-string v0, "ready"

    iget-object v1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method markAccountInvalid(Ljava/lang/String;)V
    .locals 3

    .line 167
    invoke-virtual {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 168
    :cond_0
    const-string v0, "account_invalid"

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 169
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 170
    :cond_1
    const-string p1, "\u767b\u5f55\u72b6\u6001\u5df2\u5931\u6548\uff0c\u8bf7\u91cd\u65b0\u767b\u5f55"

    :cond_2
    iput-object p1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    .line 171
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const/4 p1, 0x0

    const-string v2, "PF_ACCOUNT_INVALID"

    invoke-direct {p0, v2, v0, v1, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V

    return-void
.end method

.method markAccountRequired()V
    .locals 4

    .line 160
    invoke-virtual {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 161
    :cond_0
    const-string v0, "account_required"

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    .line 162
    const-string v0, "\u8bf7\u767b\u5f55\u8d26\u53f7\u4ee5\u89e3\u9501\u6a21\u62df\u5668\u6216\u865a\u62df\u673a"

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    .line 163
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const/4 v2, 0x0

    const-string v3, "PF_ACCOUNT_REQUIRED"

    invoke-direct {p0, v3, v0, v1, v2}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V

    return-void
.end method

.method markChecking()V
    .locals 1

    .line 151
    const-string v0, ""

    invoke-virtual {p0, v0}, Lio/piupiu/chat/ProtectedFrontendManager;->markChecking(Ljava/lang/String;)V

    return-void
.end method

.method markChecking(Ljava/lang/String;)V
    .locals 1

    .line 152
    invoke-virtual {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "checking"

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    iput-object p1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method markError(Ljava/lang/String;Z)V
    .locals 1

    .line 154
    invoke-virtual {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    .line 155
    const-string p2, "rejected"

    goto :goto_0

    :cond_1
    const-string p2, "error"

    :goto_0
    iput-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    if-nez p1, :cond_2

    .line 156
    const-string p1, ""

    :cond_2
    iput-object p1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    return-void
.end method

.method open(Ljava/lang/String;)Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 185
    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 186
    invoke-direct {p0, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->entryForPath(Ljava/lang/String;)Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 188
    :cond_0
    invoke-virtual {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->isReady()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 189
    iget v1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    iget-wide v1, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->plaintextLength:J

    const-wide/32 v3, 0x80000

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    .line 190
    new-instance v1, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;

    iget-object v2, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->mime:Ljava/lang/String;

    new-instance v3, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;

    invoke-direct {v3, p0, p1, v0}, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;-><init>(Lio/piupiu/chat/ProtectedFrontendManager;Ljava/lang/String;Lio/piupiu/chat/ProtectedFrontendManager$Entry;)V

    invoke-direct {v1, v2, v3}, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;-><init>(Ljava/lang/String;Ljava/io/InputStream;)V

    return-object v1

    .line 192
    :cond_1
    new-instance v1, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;

    iget-object v2, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->mime:Ljava/lang/String;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {p0, p1, v0}, Lio/piupiu/chat/ProtectedFrontendManager;->getOrDecrypt(Ljava/lang/String;Lio/piupiu/chat/ProtectedFrontendManager$Entry;)[B

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v2, v3}, Lio/piupiu/chat/ProtectedFrontendManager$DecryptedResource;-><init>(Ljava/lang/String;Ljava/io/InputStream;)V

    return-object v1

    .line 188
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Protected frontend is locked"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method trimMemory(I)V
    .locals 1

    const/16 v0, 0xa

    if-lt p1, v0, :cond_0

    .line 196
    invoke-direct {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->clearPlaintextCache()V

    :cond_0
    return-void
.end method

.method declared-synchronized unlock([B)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 115
    :try_start_0
    iget-boolean v0, p0, Lio/piupiu/chat/ProtectedFrontendManager;->protectedBuild:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    if-eqz p1, :cond_4

    .line 116
    :try_start_1
    array-length v0, p1

    const/16 v1, 0x20

    if-ne v0, v1, :cond_4

    .line 117
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 118
    invoke-direct {p0}, Lio/piupiu/chat/ProtectedFrontendManager;->verifyPakHash()V

    .line 119
    iget v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->formatVersion:I

    const/4 v3, 0x3

    const/4 v4, 0x0

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->keyId:Ljava/lang/String;

    invoke-static {p1, v2}, Lio/piupiu/chat/ProtectedFrontendManager;->deriveV3Keys([BLjava/lang/String;)[[B

    move-result-object p1

    goto :goto_0

    .line 120
    :cond_1
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    filled-new-array {p1, v4}, [[B

    move-result-object p1

    :goto_0
    const/4 v2, 0x0

    .line 121
    aget-object v2, p1, v2

    const/4 v3, 0x1

    .line 122
    aget-object p1, p1, v3

    .line 123
    iget-object v3, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCacheLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 124
    :try_start_2
    iget-object v5, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    .line 125
    iget-object v6, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B

    if-eqz v5, :cond_2

    .line 126
    const-string v7, "ready"

    iget-object v8, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 127
    invoke-static {v5, v2}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-static {v6, p1}, Lio/piupiu/chat/ProtectedFrontendManager;->equalNullable([B[B)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 128
    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    .line 130
    :cond_2
    :try_start_3
    iget-object v7, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    invoke-virtual {v7}, Landroid/util/LruCache;->evictAll()V

    .line 131
    iput-object v2, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    .line 132
    iput-object p1, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 134
    :try_start_4
    const-string v7, "index.html"

    invoke-direct {p0, v7}, Lio/piupiu/chat/ProtectedFrontendManager;->decryptFully(Ljava/lang/String;)[B

    move-result-object v7

    .line 135
    array-length v8, v7

    const/high16 v9, 0x80000

    if-gt v8, v9, :cond_3

    iget-object v8, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    const-string v9, "index.html"

    invoke-virtual {v8, v9, v7}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    invoke-static {v7}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 136
    :goto_1
    const-string v7, "ready"

    iput-object v7, p0, Lio/piupiu/chat/ProtectedFrontendManager;->status:Ljava/lang/String;

    .line 137
    const-string v7, ""

    iput-object v7, p0, Lio/piupiu/chat/ProtectedFrontendManager;->message:Ljava/lang/String;

    .line 138
    invoke-static {v5}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-static {v6}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 139
    const-string v7, "PF_UNLOCK_OK"

    invoke-direct {p0, v7, v0, v1, v4}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 148
    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 149
    monitor-exit p0

    return-void

    :catch_0
    move-exception v4

    .line 141
    :try_start_6
    iget-object v7, p0, Lio/piupiu/chat/ProtectedFrontendManager;->decryptedCache:Landroid/util/LruCache;

    invoke-virtual {v7}, Landroid/util/LruCache;->evictAll()V

    .line 142
    iput-object v5, p0, Lio/piupiu/chat/ProtectedFrontendManager;->contentKey:[B

    .line 143
    iput-object v6, p0, Lio/piupiu/chat/ProtectedFrontendManager;->pathIndexKey:[B

    .line 144
    invoke-static {v2}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    invoke-static {p1}, Lio/piupiu/chat/ProtectedFrontendManager;->wipe([B)V

    .line 145
    const-string p1, "PF_UNLOCK_FAIL"

    invoke-direct {p0, p1, v0, v1, v4}, Lio/piupiu/chat/ProtectedFrontendManager;->diagnostic(Ljava/lang/String;JLjava/lang/Throwable;)V

    .line 146
    throw v4

    :catchall_0
    move-exception p1

    .line 148
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw p1

    .line 116
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid frontend content key"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1
.end method
