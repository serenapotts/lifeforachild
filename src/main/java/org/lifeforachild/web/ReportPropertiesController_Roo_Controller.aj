package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.ReportProperties;
import org.lifeforachild.web.report.enums.ReportType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ReportPropertiesController_Roo_Controller {
	
	private static final Log LOG = LogFactory.getLog(ReportPropertiesController.class);
    
    @RequestMapping(value = "/reportproperties", method = RequestMethod.POST)    
    public String ReportPropertiesController.create(@Valid ReportProperties reportProperties, BindingResult result, 
    		ModelMap modelMap) {    
    	try {
	        if (reportProperties == null) throw new IllegalArgumentException("A reportProperties is required");        
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("reportProperties", reportProperties);            
	            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
	            return "reportproperties/create";            
	        }        
	        reportProperties.persist();        
	        return "redirect:/reportproperties/" + reportProperties.get_id();  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to create report properties");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/reportproperties/form", method = RequestMethod.GET)    
    public String ReportPropertiesController.createForm(ModelMap modelMap) {    
    	try {
	        modelMap.addAttribute("reportProperties", new ReportProperties());        
	        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
	        return "reportproperties/create";    
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate report properties for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}", method = RequestMethod.GET)    
    public String ReportPropertiesController.show(@PathVariable("_id") Long _id, ModelMap modelMap) {  
    	try {
	        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("reportProperties", ReportProperties.findReportProperties(_id));        
	        return "reportproperties/show";   
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to show report properties with id " + _id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/reportproperties", method = RequestMethod.GET)    
    public String ReportPropertiesController.list(@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
    	try {
	        if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("reportpropertieses", ReportProperties.findReportPropertiesEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) ReportProperties.countReportPropertieses() / sizeNo;            
	            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("reportpropertieses", ReportProperties.findAllReportPropertieses());            
	        }        
	        return "reportproperties/list"; 
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to list report properties");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ReportPropertiesController.update(@Valid ReportProperties reportProperties, 
    		BindingResult result, ModelMap modelMap) {    
    	try {
	        if (reportProperties == null) throw new IllegalArgumentException("A reportProperties is required");        
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("reportProperties", reportProperties);            
	            modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());            
	            return "reportproperties/update";            
	        }        
	        reportProperties.merge();        
	        return "redirect:/reportproperties/" + reportProperties.get_id();  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to update report properties");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}/form", method = RequestMethod.GET)    
    public String ReportPropertiesController.updateForm(@PathVariable("_id") Long _id, ModelMap modelMap) { 
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	        if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("reportProperties", ReportProperties.findReportProperties(_id));        
	        modelMap.addAttribute("reporttype_enum", ReportType.class.getEnumConstants());        
	        return "reportproperties/update";     
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to update report properties");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/reportproperties/{_id}", method = RequestMethod.DELETE)    
    public String ReportPropertiesController.delete(@PathVariable("_id") Long _id, 
    		@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size) {  
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	    	if (_id == null) throw new IllegalArgumentException("An Identifier is required");        
	        ReportProperties.findReportProperties(_id).remove();        
	        return "redirect:/reportproperties?page=" + ((page == null) ? "1" : page.toString()) 
	        		+ "&size=" + ((size == null) ? "10" : size.toString());  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate report properties for update");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
}
