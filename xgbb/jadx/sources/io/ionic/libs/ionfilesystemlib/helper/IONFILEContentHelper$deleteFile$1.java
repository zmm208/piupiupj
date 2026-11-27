package io.ionic.libs.ionfilesystemlib.helper;

import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: IONFILEContentHelper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILEContentHelper", m87f = "IONFILEContentHelper.kt", m88i = {}, m89l = {112}, m90m = "deleteFile-gIAlu-s", m91n = {}, m93s = {})
final class IONFILEContentHelper$deleteFile$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEContentHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEContentHelper$deleteFile$1(IONFILEContentHelper iONFILEContentHelper, Continuation<? super IONFILEContentHelper$deleteFile$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEContentHelper;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM282deleteFilegIAlus = this.this$0.m282deleteFilegIAlus(null, this);
        return objM282deleteFilegIAlus == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM282deleteFilegIAlus : Result.m344boximpl(objM282deleteFilegIAlus);
    }
}
