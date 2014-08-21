package org.lifeforachild.enums;

import org.lifeforachild.domain.UserGroup;

/**
 * User groups defined - this SHOULD NOT be I18N'd.
 * 
 * @author Serena Potts
 *
 */
public enum UserGroups {
	PROGRAM_MANAGER,
	PMS_ASSISTANTS,
	DATA_ENTRY_OPERATORS,
	TRANSLATION_COUNTRY_MANAGER,
	COUNTRY_MANAGER,
	CENTRE_ADMIN,
	CENTRE_STAFF,
	RESEARCHERS;
	
	public static String[] getUserGroupsCanAccess(UserGroup userGroup)
	{
		if (userGroup.getGroupCode().equals(UserGroups.PMS_ASSISTANTS.name()))
		{
			return new String[] {UserGroups.DATA_ENTRY_OPERATORS.name(), 
								 UserGroups.CENTRE_ADMIN.name(), 
								 UserGroups.TRANSLATION_COUNTRY_MANAGER.name(),
								 UserGroups.COUNTRY_MANAGER.name(),
								 UserGroups.CENTRE_STAFF.name(), 
								 UserGroups.RESEARCHERS.name()};     		
		}
		else if (userGroup.getGroupCode().equals(UserGroups.COUNTRY_MANAGER.name()) || 
				userGroup.getGroupCode().equals(UserGroups.TRANSLATION_COUNTRY_MANAGER.name()))
			return new String[] {UserGroups.CENTRE_ADMIN.name(), UserGroups.CENTRE_STAFF.name()};     		
		else if (userGroup.getGroupCode().equals(UserGroups.CENTRE_ADMIN.name()))
			return new String[] { UserGroups.CENTRE_STAFF.name()};
		return null;
		
	}
}