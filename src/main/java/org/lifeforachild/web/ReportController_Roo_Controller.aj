package org.lifeforachild.web;

privileged aspect ReportController_Roo_Controller {
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/report", method = org.springframework.web.bind.annotation.RequestMethod.POST)    
    public java.lang.String ReportController.create(@org.springframework.web.bind.annotation.ModelAttribute("report") org.lifeforachild.domain.Report report, org.springframework.validation.BindingResult result) {    
        if (report == null) throw new IllegalArgumentException("A report is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.Report> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(report)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "report/create";            
        }        
        report.persist();        
        return "redirect:/report/" + report.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/report/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ReportController.createForm(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("report", new org.lifeforachild.domain.Report());        
        modelMap.addAttribute("_reporttype", org.lifeforachild.domain.ReportType.class.getEnumConstants());        
        modelMap.addAttribute("_statustype", org.lifeforachild.domain.StatusType.class.getEnumConstants());        
        modelMap.addAttribute("_timeperiodunit", org.lifeforachild.domain.TimePeriodUnit.class.getEnumConstants());        
        return "report/create";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/report/{id}", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ReportController.show(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("report", org.lifeforachild.domain.Report.findReport(id));        
        return "report/show";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/report", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ReportController.list(org.springframework.ui.ModelMap modelMap) {    
        modelMap.addAttribute("reports", org.lifeforachild.domain.Report.findAllReports());        
        return "report/list";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(method = org.springframework.web.bind.annotation.RequestMethod.PUT)    
    public java.lang.String ReportController.update(@org.springframework.web.bind.annotation.ModelAttribute("report") org.lifeforachild.domain.Report report, org.springframework.validation.BindingResult result) {    
        if (report == null) throw new IllegalArgumentException("A report is required");        
        for(javax.validation.ConstraintViolation<org.lifeforachild.domain.Report> constraint : javax.validation.Validation.buildDefaultValidatorFactory().getValidator().validate(report)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "report/update";            
        }        
        report.merge();        
        return "redirect:/report/" + report.getId();        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/report/{id}/form", method = org.springframework.web.bind.annotation.RequestMethod.GET)    
    public java.lang.String ReportController.updateForm(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id, org.springframework.ui.ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("report", org.lifeforachild.domain.Report.findReport(id));        
        modelMap.addAttribute("_reporttype", org.lifeforachild.domain.ReportType.class.getEnumConstants());        
        modelMap.addAttribute("_statustype", org.lifeforachild.domain.StatusType.class.getEnumConstants());        
        modelMap.addAttribute("_timeperiodunit", org.lifeforachild.domain.TimePeriodUnit.class.getEnumConstants());        
        return "report/update";        
    }    
    
    @org.springframework.web.bind.annotation.RequestMapping(value = "/report/{id}", method = org.springframework.web.bind.annotation.RequestMethod.DELETE)    
    public java.lang.String ReportController.delete(@org.springframework.web.bind.annotation.PathVariable("id") java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        org.lifeforachild.domain.Report.findReport(id).remove();        
        return "redirect:/report";        
    }    
    
    @org.springframework.web.bind.annotation.InitBinder    
    public void ReportController.initBinder(org.springframework.web.bind.WebDataBinder binder) {    
        binder.registerCustomEditor(java.util.Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(new java.text.SimpleDateFormat("d/MM/yyyy"), false));        
    }    
    
}
