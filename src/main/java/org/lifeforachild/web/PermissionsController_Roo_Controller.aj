package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.lifeforachild.domain.Permissions;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PermissionsController_Roo_Controller {
    
    @RequestMapping(value = "/permissions", method = RequestMethod.POST)    
    public String PermissionsController.create(@Valid Permissions permissions, BindingResult result, ModelMap modelMap) {    
        if (permissions == null) throw new IllegalArgumentException("A permissions is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("permissions", permissions);            
            return "permissions/create";            
        }        
        permissions.persist();        
        return "redirect:/permissions/" + permissions.getId();        
    }    
    
    @RequestMapping(value = "/permissions/form", method = RequestMethod.GET)    
    public String PermissionsController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("permissions", new Permissions());        
        return "permissions/create";        
    }    
    
    @RequestMapping(value = "/permissions/{id}", method = RequestMethod.GET)    
    public String PermissionsController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("permissions", Permissions.findPermissions(id));        
        return "permissions/show";        
    }    
    
    @RequestMapping(value = "/permissions", method = RequestMethod.GET)    
    public String PermissionsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("permissionses", Permissions.findPermissionsEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Permissions.countPermissionses() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());            
        }        
        return "permissions/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String PermissionsController.update(@Valid Permissions permissions, BindingResult result, ModelMap modelMap) {    
        if (permissions == null) throw new IllegalArgumentException("A permissions is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("permissions", permissions);            
            return "permissions/update";            
        }        
        permissions.merge();        
        return "redirect:/permissions/" + permissions.getId();        
    }    
    
    @RequestMapping(value = "/permissions/{id}/form", method = RequestMethod.GET)    
    public String PermissionsController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("permissions", Permissions.findPermissions(id));        
        return "permissions/update";        
    }    
    
    @RequestMapping(value = "/permissions/{id}", method = RequestMethod.DELETE)    
    public String PermissionsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Permissions.findPermissions(id).remove();        
        return "redirect:/permissions?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
