package org.lifeforachild.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.DateRange;
import org.lifeforachild.domain.ReportType;
import org.lifeforachild.domain.Search;
import org.lifeforachild.domain.TimePeriodUnit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * Controller that displays and perform simple search capabilities using JPA.
 */
@RequestMapping("/search/**")
@Controller
public class SearchController {

	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("d/MM/yyyy");
	private static final SimpleDateFormat QUERY_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	private static final char EQUALS_OPERATOR = '=';
	private static final char LESS_THAN_OPERATOR = '<';
	private static final char GREATER_THAN_OPERATOR = '>';
	
	/**
	 * Called on a HTTP Get to display the search page. 
	 * @return The name of the jsp page to display
	 */
    @RequestMapping
    public String get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	// create a new search object so it can be populated and posted back
    	modelMap.addAttribute("search", new Search());
    	// map attributes for lists
    	modelMap.addAttribute("_reporttype", ReportType.class.getEnumConstants());
    	modelMap.addAttribute("_timeperiodunit", TimePeriodUnit.class.getEnumConstants());
    	return "index";
    }

    /** 
     * Called on HTTP POST to perform the search.
     * @param search The search object which has the values from the form
     * @param modelMap Map to hold servlet information
     * @param request HTTP servlet request
     * @param response HTTP servlet response
     * @return The name of the jsp page to display
     */
    @RequestMapping(method = RequestMethod.POST)
    public String post(@ModelAttribute("search") Search search, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	// generate the query from the search parameters entered
    	String subQuery = generateSubQuery(search);
    	// determine the type of object we are searching on
    	if (search.getReportType().equals(ReportType.CHILD))
    	{
    		modelMap.addAttribute("children", Child.findChildren("select o from Child o " + subQuery));
	    	return "child/list";
    	}
    	else if (search.getReportType().equals(ReportType.CLINICAL_RECORD))
    	{
	    	modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());
	    	return "clinicalrecord/list";    		
    	}
    	// error
    	return "dataAccessFailure";    	
    }

    /**
     * Generates a query string from the entered search values.
     * 
     * @param search The search object which has the values from the form
     * @return A sql query string
     */
	private String generateSubQuery(Search search) {
		String id = search.getId();
		String timePeriod = search.getTimePeriod();
		TimePeriodUnit timePeriodUnit = search.getTimePeriodUnit();
		String from = search.getFromDate();
		String to = search.getToDate();
		String centre = search.getCentre();
		String country = search.getCountry(); 
		StringBuffer buffer = new StringBuffer();
		if (!StringUtil.isEmpty(id))
			appendOperator(buffer, Child.ID_COLUMN, id, EQUALS_OPERATOR);
		if (!StringUtil.isEmpty(timePeriod) && timePeriodUnit != TimePeriodUnit.NONE)
		{
			DateRange dateRange = TimePeriodUnit.getDateRange(timePeriod, timePeriodUnit);
			appendDateRange(buffer, dateRange);
		}
		if (!StringUtil.isEmpty(from) && !StringUtil.isEmpty(to))
		{
			try
			{
				Date fromDate = DATE_FORMAT.parse(from);
				Date toDate = DATE_FORMAT.parse(to);
				appendDateRange(buffer, new DateRange(fromDate, toDate));
			}
			catch (ParseException e) {
				e.printStackTrace();
				return null;
			}			
		}	
		/*if (!StringUtil.isEmpty(centre))
			appendOperator(buffer, "centre", centre, EQUALS_OPERATOR);
		if (!StringUtil.isEmpty(country))
			appendOperator(buffer, "country", country, EQUALS_OPERATOR);*/
		
		return "where " + buffer.toString();
	}
	
	/**
	 * Append a date range to the sql query
	 * @param buffer The StringBuffer that contains the query
	 * @param dateRange Two dates in the range
	 */
	private void appendDateRange(StringBuffer buffer, DateRange dateRange)
	{
		appendAndClause(buffer);
		String toDate = QUERY_DATE_FORMAT.format(dateRange.getToDate());
		String fromDate = QUERY_DATE_FORMAT.format(dateRange.getFromDate());
		appendOperator(buffer, Child.UPDATED_ON_COLUMN, toDate, LESS_THAN_OPERATOR);
		appendOperator(buffer, Child.UPDATED_ON_COLUMN, fromDate, GREATER_THAN_OPERATOR);
	}
	
	/**
	 * Append an and to the sql query if something previously exists in the query.
	 * @param buffer The StringBuffer that contains the query
	 */
	private void appendAndClause(StringBuffer buffer)
	{
		if (buffer.toString().length() > 0)
			buffer.append(" and ");
	}
	
	/**
	 * Append an operator based statement to the query 
	 * @param buffer The StringBuffer that contains the query
	 * @param key The name of the column
	 * @param value The value to operate on
	 * @param operator The operator to use
	 */
	private void appendOperator(StringBuffer buffer, String key, String value, char operator)
	{
		appendAndClause(buffer);
		buffer.append(key);
		buffer.append(operator);
		buffer.append("'");
		buffer.append(value);
		buffer.append("'");
	}
}
