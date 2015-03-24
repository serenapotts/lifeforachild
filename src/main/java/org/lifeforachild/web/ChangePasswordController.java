package org.lifeforachild.web;

import javax.validation.Valid;

import org.lifeforachild.domain.ChangePassword;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

@RequestMapping("/changepassword/**")
@Controller
public class ChangePasswordController {
	
	@RequestMapping(method = RequestMethod.GET)    
    public String requestChangePassword(ModelMap modelMap) {  
		modelMap.put("changePassword", new ChangePassword());
        return "changepassword/update"; 
    }  
	    
    @RequestMapping(method = RequestMethod.PUT)    
    public String changePassword(@Valid ChangePassword changePassword, BindingResult result, ModelMap modelMap) { 
    	if (changePassword == null) throw new IllegalArgumentException("A changePassword is required");  
        if (result.hasErrors()) {
        	modelMap.put("changePassword", changePassword);
        	return "changepassword/update";
        }
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
