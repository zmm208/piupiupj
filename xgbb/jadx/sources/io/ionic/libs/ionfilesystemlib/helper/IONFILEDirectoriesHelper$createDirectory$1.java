package io.ionic.libs.ionfilesystemlib.helper;

import androidx.core.view.MotionEventCompat;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* JADX INFO: compiled from: IONFILEDirectoriesHelper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILEDirectoriesHelper", m87f = "IONFILEDirectoriesHelper.kt", m88i = {}, m89l = {MotionEventCompat.AXIS_GENERIC_14}, m90m = "createDirectory-0E7RQCE", m91n = {}, m93s = {})
final class IONFILEDirectoriesHelper$createDirectory$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ IONFILEDirectoriesHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEDirectoriesHelper$createDirectory$1(IONFILEDirectoriesHelper iONFILEDirectoriesHelper, Continuation<? super IONFILEDirectoriesHelper$createDirectory$1> continuation) {
        super(continuation);
        this.this$0 = iONFILEDirectoriesHelper;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM286createDirectory0E7RQCE = this.this$0.m286createDirectory0E7RQCE(null, null, this);
        return objM286createDirectory0E7RQCE == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objM286createDirectory0E7RQCE : Result.m344boximpl(objM286createDirectory0E7RQCE);
    }
}
