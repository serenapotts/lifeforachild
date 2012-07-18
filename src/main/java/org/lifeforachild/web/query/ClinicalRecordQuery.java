package org.lifeforachild.web.query;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Report;
import org.lifeforachild.security.SimpleStringCipher;
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
	
	public List<ClinicalRecord> getIndividualClinicalRecordQuery(EntityManager entityManager, Report report)
	{
		return getQuery(entityManager, null, report.getRecordNumber(), null, null, report.getFromDate());
	}
	
	private List<ClinicalRecord> getQuery(EntityManager entityManager, String individualId, String localMedicaldNo, String name, String lastName, Date date)
	{
		// restrict to only what they have access to by default
		Criteria criteria = findByAccessCriteria(entityManager);
		Criteria child = criteria.createCriteria("child");
		searchByID(child, individualId);
		searchByLocalMedicalNo(child, localMedicaldNo);
		searchByName(child, name);
		searchByLastName(child, lastName);
		//searchByDate(criteria, date);
		return criteria.list();
	}	
	
	private void searchByID(Criteria criteria, String id)
	{
		if (!StringUtil.isEmpty(id))
			criteria.add(Restrictions.eq("individualId", id) );
	}
	
	private void searchByLocalMedicalNo(Criteria criteria, String id)
	{
		if (!StringUtil.isEmpty(id))
			criteria.add(Restrictions.eq("localMedicalNumber", id) );
	}
	
	private void searchByName(Criteria criteria, String name)
	{
		if (!StringUtil.isEmpty(name))
			criteria.add(Restrictions.like("name", SimpleStringCipher.encrypt(name)) );
	}	
	
	private void searchByLastName(Criteria criteria, String lastName)
	{
		if (!StringUtil.isEmpty(lastName))
			criteria.add(Restrictions.like("lastName", SimpleStringCipher.encrypt(lastName)) );
	}		
	
	private void searchByDate(Criteria criteria, Date date)
	{
		if (date != null)
			criteria.add(Restrictions.like("dateCompleted", date ));
	}	
}
