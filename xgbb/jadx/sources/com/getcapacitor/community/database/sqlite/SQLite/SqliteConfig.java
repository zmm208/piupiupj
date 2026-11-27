package com.getcapacitor.community.database.sqlite.SQLite;

/* JADX INFO: loaded from: classes.dex */
public class SqliteConfig {
    private boolean biometricAuth = false;
    private String biometricTitle = "Biometric login for capacitor sqlite";
    private String biometricSubTitle = "Log in using your biometric";
    private boolean isEncryption = true;

    public boolean getIsEncryption() {
        return this.isEncryption;
    }

    public void setIsEncryption(boolean isEncryption) {
        this.isEncryption = isEncryption;
    }

    public boolean getBiometricAuth() {
        return this.biometricAuth;
    }

    public void setBiometricAuth(boolean biometricAuth) {
        this.biometricAuth = biometricAuth;
    }

    public String getBiometricTitle() {
        return this.biometricTitle;
    }

    public void setBiometricTitle(String biometricTitle) {
        this.biometricTitle = biometricTitle;
    }

    public String getBiometricSubTitle() {
        return this.biometricSubTitle;
    }

    public void setBiometricSubTitle(String biometricSubTitle) {
        this.biometricSubTitle = biometricSubTitle;
    }
}
