package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.security.access.AccessDeniedException;

public class ClinicalRecordQuery extends BaseQuery<ClinicalRecord> {

	@Override
	public Criteria findByAccessCriteria(EntityManager entityManager) {
		return ((Session)entityManager.getDelegate()).createCriteria(ClinicalRecord.class);
	}

	// override this method so we can check the user has access to the child that this clinical
	// record is for in case url is accessed directly.
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
}
