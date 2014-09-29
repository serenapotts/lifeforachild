package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.web.Report.DiabetesCentreReportGenerator;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.validation.DiabetesCentreValidator;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect DiabetesCentreController_Roo_Controller {
	
	private static final Log LOG = LogFactory.getLog(DiabetesCentreController.class);
    
    @RequestMapping(value = "/diabetescentre", method = RequestMethod.POST)    
    public String DiabetesCentreController.create(@Valid DiabetesCentre diabetesCentre, 
    		BindingResult result, ModelMap modelMap) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
	    	if (diabetesCentre == null) throw new IllegalArgumentException("A diabetesCentre is required");      
	    	validate(result, diabetesCentre);
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("diabetesCentre", diabetesCentre);            
	            modelMap.addAttribute("countrys", Country.findAllCountrys());            
	            return "diabetescentre/create";            
	        }        
	        diabetesCentre.persist();        
	        return "redirect:/diabetescentre/" + diabetesCentre.getId(); 
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to save diabetes centre");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/diabetescentre/form", method = RequestMethod.GET)    
    public String DiabetesCentreController.createForm(ModelMap modelMap) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
	    	DiabetesCentre centre = new DiabetesCentre();
	    	centre.setIsDeleted(false);
	        modelMap.addAttribute("diabetesCentre", centre);        
	        modelMap.addAttribute("countrys", Country.findAllCountrys());        
	        return "diabetescentre/create";    
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate diabetes centre for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}", method = RequestMethod.GET)    
    public String DiabetesCentreController.show(@PathVariable("id") Long id, ModelMap modelMap) { 
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("diabetesCentre", DiabetesCentre.findDiabetesCentre(id));        
	        return "diabetescentre/show";     
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to get diabetes centre with id " + id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/diabetescentre", method = RequestMethod.GET)    
    public String DiabetesCentreController.list(@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
	        if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("diabetescentres", 
	            		DiabetesCentre.findDiabetesCentreEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) DiabetesCentre.countDiabetesCentres() / sizeNo;            
	            modelMap.addAttribute("maxPages", 
	            		(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("diabetescentres", DiabetesCentre.findAllDiabetesCentres());            
	        }        
	        return "diabetescentre/list";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to list diabetes centres");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String DiabetesCentreController.update(@Valid DiabetesCentre diabetesCentre, 
    		BindingResult result, ModelMap modelMap) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CENTRE);
	    	if (diabetesCentre == null) throw new IllegalArgumentException("A diabetesCentre is required");   
	    	validate(result, diabetesCentre);
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("diabetesCentre", diabetesCentre);            
	            modelMap.addAttribute("countrys", Country.findAllCountrys());            
	            return "diabetescentre/update";            
	        }        
	        diabetesCentre.merge();        
	        return "redirect:/diabetescentre/" + diabetesCentre.getId();  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to update diabetes centre");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}/form", method = RequestMethod.GET)    
    public String DiabetesCentreController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CENTRE);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("diabetesCentre", DiabetesCentre.findDiabetesCentre(id));        
	        modelMap.addAttribute("countrys", Country.findAllCountrys());        
	        return "diabetescentre/update";        
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate diabetes centre for update");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/diabetescentre/{id}", method = RequestMethod.DELETE)    
    public String DiabetesCentreController.delete(@PathVariable("id") Long id, 
    		@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	    	DiabetesCentre centre = DiabetesCentre.findDiabetesCentre(id);
	    	centre.setIsDeleted(true);
	    	centre.persist();
	        return "redirect:/diabetescentre?page=" + ((page == null) ? "1" : page.toString()) 
	        		+ "&size=" + ((size == null) ? "10" : size.toString()); 
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to delete diabetes centre with id" + id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/diabetescentre/print", method = RequestMethod.GET)    
    public void DiabetesCentreController.printForm(ModelMap modelMap, HttpServletRequest request, 
    		HttpServletResponse response)
	{
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CENTRE);
	    	ReportGenerator repGen = new DiabetesCentreReportGenerator();
	    	repGen.generateExcelReport("List Centres", DiabetesCentre.findAllDiabetesCentres(), null, request, response);
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to print diabetes centre report");
    		e.printStackTrace();
    	}
	}      
    
	public void DiabetesCentreController.validate(BindingResult result, DiabetesCentre diabetesCentre) {
		Errors errors = new BindException(result);
		DiabetesCentreValidator validator = new DiabetesCentreValidator();
		validator.validate(diabetesCentre, errors);
	}      
}
