package quickstart.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	public static final String FORMAT_MMDDYYYY_HOUR= "MM/dd/yyyy :hh:mm:ss";
	public static final String FORMAT_YYMMDD = "yyyy-mm-dd";
	
	public static final Date stringToDate(String fecha,String formato) throws ParseException{
		Calendar cal = Calendar.getInstance();
		DateFormat sdf=new SimpleDateFormat(formato);
		cal.setTime((Date)sdf.parse(fecha));
		
		return cal.getTime();
	}
	
	  public static Date formato(Date d,String f) throws ParseException{
		  SimpleDateFormat sdf = new SimpleDateFormat(f);
		  String date = sdf.format(d);
		  
		  return sdf.parse(date);
	  }
	
	public static final Date jqueryDatePicker(String fecha)throws ParseException{
		Date dFecha = null;
		Date dfechaFmt = null;
		
		try{
		dFecha = stringToDate(fecha,FORMAT_MMDDYYYY_HOUR);//formato que maneja jquery por default
		dfechaFmt = formato(dFecha,"yyyy-MM-dd hh:mm:ss");//formato de la base de datos
		}catch(NullPointerException e){
			dfechaFmt = null;
		}
		return dfechaFmt;
	}

}
