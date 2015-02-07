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
	
    public static String buildString (Object[] array, String pre,
		      String post, String delim)
	{
    	StringBuffer buf = new StringBuffer ();
		if (array != null) {
		  boolean first = true;
		  for (int i = 0; i < array.length; i++)
		  {
		      if (array[i] != null)
		      {
		          if (first)
		              first = false;
		          else if (delim != null)
		              buf.append (delim);
		
		          if (pre != null)
		              buf.append (pre);
		          buf.append (array[i].toString());
		          if (post != null)
		              buf.append (post);
		      }
		  }
		}
		return buf.toString ();
	}
    
    public static String padWithZeros(long id, int length)
    {
    	String idString = String.valueOf(id);
    	for (int i = idString.length(); i < length; i++)
    	{
    		idString = "0" + idString;
    	}
    	return idString;
    }

}
