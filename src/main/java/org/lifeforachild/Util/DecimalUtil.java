package org.lifeforachild.Util;

import java.text.DecimalFormat;

public class DecimalUtil
{
    public static double roundToTwoDecimals(double number)
    {
        double result = number * 100;
        result = Math.round(result);
        result = result / 100;
        return result;
    }
    
    public static String format(float value)
    {
    	return new DecimalFormat("0.##").format(value);
    }
}
