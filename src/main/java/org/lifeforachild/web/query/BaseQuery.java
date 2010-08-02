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
  
    
}
