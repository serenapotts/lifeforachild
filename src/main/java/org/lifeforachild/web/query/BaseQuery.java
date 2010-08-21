package org.lifeforachild.web.query;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.access.AccessDeniedException;

public abstract class BaseQuery<T> {

	protected static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("d/MM/yyyy");
		
	public long count(Criteria criteria)
	{
		criteria.setProjection(Projections.rowCount());
		return ((Integer)criteria.list().get(0)).longValue(); 
	}	
	
	public Object findByAccess(EntityManager entityManager, Long id)
	{
		if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance");
		// allow id=0 for blank items in a list to not throw access denied
		else if (id == 0) return null;
        Criteria criteria = findByAccessCriteria(entityManager);
    	criteria.add(Restrictions.eq("id", id));
    	Object obj = criteria.uniqueResult();
    	if (obj == null)
    		throw new AccessDeniedException("Denied");
    	return obj;
	}
	
	public List<T> findByAccess(EntityManager entityManager)
	{
		Criteria criteria = findByAccessCriteria(entityManager);
		return criteria.list();		
	}
	
	public List<T> findEntries(EntityManager entityManager, int firstResult, int maxResults) 
	{
		return findByAccessCriteria(entityManager).setFirstResult(firstResult).setMaxResults(maxResults).list();
	}
	
	abstract public Criteria findByAccessCriteria(EntityManager entityManager);
 
	
    
}
