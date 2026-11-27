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
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILEContentHelper", m87f = "IONFILEContentHelper.kt", m88i = {}, m89l = {134}, m90m = "copyFile-0E7RQCE", m91n = {}, m93s = {})
final class IONFILEContentHelper$copyFile$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEContentHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEContentHelper$copyFile$1(IONFILEContentHelper iONFILEContentHelper, Continuation<? super IONFILEContentHelper$copyFile$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEContentHelper;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM281copyFile0E7RQCE = this.this$0.m281copyFile0E7RQCE(null, null, this);
        return objM281copyFile0E7RQCE == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM281copyFile0E7RQCE : Result.m344boximpl(objM281copyFile0E7RQCE);
    }
}
