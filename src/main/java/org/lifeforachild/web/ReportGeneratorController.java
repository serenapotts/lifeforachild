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

@RequestMapping("/reportgenerator/**")
@Controller
public class ReportGeneratorController {

    @RequestMapping(method = RequestMethod.GET, value = "{id}")
    public String get(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	Report report = Report.findReport(id);
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

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public String post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	return "dataAccessFailure";    	
    }       
    
    
}
