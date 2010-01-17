package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.UserGroup;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserGroupController_Roo_Controller {
    
    @RequestMapping(value = "/usergroup", method = RequestMethod.POST)    
    public String UserGroupController.create(@ModelAttribute("usergroup") UserGroup usergroup, BindingResult result, ModelMap modelMap) {    
        if (usergroup == null) throw new IllegalArgumentException("A usergroup is required");        
        for (ConstraintViolation<UserGroup> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(usergroup)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "usergroup.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("usergroup", usergroup);            
            modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());            
            return "usergroup/create";            
        }        
        usergroup.persist();        
        return "redirect:/usergroup/" + usergroup.getId();        
    }    
    
    @RequestMapping(value = "/usergroup/form", method = RequestMethod.GET)    
    public String UserGroupController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("usergroup", new UserGroup());        
        modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());        
        return "usergroup/create";        
    }    
    
    @RequestMapping(value = "/usergroup/{id}", method = RequestMethod.GET)    
    public String UserGroupController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("usergroup", UserGroup.findUserGroup(id));        
        return "usergroup/show";        
    }    
    
    @RequestMapping(value = "/usergroup", method = RequestMethod.GET)    
    public String UserGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("usergroups", UserGroup.findUserGroupEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) UserGroup.countUserGroups() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
        }        
        return "usergroup/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String UserGroupController.update(@ModelAttribute("usergroup") UserGroup usergroup, BindingResult result, ModelMap modelMap) {    
        if (usergroup == null) throw new IllegalArgumentException("A usergroup is required");        
        for (ConstraintViolation<UserGroup> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(usergroup)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "usergroup.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("usergroup", usergroup);            
            modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());            
            return "usergroup/update";            
        }        
        usergroup.merge();        
        return "redirect:/usergroup/" + usergroup.getId();        
    }    
    
    @RequestMapping(value = "/usergroup/{id}/form", method = RequestMethod.GET)    
    public String UserGroupController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("usergroup", UserGroup.findUserGroup(id));        
        modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());        
        return "usergroup/update";        
    }    
    
    @RequestMapping(value = "/usergroup/{id}", method = RequestMethod.DELETE)    
    public String UserGroupController.delete(@PathVariable("id") Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        UserGroup.findUserGroup(id).remove();        
        return "redirect:/usergroup";        
    }    
    
}
