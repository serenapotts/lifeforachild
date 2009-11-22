package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import org.lifeforachild.domain.ReportProperties;
import org.lifeforachild.domain.ReportType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ReportPropertiesController_Roo_Controller {
    
    @RequestMapping(value = "/reportproperties", method = RequestMethod.POST)    
    public String ReportPropertiesController.create(@ModelAttribute("reportproperties") ReportProperties reportproperties, BindingResult result, ModelMap modelMap) {    
        if (reportproperties == null) throw new IllegalArgumentException("A reportproperties is required");        
        for (ConstraintViolation<ReportProperties> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(reportproperties)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "reportproperties.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("reportproperties", reportproperties);            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            return "reportproperties/create";            
        }        
        reportproperties.persist();        
        return "redirect:/reportproperties/" + reportproperties.get_id();        
    }    
    
    @RequestMapping(value = "/reportproperties/form", method = RequestMethod.GET)    
    public String ReportPropertiesController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("reportproperties", new ReportProperties());        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        return "reportproperties/create";        
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}", method = RequestMethod.GET)    
    public String ReportPropertiesController.show(@PathVariable("_id") Long _id, ModelMap modelMap) {    
        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("reportproperties", ReportProperties.findReportProperties(_id));        
        return "reportproperties/show";        
    }    
    
    @RequestMapping(value = "/reportproperties", method = RequestMethod.GET)    
    public String ReportPropertiesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("reportpropertieses", ReportProperties.findReportPropertiesEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) ReportProperties.countReportPropertieses() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("reportpropertieses", ReportProperties.findAllReportPropertieses());            
        }        
        return "reportproperties/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ReportPropertiesController.update(@ModelAttribute("reportproperties") ReportProperties reportproperties, BindingResult result, ModelMap modelMap) {    
        if (reportproperties == null) throw new IllegalArgumentException("A reportproperties is required");        
        for (ConstraintViolation<ReportProperties> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(reportproperties)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "reportproperties.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("reportproperties", reportproperties);            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            return "reportproperties/update";            
        }        
        reportproperties.merge();        
        return "redirect:/reportproperties/" + reportproperties.get_id();        
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}/form", method = RequestMethod.GET)    
    public String ReportPropertiesController.updateForm(@PathVariable("_id") Long _id, ModelMap modelMap) {    
        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("reportproperties", ReportProperties.findReportProperties(_id));        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        return "reportproperties/update";        
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}", method = RequestMethod.DELETE)    
    public String ReportPropertiesController.delete(@PathVariable("_id") Long _id) {    
        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
        ReportProperties.findReportProperties(_id).remove();        
        return "redirect:/reportproperties";        
    }    
    
}
