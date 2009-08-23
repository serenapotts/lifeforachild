package org.lifeforachild.web;

privileged aspect DiabetesCentreController_Roo_Controller {
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/diabetescentre", method = org.springframework.web.bind.annotation.RequestMethod.POST)    
    public java.lang.String DiabetesCentreController.create(@org.springframework.web.bind.annotation.ModelAttribute("diabetescentre") org.lifeforachild.domain.DiabetesCentre diabetescentre, org.springframework.validation.BindingResult result) {    
        if (diabetescentre == null) throw new IllegalArgumentException("A diabetescentre is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.DiabetesCentre> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(diabetescentre)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "diabetescentre/create";            
        }        
        diabetescentre.persist();        
        return "redirect:/diabetescentre/" + diabetescentre.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/diabetescentre/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String DiabetesCentreController.createForm(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("diabetescentre", new org.lifeforachild.domain.DiabetesCentre());        
        modelMap.addAttribute("countrys", org.lifeforachild.domain.Country.findAllCountrys());        
        return "diabetescentre/create";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/diabetescentre/{id}", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String DiabetesCentreController.show(@org.springframework.web.bind.annotation.PathVariable("id") Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("diabetescentre", org.lifeforachild.domain.DiabetesCentre.findDiabetesCentre(id));        
        return "diabetescentre/show";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/diabetescentre", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String DiabetesCentreController.list(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("diabetescentres", org.lifeforachild.domain.DiabetesCentre.findAllDiabetesCentres());        
        return "diabetescentre/list";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(method = org.springframework.web.bind.annotation.RequestMethod.PUT)    
    public java.lang.String DiabetesCentreController.update(@org.springframework.web.bind.annotation.ModelAttribute("diabetescentre") org.lifeforachild.domain.DiabetesCentre diabetescentre, org.springframework.validation.BindingResult result) {    
        if (diabetescentre == null) throw new IllegalArgumentException("A diabetescentre is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.DiabetesCentre> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(diabetescentre)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "diabetescentre/update";            
        }        
        diabetescentre.merge();        
        return "redirect:/diabetescentre/" + diabetescentre.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/diabetescentre/{id}/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String DiabetesCentreController.updateForm(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("diabetescentre", org.lifeforachild.domain.DiabetesCentre.findDiabetesCentre(id));        
        modelMap.addAttribute("countrys", org.lifeforachild.domain.Country.findAllCountrys());        
        return "diabetescentre/update";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/diabetescentre/{id}", method = org.springframework.web.bind.annotation.RequestMethod.DELETE)    
    public java.lang.String DiabetesCentreController.delete(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        org.lifeforachild.domain.DiabetesCentre.findDiabetesCentre(id).remove();        
        return "redirect:/diabetescentre";        
    }    
    
}
