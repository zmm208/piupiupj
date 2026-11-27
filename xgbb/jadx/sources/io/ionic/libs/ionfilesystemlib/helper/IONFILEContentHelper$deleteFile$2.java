package io.ionic.libs.ionfilesystemlib.helper;

import android.net.Uri;
import io.ionic.libs.ionfilesystemlib.model.IONFILEExceptions;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;

/* JADX INFO: compiled from: IONFILEContentHelper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m67d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u008a@"}, m68d2 = {"<anonymous>", "Lkotlin/Result;", "", "Lkotlinx/coroutines/CoroutineScope;"}, m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILEContentHelper$deleteFile$2", m87f = "IONFILEContentHelper.kt", m88i = {}, m89l = {}, m90m = "invokeSuspend", m91n = {}, m93s = {})
final class IONFILEContentHelper$deleteFile$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Result<? extends Unit>>, Object> {
    final /* synthetic */ Uri $uri;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ IONFILEContentHelper this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILEContentHelper$deleteFile$2(IONFILEContentHelper iONFILEContentHelper, Uri uri, Continuation<? super IONFILEContentHelper$deleteFile$2> continuation) {
        super(2, continuation);
        this.this$0 = iONFILEContentHelper;
        this.$uri = uri;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        IONFILEContentHelper$deleteFile$2 iONFILEContentHelper$deleteFile$2 = new IONFILEContentHelper$deleteFile$2(this.this$0, this.$uri, continuation);
        iONFILEContentHelper$deleteFile$2.L$0 = obj;
        return iONFILEContentHelper$deleteFile$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(CoroutineScope coroutineScope, Continuation<? super Result<? extends Unit>> continuation) {
        return invoke2(coroutineScope, (Continuation<? super Result<Unit>>) continuation);
    }

    /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
    public final Object invoke2(CoroutineScope coroutineScope, Continuation<? super Result<Unit>> continuation) {
        return ((IONFILEContentHelper$deleteFile$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objM345constructorimpl;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.throwOnFailure(obj);
        IONFILEContentHelper iONFILEContentHelper = this.this$0;
        Uri uri = this.$uri;
        try {
            Result.Companion companion = Result.INSTANCE;
            if (iONFILEContentHelper.contentResolver.delete(uri, null, null) > 0) {
                objM345constructorimpl = Result.m345constructorimpl(Unit.INSTANCE);
                return Result.m344boximpl(iONFILEContentHelper.m280mapErrorKWTtemM(objM345constructorimpl, this.$uri));
            }
            throw new IONFILEExceptions.UnknownError(null, 1, null);
        } catch (Throwable th) {
            Result.Companion companion2 = Result.INSTANCE;
            objM345constructorimpl = Result.m345constructorimpl(ResultKt.createFailure(th));
        }
    }
}
