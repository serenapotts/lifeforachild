package org.lifeforachild.web;

import javax.validation.Valid;

import org.lifeforachild.domain.ChangePassword;
import org.lifeforachild.domain.User;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.web.validation.UserValidator;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    	String username = SecurityUtil.getInstance().getCurrentUsername();
    	if (username == null || username.isEmpty()) {
    		return "accessDenied";
    	}
    	User user = User.findUserbyUsername(username);
    	validate(result, user, changePassword);
    	if (result.hasErrors()) {
    		return "changepassword/update";
    	}
    	user.setPassword(UserController.encryptPassword(changePassword.getNewPassword()));
    	user.merge();
    	// TODO send updated email notification
        return "changepassword/success"; 
    }
    
    public void validate(BindingResult result, User user, ChangePassword changePassword) {
		Errors errors = new BindException(result);
		String encPassword = UserController.encryptPassword(changePassword.getOldPassword());
    	if (!user.getPassword().equals(encPassword)) {
    		errors.rejectValue("oldPassword", "user.old.password.invalid");
    	}
    	if (!changePassword.getNewPassword().equals(changePassword.getConfirmPassword())) {
    		errors.rejectValue("newPassword", "user.new.password.mismatch");
    	}
    	if (!UserValidator.isPasswordStrong(changePassword.getNewPassword())) {
			errors.rejectValue("newPassword", "user.password.stronger");	
		}
	}
}
