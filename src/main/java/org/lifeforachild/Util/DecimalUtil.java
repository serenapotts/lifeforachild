package org.lifeforachild.Util;

import java.text.DecimalFormat;

public class DecimalUtil
{
    public static double roundToTwoDecimals(double number)
    {
    	DecimalFormat twoDForm = new DecimalFormat("#.##");
    	return Double.valueOf(twoDForm.format(number));       
    }
    
    public static double roundToOneDecimal(double number)
    {
    	DecimalFormat oneDForm = new DecimalFormat("#.#");
    	return Double.valueOf(oneDForm.format(number));       
    }
    
    public static String format(float value)
    {
    	return new DecimalFormat("0.##").format(value);
    }
}
