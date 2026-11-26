package io.ionic.libs.ionfilesystemlib.helper;

import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: IONFILELocalFilesHelper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILELocalFilesHelper", m87f = "IONFILELocalFilesHelper.kt", m88i = {}, m89l = {137}, m90m = "saveFile-0E7RQCE", m91n = {}, m93s = {})
final class IONFILELocalFilesHelper$saveFile$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILELocalFilesHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILELocalFilesHelper$saveFile$1(IONFILELocalFilesHelper iONFILELocalFilesHelper, Continuation<? super IONFILELocalFilesHelper$saveFile$1> continuation) {
        super(continuation);
        this.this$0 = iONFILELocalFilesHelper;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM296saveFile0E7RQCE = this.this$0.m296saveFile0E7RQCE(null, null, this);
        return objM296saveFile0E7RQCE == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM296saveFile0E7RQCE : Result.m344boximpl(objM296saveFile0E7RQCE);
    }
}
