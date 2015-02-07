package org.lifeforachild.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.ReportProperties;
import org.lifeforachild.web.report.ChildReportGenerator;
import org.lifeforachild.web.report.ClinicalRecordReportGenerator;
import org.lifeforachild.web.report.ReportGenerator;
import org.lifeforachild.web.report.enums.ReportType;
import org.springframework.security.access.AccessDeniedException;
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

	private static final Log LOG = LogFactory.getLog(ReportGeneratorController.class);
	
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
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.VIEW_REPORT);
    		Report report = Report.findReport(id);
	    	ReportGenerator repGen = ReportGeneratorController.getReportGenerator(report);   		
	    	if (repGen != null)
	    	{
	    		ReportProperties reportProperties = new ReportProperties();
	    		reportProperties.setId(report.getId());
	    		modelMap.addAttribute("reportProperties", reportProperties);
		    	return "report/report";
	    	}
	    	return "dataAccessFailure"; 
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to generate html report");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }
    
    public static ReportGenerator getReportGenerator(Report report)
    {
    	ReportGenerator repGen = null;
    	// check what type of report we are displaying
    	switch (report.getReporttype())
    	{
    		case CHILD:
    		case INDIVIDUAL_CHILD:
    		case CHILD_NOT_SEEN_TIME_PERIOD:
    		{
    			repGen = new ChildReportGenerator();
    			break;
    		}
    		case INDIVIDUAL_CHILD_VISIT:
    		case INDIVIDUAL_CHILD_MULTI_VISIT:
    		case CHILD_RECENT_VISIT:
    		case CHILD_SEEN_TIME_PERIOD:    		
    		{
    			repGen = new ClinicalRecordReportGenerator(); 
    			break;
    		}
    	}
    	return repGen;
    }
      
}
