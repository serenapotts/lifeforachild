package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.ReportType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller that generates a the report for a {@link Report}.
 * 
 * Called when /reportgenerator/id is called.
 * 
 * @author Serena Potts
 */
@RequestMapping("/reportgenerator/**")
@Controller
public class ReportGeneratorController {

	/**
	 * 
	 * @param id Id of the report to display.
	 * @param modelMap Map to hold servlet information
     * @param request HTTP servlet request
     * @param response HTTP servlet response
	 * @return the jsp page to display
	 */
    @RequestMapping(method = RequestMethod.GET, value = "{id}")
    public String get(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	Report report = Report.findReport(id);
    	// check what type of report we are displaying
    	if (report.getReporttype().equals(ReportType.CHILD))
    	{
    		ChildReportGenerator childRepGen = new ChildReportGenerator();
    		String html = childRepGen.generateHtmlReport(report);
    		modelMap.addAttribute("html", html);
	    	return "report/report";
    	}
    	else if (report.getReporttype().equals(ReportType.CLINICAL_RECORD))
    	{
    		ClinicalRecordReportGenerator clinicalRecordRepGen = new ClinicalRecordReportGenerator();
    		String html = clinicalRecordRepGen.generateHtmlReport(report);
    		modelMap.addAttribute("html", html);
	    	return "report/report";    		
    	}
    	return "dataAccessFailure";    	
    }

    // Not called at present
    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public String post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	return "dataAccessFailure";    	
    }       
    
    
}
