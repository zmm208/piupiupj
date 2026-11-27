package com.getcapacitor.community.database.sqlite.SQLite;

import androidx.biometric.BiometricPrompt;

/* JADX INFO: loaded from: classes.dex */
public interface BiometricListener {
    void onFailed();

    void onSuccess(BiometricPrompt.AuthenticationResult result);
}
