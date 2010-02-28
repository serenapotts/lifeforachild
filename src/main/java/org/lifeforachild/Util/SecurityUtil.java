package org.lifeforachild.Util;

import org.lifeforachild.domain.UserGroup;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class SecurityUtil {
	
	private static SecurityUtil instance = null;
	
	protected SecurityUtil() {}
	
	public static SecurityUtil getInstance()
	{
		if (instance == null)
		{
			instance = new SecurityUtil();
		}
		return instance;
	}
	
	public User getCurrentUser()
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
	
	public UserGroup getCurrentUserGroup()
	{
		User user = getCurrentUser();
		if (user == null)
			return null;
		String userGroupName = org.lifeforachild.domain.User.findUserGroupForUser(user.getUsername());
		UserGroup ug = new UserGroup();
		ug.setGroupName(userGroupName);
		return ug;
	}
}
