package org.lifeforachild.web;

privileged aspect ChildController_Roo_Controller {
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/child/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ChildController.createForm(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("child", new org.lifeforachild.domain.Child());        
        modelMap.addAttribute("_causeofdeathtype", org.lifeforachild.domain.CauseOfDeathType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecords", org.lifeforachild.domain.ClinicalRecord.findAllClinicalRecords());        
        modelMap.addAttribute("_diabetestype", org.lifeforachild.domain.DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("_distancetype", org.lifeforachild.domain.DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("_sextype", org.lifeforachild.domain.SexType.class.getEnumConstants());        
        modelMap.addAttribute("_survivalstatustype", org.lifeforachild.domain.SurvivalStatusType.class.getEnumConstants());        
        return "child/create";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/child/{id}", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ChildController.show(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("child", org.lifeforachild.domain.Child.findChild(id));        
        return "child/show";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/child", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ChildController.list(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("children", org.lifeforachild.domain.Child.findAllChildren());        
        return "child/list";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/child/{id}/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ChildController.updateForm(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("child", org.lifeforachild.domain.Child.findChild(id));        
        modelMap.addAttribute("_causeofdeathtype", org.lifeforachild.domain.CauseOfDeathType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalrecords", org.lifeforachild.domain.ClinicalRecord.findAllClinicalRecords());        
        modelMap.addAttribute("_diabetestype", org.lifeforachild.domain.DiabetesType.class.getEnumConstants());        
        modelMap.addAttribute("_distancetype", org.lifeforachild.domain.DistanceType.class.getEnumConstants());        
        modelMap.addAttribute("_sextype", org.lifeforachild.domain.SexType.class.getEnumConstants());        
        modelMap.addAttribute("_survivalstatustype", org.lifeforachild.domain.SurvivalStatusType.class.getEnumConstants());        
        return "child/update";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/child/{id}", method = org.springframework.web.bind.annotation.RequestMethod.DELETE)    
    public java.lang.String ChildController.delete(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        org.lifeforachild.domain.Child.findChild(id).remove();        
        return "redirect:/child";        
    }    
    
    @org.springframework.web.bind.annotation.InitBinder    
    public void ChildController.initBinder(org.springframework.web.bind.WebDataBinder binder) {    
        binder.registerCustomEditor(java.util.Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(new java.text.SimpleDateFormat("d/MM/yyyy"), true));        
    }    
    
}
