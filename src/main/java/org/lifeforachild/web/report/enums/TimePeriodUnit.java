package org.lifeforachild.web.Report.enums;

import java.util.Calendar;
import java.util.Date;

import org.lifeforachild.web.AppContext;
import org.lifeforachild.web.Report.DateRange;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * Enum that represents a unit of time, i.e. Month, Year etc.
 * 
 * @author Serena Potts
 *
 */
public enum TimePeriodUnit {	
	MONTH("timeperiodunit.month"),
	QUARTER("timeperiodunit.quarter"),
	YEAR("timeperiodunit.year");		
	
	TimePeriodUnit(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
    }	
    
    public String toString()
    {
    	return getLabel();
    }    
    
    /**
     * Determines the from and to dates in a date range for a {@link TimePeriodUnit}
     * and the number of units.
     * 
     * @param timePeriod A numeric value of the number of units to be applied
     * @param unit The time period unit to use
     * @return A date range
     */
    public static DateRange getDateRange(TimePeriodUnit unit)
    {
    	if (unit == null)
    		return new DateRange(new Date(), new Date());
    	DateRange dateRange = new DateRange();
    	Date now = new Date();
    	// to date is the current date
    	dateRange.setToDate(now);
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		// determine number of units by subtracting value
		switch (unit)
		{
			case MONTH:
			{
				cal.add(Calendar.MONTH, -1);
				break;
			}
			case QUARTER: 
			{
				cal.add(Calendar.MONTH, -4);
				break;
			}
			case YEAR:
			{
				cal.add(Calendar.YEAR, -1);
				break;
			}			
		}    	
    	dateRange.setFromDate(cal.getTime());
    	return dateRange;
    }
}
