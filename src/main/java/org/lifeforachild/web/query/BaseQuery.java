package org.lifeforachild.web.query;

import java.text.SimpleDateFormat;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;

public class BaseQuery {

	protected static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("d/MM/yyyy");
	
	public static long count(Criteria criteria)
	{
		criteria.setProjection(Projections.rowCount());
		return ((Integer)criteria.list().get(0)).longValue(); 
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
    
    protected static void findCentreByAccessCriteria(Criteria criteria)
    {
		Integer centre = SecurityUtil.getInstance().getCentre();
		if (centre != null && centre != 0)
		{
			// have just country access to restrict to all centres in that country
			criteria.createCriteria("centre")
					.add(Restrictions.eq("id", new Long(centre)));
		}    
    }	
}
