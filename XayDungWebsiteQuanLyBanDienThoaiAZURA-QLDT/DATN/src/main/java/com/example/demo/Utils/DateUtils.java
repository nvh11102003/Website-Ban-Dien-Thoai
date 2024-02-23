package com.example.demo.Utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class DateUtils {

    public static Date convertStringToDate(String dateString, String format){
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(format);
            return formatter.parse(dateString);
        } catch (ParseException e) {
            return null;
        }
    }

    public static String date2String(Date value, String format) {
        if (value != null) {
            SimpleDateFormat date = new SimpleDateFormat(format);
            return date.format(value);
        }
        return "";
    }
}
