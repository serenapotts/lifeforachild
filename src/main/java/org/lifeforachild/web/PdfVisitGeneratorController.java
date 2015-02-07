package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Report;
import org.lifeforachild.web.report.ChildReportGenerator;
import org.lifeforachild.web.report.ReportGenerator;
import org.lifeforachild.web.report.enums.ClinicalRecordFields;
import org.lifeforachild.web.report.enums.ReportType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller that generates a PDF version of a report for a {@link Report}.
 * 
 * Called when /pdfgenerator is called.
 * 
 * @author Serena Potts
 */
@Controller
public class PdfVisitGeneratorController {

	/**
	 * @param report Report object
	 * @param modelMap Map to hold servlet information
     * @param request HTTP servlet request
     * @param response HTTP servlet response
	 * @return the jsp page to display
	 */
    @RequestMapping(method = RequestMethod.GET, value = "/pdfvisitgenerator/{id}")
    public void get(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	generatePdfReport(id, request, response);
    }    
    
    private void generatePdfReport(Long id, HttpServletRequest request, HttpServletResponse response)
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
    		repGen.generatePdfReport(report, request, response);    		
    	} 
    }
    
    
}
