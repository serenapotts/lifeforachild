package org.lifeforachild.Util;

/**
 * String utilities.
 * 
 * @author Serena Potts
 *
 */
public class StringUtil {

	/**
	 * @return True if the given string is null or empty, false otherwise.
	 */
	public static boolean isEmpty(String s)
	{
		return s == null || ( s != null && s.equals(""));
	}
}
