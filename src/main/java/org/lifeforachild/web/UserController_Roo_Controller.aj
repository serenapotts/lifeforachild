package org.lifeforachild.web;

privileged aspect UserController_Roo_Controller {
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/user", method = org.springframework.web.bind.annotation.RequestMethod.POST)    
    public java.lang.String UserController.create(@org.springframework.web.bind.annotation.ModelAttribute("user") org.lifeforachild.domain.User user, org.springframework.validation.BindingResult result) {    
        if (user == null) throw new IllegalArgumentException("A user is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.User> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(user)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "user/create";            
        }        
        user.persist();        
        return "redirect:/user/" + user.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/user/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String UserController.createForm(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("user", new org.lifeforachild.domain.User());        
        return "user/create";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/user/{id}", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String UserController.show(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("user", org.lifeforachild.domain.User.findUser(id));        
        return "user/show";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/user", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String UserController.list(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("users", org.lifeforachild.domain.User.findAllUsers());        
        return "user/list";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(method = org.springframework.web.bind.annotation.RequestMethod.PUT)    
    public java.lang.String UserController.update(@org.springframework.web.bind.annotation.ModelAttribute("user") org.lifeforachild.domain.User user, org.springframework.validation.BindingResult result) {    
        if (user == null) throw new IllegalArgumentException("A user is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.User> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(user)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "user/update";            
        }        
        user.merge();        
        return "redirect:/user/" + user.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/user/{id}/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String UserController.updateForm(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("user", org.lifeforachild.domain.User.findUser(id));        
        return "user/update";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/user/{id}", method = org.springframework.web.bind.annotation.RequestMethod.DELETE)    
    public java.lang.String UserController.delete(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        org.lifeforachild.domain.User.findUser(id).remove();        
        return "redirect:/user";        
    }    
    
}
