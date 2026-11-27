.class final Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;
.super Ljava/io/InputStream;
.source "ProtectedFrontendManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/piupiu/chat/ProtectedFrontendManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SegmentedInputStream"
.end annotation


# instance fields
.field private closed:Z

.field private current:Ljava/io/ByteArrayInputStream;

.field private currentBytes:[B

.field private final entry:Lio/piupiu/chat/ProtectedFrontendManager$Entry;

.field private final path:Ljava/lang/String;

.field private segmentIndex:I

.field final synthetic this$0:Lio/piupiu/chat/ProtectedFrontendManager;


# direct methods
.method constructor <init>(Lio/piupiu/chat/ProtectedFrontendManager;Ljava/lang/String;Lio/piupiu/chat/ProtectedFrontendManager$Entry;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 392
    iput-object p1, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->this$0:Lio/piupiu/chat/ProtectedFrontendManager;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput-object p2, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->path:Ljava/lang/String;

    iput-object p3, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->entry:Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    const/4 v0, 0x1

    .line 411
    iput-boolean v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->closed:Z

    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->currentBytes:[B

    invoke-static {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->-$$Nest$smwipe([B)V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->currentBytes:[B

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->current:Ljava/io/ByteArrayInputStream;

    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 394
    new-array v1, v0, [B

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v0}, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->read([BII)I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    aget-byte v0, v1, v2

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public read([BII)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 397
    iget-boolean v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->closed:Z

    if-nez v0, :cond_4

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return p1

    .line 399
    :cond_0
    :goto_0
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->current:Ljava/io/ByteArrayInputStream;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 409
    :cond_1
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->current:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result p1

    return p1

    .line 400
    :cond_2
    :goto_1
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->currentBytes:[B

    invoke-static {v0}, Lio/piupiu/chat/ProtectedFrontendManager;->-$$Nest$smwipe([B)V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->currentBytes:[B

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->current:Ljava/io/ByteArrayInputStream;

    .line 401
    iget v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->segmentIndex:I

    iget-object v1, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->entry:Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    iget-object v1, v1, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    array-length v1, v1

    if-lt v0, v1, :cond_3

    const/4 p1, -0x1

    return p1

    .line 402
    :cond_3
    iget-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->entry:Lio/piupiu/chat/ProtectedFrontendManager$Entry;

    iget-object v0, v0, Lio/piupiu/chat/ProtectedFrontendManager$Entry;->segments:[Lio/piupiu/chat/ProtectedFrontendManager$Segment;

    iget v1, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->segmentIndex:I

    aget-object v0, v0, v1

    .line 404
    :try_start_0
    iget-object v2, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->this$0:Lio/piupiu/chat/ProtectedFrontendManager;

    iget-object v3, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->path:Ljava/lang/String;

    iget-wide v4, v0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->offset:J

    iget v6, v0, Lio/piupiu/chat/ProtectedFrontendManager$Segment;->length:I

    .line 405
    invoke-static {v2, v4, v5, v6}, Lio/piupiu/chat/ProtectedFrontendManager;->-$$Nest$mreadPakRange(Lio/piupiu/chat/ProtectedFrontendManager;JI)[B

    move-result-object v4

    .line 404
    invoke-static {v2, v3, v1, v0, v4}, Lio/piupiu/chat/ProtectedFrontendManager;->-$$Nest$mdecryptSegment(Lio/piupiu/chat/ProtectedFrontendManager;Ljava/lang/String;ILio/piupiu/chat/ProtectedFrontendManager$Segment;[B)[B

    move-result-object v0

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->currentBytes:[B

    .line 406
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->currentBytes:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->current:Ljava/io/ByteArrayInputStream;

    iget v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->segmentIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/piupiu/chat/ProtectedFrontendManager$SegmentedInputStream;->segmentIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 407
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Unable to decrypt protected frontend segment"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 397
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Stream is closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
