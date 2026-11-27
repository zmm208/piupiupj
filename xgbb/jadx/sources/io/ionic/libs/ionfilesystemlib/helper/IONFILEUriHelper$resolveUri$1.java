package io.ionic.libs.ionfilesystemlib.helper;

import androidx.core.view.MotionEventCompat;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: IONFILEUriHelper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILEUriHelper", m87f = "IONFILEUriHelper.kt", m88i = {}, m89l = {MotionEventCompat.AXIS_GENERIC_16, 52, 60}, m90m = "resolveUri-gIAlu-s", m91n = {}, m93s = {})
final class IONFILEUriHelper$resolveUri$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEUriHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEUriHelper$resolveUri$1(IONFILEUriHelper iONFILEUriHelper, Continuation<? super IONFILEUriHelper$resolveUri$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEUriHelper;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM297resolveUrigIAlus = this.this$0.m297resolveUrigIAlus(null, this);
        return objM297resolveUrigIAlus == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM297resolveUrigIAlus : Result.m344boximpl(objM297resolveUrigIAlus);
    }
}
