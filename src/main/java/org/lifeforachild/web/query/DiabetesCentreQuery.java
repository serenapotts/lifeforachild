package org.lifeforachild.web.query;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;

/**
 * Implements {@link BaseQuery} for the {@link DiabetesCentre} domain class, determining 
 * whether the user has access to a centre based on their access.
 * 
 * @author Serena Keating
 *
 */
public class DiabetesCentreQuery extends BaseQuery<DiabetesCentre> {
	
	/**
	 * Return hibernate crtieria for centres a user has access to when no country is specified.
	 */
	public Criteria findByAccessCriteria(EntityManager entityManager)
	{
		return findByAccessCriteria(entityManager, null);
	}
	
	/**
	 * Return hibernate criteria to determine which centres a user has access to
	 * based on the centre set in their user record. If no centre is set, the user
	 * has access to all centres in the given country, otherwise restrict to the 
	 * particular centre the user is in.
	 */
	public Criteria findByAccessCriteria(EntityManager entityManager, Long countryId)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(DiabetesCentre.class);
		Integer centre = SecurityUtil.getInstance().getCentre();
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
	
	/**
	 * Add centre restriction to the given hibernate criteria, if the user only has access
	 * to a particular centre. If no centre set do nothing as they will have access to all
	 * centres.
	 */
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
 
    public static void findChildCentreByAccessCriteria(Criteria criteria)
    {
		Integer centre = SecurityUtil.getInstance().getCentre();
		if (centre != null && centre != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("child.centre")
					.add(Restrictions.eq("id", new Long(centre)));
		}    
    }	
    
    public static void findReportCentreByAccessCriteria(Criteria criteria)
    {
		Integer centre = SecurityUtil.getInstance().getCentre();
		if (centre != null && centre != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("centre", CriteriaSpecification.LEFT_JOIN)
					.add(Restrictions.or(Restrictions.eq("id", new Long(centre)), Restrictions.isNull("id")));
		}    
    }	    
    
    /**
     * Returns a list of diabetes centres the user has access to in a particular country, excluding deleted ones.
     */
	public List<DiabetesCentre> findByCountryAccess(EntityManager entityManager, Long countryId)
	{
		Criteria criteria = findByAccessCriteria(entityManager, countryId);
		criteria.add(Restrictions.eq("isDeleted", false));
		return criteria.list();		
	}

	/**
	 * Return the diabetes centre with the given name.
	 */
    protected DiabetesCentre findDiabetesCentreByName(EntityManager entityManager, String name)
    {
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(DiabetesCentre.class);
		criteria.add(Restrictions.eq("name", name));  
		return (DiabetesCentre)criteria.uniqueResult();
    }   	
}
