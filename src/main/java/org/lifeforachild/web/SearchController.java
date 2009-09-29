package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.ReportType;
import org.lifeforachild.domain.Search;
import org.lifeforachild.domain.TimePeriodUnit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/search/**")
@Controller
public class SearchController {

    @RequestMapping
    public String get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	modelMap.addAttribute("search", new Search());
    	modelMap.addAttribute("_reporttype", ReportType.class.getEnumConstants());
    	modelMap.addAttribute("_timeperiodunit", TimePeriodUnit.class.getEnumConstants());
    	//modelMap.addAttribute("_timeperiodunit", TimePeriodUnit.getList());
    	return "index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(@ModelAttribute("search") Search search, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	if (search.getReportType().equals(ReportType.CHILD))
    	{
	    	modelMap.addAttribute("children", Child.findAllChildren());
	    	return "child/list";
    	}
    	else if (search.getReportType().equals(ReportType.CLINICAL_RECORD))
    	{
	    	modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());
	    	return "clinicalrecord/list";    		
    	}
    	return "dataAccessFailure";    	
    }
}
