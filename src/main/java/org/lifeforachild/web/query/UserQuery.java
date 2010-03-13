package org.lifeforachild.web.query;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.enums.UserGroups;

public class UserQuery extends BaseQuery {

    public static Criteria getUsersByAccessCriteria(EntityManager entityManager)
    {
    	Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(User.class);
    	findCountryByAccessCriteria(criteria);
    	findCentreByAccessCriteria(criteria);
    	
    	UserGroup userGroup = SecurityUtil.getInstance().getCurrentUserGroup();
    	if (userGroup == null)
    		// TODO this will cause null pointer
    		return null;
    	else if (userGroup.getGroupName().equals(UserGroups.PROGRAM_MANAGER.getName()))
    		// they can see all users
    		return criteria;
    	else
    	{
    		String[] accessGroups = UserGroups.getUserGroupsCanAccess(userGroup);
    		if (accessGroups != null && accessGroups.length > 0)
    		{
	    		Disjunction disjunction = Restrictions.disjunction();
	    		for (int i = 0; i < accessGroups.length; i++)
	    		{
	    			disjunction.add(Restrictions.eq("groupName", accessGroups[i]));
	    		}
	    		criteria.createCriteria("userGroup").add(disjunction);
	    		return criteria;
    		} 		
    	}

    	return criteria;
    }    
    
    public static List<User> getUsersByAccess(EntityManager entityManager)
    {
    	return getUsersByAccessCriteria(entityManager).list();
    }
}
