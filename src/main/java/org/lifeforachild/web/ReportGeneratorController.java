package org.lifeforachild.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.ReportProperties;
import org.lifeforachild.domain.ReportType;
import org.lifeforachild.web.Report.ChildReportGenerator;
import org.lifeforachild.web.Report.ClinicalRecordReportGenerator;
import org.lifeforachild.web.Report.ReportGenerator;
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
    @RequestMapping(method = RequestMethod.GET, value = "/reportgenerator/{id}")
    public String get(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	Report report = Report.findReport(id);
    	ReportGenerator repGen = null;
    	// check what type of report we are displaying
    	if (report.getReporttype().equals(ReportType.CHILD))
    		repGen = new ChildReportGenerator();
    	else if (report.getReporttype().equals(ReportType.CLINICAL_RECORD))
    		repGen = new ClinicalRecordReportGenerator();    		
    	if (repGen != null)
    	{
    		List results = repGen.buildQuery(report);
    		String html = repGen.generateHtmlReport(report, results);
    		modelMap.addAttribute("html", html);
    		ReportProperties reportProperties = new ReportProperties();
    		reportProperties.setId(report.getId());
    		modelMap.addAttribute("reportProperties", reportProperties);
	    	return "report/report";
    	}
    	return "dataAccessFailure";    	
    }
      
}
