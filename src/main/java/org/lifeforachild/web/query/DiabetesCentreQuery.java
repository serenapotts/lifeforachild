package org.lifeforachild.web.query;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.DiabetesCentre;

public class DiabetesCentreQuery extends BaseQuery<DiabetesCentre> {
	
	public Criteria findByAccessCriteria(EntityManager entityManager)
	{
		return findByAccessCriteria(entityManager, null);
	}
	
	public Criteria findByAccessCriteria(EntityManager entityManager, Long countryId)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(DiabetesCentre.class);
		Integer centre = SecurityUtil.getInstance().getCentre();
		//Integer country = SecurityUtil.getInstance().getCountry();
		if (countryId != null && countryId != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("country")
					.add(Restrictions.eq("id", countryId));
		}			
		if (centre != null && centre != 0)
		{
			// have specific centre access so restrict to that centre
			criteria.add(Restrictions.eq("id", new Long(centre)));			
		}		
		criteria.addOrder(Order.asc("name"));
		// else can access all centres as no centre set
		return criteria;
	}	
	
    public static void findCentreByAccessCriteria(Criteria criteria)
    {
		Integer centre = SecurityUtil.getInstance().getCentre();
		if (centre != null && centre != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("centre")
					.add(Restrictions.eq("id", new Long(centre)));
		}    
    }	
    
	public List<DiabetesCentre> findByCountryAccess(EntityManager entityManager, Long countryId)
	{
		Criteria criteria = findByAccessCriteria(entityManager, countryId);
		criteria.add(Restrictions.eq("isDeleted", false));
		return criteria.list();		
	}

}
