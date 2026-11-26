package kotlinx.coroutines.flow;

import androidx.core.view.MotionEventCompat;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: Channels.kt */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(m69k = 3, m70mv = {2, 1, 0}, m72xi = 48)
@DebugMetadata(m86c = "kotlinx.coroutines.flow.FlowKt__ChannelsKt", m87f = "Channels.kt", m88i = {0, 0, 0, 1, 1, 1}, m89l = {32, MotionEventCompat.AXIS_GENERIC_2}, m90m = "emitAllImpl$FlowKt__ChannelsKt", m91n = {"$this$emitAllImpl", "channel", "consume", "$this$emitAllImpl", "channel", "consume"}, m93s = {"L$0", "L$1", "Z$0", "L$0", "L$1", "Z$0"})
final class FlowKt__ChannelsKt$emitAllImpl$1<T> extends ContinuationImpl {
    Object L$0;
    Object L$1;
    Object L$2;
    boolean Z$0;
    int label;
    /* synthetic */ Object result;

    FlowKt__ChannelsKt$emitAllImpl$1(Continuation<? super FlowKt__ChannelsKt$emitAllImpl$1> continuation) {
        super(continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return FlowKt__ChannelsKt.emitAllImpl$FlowKt__ChannelsKt(null, null, false, this);
    }
}
