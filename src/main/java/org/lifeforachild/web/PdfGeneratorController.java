package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.ReportType;
import org.lifeforachild.web.Report.ChildReportGenerator;
import org.lifeforachild.web.Report.ClinicalRecordReportGenerator;
import org.lifeforachild.web.Report.ReportGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller that generates a PDF version of a report for a {@link Report}.
 * 
 * Called when /pdfgenerator is called.
 * 
 * @author Serena Potts
 */
@RequestMapping("/pdfgenerator/**")
@Controller
public class PdfGeneratorController {

	// not implemented
    @RequestMapping(method = RequestMethod.GET)
    public void get(@ModelAttribute("report") Report report, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

	/**
	 * @param report Report object
	 * @param modelMap Map to hold servlet information
     * @param request HTTP servlet request
     * @param response HTTP servlet response
	 * @return the jsp page to display
	 */
    @RequestMapping(method = RequestMethod.POST)
    public String post(@ModelAttribute("report") Report report, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	ReportGenerator repGen = null;
    	// check what type of report we are displaying
    	if (report.getReporttype().equals(ReportType.CHILD))
    		repGen = new ChildReportGenerator();
    	else if (report.getReporttype().equals(ReportType.CLINICAL_RECORD))
    		repGen = new ClinicalRecordReportGenerator();    		
    	if (repGen != null)
    	{
    		String query = repGen.buildQuery(report);
    		repGen.generatePdfReport(query);
    	}    	
    	// redirect back to to the current page
    	return "redirect:/reportgenerator/" + report.getId();
    }       
    
    
}
