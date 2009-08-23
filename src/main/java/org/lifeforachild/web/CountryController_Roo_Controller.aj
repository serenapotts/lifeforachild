package org.lifeforachild.web;

privileged aspect CountryController_Roo_Controller {
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/country", method = org.springframework.web.bind.annotation.RequestMethod.POST)    
    public java.lang.String CountryController.create(@org.springframework.web.bind.annotation.ModelAttribute("country") org.lifeforachild.domain.Country country, org.springframework.validation.BindingResult result) {    
        if (country == null) throw new IllegalArgumentException("A country is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.Country> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(country)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "country/create";            
        }        
        country.persist();        
        return "redirect:/country/" + country.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/country/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String CountryController.createForm(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("country", new org.lifeforachild.domain.Country());        
        modelMap.addAttribute("diabetescentres", org.lifeforachild.domain.DiabetesCentre.findAllDiabetesCentres());        
        return "country/create";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/country/{id}", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String CountryController.show(@org.springframework.web.bind.annotation.PathVariable("id") Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("country", org.lifeforachild.domain.Country.findCountry(id));        
        return "country/show";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/country", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String CountryController.list(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("countrys", org.lifeforachild.domain.Country.findAllCountrys());        
        return "country/list";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(method = org.springframework.web.bind.annotation.RequestMethod.PUT)    
    public java.lang.String CountryController.update(@org.springframework.web.bind.annotation.ModelAttribute("country") org.lifeforachild.domain.Country country, org.springframework.validation.BindingResult result) {    
        if (country == null) throw new IllegalArgumentException("A country is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.Country> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(country)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "country/update";            
        }        
        country.merge();        
        return "redirect:/country/" + country.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/country/{id}/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String CountryController.updateForm(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("country", org.lifeforachild.domain.Country.findCountry(id));        
        modelMap.addAttribute("diabetescentres", org.lifeforachild.domain.DiabetesCentre.findAllDiabetesCentres());        
        return "country/update";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/country/{id}", method = org.springframework.web.bind.annotation.RequestMethod.DELETE)    
    public java.lang.String CountryController.delete(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        org.lifeforachild.domain.Country.findCountry(id).remove();        
        return "redirect:/country";        
    }    
    
}
