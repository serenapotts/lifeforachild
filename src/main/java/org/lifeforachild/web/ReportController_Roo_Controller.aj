package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.User;
import org.lifeforachild.enums.ShowOptionType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.lifeforachild.web.AppContext;
import org.lifeforachild.web.Report.enums.ChildFields;
import org.lifeforachild.web.Report.enums.ClinicalRecordFields;
import org.lifeforachild.web.Report.enums.ReportType;
import org.lifeforachild.web.Report.enums.StatusType;
import org.lifeforachild.web.Report.enums.TimePeriodUnit;

privileged aspect ReportController_Roo_Controller {
    	
    @RequestMapping(value = "/report", method = RequestMethod.POST)    
    public String ReportController.create(@Valid Report report, BindingResult result, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_REPORT);
        if (report == null) throw new IllegalArgumentException("A report is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("report", report);  
            ChildFields[] childFieldsArray = ChildFields.class.getEnumConstants();
            Arrays.sort(childFieldsArray, new ChildFieldsComparator());
            modelMap.addAttribute("childfields_enum", childFieldsArray);          
            ClinicalRecordFields[] crFieldsArray = ClinicalRecordFields.class.getEnumConstants();
            Arrays.sort(crFieldsArray, new ClinicalRecordFieldsComparator());
            modelMap.addAttribute("clinicalrecordfields_enum", crFieldsArray);            
            modelMap.addAttribute("countrys", Country.findAllCountrys(true));
            Country country = report.getCountry();
            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
            modelMap.addAttribute("diabetescentres", centres);            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());            
            modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());            
            modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants()); 
            String username = SecurityUtil.getInstance().getCurrentUsername();
            ArrayList<User> users = new ArrayList<User>();
            users.add(User.findUserbyUsername(username));
            modelMap.addAttribute("users", users);           
            modelMap.addAttribute("report_fromDate_date_format", AppContext.getDatePattern());            
            modelMap.addAttribute("report_toDate_date_format", AppContext.getDatePattern());            
            return "report/create";            
        }        
        report.persist();        
        return "redirect:/reportgenerator/" + report.getId();        
    }    
    
    @RequestMapping(value = "/report/form", method = RequestMethod.GET)    
    public String ReportController.createForm(ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_REPORT);
    	Report report = new Report();
    	report.setIsDeleted(false);
        modelMap.addAttribute("report", report);        
        ChildFields[] childFieldsArray = ChildFields.class.getEnumConstants();
        Arrays.sort(childFieldsArray, new ChildFieldsComparator());
        modelMap.addAttribute("childfields_enum", childFieldsArray);          
        ClinicalRecordFields[] crFieldsArray = ClinicalRecordFields.class.getEnumConstants();
        Arrays.sort(crFieldsArray, new ClinicalRecordFieldsComparator());
        modelMap.addAttribute("clinicalrecordfields_enum", crFieldsArray);      
        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
        Country country = report.getCountry();
        List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
        modelMap.addAttribute("diabetescentres", centres);      
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());        
        modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());        
        modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());     
        String username = SecurityUtil.getInstance().getCurrentUsername();
        ArrayList<User> users = new ArrayList<User>();
        users.add(User.findUserbyUsername(username));
        modelMap.addAttribute("users", users);        
        modelMap.addAttribute("report_fromDate_date_format", AppContext.getDatePattern());        
        modelMap.addAttribute("report_toDate_date_format", AppContext.getDatePattern());        
        return "report/create";        
    }    
    
    @RequestMapping(value = "/report/{id}", method = RequestMethod.GET)    
    public String ReportController.show(@PathVariable("id") Long id, ModelMap modelMap) {  
    	SecurityUtil.getInstance().checkPermission(Permissions.VIEW_REPORT);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("report_fromDate_date_format", AppContext.getDatePattern());        
        modelMap.addAttribute("report_toDate_date_format", AppContext.getDatePattern());        
        modelMap.addAttribute("report", Report.findReport(id));        
        return "report/show";        
    }    
    
    @RequestMapping(value = "/report", method = RequestMethod.GET)    
    public String ReportController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.VIEW_REPORT);
    	if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("reports", Report.findReportEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Report.countReports() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("reports", Report.findAllReports());            
        }        
        modelMap.addAttribute("report_fromDate_date_format", AppContext.getDatePattern());        
        modelMap.addAttribute("report_toDate_date_format", AppContext.getDatePattern());        
        return "report/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ReportController.update(@Valid Report report, BindingResult result, ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_REPORT);
    	if (report == null) throw new IllegalArgumentException("A report is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("report", report);            
            ChildFields[] childFieldsArray = ChildFields.class.getEnumConstants();
            Arrays.sort(childFieldsArray, new ChildFieldsComparator());
            modelMap.addAttribute("childfields_enum", childFieldsArray);          
            ClinicalRecordFields[] crFieldsArray = ClinicalRecordFields.class.getEnumConstants();
            Arrays.sort(crFieldsArray, new ClinicalRecordFieldsComparator());
            modelMap.addAttribute("clinicalrecordfields_enum", crFieldsArray);           
            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
            Country country = report.getCountry();
            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
            modelMap.addAttribute("diabetescentres", centres);            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());            
            modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());            
            modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());   
            String username = SecurityUtil.getInstance().getCurrentUsername();
            ArrayList<User> users = new ArrayList<User>();
            users.add(User.findUserbyUsername(username));
            modelMap.addAttribute("users", users);            
            modelMap.addAttribute("report_fromDate_date_format", AppContext.getDatePattern());            
            modelMap.addAttribute("report_toDate_date_format", AppContext.getDatePattern());            
            return "report/update";            
        }        
        report.merge();        
        return "redirect:/reportgenerator/" + report.getId();        
    }    
    
    @RequestMapping(value = "/report/{id}/form", method = RequestMethod.GET)    
    public String ReportController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_REPORT);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Report report = Report.findReport(id);
        modelMap.addAttribute("report", report);        
        ChildFields[] childFieldsArray = ChildFields.class.getEnumConstants();
        Arrays.sort(childFieldsArray, new ChildFieldsComparator());
        modelMap.addAttribute("childfields_enum", childFieldsArray);          
        ClinicalRecordFields[] crFieldsArray = ClinicalRecordFields.class.getEnumConstants();
        Arrays.sort(crFieldsArray, new ClinicalRecordFieldsComparator());
        modelMap.addAttribute("clinicalrecordfields_enum", crFieldsArray);      
        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
        Country country = report.getCountry();
        List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
        modelMap.addAttribute("diabetescentres", centres);        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        modelMap.addAttribute("showoptiontype_enum", ShowOptionType.class.getEnumConstants());        
        modelMap.addAttribute("statustype_enum", StatusType.class.getEnumConstants());        
        modelMap.addAttribute("timeperiodunit_enum", TimePeriodUnit.class.getEnumConstants());  
        
        String username = SecurityUtil.getInstance().getCurrentUsername();
        ArrayList<User> users = new ArrayList<User>();
        users.add(User.findUserbyUsername(username));
        modelMap.addAttribute("users", users);        
        modelMap.addAttribute("report_fromDate_date_format", AppContext.getDatePattern());        
        modelMap.addAttribute("report_toDate_date_format", AppContext.getDatePattern());        
        return "report/update";        
    }    
    
    @RequestMapping(value = "/report/{id}", method = RequestMethod.DELETE)    
    public String ReportController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_REPORT);
    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Report report = Report.findReport(id);
        report.setIsDeleted(true);
        report.persist();
        return "redirect:/report?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
