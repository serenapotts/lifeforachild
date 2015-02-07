package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Country;

/**
 * Implements {@link BaseQuery} for the {@link Country} domain class, determining 
 * whether the user has access to a country based on their access.
 * 
 * @author Serena Keating
 *
 */
public class CountryQuery extends BaseQuery<Country> {

	/**
	 * Return hibernate criteria to determine which countries a user has access to
	 * based on the country set in their user record. If no country is set, the user
	 * has access to all countries, otherwise restrict to the particular country the user is in.
	 */
	public Criteria findByAccessCriteria(EntityManager entityManager)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Country.class);
		Integer country = SecurityUtil.getInstance().getCountry();
		if (country != null && country != 0)
			// restrict to country of user
			criteria.add(Restrictions.eq("id", new Long(country)));
		criteria.addOrder(Order.asc("name"));
		// else can access all countries as no country set
		return criteria;
	}
	
	/**
	 * Add country restriction to the given hibernate criteria, if the user only has access
	 * to a particular country. If no country set do nothing as they will have access to all
	 * countries.
	 */
    protected static void findCountryByAccessCriteria(Criteria criteria)
    {
		Integer country = SecurityUtil.getInstance().getCountry();
		if (country != null && country != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("country")
					.add(Restrictions.eq("id", new Long(country)));
		}    
    }
    
    protected static void findChildCountryByAccessCriteria(Criteria criteria)
    {
		Integer country = SecurityUtil.getInstance().getCountry();
		if (country != null && country != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("child.country")
					.add(Restrictions.eq("id", new Long(country)));
		}    
    }
    
    protected static void findReportCountryByAccessCriteria(Criteria criteria)
    {
		Integer country = SecurityUtil.getInstance().getCountry();
		if (country != null && country != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("country", CriteriaSpecification.LEFT_JOIN)
					.add(Restrictions.or(Restrictions.eq("id", new Long(country)),Restrictions.isNull("id")));
		}    
    }    
		
    /**
     * Return the country with the given name.
     */
    protected Country findCountryByName(EntityManager entityManager, String name)
    {
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Country.class);
		criteria.add(Restrictions.eq("name", name));  
		return (Country)criteria.uniqueResult();
    }    
}
