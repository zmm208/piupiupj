package com.getcapacitor.community.database.sqlite;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class NotificationCenter {
    private static NotificationCenter _instance;
    private HashMap<String, ArrayList<MyRunnable>> registredObjects = new HashMap<>();

    private NotificationCenter() {
    }

    public static synchronized NotificationCenter defaultCenter() {
        if (_instance == null) {
            _instance = new NotificationCenter();
        }
        return _instance;
    }

    public synchronized void addMethodForNotification(String notificationName, MyRunnable r) {
        ArrayList<MyRunnable> arrayList = this.registredObjects.get(notificationName);
        if (arrayList == null) {
            arrayList = new ArrayList<>();
            this.registredObjects.put(notificationName, arrayList);
        }
        arrayList.add(r);
    }

    public synchronized void removeMethodForNotification(String notificationName, MyRunnable r) {
        ArrayList<MyRunnable> arrayList = this.registredObjects.get(notificationName);
        if (arrayList != null) {
            arrayList.remove(r);
        }
    }

    public synchronized void removeAllNotifications() {
        Iterator<Map.Entry<String, ArrayList<MyRunnable>>> it = this.registredObjects.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, ArrayList<MyRunnable>> next = it.next();
            removeMethodForNotification(next.getKey(), next.getValue().get(0));
            it.remove();
        }
    }

    public synchronized void postNotification(String notificationName, Map<String, Object> _info) {
        ArrayList<MyRunnable> arrayList = this.registredObjects.get(notificationName);
        if (arrayList != null) {
            for (MyRunnable myRunnable : new ArrayList(arrayList)) {
                myRunnable.setInfo(_info);
                myRunnable.run();
            }
        }
    }
}
