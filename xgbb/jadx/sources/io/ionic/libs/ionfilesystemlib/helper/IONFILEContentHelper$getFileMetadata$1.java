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
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILEContentHelper", m87f = "IONFILEContentHelper.kt", m88i = {}, m89l = {79}, m90m = "getFileMetadata-gIAlu-s", m91n = {}, m93s = {})
final class IONFILEContentHelper$getFileMetadata$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEContentHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEContentHelper$getFileMetadata$1(IONFILEContentHelper iONFILEContentHelper, Continuation<? super IONFILEContentHelper$getFileMetadata$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEContentHelper;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM283getFileMetadatagIAlus = this.this$0.m283getFileMetadatagIAlus(null, this);
        return objM283getFileMetadatagIAlus == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM283getFileMetadatagIAlus : Result.m344boximpl(objM283getFileMetadatagIAlus);
    }
}
