package com.getcapacitor.community.database.sqlite.SQLite;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;
import androidx.biometric.BiometricManager;
import androidx.biometric.BiometricPrompt;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.FragmentActivity;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public class UtilsBiometric {
    private BiometricManager biometricManager;
    private BiometricPrompt biometricPrompt;
    private Context context;
    private Executor executor;
    private BiometricListener listener;
    private BiometricPrompt.PromptInfo promptInfo;

    public UtilsBiometric(Context context, BiometricManager biometricManager, BiometricListener listener) {
        this.context = context;
        this.biometricManager = biometricManager;
        this.listener = listener;
    }

    public boolean checkBiometricIsAvailable() {
        Boolean bool = false;
        BiometricManager biometricManagerFrom = BiometricManager.from(this.context);
        this.biometricManager = biometricManagerFrom;
        int iCanAuthenticate = biometricManagerFrom.canAuthenticate(32783);
        if (iCanAuthenticate == 0) {
            Log.d("MY_APP_TAG", "App can authenticate using biometrics.");
            Toast.makeText(this.context, "App can authenticate using biometrics.", 1).show();
            bool = true;
        } else if (iCanAuthenticate == 1) {
            Log.e("MY_APP_TAG", "Biometric features are currently unavailable.");
            Toast.makeText(this.context, "App can authenticate using biometrics.", 1).show();
        } else if (iCanAuthenticate == 11) {
            Log.e("MY_APP_TAG", "The user hasn't associated any biometric credentials with their account..");
            Toast.makeText(this.context, "The user hasn't associated any biometric credentials with their account..", 1).show();
        } else if (iCanAuthenticate == 12) {
            Log.e("MY_APP_TAG", "No biometric features available on this device.");
            Toast.makeText(this.context, "No biometric features available on this device.", 1).show();
        }
        return bool.booleanValue();
    }

    public void showBiometricDialog(String biometricTitle, String biometricSubTitle) throws Exception {
        setupBiometricPrompt(biometricTitle, biometricSubTitle);
        try {
            this.biometricPrompt.authenticate(this.promptInfo);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e);
        }
    }

    private void setupBiometricPrompt(String biometricTitle, String biometricSubTitle) {
        this.executor = ContextCompat.getMainExecutor(this.context);
        this.biometricPrompt = new BiometricPrompt((FragmentActivity) this.context, this.executor, new BiometricPrompt.AuthenticationCallback() { // from class: com.getcapacitor.community.database.sqlite.SQLite.UtilsBiometric.1
            @Override // androidx.biometric.BiometricPrompt.AuthenticationCallback
            public void onAuthenticationError(int errorCode, CharSequence errString) {
                super.onAuthenticationError(errorCode, errString);
                Toast.makeText(UtilsBiometric.this.context, "Authentication error: " + ((Object) errString), 0).show();
                UtilsBiometric.this.listener.onFailed();
            }

            @Override // androidx.biometric.BiometricPrompt.AuthenticationCallback
            public void onAuthenticationSucceeded(BiometricPrompt.AuthenticationResult result) {
                super.onAuthenticationSucceeded(result);
                UtilsBiometric.this.listener.onSuccess(result);
            }

            @Override // androidx.biometric.BiometricPrompt.AuthenticationCallback
            public void onAuthenticationFailed() {
                super.onAuthenticationFailed();
                Toast.makeText(UtilsBiometric.this.context, "Authentication failed", 0).show();
                UtilsBiometric.this.listener.onFailed();
            }
        });
        this.promptInfo = new BiometricPrompt.PromptInfo.Builder().setTitle(biometricTitle).setSubtitle(biometricSubTitle).setAllowedAuthenticators(32783).build();
    }
}
