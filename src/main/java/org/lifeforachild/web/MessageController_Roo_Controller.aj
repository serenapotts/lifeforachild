package org.lifeforachild.web;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Message;
import org.lifeforachild.domain.Permissions;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect MessageController_Roo_Controller {  
    
	private static final Log LOG = LogFactory.getLog(MessageController.class);
	
    @RequestMapping(value = "/message/{id}", method = RequestMethod.GET)    
    public String MessageController.show(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.EDIT_TRANSLATIONS);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("message", Message.find(id));        
	        return "message/show";        
    	} catch (Exception e) {
    		LOG.error("Unable to get message with id " + id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/message", method = RequestMethod.GET)    
    public String MessageController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.EDIT_TRANSLATIONS);
	    	if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("messages", Message.findMessageEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) Message.countMessages() / sizeNo;            
	            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("messages", Message.list());            
	        }        
	        return "message/list"; 
    	} catch (Exception e) {
    		LOG.error("Unable to list messages");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String MessageController.update(@Valid Message message, BindingResult result, ModelMap modelMap) { 
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.EDIT_TRANSLATIONS);
	        if (message == null) throw new IllegalArgumentException("A message is required");  
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("message", message);            
	            return "message/update";            
	        }        
	        message.merge();  
	        AppContext.clear();
	        return "redirect:/message/" + message.getId();  
    	} catch (Exception e) {
    		LOG.error("Unable to update messages");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/message/{id}/form", method = RequestMethod.GET)    
    public String MessageController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.EDIT_TRANSLATIONS);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");    
	        Message message = Message.find(id);
	        modelMap.addAttribute("message", message);        
	        return "message/update";       
    	} catch (Exception e) {
    		LOG.error("Unable to populate message for update");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
}
