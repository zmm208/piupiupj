package kotlin.concurrent.atomics;

import java.util.concurrent.atomic.AtomicReferenceArray;

/* JADX INFO: renamed from: kotlin.concurrent.atomics.AtomicArraysKt__AtomicArrays_jvmKt$$ExternalSyntheticBackportWithForwarding0 */
/* JADX INFO: compiled from: D8$$SyntheticClass */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class C0984xbd4a3849 {
    /* JADX INFO: renamed from: m */
    public static /* synthetic */ boolean m84m(AtomicReferenceArray atomicReferenceArray, int i, Object obj, Object obj2) {
        while (!atomicReferenceArray.compareAndSet(i, obj, obj2)) {
            if (atomicReferenceArray.get(i) != obj) {
                return false;
            }
        }
        return true;
    }
}
