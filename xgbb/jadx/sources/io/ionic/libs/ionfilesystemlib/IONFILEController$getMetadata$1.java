package io.ionic.libs.ionfilesystemlib;

import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: IONFILEController.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.IONFILEController", m87f = "IONFILEController.kt", m88i = {0}, m89l = {298, 169, 171}, m90m = "getMetadata-gIAlu-s", m91n = {"this"}, m93s = {"L$0"})
final class IONFILEController$getMetadata$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEController this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEController$getMetadata$1(IONFILEController iONFILEController, Continuation<? super IONFILEController$getMetadata$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEController;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM274getMetadatagIAlus = this.this$0.m274getMetadatagIAlus(null, this);
        return objM274getMetadatagIAlus == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM274getMetadatagIAlus : Result.m344boximpl(objM274getMetadatagIAlus);
    }
}
