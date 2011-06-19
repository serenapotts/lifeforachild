package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.enums.UserGroups;
import org.springframework.security.access.AccessDeniedException;

public class UserQuery extends BaseQuery<User> {

	public User findUser(EntityManager entityManager, Long id)
	{
		if (id == 0)
    		return null;
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(User.class);
		criteria.add(Restrictions.eq("id", id));
    	Object obj = criteria.uniqueResult();
    	if (obj == null)
    		throw new AccessDeniedException("Denied");
    	return (User)obj;
	}
	
    public Criteria findByAccessCriteria(EntityManager entityManager)
    {
    	Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(User.class);
    	criteria.addOrder(Order.asc("firstName"));
    	CountryQuery.findCountryByAccessCriteria(criteria);
    	DiabetesCentreQuery.findCentreByAccessCriteria(criteria);
    	
    	UserGroup userGroup = SecurityUtil.getInstance().getCurrentUserGroup();
    	if (userGroup == null)
    		// TODO this will cause null pointer
    		return null;
    	else if (userGroup.getGroupCode().equals(UserGroups.PROGRAM_MANAGER.name()))
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
	    			disjunction.add(Restrictions.eq("groupCode", accessGroups[i]));
	    		}
	    		criteria.createCriteria("userGroup").add(disjunction);
	    		return criteria;
    		} 		
    	}

    	return criteria;
    }    

    protected User findUserByUsername(EntityManager entityManager, String username)
    {
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(User.class);
		// have just country access to restrict to all centres in that country
		criteria.add(Restrictions.eq("username", username));  
		return (User)criteria.uniqueResult();
    }       
}
