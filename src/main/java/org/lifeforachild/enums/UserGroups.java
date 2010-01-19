package org.lifeforachild.enums;

import org.lifeforachild.domain.UserGroup;


public enum UserGroups {
	PROGRAM_MANAGER("Program Manager"),
	PMS_ASSISTANTS("PMs Assistants"),
	DATA_ENTRY_OPERATORS("Data Entry Operators"),
	COUNTRY_MANAGER("Country Manager"),
	CENTRE_ADMIN("Centre Admin"),
	CENTRE_STAFF("Centre Staff"),
	RESEARCHERS("Researchers");
	
	UserGroups(String s){ name = s;}
	
	String name;
	
	public String getName() { return name; }
	
	public static String[] getUserGroupsCanAccess(UserGroup userGroup)
	{
		if (userGroup.getGroupName().equals(UserGroups.PMS_ASSISTANTS.getName()))
		{
			return new String[] {UserGroups.DATA_ENTRY_OPERATORS.getName(), 
								 UserGroups.CENTRE_ADMIN.getName(), 
								 UserGroups.COUNTRY_MANAGER.getName(),
								 UserGroups.CENTRE_STAFF.getName(), 
								 UserGroups.RESEARCHERS.getName()};     		
		}
		else if (userGroup.getGroupName().equals(UserGroups.COUNTRY_MANAGER.getName()))
			return new String[] {UserGroups.CENTRE_ADMIN.getName(), UserGroups.CENTRE_STAFF.getName()};     		
		else if (userGroup.getGroupName().equals(UserGroups.CENTRE_ADMIN.getName()))
			return new String[] { UserGroups.CENTRE_STAFF.getName()};
		return null;
		
	}
}