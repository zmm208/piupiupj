package com.capacitorjs.plugins.localnotifications;

import com.getcapacitor.JSObject;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import kotlinx.coroutines.DebugKt;

/* JADX INFO: loaded from: classes.dex */
public class LocalNotificationSchedule {
    public static String JS_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

    /* JADX INFO: renamed from: at */
    private Date f50at;
    private Integer count;
    private String every;

    /* JADX INFO: renamed from: on */
    private DateMatch f51on;
    private Boolean repeats;
    private JSObject scheduleObj;
    private Boolean whileIdle;

    public LocalNotificationSchedule(JSObject jSObject) throws ParseException {
        this.scheduleObj = jSObject;
        buildEveryElement(jSObject);
        buildCountElement(jSObject);
        buildAtElement(jSObject);
        buildOnElement(jSObject);
        this.whileIdle = jSObject.getBoolean("allowWhileIdle", false);
    }

    public LocalNotificationSchedule() {
    }

    private void buildEveryElement(JSObject jSObject) {
        this.every = jSObject.getString("every");
    }

    private void buildCountElement(JSObject jSObject) {
        this.count = jSObject.getInteger("count", 1);
    }

    private void buildAtElement(JSObject jSObject) throws ParseException {
        this.repeats = jSObject.getBool("repeats");
        String string = jSObject.getString("at");
        if (string != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(JS_DATE_FORMAT);
            simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
            this.f50at = simpleDateFormat.parse(string);
        }
    }

    private void buildOnElement(JSObject jSObject) {
        JSObject jSObject2 = jSObject.getJSObject(DebugKt.DEBUG_PROPERTY_VALUE_ON);
        if (jSObject2 != null) {
            DateMatch dateMatch = new DateMatch();
            this.f51on = dateMatch;
            dateMatch.setYear(jSObject2.getInteger("year"));
            this.f51on.setMonth(jSObject2.getInteger("month"));
            this.f51on.setDay(jSObject2.getInteger("day"));
            this.f51on.setWeekday(jSObject2.getInteger("weekday"));
            this.f51on.setHour(jSObject2.getInteger("hour"));
            this.f51on.setMinute(jSObject2.getInteger("minute"));
            this.f51on.setSecond(jSObject2.getInteger("second"));
        }
    }

    public DateMatch getOn() {
        return this.f51on;
    }

    public JSObject getOnObj() {
        return this.scheduleObj.getJSObject(DebugKt.DEBUG_PROPERTY_VALUE_ON);
    }

    public void setOn(DateMatch dateMatch) {
        this.f51on = dateMatch;
    }

    public Date getAt() {
        return this.f50at;
    }

    public void setAt(Date date) {
        this.f50at = date;
    }

    public Boolean getRepeats() {
        return this.repeats;
    }

    public void setRepeats(Boolean bool) {
        this.repeats = bool;
    }

    public String getEvery() {
        return this.every;
    }

    public void setEvery(String str) {
        this.every = str;
    }

    public int getCount() {
        return this.count.intValue();
    }

    public void setCount(int i) {
        this.count = Integer.valueOf(i);
    }

    public boolean allowWhileIdle() {
        return this.whileIdle.booleanValue();
    }

    public boolean isRepeating() {
        return Boolean.TRUE.equals(this.repeats);
    }

    public boolean isRemovable() {
        if (this.every != null || this.f51on != null) {
            return false;
        }
        if (this.f50at != null) {
            return !isRepeating();
        }
        return true;
    }

    public Long getEveryInterval() {
        String str = this.every;
        str.hashCode();
        switch (str) {
            case "two-weeks":
                return Long.valueOf(((long) (this.count.intValue() * 2)) * 604800000);
            case "minute":
                return Long.valueOf(((long) this.count.intValue()) * 60000);
            case "second":
                return Long.valueOf(((long) this.count.intValue()) * 1000);
            case "day":
                return Long.valueOf(((long) this.count.intValue()) * 86400000);
            case "hour":
                return Long.valueOf(((long) this.count.intValue()) * 3600000);
            case "week":
                return Long.valueOf(((long) this.count.intValue()) * 604800000);
            case "year":
                return Long.valueOf(((long) this.count.intValue()) * 31449600000L);
            case "month":
                return Long.valueOf(((long) (this.count.intValue() * 30)) * 86400000);
            default:
                return null;
        }
    }

    public Long getNextOnSchedule(Date date) {
        return Long.valueOf(this.f51on.nextTrigger(date));
    }
}
