package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.Report.UserGroupReportGenerator;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserGroupController_Roo_Controller {
	
	private static final Log LOG = LogFactory.getLog(UserGroupController.class);
    
    @RequestMapping(value = "/usergroup", method = RequestMethod.POST)    
    public String UserGroupController.create(@Valid UserGroup userGroup, BindingResult result, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	        if (userGroup == null) throw new IllegalArgumentException("A userGroup is required");        
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("userGroup", userGroup);            
	            modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());            
	            return "usergroup/create";            
	        }        
	        userGroup.persist();        
	        return "redirect:/usergroup/" + userGroup.getId(); 
    	} catch (Exception e) {
    		LOG.error("Unable to create user group");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/usergroup/form", method = RequestMethod.GET)    
    public String UserGroupController.createForm(ModelMap modelMap) { 
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	    	UserGroup usergroup = new UserGroup();
	    	usergroup.setIsDeleted(true);
	        modelMap.addAttribute("userGroup", usergroup);        
	        modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());        
	        return "usergroup/create";  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate user group for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/usergroup/{id}", method = RequestMethod.GET)    
    public String UserGroupController.show(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("userGroup", UserGroup.findUserGroup(id));        
	        return "usergroup/show";   
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to show user group with id " + id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/usergroup", method = RequestMethod.GET)    
    public String UserGroupController.list(@RequestParam(value = "page", required = false) Integer page, 
    									   @RequestParam(value = "size", required = false) Integer size, 
    									   ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	        if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("usergroups", UserGroup.findUserGroupEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) UserGroup.countUserGroups() / sizeNo;            
	            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
	        }        
	        return "usergroup/list";  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to list user groups");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String UserGroupController.update(@Valid UserGroup userGroup, BindingResult result, ModelMap modelMap) { 
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	        if (userGroup == null) throw new IllegalArgumentException("A userGroup is required");        
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("userGroup", userGroup);            
	            modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());            
	            return "usergroup/update";            
	        }        
	        userGroup.merge();        
	        return "redirect:/usergroup/" + userGroup.getId(); 
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to update user group");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/usergroup/{id}/form", method = RequestMethod.GET)    
    public String UserGroupController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("userGroup", UserGroup.findUserGroup(id));        
	        modelMap.addAttribute("permissionses", Permissions.findAllPermissionses());        
	        return "usergroup/update";  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate user group for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/usergroup/{id}", method = RequestMethod.DELETE)    
    public String UserGroupController.delete(@PathVariable("id") Long id, 
    										 @RequestParam(value = "page", required = false) Integer page, 
    										 @RequestParam(value = "size", required = false) Integer size) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        UserGroup usergroup = UserGroup.findUserGroup(id);
	        usergroup.setIsDeleted(true);
	        usergroup.persist();
	        return "redirect:/usergroup?page=" + ((page == null) ? "1" : page.toString()) 
	        		+ "&size=" + ((size == null) ? "10" : size.toString());  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to delete user group with id");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/usergroup/print", method = RequestMethod.GET)    
    public void UserGroupController.printForm(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
	{
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_GROUP_ADMIN);
	    	ReportGenerator repGen = new UserGroupReportGenerator();
	    	repGen.generateExcelReport("List User Groups", UserGroup.findAllUserGroups(), null, request, response);
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to print user group report");
    		e.printStackTrace();
    	}
	}      
    
}
