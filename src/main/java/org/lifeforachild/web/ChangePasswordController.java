package org.lifeforachild.web;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

@RequestMapping("/changepassword/**")
@Controller
public class ChangePasswordController {
	
	@RequestMapping(method = RequestMethod.GET)    
    public String requestChangePassword(ModelMap modelMap) {        
        return "changepassword/update"; 
    }  
	    
    @RequestMapping(method = RequestMethod.PUT)    
    public String changePassword(@RequestParam String oldPassword, @RequestParam String newPassword, 
    							 @RequestParam String confirmPassword, ModelMap modelMap) { 
    	// TODO do validation checks then update password value
    	// TODO send password changed email notification
    	/*String username = SecurityUtil.getInstance().getCurrentUsername();
    	if (username == null || username.isEmpty()) {
    		return "accessDenied";
    	}
    	User user = User.findUserbyUsername(username);
    	String encPassword = UserController.encryptPassword(oldPassword);
    	if (!user.getPassword().equals(encPassword) || !newPassword.equals(confirmPassword)) {
    		return "changepassword/update";
    	}
    	user.setPassword(UserController.encryptPassword(newPassword));*/
        return "changepassword/success"; 
    }
}
