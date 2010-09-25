package org.lifeforachild.Util;

public class DecimalUtil
{
    public static double roundToTwoDecimals(double number)
    {
        double result = number * 100;
        result = Math.round(result);
        result = result / 100;
        return result;
    }
}
