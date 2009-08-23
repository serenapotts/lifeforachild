package org.lifeforachild.web;

privileged aspect ClinicalRecordController_Roo_Controller {
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/clinicalrecord", method = org.springframework.web.bind.annotation.RequestMethod.POST)    
    public java.lang.String ClinicalRecordController.create(@org.springframework.web.bind.annotation.ModelAttribute("clinicalrecord") org.lifeforachild.domain.ClinicalRecord clinicalrecord, org.springframework.validation.BindingResult result) {    
        if (clinicalrecord == null) throw new IllegalArgumentException("A clinicalrecord is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.ClinicalRecord> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(clinicalrecord)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "clinicalrecord/create";            
        }        
        clinicalrecord.persist();        
        return "redirect:/clinicalrecord/" + clinicalrecord.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/clinicalrecord/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ClinicalRecordController.createForm(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("clinicalrecord", new org.lifeforachild.domain.ClinicalRecord());        
        return "clinicalrecord/create";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/clinicalrecord/{id}", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ClinicalRecordController.show(@org.springframework.web.bind.annotation.PathVariable("id") Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalrecord", org.lifeforachild.domain.ClinicalRecord.findClinicalRecord(id));        
        return "clinicalrecord/show";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/clinicalrecord", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ClinicalRecordController.list(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("clinicalrecords", org.lifeforachild.domain.ClinicalRecord.findAllClinicalRecords());        
        return "clinicalrecord/list";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(method = org.springframework.web.bind.annotation.RequestMethod.PUT)    
    public java.lang.String ClinicalRecordController.update(@org.springframework.web.bind.annotation.ModelAttribute("clinicalrecord") org.lifeforachild.domain.ClinicalRecord clinicalrecord, org.springframework.validation.BindingResult result) {    
        if (clinicalrecord == null) throw new IllegalArgumentException("A clinicalrecord is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.ClinicalRecord> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(clinicalrecord)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "clinicalrecord/update";            
        }        
        clinicalrecord.merge();        
        return "redirect:/clinicalrecord/" + clinicalrecord.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/clinicalrecord/{id}/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ClinicalRecordController.updateForm(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalrecord", org.lifeforachild.domain.ClinicalRecord.findClinicalRecord(id));        
        return "clinicalrecord/update";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/clinicalrecord/{id}", method = org.springframework.web.bind.annotation.RequestMethod.DELETE)    
    public java.lang.String ClinicalRecordController.delete(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        org.lifeforachild.domain.ClinicalRecord.findClinicalRecord(id).remove();        
        return "redirect:/clinicalrecord";        
    }    
    
}
