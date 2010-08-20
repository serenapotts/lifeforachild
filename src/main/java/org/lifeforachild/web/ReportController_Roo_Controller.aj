package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.lifeforachild.domain.ChildFields;
import org.lifeforachild.domain.ClinicalRecordFields;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.ReportType;
import org.lifeforachild.domain.ShowOptionType;
import org.lifeforachild.domain.StatusType;
import org.lifeforachild.domain.TimePeriodUnit;
import org.lifeforachild.domain.User;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ReportController_Roo_Controller {
    
    @RequestMapping(value = "/report", method = RequestMethod.POST)    
    public String ReportController.create(@Valid Report report, BindingResult result, ModelMap modelMap) {    
        if (report == null) throw new IllegalArgumentException("A report is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("report", report);            
            modelMap.addAttribute("childfields_enum", ChildFields.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecordfields_enum", ClinicalRecordFields.class.getEnumConstants());            
            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres(true));            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());            
            modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());            
            modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());            
            modelMap.addAttribute("users", User.findAllUsers());            
            modelMap.addAttribute("report_fromDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("report_toDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "report/create";            
        }        
        report.persist();        
        return "redirect:/reportgenerator/" + report.getId();        
    }    
    
    @RequestMapping(value = "/report/form", method = RequestMethod.GET)    
    public String ReportController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("report", new Report());        
        modelMap.addAttribute("childfields_enum", ChildFields.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecordfields_enum", ClinicalRecordFields.class.getEnumConstants());        
        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres(true));        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());        
        modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());        
        modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());        
        modelMap.addAttribute("users", User.findAllUsers());        
        modelMap.addAttribute("report_fromDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("report_toDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "report/create";        
    }    
    
    @RequestMapping(value = "/report/{id}", method = RequestMethod.GET)    
    public String ReportController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("report_fromDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("report_toDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("report", Report.findReport(id));        
        return "report/show";        
    }    
    
    @RequestMapping(value = "/report", method = RequestMethod.GET)    
    public String ReportController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("reports", Report.findReportEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Report.countReports() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("reports", Report.findAllReports());            
        }        
        modelMap.addAttribute("report_fromDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("report_toDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "report/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ReportController.update(@Valid Report report, BindingResult result, ModelMap modelMap) {    
        if (report == null) throw new IllegalArgumentException("A report is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("report", report);            
            modelMap.addAttribute("childfields_enum", ChildFields.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecordfields_enum", ClinicalRecordFields.class.getEnumConstants());            
            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres(true));            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());            
            modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());            
            modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());            
            modelMap.addAttribute("users", User.findAllUsers());            
            modelMap.addAttribute("report_fromDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("report_toDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "report/update";            
        }        
        report.merge();        
        return "redirect:/report/" + report.getId();        
    }    
    
    @RequestMapping(value = "/report/{id}/form", method = RequestMethod.GET)    
    public String ReportController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("report", Report.findReport(id));        
        modelMap.addAttribute("childfields_enum", ChildFields.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecordfields_enum", ClinicalRecordFields.class.getEnumConstants());        
        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres(true));        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());        
        modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());        
        modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());        
        modelMap.addAttribute("users", User.findAllUsers());        
        modelMap.addAttribute("report_fromDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("report_toDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "report/update";        
    }    
    
    @RequestMapping(value = "/report/{id}", method = RequestMethod.DELETE)    
    public String ReportController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Report.findReport(id).remove();        
        return "redirect:/report?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
