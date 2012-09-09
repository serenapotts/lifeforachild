package org.lifeforachild.web.query;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Report;
import org.lifeforachild.security.SimpleStringCipher;
import org.lifeforachild.web.Report.DateRange;
import org.lifeforachild.web.Report.enums.TimePeriodUnit;
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
	 * Return the id of the latest version of the clinical record for a given child.
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
		//return getQueryByDate(entityManager, null, report.getRecordNumber(), null, null, report.getFromDate());
		Criteria criteria = getQuery(entityManager, null, report.getRecordNumber(), null, null);		
		// TODO set date
		searchByDate(criteria, report.getFromDate());
		return criteria.list();
	}
	
	public List<ClinicalRecord> getIndividualMultiVisitClinicalRecordQuery(EntityManager entityManager, Report report)
	{
		//return getQueryByDateRange(entityManager, null, report.getRecordNumber(), null, null, report.getFromDate(), 
		//						   report.getToDate());
		Criteria criteria = getQuery(entityManager, null, report.getRecordNumber(), null, null);		
		searchByDateRange(criteria, report.getFromDate(), report.getToDate());
		return criteria.list();
	}
	
	// TODO
	public List<ClinicalRecord> getRecentVisitClinicalRecordQuery(EntityManager entityManager, Report report)
	{
		//return getQueryByRecentVisit(entityManager, null, report.getRecordNumber(), null, null);
		DetachedCriteria d = DetachedCriteria.forClass(ClinicalRecord.class, "cr");
		d.setProjection(Projections.projectionList()
				.add(Projections.max("dateCompleted"))
				.add(Projections.groupProperty("child.id"))
				//.add(Projections.distinct(Projections.property("id")))
				);
					
		DetachedCriteria d2 = DetachedCriteria.forClass(ClinicalRecord.class, "cr");
		d2.setProjection(Projections.distinct(Projections.property("id")));
		d2.add(Subqueries.propertyEq("id", d));
		
		Criteria criteria = findByAccessCriteria(entityManager);
		criteria.add(Subqueries.propertyIn("id", d2));
		Criteria child = criteria.createCriteria("child");
		searchByCountry(child, report.getCountry());
		searchByDiabetesCentre(child, report.getCentre());
		
		return criteria.list();	
		
				
		/*Criteria criteria = findByAccessCriteria(entityManager);
		criteria.setProjection(Projections.projectionList()
				.add(Projections.max("id"))
				.add(Projections.groupProperty("child.id")));
		Criteria child = criteria.createCriteria("child");
		searchByCountry(child, report.getCountry());
		searchByDiabetesCentre(child, report.getCentre());
		return criteria.list();*/
	}
	
	public List<ClinicalRecord> getBeenSeenVisitClinicalRecordQuery(EntityManager entityManager, Report report)
	{
		Criteria criteria = findByAccessCriteria(entityManager);
		Criteria child = criteria.createCriteria("child");
		searchByTimePeriod(criteria, report.getTimeperiodunit(), true);
		searchByCountry(child, report.getCountry());
		searchByDiabetesCentre(child, report.getCentre());
		return criteria.list();			
	}
	
	
	private Criteria getQuery(EntityManager entityManager, String individualId, String localMedicaldNo, String name, String lastName)
	{
		// restrict to only what they have access to by default
		Criteria criteria = findByAccessCriteria(entityManager);
		Criteria child = criteria.createCriteria("child");
		searchByID(child, individualId);
		searchByLocalMedicalNo(child, localMedicaldNo);
		searchByName(child, name);
		searchByLastName(child, lastName);
		return criteria;
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
	
	private static void searchByTimePeriod(Criteria criteria, TimePeriodUnit timePeriodUnit, boolean inRange)
	{
		DateRange dateRange = TimePeriodUnit.getDateRange(timePeriodUnit);
		searchByDateRange(criteria, dateRange.getFromDate(), dateRange.getToDate(), inRange);
	}	
	
	private static void searchByDateRange(Criteria criteria, Date fromDate, Date toDate)
	{
		searchByDateRange(criteria, fromDate, toDate, true);
	}

	private static void searchByDateRange(Criteria criteria, Date fromDate, Date toDate, boolean inRange)
	{
		Criterion c = Restrictions.and(
				Restrictions.ge("dateCompleted", fromDate), 
				Restrictions.le("dateCompleted", toDate));
		
		if (inRange)
			criteria.add(c);
		else
			criteria.add(Restrictions.not(c));						
	}	
	
	protected static void searchByTimePeriod(DetachedCriteria criteria, TimePeriodUnit timePeriodUnit, boolean inRange)
	{
		DateRange dateRange = TimePeriodUnit.getDateRange(timePeriodUnit);
		searchByDateRange(criteria, dateRange.getFromDate(), dateRange.getToDate(), inRange);
	}	
	
	protected static void searchByDateRange(DetachedCriteria criteria, Date fromDate, Date toDate)
	{
		searchByDateRange(criteria, fromDate, toDate, true);
	}

	protected static void searchByDateRange(DetachedCriteria criteria, Date fromDate, Date toDate, boolean inRange)
	{
		Criterion c = Restrictions.and(
				Restrictions.ge("dateCompleted", fromDate), 
				Restrictions.le("dateCompleted", toDate));
		
		if (inRange)
			criteria.add(c);
		else
			criteria.add(Restrictions.not(c));						
	}		
}
