//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.tool;

import java.io.PrintStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class DayTimer {
    private static final long PERIOD_DAY = 86400000L;

    public DayTimer() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(11, 12);
        calendar.set(12, 10);
        calendar.set(13, 0);
        Date date = calendar.getTime();
        System.out.println(date);
        PrintStream var10000 = System.out;
        boolean var10001 = date.before(new Date());
        var10000.println("before 方法比较：" + var10001);
        if (date.before(new Date())) {
            date = this.addDay(date, 1);
            System.out.println(date);
        }

        Timer timer = new Timer();
        UpdateDataTask task = new UpdateDataTask();
        long tempdelay = 60000L;
        long tempcircle = 30000L;
        timer.schedule(task, date, 86400000L);
    }

    public Date addDay(Date date, int num) {
        Calendar startDT = Calendar.getInstance();
        startDT.setTime(date);
        startDT.add(5, num);
        return startDT.getTime();
    }
}
