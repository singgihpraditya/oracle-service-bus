package id.co.quadras.training;

import java.text.SimpleDateFormat;

import java.util.Date;

public class WriteToConsole {
    public static void println(String category, String message){
        category = category==null?"":category;
        message = message==null?"":message;
        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,SSS").format(new Date())+" "+category+" "+message);
    }
}
