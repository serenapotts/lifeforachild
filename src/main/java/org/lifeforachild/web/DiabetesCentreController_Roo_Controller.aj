package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Permissions;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect DiabetesCentreController_Roo_Controller {
    
    @RequestMapping(value = "/diabetescentre", method = RequestMethod.POST)    
    public String DiabetesCentreController.create(@Valid DiabetesCentre diabetesCentre, BindingResult result, ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
    	if (diabetesCentre == null) throw new IllegalArgumentException("A diabetesCentre is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("diabetesCentre", diabetesCentre);            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            return "diabetescentre/create";            
        }        
        diabetesCentre.persist();        
        return "redirect:/diabetescentre/" + diabetesCentre.getId();        
    }    
    
    @RequestMapping(value = "/diabetescentre/form", method = RequestMethod.GET)    
    public String DiabetesCentreController.createForm(ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
    	DiabetesCentre centre = new DiabetesCentre();
    	centre.setIsDeleted(false);
        modelMap.addAttribute("diabetesCentre", centre);        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        return "diabetescentre/create";        
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}", method = RequestMethod.GET)    
    public String DiabetesCentreController.show(@PathVariable("id") Long id, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("diabetesCentre", DiabetesCentre.findDiabetesCentre(id));        
        return "diabetescentre/show";        
    }    
    
    @RequestMapping(value = "/diabetescentre", method = RequestMethod.GET)    
    public String DiabetesCentreController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
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
    public String DiabetesCentreController.update(@Valid DiabetesCentre diabetesCentre, BindingResult result, ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CENTRE);
    	if (diabetesCentre == null) throw new IllegalArgumentException("A diabetesCentre is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("diabetesCentre", diabetesCentre);            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            return "diabetescentre/update";            
        }        
        diabetesCentre.merge();        
        return "redirect:/diabetescentre/" + diabetesCentre.getId();        
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}/form", method = RequestMethod.GET)    
    public String DiabetesCentreController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {  
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CENTRE);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("diabetesCentre", DiabetesCentre.findDiabetesCentre(id));        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        return "diabetescentre/update";        
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}", method = RequestMethod.DELETE)    
    public String DiabetesCentreController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CENTRE);
    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
    	DiabetesCentre centre = DiabetesCentre.findDiabetesCentre(id);
    	centre.setIsDeleted(true);
    	centre.persist();
        return "redirect:/diabetescentre?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
