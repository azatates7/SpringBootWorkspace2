package date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {

    public static void main(String [] args){
        DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        //System.out.println(sdf.format(date));
        //String date2 = date.toString();
        System.out.print(sdf.format(date));
        //System.out.printf((new Date()).toString().replaceAll("\\s+",""));
    }

}
