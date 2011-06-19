package org.lifeforachild.web.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.lifeforachild.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/*
 * Validations for a {@link User}
 */
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User)target;
		
		String oldPassword = user.getOldPassword();
		if (oldPassword == null || (oldPassword != null && !oldPassword.equals(user.getPassword())))
		{
			// has to contain 1 uppercase, 1 lowercase, 1 number of special char and be 8 characters in length
			Pattern pattern = Pattern.compile("(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");
			Matcher m = pattern.matcher(user.getPassword());
			if (!m.matches())
				errors.rejectValue("password", "user.password.stronger");	
		}
		
		if (User.findUserbyUsername(user.getUsername()) != null)			
		{
			errors.rejectValue("username", "user.username.notUnique");
		}		
	}

}
