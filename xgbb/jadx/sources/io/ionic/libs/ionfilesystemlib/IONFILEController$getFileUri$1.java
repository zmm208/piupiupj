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
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.IONFILEController", m87f = "IONFILEController.kt", m88i = {}, m89l = {57}, m90m = "getFileUri-gIAlu-s", m91n = {}, m93s = {})
final class IONFILEController$getFileUri$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEController this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEController$getFileUri$1(IONFILEController iONFILEController, Continuation<? super IONFILEController$getFileUri$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEController;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM273getFileUrigIAlus = this.this$0.m273getFileUrigIAlus(null, this);
        return objM273getFileUrigIAlus == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM273getFileUrigIAlus : Result.m344boximpl(objM273getFileUrigIAlus);
    }
}
