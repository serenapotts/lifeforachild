package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect DiabetesCentreController_Roo_Controller {
    
    @RequestMapping(value = "/diabetescentre", method = RequestMethod.POST)    
    public String DiabetesCentreController.create(@ModelAttribute("diabetescentre") DiabetesCentre diabetescentre, BindingResult result, ModelMap modelMap) {    
        if (diabetescentre == null) throw new IllegalArgumentException("A diabetescentre is required");        
        for (ConstraintViolation<DiabetesCentre> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(diabetescentre)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "diabetescentre.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("diabetescentre", diabetescentre);            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            return "diabetescentre/create";            
        }        
        diabetescentre.persist();        
        return "redirect:/diabetescentre/" + diabetescentre.getId();        
    }    
    
    @RequestMapping(value = "/diabetescentre/form", method = RequestMethod.GET)    
    public String DiabetesCentreController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("diabetescentre", new DiabetesCentre());        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        return "diabetescentre/create";        
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}", method = RequestMethod.GET)    
    public String DiabetesCentreController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("diabetescentre", DiabetesCentre.findDiabetesCentre(id));        
        return "diabetescentre/show";        
    }    
    
    @RequestMapping(value = "/diabetescentre", method = RequestMethod.GET)    
    public String DiabetesCentreController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findDiabetesCentreEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) DiabetesCentre.countDiabetesCentres() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
        }        
        return "diabetescentre/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String DiabetesCentreController.update(@ModelAttribute("diabetescentre") DiabetesCentre diabetescentre, BindingResult result, ModelMap modelMap) {    
        if (diabetescentre == null) throw new IllegalArgumentException("A diabetescentre is required");        
        for (ConstraintViolation<DiabetesCentre> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(diabetescentre)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "diabetescentre.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("diabetescentre", diabetescentre);            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            return "diabetescentre/update";            
        }        
        diabetescentre.merge();        
        return "redirect:/diabetescentre/" + diabetescentre.getId();        
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}/form", method = RequestMethod.GET)    
    public String DiabetesCentreController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("diabetescentre", DiabetesCentre.findDiabetesCentre(id));        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        return "diabetescentre/update";        
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}", method = RequestMethod.DELETE)    
    public String DiabetesCentreController.delete(@PathVariable("id") Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        DiabetesCentre.findDiabetesCentre(id).remove();        
        return "redirect:/diabetescentre";        
    }    
    
}
