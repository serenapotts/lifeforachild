package org.lifeforachild.web.query;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;

public class CountryQuery extends BaseQuery {

	public static Criteria findCountryByAccessCriteria(EntityManager entityManager)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Country.class);
		Integer country = SecurityUtil.getInstance().getCountry();
		if (country != null && country != 0)
			// restrict to country of user
			criteria.add(Restrictions.eq("id", new Long(country)));
		// else can access all countries as no country set
		return criteria;
	}
	
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
	
	public static List<Country> findCountryByAccess(EntityManager entityManager)
	{		
		Criteria criteria = findCountryByAccessCriteria(entityManager);
		return criteria.list();
	}
		
}
