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
    
    private static void findCountryByAccessCriteria(Criteria criteria)
    {
		Integer country = SecurityUtil.getInstance().getCountry();
		if (country != null && country != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("country")
					.add(Restrictions.eq("id", new Long(country)));
		}    
    }
    
    private static void findCentreByAccessCriteria(Criteria criteria)
    {
		Integer centre = SecurityUtil.getInstance().getCentre();
		if (centre != null && centre != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("centre")
					.add(Restrictions.eq("id", new Long(centre)));
		}    
    }    
    
    public static List<User> getUsersByAccess(EntityManager entityManager)
    {
    	return getUsersByAccessCriteria(entityManager).list();
    }
}
