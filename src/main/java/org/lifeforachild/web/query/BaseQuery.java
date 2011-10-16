package org.lifeforachild.web.query;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.access.AccessDeniedException;

/**
 * 
 * Generic abstract query class to handle querying the database for domain objects, 
 * restricting the user to what they have access to. 
 * 
 * It contains a number of commonly methods used by the implementing Query classes.
 * 
 * @author Serena Keating
 *
 * @param <T> Domain object to query on.
 */
public abstract class BaseQuery<T> {

	protected static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("d/MM/yyyy");
		
	/**
	 * Return the count returned by the query with the given criteria.
	 */
	public long count(Criteria criteria)
	{
		criteria.setProjection(Projections.rowCount());
		return ((Integer)criteria.list().get(0)).longValue(); 
	}	
	
	/**
	 * Return the object with the given id if the user has access.
	 * 
	 * @throws AccessDeniedException when the user does not have access.
	 */
	public Object findByAccess(EntityManager entityManager, Long id)
	{
		if (id == null) 
			throw new IllegalArgumentException("An identifier is required to retrieve an instance");
		// allow id=0 for blank items in a list to not throw access denied
		else if (id == 0) return null;
        Criteria criteria = findByAccessCriteria(entityManager);
    	criteria.add(Restrictions.eq("id", id));
    	Object obj = criteria.uniqueResult();
    	if (obj == null)
    		// no access so throw exception so the user is redirected to the no access page
    		throw new AccessDeniedException("Denied");
    	// found so have access and return
    	return obj;
	}
	
	/**
	 * Return a list of T the user has access to, excluding deleted ones. 
	 */
	public List<T> findByAccess(EntityManager entityManager)
	{
		Criteria criteria = findByAccessCriteria(entityManager);
		criteria.add(Restrictions.eq("isDeleted", false));
		return criteria.list();		
	}
	
	/**
	 * Return the list of entries giving a start result up to a maximum number of results.
	 */
	public List<T> findEntries(EntityManager entityManager, int firstResult, int maxResults) 
	{
		Criteria criteria = findByAccessCriteria(entityManager);
		criteria.add(Restrictions.eq("isDeleted", false));
		return criteria.setFirstResult(firstResult).setMaxResults(maxResults).list();
	}
	
	/**
	 * Abstract method all implementing classes must implement to determine
	 * whether access to a particular object is allowed.
	 */
	abstract public Criteria findByAccessCriteria(EntityManager entityManager);
 
}
