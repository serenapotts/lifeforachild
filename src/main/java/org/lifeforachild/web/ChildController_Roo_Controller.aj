package org.lifeforachild.web;

import java.util.Date;

import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.CauseOfDeathType;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.DiabetesType;
import org.lifeforachild.domain.DistanceType;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.SexType;
import org.lifeforachild.domain.SurvivalStatusType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ChildController_Roo_Controller {
    
    @RequestMapping(value = "/child", method = RequestMethod.POST)    
    public String ChildController.create(@Valid Child child, BindingResult result, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CHILD);
        if (child == null) throw new IllegalArgumentException("A child is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("child", child);            
            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
            modelMap.addAttribute("child_createdOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_dateOfBirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_diabetesDiagnosed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_insulinSince_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_updatedOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_dateOfDeath_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_dateOfRegistration_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "child/create";            
        }        
        child.setAgeAtDiagnosis(child.calculatedAgeAtDiabetesDiagnosis());
        child.persist();  
        
        // now that child is created auto generate individual id
        String id = StringUtil.padWithZeros(child.getId(), 4);
        String countryId = StringUtil.padWithZeros(child.getCountry().getId(), 3);
        String centreId = StringUtil.padWithZeros(child.getCentre().getId(), 3);
        child.setIndividualId(countryId + centreId + id);
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
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());        
        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
        modelMap.addAttribute("child_createdOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfBirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_insulinSince_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_updatedOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfDeath_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfRegistration_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "child/create";        
    }    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.GET)    
    public String ChildController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("child_createdOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfBirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_insulinSince_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_updatedOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfDeath_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfRegistration_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
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
        modelMap.addAttribute("child_createdOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfBirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_insulinSince_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_updatedOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfDeath_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfRegistration_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "child/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ChildController.update(@Valid Child child, BindingResult result, ModelMap modelMap) {  
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
        if (child == null) throw new IllegalArgumentException("A child is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("child", child);            
            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
            modelMap.addAttribute("child_createdOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_dateOfBirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_diabetesDiagnosed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_insulinSince_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_updatedOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_dateOfDeath_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("child_dateOfRegistration_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
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
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());        
        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
        modelMap.addAttribute("child_createdOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfBirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_diabetesDiagnosed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_insulinSince_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_updatedOn_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfDeath_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("child_dateOfRegistration_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "child/update";        
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
    
}
