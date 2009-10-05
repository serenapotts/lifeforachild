package org.lifeforachild.domain;

import java.util.Date;

/**
 * Class that represents a Date range consisting of a from and to date.
 * 
 * @author Serena Potts
 *
 */
public class DateRange {

	private Date fromDate;
	private Date toDate;
	
	public DateRange() {}
	
	public DateRange(Date fromDate, Date toDate)
	{
		this.fromDate = fromDate;
		this.toDate = toDate;
	}
	
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
		
}
