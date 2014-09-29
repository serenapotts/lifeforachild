package org.lifeforachild.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.Search;
import org.lifeforachild.web.Report.enums.ReportType;
import org.lifeforachild.web.Report.enums.TimePeriodUnit;
import org.springframework.security.access.AccessDeniedException;
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
	
	private static final Log LOG = LogFactory.getLog(SearchController.class);
	
	/**
	 * Called on a HTTP Get to display the search page. 
	 * @return The name of the jsp page to display
	 */
    @RequestMapping
    public String get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	try {
	    	// create a new search object so it can be populated and posted back
	    	modelMap.addAttribute("search", new Search());
	    	// map attributes for lists
	    	modelMap.addAttribute("_reporttype", ReportType.class.getEnumConstants());
	    	modelMap.addAttribute("_timeperiodunit", TimePeriodUnit.class.getEnumConstants());
	    	modelMap.addAttribute("countrys", Country.findAllCountrys());
	    	modelMap.addAttribute("diabetescentres", null);
	    	return "index";
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to display search page");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
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
    public String post(@ModelAttribute("search") Search search, ModelMap modelMap, HttpServletRequest request, 
    		HttpServletResponse response) {
    	try {
	    	// generate the query from the search parameters entered
	    	// determine the type of object we are searching on
	    	modelMap.addAttribute("children", Child.findChildren(search));
	    	modelMap.addAttribute("search", buildSearchQueryParams(search));
	    	modelMap.addAttribute("country", search.getCountry());
	    	return "child/list";    
    	} catch (Exception e) {
    		LOG.error("Unable to perform search");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }
    
    public static String buildSearchQueryParams(Search search) {
    	StringBuilder builder = new StringBuilder();
    	appendIfValuePresent(builder, "localmedicalnum", search.getId());
    	appendIfValuePresent(builder, "from", search.getFromDate());
    	appendIfValuePresent(builder, "to", search.getToDate());
    	appendIfValuePresent(builder, "createdfrom", search.getCreatedFromDate());
    	appendIfValuePresent(builder, "createdto", search.getCreatedToDate());
    	appendIfValuePresent(builder, "firstname", search.getName());
    	appendIfValuePresent(builder, "lastname", search.getLastName());
    	appendIfValuePresent(builder, "centre", search.getCentre());
    	appendIfValuePresent(builder, "country", search.getCountry());
    	return builder.toString();
    }
    
    private static StringBuilder appendIfValuePresent(StringBuilder builder, String name, String value) {
    	if (value != null && !value.isEmpty() && !value.equals(",") && !value.equals(0)) {
    		builder.append(name);
    		builder.append("=");
    		builder.append(value);
    		builder.append("&");
    	}
    	return builder;
    }

}
