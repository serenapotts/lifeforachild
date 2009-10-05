package org.lifeforachild.domain;

import java.util.Calendar;
import java.util.Date;

/**
 * Enum that represents a unit of time, i.e. Month, Year etc.
 * 
 * @author Serena Potts
 *
 */
public enum TimePeriodUnit {
	NONE(""),
	MONTHS("Months"),
	YEARS("Years");		
	
	TimePeriodUnit(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    /**
     * Determines the from and to dates in a date range for a {@link TimePeriodUnit}
     * and the number of units.
     * 
     * @param timePeriod A numeric value of the number of units to be applied
     * @param unit The time period unit to use
     * @return A date range
     */
    public static DateRange getDateRange(String timePeriod, TimePeriodUnit unit)
    {
    	if (unit == null || unit.equals(NONE))
    		return null;
    	int timePeriodInt;
    	try
    	{
    		// try to parse the number of units
    		// make negative as we want to subtract later
    		timePeriodInt = - Integer.parseInt(timePeriod);
    	}
    	catch (Exception e) {
			return null;
		}
    	DateRange dateRange = new DateRange();
    	Date now = new Date();
    	// to date is the current date
    	dateRange.setToDate(now);
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		// determine number of units by subtracting value
    	if (unit.equals(MONTHS))
    		cal.add(Calendar.MONTH, timePeriodInt);    		
    	else 
    		cal.add(Calendar.YEAR, timePeriodInt);
    	dateRange.setFromDate(cal.getTime());
    	return dateRange;
    }
}
