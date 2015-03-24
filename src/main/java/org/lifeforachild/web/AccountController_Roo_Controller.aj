package org.lifeforachild.web;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.domain.User;
import org.lifeforachild.util.SecurityUtil;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;;

privileged aspect AccountController_Roo_Controller {  
    
	private static final Log LOG = LogFactory.getLog(ChangePasswordController.class); 
    
    @RequestMapping(value = "/account", method = RequestMethod.GET)    
    public String AccountController.getAccount(ModelMap modelMap) {   
    	String username = SecurityUtil.getInstance().getCurrentUsername();
    	if (username == null || username.isEmpty()) {
    		return "accessDenied";
    	}
    	User user = User.findUserbyUsername(username);
    	modelMap.addAttribute("user", user); 
        return "account/update"; 
    }  
    
    @RequestMapping(value = "/account", method = RequestMethod.PUT)    
    public String AccountController.updateAccount(@Valid User user, BindingResult result, ModelMap modelMap) { 
    	//save user account details back
    	if (user == null || user.getId() == null) throw new IllegalArgumentException("A user is required");  
    	try {
        User updatedUser = User.findUser(user.getId());
        if (updatedUser != null) {
	        if (user.getFirstName() != null && !user.getFirstName().trim().isEmpty()) {
	        	updatedUser.setFirstName(user.getFirstName());
	        }
	        if (user.getLastName() != null && !user.getLastName().trim().isEmpty()) {
	        	updatedUser.setLastName(user.getLastName());
	        }
	        if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
	        	updatedUser.setEmail(user.getEmail());
	        }
	        updatedUser.merge();
        }
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
        return "account/success"; 
    }  
}
