package kotlinx.coroutines.flow;

import com.getcapacitor.PluginMethod;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.JobKt;
import kotlinx.coroutines.flow.internal.AbortFlowException;
import kotlinx.coroutines.flow.internal.FlowExceptions_commonKt;

/* JADX INFO: compiled from: Logic.kt */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(m67d1 = {"\u0000\u001e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u001aB\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\"\u0010\u0004\u001a\u001e\b\u0001\u0012\u0004\u0012\u0002H\u0002\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0005H\u0086@¢\u0006\u0002\u0010\b\u001aB\u0010\t\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\"\u0010\u0004\u001a\u001e\b\u0001\u0012\u0004\u0012\u0002H\u0002\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0005H\u0086@¢\u0006\u0002\u0010\b\u001aB\u0010\n\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\"\u0010\u0004\u001a\u001e\b\u0001\u0012\u0004\u0012\u0002H\u0002\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0005H\u0086@¢\u0006\u0002\u0010\b¨\u0006\u000b"}, m68d2 = {"any", "", "T", "Lkotlinx/coroutines/flow/Flow;", "predicate", "Lkotlin/Function2;", "Lkotlin/coroutines/Continuation;", "", "(Lkotlinx/coroutines/flow/Flow;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "all", PluginMethod.RETURN_NONE, "kotlinx-coroutines-core"}, m69k = 5, m70mv = {2, 1, 0}, m72xi = 48, m73xs = "kotlinx/coroutines/flow/FlowKt")
final /* synthetic */ class FlowKt__LogicKt {

    /* JADX INFO: renamed from: kotlinx.coroutines.flow.FlowKt__LogicKt$all$1 */
    /* JADX INFO: compiled from: Logic.kt */
    @Metadata(m69k = 3, m70mv = {2, 1, 0}, m72xi = 48)
    @DebugMetadata(m86c = "kotlinx.coroutines.flow.FlowKt__LogicKt", m87f = "Logic.kt", m88i = {0, 0}, m89l = {119}, m90m = "all", m91n = {"foundCounterExample", "collector$iv"}, m93s = {"L$0", "L$1"})
    static final class C11541<T> extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        C11541(Continuation<? super C11541> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return FlowKt.all(null, null, this);
        }
    }

    /* JADX INFO: renamed from: kotlinx.coroutines.flow.FlowKt__LogicKt$any$1 */
    /* JADX INFO: compiled from: Logic.kt */
    @Metadata(m69k = 3, m70mv = {2, 1, 0}, m72xi = 48)
    @DebugMetadata(m86c = "kotlinx.coroutines.flow.FlowKt__LogicKt", m87f = "Logic.kt", m88i = {0, 0}, m89l = {119}, m90m = "any", m91n = {"found", "collector$iv"}, m93s = {"L$0", "L$1"})
    static final class C11561<T> extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        C11561(Continuation<? super C11561> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return FlowKt.any(null, null, this);
        }
    }

    /* JADX INFO: renamed from: kotlinx.coroutines.flow.FlowKt__LogicKt$none$1 */
    /* JADX INFO: compiled from: Logic.kt */
    @Metadata(m69k = 3, m70mv = {2, 1, 0}, m72xi = 48)
    @DebugMetadata(m86c = "kotlinx.coroutines.flow.FlowKt__LogicKt", m87f = "Logic.kt", m88i = {}, m89l = {107}, m90m = PluginMethod.RETURN_NONE, m91n = {}, m93s = {})
    static final class C11571<T> extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        C11571(Continuation<? super C11571> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return FlowKt.none(null, null, this);
        }
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public static final <T> Object any(Flow<? extends T> flow, Function2<? super T, ? super Continuation<? super Boolean>, ? extends Object> function2, Continuation<? super Boolean> continuation) throws Throwable {
        C11561 c11561;
        Ref.BooleanRef booleanRef;
        AbortFlowException e;
        FlowCollector<? super Object> flowCollector;
        if (continuation instanceof C11561) {
            c11561 = (C11561) continuation;
            if ((c11561.label & Integer.MIN_VALUE) != 0) {
                c11561.label -= Integer.MIN_VALUE;
            } else {
                c11561 = new C11561(continuation);
            }
        } else {
            c11561 = new C11561(continuation);
        }
        Object obj = c11561.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        int i = c11561.label;
        if (i == 0) {
            ResultKt.throwOnFailure(obj);
            Ref.BooleanRef booleanRef2 = new Ref.BooleanRef();
            FlowCollector<? super Object> flowKt__LogicKt$any$$inlined$collectWhile$1 = new FlowKt__LogicKt$any$$inlined$collectWhile$1<>(function2, booleanRef2);
            try {
                c11561.L$0 = booleanRef2;
                c11561.L$1 = flowKt__LogicKt$any$$inlined$collectWhile$1;
                c11561.label = 1;
                if (flow.collect(flowKt__LogicKt$any$$inlined$collectWhile$1, c11561) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                booleanRef = booleanRef2;
            } catch (AbortFlowException e2) {
                booleanRef = booleanRef2;
                e = e2;
                flowCollector = flowKt__LogicKt$any$$inlined$collectWhile$1;
                FlowExceptions_commonKt.checkOwnership(e, flowCollector);
                JobKt.ensureActive(c11561.get$context());
            }
        } else {
            if (i != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            flowCollector = (FlowKt__LogicKt$any$$inlined$collectWhile$1) c11561.L$1;
            booleanRef = (Ref.BooleanRef) c11561.L$0;
            try {
                ResultKt.throwOnFailure(obj);
            } catch (AbortFlowException e3) {
                e = e3;
                FlowExceptions_commonKt.checkOwnership(e, flowCollector);
                JobKt.ensureActive(c11561.get$context());
            }
        }
        return Boxing.boxBoolean(booleanRef.element);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public static final <T> Object all(Flow<? extends T> flow, Function2<? super T, ? super Continuation<? super Boolean>, ? extends Object> function2, Continuation<? super Boolean> continuation) throws Throwable {
        C11541 c11541;
        Ref.BooleanRef booleanRef;
        AbortFlowException e;
        FlowCollector<? super Object> flowCollector;
        if (continuation instanceof C11541) {
            c11541 = (C11541) continuation;
            if ((c11541.label & Integer.MIN_VALUE) != 0) {
                c11541.label -= Integer.MIN_VALUE;
            } else {
                c11541 = new C11541(continuation);
            }
        } else {
            c11541 = new C11541(continuation);
        }
        Object obj = c11541.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        int i = c11541.label;
        if (i == 0) {
            ResultKt.throwOnFailure(obj);
            Ref.BooleanRef booleanRef2 = new Ref.BooleanRef();
            FlowCollector<? super Object> flowKt__LogicKt$all$$inlined$collectWhile$1 = new FlowKt__LogicKt$all$$inlined$collectWhile$1<>(function2, booleanRef2);
            try {
                c11541.L$0 = booleanRef2;
                c11541.L$1 = flowKt__LogicKt$all$$inlined$collectWhile$1;
                c11541.label = 1;
                if (flow.collect(flowKt__LogicKt$all$$inlined$collectWhile$1, c11541) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                booleanRef = booleanRef2;
            } catch (AbortFlowException e2) {
                booleanRef = booleanRef2;
                e = e2;
                flowCollector = flowKt__LogicKt$all$$inlined$collectWhile$1;
                FlowExceptions_commonKt.checkOwnership(e, flowCollector);
                JobKt.ensureActive(c11541.get$context());
            }
        } else {
            if (i != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            flowCollector = (FlowKt__LogicKt$all$$inlined$collectWhile$1) c11541.L$1;
            booleanRef = (Ref.BooleanRef) c11541.L$0;
            try {
                ResultKt.throwOnFailure(obj);
            } catch (AbortFlowException e3) {
                e = e3;
                FlowExceptions_commonKt.checkOwnership(e, flowCollector);
                JobKt.ensureActive(c11541.get$context());
            }
        }
        return Boxing.boxBoolean(!booleanRef.element);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public static final <T> Object none(Flow<? extends T> flow, Function2<? super T, ? super Continuation<? super Boolean>, ? extends Object> function2, Continuation<? super Boolean> continuation) throws Throwable {
        C11571 c11571;
        if (continuation instanceof C11571) {
            c11571 = (C11571) continuation;
            if ((c11571.label & Integer.MIN_VALUE) != 0) {
                c11571.label -= Integer.MIN_VALUE;
            } else {
                c11571 = new C11571(continuation);
            }
        } else {
            c11571 = new C11571(continuation);
        }
        Object objAny = c11571.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        int i = c11571.label;
        if (i == 0) {
            ResultKt.throwOnFailure(objAny);
            c11571.label = 1;
            objAny = FlowKt.any(flow, function2, c11571);
            if (objAny == coroutine_suspended) {
                return coroutine_suspended;
            }
        } else {
            if (i != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.throwOnFailure(objAny);
        }
        return Boxing.boxBoolean(!((Boolean) objAny).booleanValue());
    }
}
