package org.lifeforachild.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;;

privileged aspect ForgotPasswordController_Roo_Controller {  
    
	private static final Log LOG = LogFactory.getLog(ForgotPasswordController.class); 

    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)    
    public String ForgotPasswordController.requestforgotPassword(ModelMap modelMap) { 
        return "forgotpassword/request"; 
    } 
    
    @RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)    
    public String ForgotPasswordController.forgotPassword(ModelMap modelMap) { 
    	// TODO check user has an email address set otherwise just return
    	// TODO send OTP email link
        return "forgotpassword/success"; 
    }         
}
