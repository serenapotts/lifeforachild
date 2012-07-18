package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.lifeforachild.domain.ReportProperties;
import org.lifeforachild.web.Report.enums.ReportType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ReportPropertiesController_Roo_Controller {
    
    @RequestMapping(value = "/reportproperties", method = RequestMethod.POST)    
    public String ReportPropertiesController.create(@Valid ReportProperties reportProperties, BindingResult result, ModelMap modelMap) {    
        if (reportProperties == null) throw new IllegalArgumentException("A reportProperties is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("reportProperties", reportProperties);            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            return "reportproperties/create";            
        }        
        reportProperties.persist();        
        return "redirect:/reportproperties/" + reportProperties.get_id();        
    }    
    
    @RequestMapping(value = "/reportproperties/form", method = RequestMethod.GET)    
    public String ReportPropertiesController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("reportProperties", new ReportProperties());        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        return "reportproperties/create";        
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}", method = RequestMethod.GET)    
    public String ReportPropertiesController.show(@PathVariable("_id") Long _id, ModelMap modelMap) {    
        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("reportProperties", ReportProperties.findReportProperties(_id));        
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
    public String ReportPropertiesController.update(@Valid ReportProperties reportProperties, BindingResult result, ModelMap modelMap) {    
        if (reportProperties == null) throw new IllegalArgumentException("A reportProperties is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("reportProperties", reportProperties);            
            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
            return "reportproperties/update";            
        }        
        reportProperties.merge();        
        return "redirect:/reportproperties/" + reportProperties.get_id();        
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}/form", method = RequestMethod.GET)    
    public String ReportPropertiesController.updateForm(@PathVariable("_id") Long _id, ModelMap modelMap) {    
        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("reportProperties", ReportProperties.findReportProperties(_id));        
        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
        return "reportproperties/update";        
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}", method = RequestMethod.DELETE)    
    public String ReportPropertiesController.delete(@PathVariable("_id") Long _id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
        ReportProperties.findReportProperties(_id).remove();        
        return "redirect:/reportproperties?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
