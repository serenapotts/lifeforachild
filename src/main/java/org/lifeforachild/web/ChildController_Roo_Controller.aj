package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import org.lifeforachild.domain.CauseOfDeathType;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.DiabetesType;
import org.lifeforachild.domain.DistanceType;
import org.lifeforachild.domain.SexType;
import org.lifeforachild.domain.SurvivalStatusType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ChildController_Roo_Controller {
    
    @RequestMapping(value = "/child", method = RequestMethod.POST)    
    public String ChildController.create(@ModelAttribute("child") Child child, BindingResult result, ModelMap modelMap) {    
        if (child == null) throw new IllegalArgumentException("A child is required");        
        for (ConstraintViolation<Child> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(child)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "child.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("child", child);            
            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
            return "child/create";            
        }        
        child.persist();        
        return "redirect:/child/" + child.getId();        
    }    
    
    @RequestMapping(value = "/child/form", method = RequestMethod.GET)    
    public String ChildController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("child", new Child());        
        modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());        
        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
        return "child/create";        
    }    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.GET)    
    public String ChildController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
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
        return "child/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ChildController.update(@ModelAttribute("child") Child child, BindingResult result, ModelMap modelMap) {    
        if (child == null) throw new IllegalArgumentException("A child is required");        
        for (ConstraintViolation<Child> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(child)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "child.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("child", child);            
            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
            return "child/update";            
        }        
        child.merge();        
        return "redirect:/child/" + child.getId();        
    }    
    
    @RequestMapping(value = "/child/{id}/form", method = RequestMethod.GET)    
    public String ChildController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("child", Child.findChild(id));        
        modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());        
        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
        return "child/update";        
    }    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.DELETE)    
    public String ChildController.delete(@PathVariable("id") Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Child.findChild(id).remove();        
        return "redirect:/child";        
    }    
    
    @InitBinder    
    public void ChildController.initBinder(WebDataBinder binder) {    
        binder.registerCustomEditor(java.util.Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(new java.text.SimpleDateFormat("d/MM/yy"), true));        
    }    
    
}
