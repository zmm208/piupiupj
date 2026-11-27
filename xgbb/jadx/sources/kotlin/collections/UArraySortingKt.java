package kotlin.collections;

import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UByteArray;
import kotlin.UIntArray;
import kotlin.ULongArray;
import kotlin.UShort;
import kotlin.UShortArray;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: UArraySorting.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(m67d1 = {"\u00000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\f\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\u0006\u0010\u0007\u001a'\u0010\b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\n\u0010\u000b\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\f2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\r\u0010\u000e\u001a'\u0010\b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\f2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\u000f\u0010\u0010\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00112\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\u0012\u0010\u0013\u001a'\u0010\b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00112\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\u0014\u0010\u0015\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00162\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\u0017\u0010\u0018\u001a'\u0010\b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00162\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003¢\u0006\u0004\b\u0019\u0010\u001a\u001a'\u0010\u001b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\u00012\u0006\u0010\u001d\u001a\u00020\u0001H\u0001¢\u0006\u0004\b\u001e\u0010\u000b\u001a'\u0010\u001b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\f2\u0006\u0010\u001c\u001a\u00020\u00012\u0006\u0010\u001d\u001a\u00020\u0001H\u0001¢\u0006\u0004\b\u001f\u0010\u0010\u001a'\u0010\u001b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00112\u0006\u0010\u001c\u001a\u00020\u00012\u0006\u0010\u001d\u001a\u00020\u0001H\u0001¢\u0006\u0004\b \u0010\u0015\u001a'\u0010\u001b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00162\u0006\u0010\u001c\u001a\u00020\u00012\u0006\u0010\u001d\u001a\u00020\u0001H\u0001¢\u0006\u0004\b!\u0010\u001a¨\u0006\""}, m68d2 = {"partition", "", "array", "Lkotlin/UByteArray;", "left", "right", "partition-4UcCI2c", "([BII)I", "quickSort", "", "quickSort-4UcCI2c", "([BII)V", "Lkotlin/UShortArray;", "partition-Aa5vz7o", "([SII)I", "quickSort-Aa5vz7o", "([SII)V", "Lkotlin/UIntArray;", "partition-oBK06Vg", "([III)I", "quickSort-oBK06Vg", "([III)V", "Lkotlin/ULongArray;", "partition--nroSd4", "([JII)I", "quickSort--nroSd4", "([JII)V", "sortArray", "fromIndex", "toIndex", "sortArray-4UcCI2c", "sortArray-Aa5vz7o", "sortArray-oBK06Vg", "sortArray--nroSd4", "kotlin-stdlib"}, m69k = 2, m70mv = {2, 2, 0}, m72xi = 48)
public final class UArraySortingKt {
    /* JADX INFO: renamed from: partition-4UcCI2c, reason: not valid java name */
    private static final int m805partition4UcCI2c(byte[] bArr, int i, int i2) {
        int i3;
        byte bM421getw2LRezQ = UByteArray.m421getw2LRezQ(bArr, (i + i2) / 2);
        while (i <= i2) {
            while (true) {
                int iM421getw2LRezQ = UByteArray.m421getw2LRezQ(bArr, i) & UByte.MAX_VALUE;
                i3 = bM421getw2LRezQ & UByte.MAX_VALUE;
                if (Intrinsics.compare(iM421getw2LRezQ, i3) >= 0) {
                    break;
                }
                i++;
            }
            while (Intrinsics.compare(UByteArray.m421getw2LRezQ(bArr, i2) & UByte.MAX_VALUE, i3) > 0) {
                i2--;
            }
            if (i <= i2) {
                byte bM421getw2LRezQ2 = UByteArray.m421getw2LRezQ(bArr, i);
                UByteArray.m426setVurrAj0(bArr, i, UByteArray.m421getw2LRezQ(bArr, i2));
                UByteArray.m426setVurrAj0(bArr, i2, bM421getw2LRezQ2);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* JADX INFO: renamed from: quickSort-4UcCI2c, reason: not valid java name */
    private static final void m809quickSort4UcCI2c(byte[] bArr, int i, int i2) {
        int iM805partition4UcCI2c = m805partition4UcCI2c(bArr, i, i2);
        int i3 = iM805partition4UcCI2c - 1;
        if (i < i3) {
            m809quickSort4UcCI2c(bArr, i, i3);
        }
        if (iM805partition4UcCI2c < i2) {
            m809quickSort4UcCI2c(bArr, iM805partition4UcCI2c, i2);
        }
    }

    /* JADX INFO: renamed from: partition-Aa5vz7o, reason: not valid java name */
    private static final int m806partitionAa5vz7o(short[] sArr, int i, int i2) {
        int i3;
        short sM684getMh2AYeg = UShortArray.m684getMh2AYeg(sArr, (i + i2) / 2);
        while (i <= i2) {
            while (true) {
                int iM684getMh2AYeg = UShortArray.m684getMh2AYeg(sArr, i) & UShort.MAX_VALUE;
                i3 = sM684getMh2AYeg & UShort.MAX_VALUE;
                if (Intrinsics.compare(iM684getMh2AYeg, i3) >= 0) {
                    break;
                }
                i++;
            }
            while (Intrinsics.compare(UShortArray.m684getMh2AYeg(sArr, i2) & UShort.MAX_VALUE, i3) > 0) {
                i2--;
            }
            if (i <= i2) {
                short sM684getMh2AYeg2 = UShortArray.m684getMh2AYeg(sArr, i);
                UShortArray.m689set01HTLdE(sArr, i, UShortArray.m684getMh2AYeg(sArr, i2));
                UShortArray.m689set01HTLdE(sArr, i2, sM684getMh2AYeg2);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* JADX INFO: renamed from: quickSort-Aa5vz7o, reason: not valid java name */
    private static final void m810quickSortAa5vz7o(short[] sArr, int i, int i2) {
        int iM806partitionAa5vz7o = m806partitionAa5vz7o(sArr, i, i2);
        int i3 = iM806partitionAa5vz7o - 1;
        if (i < i3) {
            m810quickSortAa5vz7o(sArr, i, i3);
        }
        if (iM806partitionAa5vz7o < i2) {
            m810quickSortAa5vz7o(sArr, iM806partitionAa5vz7o, i2);
        }
    }

    /* JADX INFO: renamed from: partition-oBK06Vg, reason: not valid java name */
    private static final int m807partitionoBK06Vg(int[] iArr, int i, int i2) {
        int iM500getpVg5ArA = UIntArray.m500getpVg5ArA(iArr, (i + i2) / 2);
        while (i <= i2) {
            while (Integer.compare(UIntArray.m500getpVg5ArA(iArr, i) ^ Integer.MIN_VALUE, iM500getpVg5ArA ^ Integer.MIN_VALUE) < 0) {
                i++;
            }
            while (Integer.compare(UIntArray.m500getpVg5ArA(iArr, i2) ^ Integer.MIN_VALUE, iM500getpVg5ArA ^ Integer.MIN_VALUE) > 0) {
                i2--;
            }
            if (i <= i2) {
                int iM500getpVg5ArA2 = UIntArray.m500getpVg5ArA(iArr, i);
                UIntArray.m505setVXSXFK8(iArr, i, UIntArray.m500getpVg5ArA(iArr, i2));
                UIntArray.m505setVXSXFK8(iArr, i2, iM500getpVg5ArA2);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* JADX INFO: renamed from: quickSort-oBK06Vg, reason: not valid java name */
    private static final void m811quickSortoBK06Vg(int[] iArr, int i, int i2) {
        int iM807partitionoBK06Vg = m807partitionoBK06Vg(iArr, i, i2);
        int i3 = iM807partitionoBK06Vg - 1;
        if (i < i3) {
            m811quickSortoBK06Vg(iArr, i, i3);
        }
        if (iM807partitionoBK06Vg < i2) {
            m811quickSortoBK06Vg(iArr, iM807partitionoBK06Vg, i2);
        }
    }

    /* JADX INFO: renamed from: partition--nroSd4, reason: not valid java name */
    private static final int m804partitionnroSd4(long[] jArr, int i, int i2) {
        long jM579getsVKNKU = ULongArray.m579getsVKNKU(jArr, (i + i2) / 2);
        while (i <= i2) {
            while (Long.compare(ULongArray.m579getsVKNKU(jArr, i) ^ Long.MIN_VALUE, jM579getsVKNKU ^ Long.MIN_VALUE) < 0) {
                i++;
            }
            while (Long.compare(ULongArray.m579getsVKNKU(jArr, i2) ^ Long.MIN_VALUE, jM579getsVKNKU ^ Long.MIN_VALUE) > 0) {
                i2--;
            }
            if (i <= i2) {
                long jM579getsVKNKU2 = ULongArray.m579getsVKNKU(jArr, i);
                ULongArray.m584setk8EXiF4(jArr, i, ULongArray.m579getsVKNKU(jArr, i2));
                ULongArray.m584setk8EXiF4(jArr, i2, jM579getsVKNKU2);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* JADX INFO: renamed from: quickSort--nroSd4, reason: not valid java name */
    private static final void m808quickSortnroSd4(long[] jArr, int i, int i2) {
        int iM804partitionnroSd4 = m804partitionnroSd4(jArr, i, i2);
        int i3 = iM804partitionnroSd4 - 1;
        if (i < i3) {
            m808quickSortnroSd4(jArr, i, i3);
        }
        if (iM804partitionnroSd4 < i2) {
            m808quickSortnroSd4(jArr, iM804partitionnroSd4, i2);
        }
    }

    /* JADX INFO: renamed from: sortArray-4UcCI2c, reason: not valid java name */
    public static final void m813sortArray4UcCI2c(byte[] bArr, int i, int i2) {
        Intrinsics.checkNotNullParameter(bArr, "$v$c$kotlin-UByteArray$-array$0");
        m809quickSort4UcCI2c(bArr, i, i2 - 1);
    }

    /* JADX INFO: renamed from: sortArray-Aa5vz7o, reason: not valid java name */
    public static final void m814sortArrayAa5vz7o(short[] sArr, int i, int i2) {
        Intrinsics.checkNotNullParameter(sArr, "$v$c$kotlin-UShortArray$-array$0");
        m810quickSortAa5vz7o(sArr, i, i2 - 1);
    }

    /* JADX INFO: renamed from: sortArray-oBK06Vg, reason: not valid java name */
    public static final void m815sortArrayoBK06Vg(int[] iArr, int i, int i2) {
        Intrinsics.checkNotNullParameter(iArr, "$v$c$kotlin-UIntArray$-array$0");
        m811quickSortoBK06Vg(iArr, i, i2 - 1);
    }

    /* JADX INFO: renamed from: sortArray--nroSd4, reason: not valid java name */
    public static final void m812sortArraynroSd4(long[] jArr, int i, int i2) {
        Intrinsics.checkNotNullParameter(jArr, "$v$c$kotlin-ULongArray$-array$0");
        m808quickSortnroSd4(jArr, i, i2 - 1);
    }
}
