package org.lifeforachild.domain;

import org.lifeforachild.Util.SecurityUtil;

public class TestUtil {

	public static void createAndSetTestUser()
	{
		User user = new User();
    	user.setEnabled(true);
    	user.setFirstName("Test");
    	user.setIsDeleted(false);
    	user.setLastName("name");
    	user.setPassword("Password123!");
    	UserGroup ug = UserGroup.entityManager().find(UserGroup.class, 1L);   
    	user.setUserGroup(ug);
    	user.setUsername("testuser");
    	user.persist();
    	user.flush();   	
    	SecurityUtil.getInstance().setCurrentUser(user.getUsername(), user.getPassword(),
    			user.getUserGroup().getGroupCode());
	}
}
