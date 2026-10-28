package utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtils {

	private DateUtils() {}

	//Date du jour formatée en français, ex. « Mercredi 28 octobre 2026 »
	public static String aujourdHui() {
		String date = new SimpleDateFormat("EEEE d MMMM yyyy", Locale.FRENCH).format(new Date());
		if (date == null || date.isEmpty()) return date;
		return Character.toUpperCase(date.charAt(0)) + date.substring(1);
	}
}
