package org.lifeforachild.Util;

import org.lifeforachild.domain.UserGroup;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class SecurityUtil {

	public static User getCurrentUser()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
		{
			Object principal = auth.getPrincipal();
			if (principal != null && principal instanceof User)
				return (User)principal;
		}
		return null;
	}
	
	public static UserGroup getCurrentUserGroup()
	{
		User user = getCurrentUser();
		if (user == null)
			return null;
		// TODO how to get the user group ??
		UserGroup ug = new UserGroup();
		ug.setGroupName("Program Manager");
		return ug;
	}
}
