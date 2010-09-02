package org.lifeforachild.web.query;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.enums.UserGroups;

public class UserGroupQuery extends BaseQuery<UserGroup> {
    
    public Criteria findByAccessCriteria(EntityManager entityManager) {
    	UserGroup userGroup = SecurityUtil.getInstance().getCurrentUserGroup();
    	Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(UserGroup.class);
    	criteria.addOrder(Order.asc("groupName"));
    	if (userGroup == null)
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
	    		criteria.add(disjunction);
	    		return criteria;
    		}
    	}
    	return null;
    }    
    
    public List<UserGroup> findByAccess(EntityManager entityManager) {
    	Criteria criteria = findByAccessCriteria(entityManager);
    	if (criteria != null)
    		return criteria.list();
    	return null;
    }

}
