package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Permissions;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PermissionsController_Roo_Controller {
	
	private static final Log LOG = LogFactory.getLog(PermissionsController.class);
    
    @RequestMapping(value = "/permissions", method = RequestMethod.POST)    
    public String PermissionsController.create(@Valid Permissions permissions, BindingResult result, ModelMap modelMap) {
    	try {
	        if (permissions == null) throw new IllegalArgumentException("A permissions is required");        
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("permissions", permissions);            
	            return "permissions/create";            
	        }        
	        permissions.persist();        
	        return "redirect:/permissions/" + permissions.getId(); 
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to create persmission");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/permissions/form", method = RequestMethod.GET)    
    public String PermissionsController.createForm(ModelMap modelMap) {   
    	try {
	        modelMap.addAttribute("permissions", new Permissions());        
	        return "permissions/create";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate persmission for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/permissions/{id}", method = RequestMethod.GET)    
    public String PermissionsController.show(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("permissions", Permissions.findPermissions(id));        
	        return "permissions/show";   
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to get persmission with id " + id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/permissions", method = RequestMethod.GET)    
    public String PermissionsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        try {
	    	if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("permissionses", Permissions.findPermissionsEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) Permissions.countPermissionses() / sizeNo;            
	            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());            
	        }        
	        return "permissions/list"; 
        } catch (AccessDeniedException ade) {
    		throw ade;
        } catch (Exception e) {
    		LOG.error("Unable to list persmissions");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String PermissionsController.update(@Valid Permissions permissions, BindingResult result, ModelMap modelMap) {
    	try {
	        if (permissions == null) throw new IllegalArgumentException("A permissions is required");        
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("permissions", permissions);            
	            return "permissions/update";            
	        }        
	        permissions.merge();        
	        return "redirect:/permissions/" + permissions.getId();  
    	 } catch (AccessDeniedException ade) {
     		throw ade;
         } catch (Exception e) {
     		LOG.error("Unable to update persmission");
     		e.printStackTrace();
     		return "unexpectedError";
     	}
    }    
    
    @RequestMapping(value = "/permissions/{id}/form", method = RequestMethod.GET)    
    public String PermissionsController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("permissions", Permissions.findPermissions(id));        
	        return "permissions/update"; 
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate persmission for update");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/permissions/{id}", method = RequestMethod.DELETE)    
    public String PermissionsController.delete(@PathVariable("id") Long id, 
    		@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        Permissions.findPermissions(id).remove();        
	        return "redirect:/permissions?page=" + ((page == null) ? "1" : page.toString()) 
	        		+ "&size=" + ((size == null) ? "10" : size.toString());  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to delete persmission");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
}
