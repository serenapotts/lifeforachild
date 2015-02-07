package org.lifeforachild.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.jfree.util.Log;
import org.lifeforachild.domain.AllUserDetails;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;

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
	
	public AllUserDetails getCurrentUser()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
		{
			Object principal = auth.getPrincipal();
			if (principal != null && principal instanceof AllUserDetails)
				return (AllUserDetails)principal;
		}
		return null;
	}
	
	public void setCurrentUser(String username, String password, String userGroup)
	{
		AllUserDetails user = new AllUserDetails(username, password, userGroup);
		setCurrentUser(user);
	}
	
	public void setCurrentUser(AllUserDetails user)
	{				
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
	                user, user.getPassword(), user.getAuthorities());
	    auth.setDetails(user); 
		SecurityContextHolder.getContext().setAuthentication(auth);
	}
	
	public String getCurrentUsername()
	{
		AllUserDetails user = getCurrentUser();
		if (user == null)
			return "";
		return user.getUsername();
	}
	
	public User getApplicationUserForCurrentUser()
	{
		return getApplicationUser(getCurrentUser());
	}
	
	public List<User> getApplicationUserForCurrentUserAsList()
	{
		List<User> users = new ArrayList<User>();
		users.add(getApplicationUser(getCurrentUser()));
		return users;
	}
	
	public User getApplicationUser(AllUserDetails user)
	{
		return User.findUser(user.getId(), false);
	}
	
	public UserGroup getCurrentUserGroup()
	{
		AllUserDetails user = getCurrentUser();
		if (user == null)
			return null;
		UserGroup ug = new UserGroup();
		ug.setGroupCode(user.getUserGroup());
		return ug;
	}
	
	public Integer getCountry()
	{
		AllUserDetails user = getCurrentUser();
		// if no user don't let them access anything
		if (user == null)
			return -1;
		return user.getCountry();
	}
	
	public Integer getCentre()
	{
		AllUserDetails user = getCurrentUser();
		// if no user don't let them access anything
		if (user == null)
			return -1;
		return user.getCentre();
	}	
	
	public void checkPermission(String permission)
	{
		boolean found = hasPermission(permission);
		if (!found) {
			Log.warn(getCurrentUsername() + " attempted to access resource without permission " + permission);
			throw new AccessDeniedException("Denied");
		}
	}
	
	public boolean hasPermission(String permission)
	{
		Collection<GrantedAuthority> ga = getCurrentUser().getAuthorities();
		GrantedAuthorityImpl role = new GrantedAuthorityImpl(permission);
		boolean found = false;
		for (GrantedAuthority authority: ga)
		{
			if (authority instanceof GrantedAuthorityImpl 
					&& ((GrantedAuthorityImpl)authority).equals(role))
			{
				found = true;
				break;
			}
		}
		return found;
	}
}
