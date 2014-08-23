package org.lifeforachild.web.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.enums.UserGroups;
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
		
		String oldUsername = user.getOldUsername();
		if ((oldUsername == null || (oldUsername != null && !oldUsername.equals(user.getUsername()))) 
				&& User.findUserbyUsername(user.getUsername()) != null)			
		{
			errors.rejectValue("username", "user.username.notUnique");
		}	
		
		UserGroup userGroup = SecurityUtil.getInstance().getCurrentUserGroup();
		boolean isCountryCentreUser = (userGroup.getGroupCode().equals(UserGroups.COUNTRY_MANAGER.name()) || 
				userGroup.getGroupCode().equals(UserGroups.TRANSLATION_COUNTRY_MANAGER.name()) || 
				userGroup.getGroupCode().equals(UserGroups.CENTRE_ADMIN.name()));
		if ( isCountryCentreUser&& user.getCountry() == null) {
			errors.rejectValue("country", "user.country.required"); 
		}
		
		if ( isCountryCentreUser &&  user.getCentre() == null) {
			errors.rejectValue("centre", "user.centre.required"); 
		}
	}

}
