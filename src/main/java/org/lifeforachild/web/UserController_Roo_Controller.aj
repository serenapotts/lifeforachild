package org.lifeforachild.web;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.web.report.ReportGenerator;
import org.lifeforachild.web.report.UserReportGenerator;
import org.lifeforachild.web.validation.UserValidator;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserController_Roo_Controller {
	
	private static final Log LOG = LogFactory.getLog(UserController.class);
    
    @RequestMapping(value = "/user", method = RequestMethod.POST)    
    public String UserController.create(@Valid User user, BindingResult result, ModelMap modelMap) {   
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	        if (user == null) throw new IllegalArgumentException("A user is required");  
	        validate(result, user);        
	        encryptPassword(user);
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("user", user);            
	            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
	            Country country = user.getCountry();
	            List<DiabetesCentre> centres = (country == null) 
	        		? DiabetesCentre.findEmptyDiabetesCentres(true, new ArrayList<DiabetesCentre>())
	        		: DiabetesCentre.findAllDiabetesCentres(true, country.getId());
	            modelMap.addAttribute("diabetescentres", centres);           
	            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
	            return "user/create";            
	        }        
	        user.persist();     
	        return "redirect:/user/" + user.getId();  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to save user");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/user/form", method = RequestMethod.GET)    
    public String UserController.createForm(ModelMap modelMap) {
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	    	User user = new User();
	    	user.setIsDeleted(false);
	    	user.setCreatedOn(new Date());
	    	user.setUpdatedOn(new Date());    	
	    	String username = SecurityUtil.getInstance().getCurrentUsername();
	    	user.setCreatedBy(username);
	    	user.setUpdatedBy(username);
	    	user.setEnabled(true);
	        modelMap.addAttribute("user", user);        
	        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
	        List<DiabetesCentre> centres = DiabetesCentre.findEmptyDiabetesCentres(true, new ArrayList<DiabetesCentre>());   
	        modelMap.addAttribute("diabetescentres", centres); 
	        modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());        
	        return "user/create";  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate user for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)    
    public String UserController.show(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        modelMap.addAttribute("user", User.findUser(id, true));        
	        return "user/show";  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to display user with id" + id);
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/user", method = RequestMethod.GET)    
    public String UserController.list(@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	        if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("users", User.findUserEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) User.countUsers() / sizeNo;            
	            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("users", User.findAllUsers());            
	        }        
	        return "user/list";  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to list users");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String UserController.update(@Valid User user, BindingResult result, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	        if (user == null) throw new IllegalArgumentException("A user is required");  
	        validate(result, user);
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("user", user);            
	            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
	            Country country = user.getCountry();
	            List<DiabetesCentre> centres = (country == null) 
		    		? DiabetesCentre.findEmptyDiabetesCentres(true, new ArrayList<DiabetesCentre>())
		    		: DiabetesCentre.findAllDiabetesCentres(true, country.getId());
	            modelMap.addAttribute("diabetescentres", centres);            
	            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
	            return "user/update";            
	        }        
	        if (!user.getOldPassword().equals(user.getPassword()))
	        {
	        	// user has changed password so encode and save
	        	encryptPassword(user);
	        }     
	        user.merge();        
	        return "redirect:/user/" + user.getId(); 
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to update user");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/user/{id}/form", method = RequestMethod.GET)    
    public String UserController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {  
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");    
	        User user = User.findUser(id, true);
	        if (user.getCreatedOn() == null)	// for backcompatability
	        	user.setCreatedOn(new Date());
	        user.setUpdatedOn(new Date());
	        String username = SecurityUtil.getInstance().getCurrentUsername();
	        if (user.getCreatedBy() == null) 	// for backcompatability
	        	user.setCreatedBy(username);
	        user.setUpdatedBy(username);
	        user.setOldPassword(user.getPassword());
	        user.setOldUsername(user.getUsername());
	        modelMap.addAttribute("user", user);        
	        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
	        Country country = user.getCountry();
	        List<DiabetesCentre> centres = (country == null) 
				? DiabetesCentre.findEmptyDiabetesCentres(true, new ArrayList<DiabetesCentre>())
				: DiabetesCentre.findAllDiabetesCentres(true, country.getId());
	        modelMap.addAttribute("diabetescentres", centres);        
	        modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups()); 
	        return "user/update";      
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate user for update");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)    
    public String UserController.delete(@PathVariable("id") Long id, 
    									@RequestParam(value = "page", required = false) Integer page, 
    									@RequestParam(value = "size", required = false) Integer size) {   
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	    	SecurityUtil.getInstance().checkPermission(Permissions.USER_ADMIN);
	    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        User user = User.findUser(id, true);
	        user.setIsDeleted(true);
	        user.persist();
	        return "redirect:/user?page=" + ((page == null) ? "1" : page.toString()) 
	        		+ "&size=" + ((size == null) ? "10" : size.toString());  
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to delete user");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/user/print", method = RequestMethod.GET)    
    public void UserController.printForm(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
	{
    	try {
	    	ReportGenerator repGen = new UserReportGenerator();
	    	repGen.generateExcelReport("List Users'", User.findAllUsers(), null, request, response);
    	} catch (AccessDeniedException ade) {
     		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to print user report");
    		e.printStackTrace();
    	}
	}     
    
    public static void encryptPassword(User user)
    {
    	ShaPasswordEncoder passwordEncoder = new ShaPasswordEncoder();
        user.setPassword(passwordEncoder.encodePassword(user.getPassword(), null));
    }
    
	public void UserController.validate(BindingResult result, User user) {
		Errors errors = new BindException(result);
		UserValidator validator = new UserValidator();
		validator.validate(user, errors);
	}      
    
}
