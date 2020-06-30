package com.fdream.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateFomat {
	public static String getNowDate(){
		//使用Calendar
		Calendar now = Calendar.getInstance();
		System.out.println("年：" + now.get(Calendar.YEAR));
		System.out.println("月：" + (now.get(Calendar.MONTH) + 1));
		System.out.println("日：" + now.get(Calendar.DAY_OF_MONTH));
		System.out.println("时：" + now.get(Calendar.HOUR_OF_DAY));
		System.out.println("分：" + now.get(Calendar.MINUTE));
		System.out.println("秒：" + now.get(Calendar.SECOND));
		//使用Date
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}
}
