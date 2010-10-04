package org.lifeforachild.web;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
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
    	modelMap.addAttribute("countrys", Country.findAllCountrys());
    	modelMap.addAttribute("diabetescentres", null);
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
    	// determine the type of object we are searching on
    	if (search.getReportType().equals(ReportType.CHILD))
    	{
    		modelMap.addAttribute("children", Child.findChildren(search));
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

}
