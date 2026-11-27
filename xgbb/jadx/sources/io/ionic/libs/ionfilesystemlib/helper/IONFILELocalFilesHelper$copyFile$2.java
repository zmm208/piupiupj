package io.ionic.libs.ionfilesystemlib.helper;

import io.ionic.libs.ionfilesystemlib.model.IONFILEExceptions;
import java.io.File;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.p002io.FilesKt;
import kotlinx.coroutines.CoroutineScope;

/* JADX INFO: compiled from: IONFILELocalFilesHelper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m67d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u008a@"}, m68d2 = {"<anonymous>", "Lkotlin/Result;", "", "Lkotlinx/coroutines/CoroutineScope;"}, m69k = 3, m70mv = {1, 9, 0}, m72xi = 48)
@DebugMetadata(m86c = "io.ionic.libs.ionfilesystemlib.helper.IONFILELocalFilesHelper$copyFile$2", m87f = "IONFILELocalFilesHelper.kt", m88i = {}, m89l = {}, m90m = "invokeSuspend", m91n = {}, m93s = {})
final class IONFILELocalFilesHelper$copyFile$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Result<? extends Unit>>, Object> {
    final /* synthetic */ String $destinationPath;
    final /* synthetic */ String $sourcePath;
    private /* synthetic */ Object L$0;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    IONFILELocalFilesHelper$copyFile$2(String str, String str2, Continuation<? super IONFILELocalFilesHelper$copyFile$2> continuation) {
        super(2, continuation);
        this.$sourcePath = str;
        this.$destinationPath = str2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        IONFILELocalFilesHelper$copyFile$2 iONFILELocalFilesHelper$copyFile$2 = new IONFILELocalFilesHelper$copyFile$2(this.$sourcePath, this.$destinationPath, continuation);
        iONFILELocalFilesHelper$copyFile$2.L$0 = obj;
        return iONFILELocalFilesHelper$copyFile$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(CoroutineScope coroutineScope, Continuation<? super Result<? extends Unit>> continuation) {
        return invoke2(coroutineScope, (Continuation<? super Result<Unit>>) continuation);
    }

    /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
    public final Object invoke2(CoroutineScope coroutineScope, Continuation<? super Result<Unit>> continuation) {
        return ((IONFILELocalFilesHelper$copyFile$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objM345constructorimpl;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.throwOnFailure(obj);
        String str = this.$sourcePath;
        String str2 = this.$destinationPath;
        try {
            Result.Companion companion = Result.INSTANCE;
            File file = new File(str);
            File file2 = new File(str2);
            if (!Intrinsics.areEqual(file, file2)) {
                if (!file.exists()) {
                    throw new IONFILEExceptions.DoesNotExist(str, null, 2, null);
                }
                if (file.isDirectory() || file2.isDirectory()) {
                    throw new IONFILEExceptions.CopyRenameFailed.MixingFilesAndDirectories();
                }
                File parentFile = file2.getParentFile();
                if (parentFile != null && !parentFile.exists()) {
                    throw new IONFILEExceptions.CopyRenameFailed.NoParentDirectory();
                }
                if (!FilesKt.copyTo$default(file, file2, true, 0, 4, null).exists()) {
                    throw new IONFILEExceptions.UnknownError(null, 1, null);
                }
            }
            objM345constructorimpl = Result.m345constructorimpl(Unit.INSTANCE);
        } catch (Throwable th) {
            Result.Companion companion2 = Result.INSTANCE;
            objM345constructorimpl = Result.m345constructorimpl(ResultKt.createFailure(th));
        }
        return Result.m344boximpl(objM345constructorimpl);
    }
}
