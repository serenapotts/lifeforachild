package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.security.access.AccessDeniedException;

/**
 * Implements {@link BaseQuery} for the {@link ClinicalRecord} domain class, determining 
 * whether the user has access to a centre based on their access.
 * 
 * @author Serena Keating
 *
 */
public class ClinicalRecordQuery extends BaseQuery<ClinicalRecord> {

	/**
	 * Return hibernate criteria to get clinical records.
	 */
	public Criteria findByAccessCriteria(EntityManager entityManager) {
		return ((Session)entityManager.getDelegate()).createCriteria(ClinicalRecord.class);
	}

	/** 
	 * Override this method so we can check the user has access to the child that this clinical
	 * record is for in case url is accessed directly.
	 */
	public Object findByAccess(EntityManager entityManager, Long id)
	{
    	ClinicalRecord cr = (ClinicalRecord)super.findByAccess(entityManager, id);
    	Long childId = cr.getChild().getId();
    	ChildQuery childQuery = new ChildQuery();
    	Object child = childQuery.findByAccess(entityManager, childId);
    	if (child == null)
    		throw new AccessDeniedException("Denied");
    	return cr;
	}
	
	/**
	 * Return the id of the latest version of the clincal record for a given child.
	 */
	public Long findLatestClinicalRecordId(EntityManager entityManager, Long childId)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(ClinicalRecord.class);
		criteria.createCriteria("child").add(Restrictions.eq("id", new Long(childId)));
		criteria.setProjection(Projections.max("id"));
		return (Long)criteria.uniqueResult();
	}
}
