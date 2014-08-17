package org.lifeforachild.web;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Message;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect MessageController_Roo_Controller {  
    
    @RequestMapping(value = "/message/{id}", method = RequestMethod.GET)    
    public String MessageController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("message", Message.find(id));        
        return "message/show";        
    }    
    
    @RequestMapping(value = "/message", method = RequestMethod.GET)    
    public String MessageController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("messages", Message.findMessageEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Message.countMessages() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("messages", Message.list());            
        }        
        return "message/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String MessageController.update(@Valid Message message, BindingResult result, ModelMap modelMap) {    
        if (message == null) throw new IllegalArgumentException("A message is required");  
        if (result.hasErrors()) {        
            modelMap.addAttribute("message", message);            
            return "message/update";            
        }        
        message.merge();  
        AppContext.clear();
        return "redirect:/message/" + message.getId();        
    }    
    
    @RequestMapping(value = "/message/{id}/form", method = RequestMethod.GET)    
    public String MessageController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");    
        Message message = Message.find(id);
        modelMap.addAttribute("message", message);        
        return "message/update";        
    }    
}
