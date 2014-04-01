package org.lifeforachild.web.query;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
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
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(ClinicalRecord.class);
		CountryQuery.findChildCountryByAccessCriteria(criteria);
    	DiabetesCentreQuery.findChildCentreByAccessCriteria(criteria);
    	return criteria;
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
		Criteria criteria = getQuery(entityManager, report.getRecordNumber(), report.getLocalMedicalNumber(), 
				report.getFirstName(), report.getLastName());		
		searchByDate(criteria, report.getFromDate());
		return criteria.list();
	}
	
	public List<ClinicalRecord> getIndividualMultiVisitClinicalRecordQuery(EntityManager entityManager, Report report)
	{
		Criteria criteria = getQuery(entityManager, report.getRecordNumber(), report.getLocalMedicalNumber(), 
				report.getFirstName(), report.getLastName());		
		searchByDateRange(criteria, report.getFromDate(), report.getToDate());
		return criteria.list();
	}
	
	// TODO
	public List<ClinicalRecord> getRecentVisitClinicalRecordQuery(EntityManager entityManager, Report report)
	{		
		// was too hard to do this query as hibernate criteria so falling back to HQL
		Query query = ((Session)entityManager.getDelegate()).createQuery(
				"from ClinicalRecord c where (c.child, c.dateCompleted) in (select c.child, max(c.dateCompleted) from ClinicalRecord c group by c.child)");
		Iterator it = query.iterate();
		ArrayList<ClinicalRecord> list = new ArrayList<ClinicalRecord>();
		while (it.hasNext())
		{
			Object o = it.next();
			
			// also easier to restrict by child properties after the query is done in deciding what to return 
			Child c = ((ClinicalRecord)o).getChild();
			int childCountry = c.getCountry().getId().intValue();
			int childCentre = c.getCentre().getId().intValue();
			
			boolean add = true;	
			
			// restrict to current user country and centre
			Integer country = SecurityUtil.getInstance().getCountry();
			if (country != null && country != 0)
			{
				if (childCountry != country)
					add = false;
				
				// check the centre
				Integer centre = SecurityUtil.getInstance().getCentre();
				if (centre != null && centre != 0)
				{
					if (childCentre != centre)
						add = false;
				}
			}
			
			// restrict to selected country and centre too
			Country rCountry = report.getCountry(); 
			if (rCountry != null && rCountry.getId().intValue() != childCountry)
				add = false;
			
			DiabetesCentre rCentre = report.getCentre(); 
			if (rCentre != null && rCentre.getId().intValue() != childCentre)
				add = false;
			
			if (add)
				list.add((ClinicalRecord)o);
		}
		return list;				
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
		Criterion c = null;
		if (fromDate != null && toDate != null) {
			c = Restrictions.and(
					Restrictions.ge("dateCompleted", fromDate), 
					Restrictions.le("dateCompleted", toDate));
		} else if (fromDate != null) {
			c = Restrictions.ge("dateCompleted", fromDate);
		} else if (toDate != null) {
			c = Restrictions.le("dateCompleted", toDate);
		}	

		if (c != null) {
			if (inRange)
				criteria.add(c);
			else
				criteria.add(Restrictions.not(c));	
		}					
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
