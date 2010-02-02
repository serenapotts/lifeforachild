package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserController_Roo_Controller {
    
    @RequestMapping(value = "/user", method = RequestMethod.POST)    
    public String UserController.create(@Valid User user, BindingResult result, ModelMap modelMap) {    
        if (user == null) throw new IllegalArgumentException("A user is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("user", user);            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
            return "user/create";            
        }        
        user.persist();        
        return "redirect:/user/" + user.getId();        
    }    
    
    @RequestMapping(value = "/user/form", method = RequestMethod.GET)    
    public String UserController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("user", new User());        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());        
        modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());        
        return "user/create";        
    }    
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)    
    public String UserController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("user", User.findUser(id));        
        return "user/show";        
    }    
    
    @RequestMapping(value = "/user", method = RequestMethod.GET)    
    public String UserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("users", User.findUserEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) User.countUsers() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("users", User.findAllUsers());            
        }        
        return "user/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String UserController.update(@Valid User user, BindingResult result, ModelMap modelMap) {    
        if (user == null) throw new IllegalArgumentException("A user is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("user", user);            
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
            return "user/update";            
        }        
        user.merge();        
        return "redirect:/user/" + user.getId();        
    }    
    
    @RequestMapping(value = "/user/{id}/form", method = RequestMethod.GET)    
    public String UserController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("user", User.findUser(id));        
        modelMap.addAttribute("countrys", Country.findAllCountrys());        
        modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());        
        modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());        
        return "user/update";        
    }    
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)    
    public String UserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        User.findUser(id).remove();        
        return "redirect:/user?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
