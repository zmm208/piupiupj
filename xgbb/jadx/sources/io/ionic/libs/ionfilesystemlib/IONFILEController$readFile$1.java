package io.ionic.libs.ionfilesystemlib;

import androidx.core.location.LocationRequestCompat;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: IONFILEController.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.IONFILEController", m87f = "IONFILEController.kt", m88i = {0, 0}, m89l = {299, LocationRequestCompat.QUALITY_LOW_POWER, 106}, m90m = "readFile-0E7RQCE", m91n = {"this", "options"}, m93s = {"L$0", "L$1"})
final class IONFILEController$readFile$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEController this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEController$readFile$1(IONFILEController iONFILEController, Continuation<? super IONFILEController$readFile$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEController;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM277readFile0E7RQCE = this.this$0.m277readFile0E7RQCE(null, null, this);
        return objM277readFile0E7RQCE == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM277readFile0E7RQCE : Result.m344boximpl(objM277readFile0E7RQCE);
    }
}
