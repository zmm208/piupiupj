package kotlinx.coroutines.channels;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: BufferedChannel.kt */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(m69k = 3, m70mv = {2, 1, 0}, m72xi = 48)
@DebugMetadata(m86c = "kotlinx.coroutines.channels.BufferedChannel", m87f = "BufferedChannel.kt", m88i = {}, m89l = {759}, m90m = "receiveCatching-JP2dKIU$suspendImpl", m91n = {}, m93s = {})
final class BufferedChannel$receiveCatching$1<E> extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ BufferedChannel<E> this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    BufferedChannel$receiveCatching$1(BufferedChannel<E> bufferedChannel, Continuation<? super BufferedChannel$receiveCatching$1> continuation) {
        super(continuation);
        this.this$0 = bufferedChannel;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM1858receiveCatchingJP2dKIU$suspendImpl = BufferedChannel.m1858receiveCatchingJP2dKIU$suspendImpl(this.this$0, this);
        return objM1858receiveCatchingJP2dKIU$suspendImpl == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM1858receiveCatchingJP2dKIU$suspendImpl : ChannelResult.m1868boximpl(objM1858receiveCatchingJP2dKIU$suspendImpl);
    }
}
