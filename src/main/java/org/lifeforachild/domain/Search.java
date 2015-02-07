package org.lifeforachild.domain;

import org.lifeforachild.web.report.enums.ReportType;
import org.lifeforachild.web.report.enums.TimePeriodUnit;


public class Search {

	private ReportType reportType;
	private String id;
	private String centre;
	private String country;
	private String name;
	private String lastName;
	private String fromDate;
	private String toDate;
	private String createdFromDate;
	private String createdToDate;
	private String timePeriod;
	private TimePeriodUnit timePeriodUnit;
	public ReportType getReportType() {
		return reportType;
	}
	public void setReportType(ReportType reportType) {
		this.reportType = reportType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCentre() {
		return centre;
	}
	public void setCentre(String centre) {
		this.centre = centre;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}	
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getCreatedFromDate() {
		return createdFromDate;
	}
	public void setCreatedFromDate(String createdFromDate) {
		this.createdFromDate = createdFromDate;
	}
	public String getCreatedToDate() {
		return createdToDate;
	}
	public void setCreatedToDate(String createdToDate) {
		this.createdToDate = createdToDate;
	}
	public String getTimePeriod() {
		return timePeriod;
	}
	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}
	public TimePeriodUnit getTimePeriodUnit() {
		return timePeriodUnit;
	}
	public void setTimePeriodUnit(TimePeriodUnit timePeriodUnit) {
		this.timePeriodUnit = timePeriodUnit;
	}
	
}
