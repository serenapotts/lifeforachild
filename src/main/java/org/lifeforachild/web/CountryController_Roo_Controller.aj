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

privileged aspect CountryController_Roo_Controller {
    
    @RequestMapping(value = "/country", method = RequestMethod.POST)    
    public String CountryController.create(@ModelAttribute("country") Country country, BindingResult result, ModelMap modelMap) {    
        if (country == null) throw new IllegalArgumentException("A country is required");        
        for (ConstraintViolation<Country> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(country)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "country.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("country", country);            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
            return "country/create";            
        }        
        country.persist();        
        return "redirect:/country/" + country.getId();        
    }    
    
    @RequestMapping(value = "/country/form", method = RequestMethod.GET)    
    public String CountryController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("country", new Country());        
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());        
        return "country/create";        
    }    
    
    @RequestMapping(value = "/country/{id}", method = RequestMethod.GET)    
    public String CountryController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("country", Country.findCountry(id));        
        return "country/show";        
    }    
    
    @RequestMapping(value = "/country", method = RequestMethod.GET)    
    public String CountryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("countrys", Country.findCountryEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Country.countCountrys() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
        }        
        return "country/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String CountryController.update(@ModelAttribute("country") Country country, BindingResult result, ModelMap modelMap) {    
        if (country == null) throw new IllegalArgumentException("A country is required");        
        for (ConstraintViolation<Country> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(country)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "country.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("country", country);            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
            return "country/update";            
        }        
        country.merge();        
        return "redirect:/country/" + country.getId();        
    }    
    
    @RequestMapping(value = "/country/{id}/form", method = RequestMethod.GET)    
    public String CountryController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("country", Country.findCountry(id));        
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());        
        return "country/update";        
    }    
    
    @RequestMapping(value = "/country/{id}", method = RequestMethod.DELETE)    
    public String CountryController.delete(@PathVariable("id") Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Country.findCountry(id).remove();        
        return "redirect:/country";        
    }    
    
}
