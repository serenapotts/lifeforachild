package org.lifeforachild.web;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.domain.ForgotPassword;
import org.lifeforachild.domain.User;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;;

privileged aspect ForgotPasswordController_Roo_Controller {  
    
	private static final Log LOG = LogFactory.getLog(ForgotPasswordController.class); 

    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)    
    public String ForgotPasswordController.requestforgotPassword(ModelMap modelMap) { 
    	modelMap.put("forgotPassword", new ForgotPassword());
        return "forgotpassword/request"; 
    } 
    
    @RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)    
    public String ForgotPasswordController.forgotPassword(@Valid ForgotPassword forgotPassword, ModelMap modelMap) { 
    	// TODO check user has an email address set otherwise just return
    	User user = User.findUserbyUsername(forgotPassword.getUsername());
    	if (user.getEmail() != null) {
    		// TODO send OTP email link
    		AppContext.getMailSender().send(true, false, "");
    	}
        return "forgotpassword/success"; 
    }         
}
