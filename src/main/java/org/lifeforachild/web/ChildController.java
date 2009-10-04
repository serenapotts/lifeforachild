package org.lifeforachild.web;

import java.util.Date;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;

import org.lifeforachild.domain.Child;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(automaticallyMaintainView = true, formBackingObject = Child.class)
@RequestMapping("/child/**")
@Controller
public class ChildController {
	
    @RequestMapping(value = "/child", method = RequestMethod.POST)    
    public java.lang.String create(@ModelAttribute("child") Child child, BindingResult result) {    
        if (child == null) throw new IllegalArgumentException("A child is required");        
        for(ConstraintViolation<Child> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(child)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "child/create";            
        }        
        child.setCreatedOn(new Date());
        child.setUpdatedOn(new Date());
        child.persist();        
        return "redirect:/child/" + child.getId();        
    }    

    @RequestMapping(method = RequestMethod.PUT)    
    public java.lang.String update(@ModelAttribute("child") Child child, BindingResult result) {    
        if (child == null) throw new IllegalArgumentException("A child is required");        
        for(ConstraintViolation<Child> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(child)) {        
            result.rejectValue(constraint.getPropertyPath(), null, constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            return "child/update";            
        }        
        child.setUpdatedOn(new Date());
        child.merge();        
        return "redirect:/child/" + child.getId();        
    }    

}
