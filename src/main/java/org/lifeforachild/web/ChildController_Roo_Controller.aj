package org.lifeforachild.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.web.Report.ChildReportGenerator;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.validation.ChildValidator;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.lifeforachild.domain.ChildFields;
import org.lifeforachild.enums.CauseOfDeathType;
import org.lifeforachild.enums.DiabetesType;
import org.lifeforachild.enums.DistanceType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.SurvivalStatusType;

privileged aspect ChildController_Roo_Controller {
    
    @RequestMapping(value = "/child", method = RequestMethod.POST)    
    public String ChildController.create(@Valid Child child, BindingResult result, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CHILD);
        if (child == null) throw new IllegalArgumentException("A child is required"); 
        validate(result, child);
        if (result.hasErrors()) {        
        	Country country = child.getCountry();
            modelMap.addAttribute("child", child);            
            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
            modelMap.addAttribute("countrys", Country.findAllCountrys());  
            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
            modelMap.addAttribute("diabetescentres", centres);            
            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
            modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());            
            modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());            
            modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());            
            modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());            
            modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());            
            modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());            
            modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());            
            return "child/create";            
        }        
        child.setAgeAtDiagnosis(child.calculatedAgeAtDiabetesDiagnosis());
        child.persist();  
        
        // now that child is created auto generate individual id
        Long countryId = child.getCountry().getId();
        Long centreId = child.getCentre().getId();
        // TODO is there a better way to do this as could cause a race condition and two have the same id but unlikely
        long centreChildCount = Child.numberChildrenInCentre(countryId, centreId);
        String id = StringUtil.padWithZeros(centreChildCount, 4);
        String paddedCountryId = StringUtil.padWithZeros(countryId, 3);
        String paddedCentreId = StringUtil.padWithZeros(centreId, 3);
        child.setIndividualId(paddedCountryId + paddedCentreId + id);
        child.persist();
        return "redirect:/child/" + child.getId();        
    }    
    
    @RequestMapping(value = "/child/form", method = RequestMethod.GET)    
    public String ChildController.createForm(ModelMap modelMap) {  
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CHILD);
    	Child child = new Child();
        child.setCreatedOn(new Date());
        child.setUpdatedOn(new Date());
        child.setIsDeleted(false);        
        modelMap.addAttribute("child", child);     	    
        modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        modelMap.addAttribute("diabetescentres", null);        
        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
        modelMap.addAttribute("child_createdOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());        
        modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());        
        modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());        
        return "child/create";        
    }    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.GET)    
    public String ChildController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("child_createdOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());        
        modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());        
        modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", getDatePattern());
        modelMap.addAttribute("child", Child.findChild(id));        
        return "child/show";        
    }    
    
    @RequestMapping(value = "/child", method = RequestMethod.GET)    
    public String ChildController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("children", Child.findChildEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Child.countChildren() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("children", Child.findAllChildren());            
        }        
        modelMap.addAttribute("child_createdOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());        
        modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());        
        modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());        
        return "child/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ChildController.update(@Valid Child child, BindingResult result, ModelMap modelMap) {  
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
        if (child == null) throw new IllegalArgumentException("A child is required");   
        validate(result, child);
        if (result.hasErrors()) {        
            modelMap.addAttribute("child", child);            
            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
            modelMap.addAttribute("countrys", Country.findAllCountrys());      
            Country country = child.getCountry();
            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
            modelMap.addAttribute("diabetescentres", centres);           
            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
            modelMap.addAttribute("child_createdOn_date_format", getDatePattern());            
            modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());            
            modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());            
            modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());            
            modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());            
            modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());            
            modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());
            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", getDatePattern());
            return "child/update";            
        }        
        child.setAgeAtDiagnosis(child.calculatedAgeAtDiabetesDiagnosis());
        child.merge();        
        return "redirect:/child/" + child.getId();        
    }    
    
    @RequestMapping(value = "/child/{id}/form", method = RequestMethod.GET)    
    public String ChildController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");     
        Child child = Child.findChild(id);
        child.setUpdatedOn(new Date()); 
        modelMap.addAttribute("child", child);     
        modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());        
        modelMap.addAttribute("countrys", Country.findAllCountrys());  
        Country country = child.getCountry();
        List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
        modelMap.addAttribute("diabetescentres", centres);        
        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
        modelMap.addAttribute("child_createdOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());        
        modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());        
        modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());        
        modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", getDatePattern());
        return "child/update";        
    }    
    
    @RequestMapping(value = "/child/{id}/print", method = RequestMethod.GET)    
    public String ChildController.printForm(@PathVariable("id") Long id, ModelMap modelMap)
	{
		SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");     
        Child child = Child.findChild(id); 
        modelMap.addAttribute("child", child); 
        modelMap.addAttribute("child_createdOn_date_format", getDatePattern());            
        modelMap.addAttribute("child_dateOfBirth_date_format", getDatePattern());            
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", getDatePattern());            
        modelMap.addAttribute("child_insulinSince_date_format", getDatePattern());            
        modelMap.addAttribute("child_updatedOn_date_format", getDatePattern());            
        modelMap.addAttribute("child_dateOfDeath_date_format", getDatePattern());            
        modelMap.addAttribute("child_dateOfRegistration_date_format", getDatePattern());        
		return "child/print";
	}
    
    @RequestMapping(value = "/child/print", method = RequestMethod.GET)    
    public void ChildController.printForm(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
	{
    	ReportGenerator repGen = new ChildReportGenerator();
    	repGen.generateExcelReport("List Children", Child.findAllChildren(), new ChildFields[] {}, request, response);
		//SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
        //modelMap.addAttribute("children", );         
		//return "child/printList";
	}    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.DELETE)    
    public String ChildController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Child child = Child.findChild(id);  
        child.setIsDeleted(true);
        child.persist();
        return "redirect:/child?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
	public void ChildController.validate(BindingResult result, Child child) {
		Errors errors = new BindException(result);
		ChildValidator validator = new ChildValidator();
		validator.validate(child, errors);
	}    
    
}
