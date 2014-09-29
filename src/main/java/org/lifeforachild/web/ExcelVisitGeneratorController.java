package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Report;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.Report.enums.ClinicalRecordFields;
import org.lifeforachild.web.Report.enums.ReportType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller that generates a Excel file of the report for a {@link Report}.
 * 
 * Called when /excelgenerator is called.
 * 
 * @author Serena Potts
 */
@Controller
public class ExcelVisitGeneratorController {

	private static final Log LOG = LogFactory.getLog(ExcelVisitGeneratorController.class);
	
	/**
	 * @param report Report object
	 * @param modelMap Map to hold servlet information
     * @param request HTTP servlet request
     * @param response HTTP servlet response
	 * @return the jsp page to display
	 */
    @RequestMapping(method = RequestMethod.GET, value = "/excelvisitgenerator/{id}")
    public void get(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	try {
    		generateExcelReport(id, request, response);
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to generate excel report with id: " + id);
    		e.printStackTrace();
    	}
    }   
    
    private void generateExcelReport(Long id, HttpServletRequest request, HttpServletResponse response)
    {
    	ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
    	
    	Report report = new Report();
    	report.setReporttype(ReportType.INDIVIDUAL_CHILD_VISIT);
    	report.setFromDate(record.getDateCompleted());
    	report.setRecordNumber(record.getChild().getIndividualId());
    	report.setClinicalrecordfields(new ClinicalRecordFields[] { ClinicalRecordFields.ALL });
    	
    	ReportGenerator repGen = ReportGeneratorController.getReportGenerator(report);  		
    	if (repGen != null)
    	{
    		repGen.generateExcelReport(report, request, response);    		
    	}
    }
    
}
