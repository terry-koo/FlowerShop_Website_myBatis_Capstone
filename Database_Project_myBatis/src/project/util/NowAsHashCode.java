package project.util;

import java.util.Date;

public class NowAsHashCode {
	
	public static String toString(String tableAbbr) {
		Date now = new Date();
		return tableAbbr+Math.abs(now.toString().hashCode());
	}
}
