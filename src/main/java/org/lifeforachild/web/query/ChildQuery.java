package org.lifeforachild.web.query;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DateRange;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.Search;
import org.lifeforachild.domain.ShowOptionType;
import org.lifeforachild.domain.StatusType;
import org.lifeforachild.domain.TimePeriodUnit;

public class ChildQuery extends BaseQuery<Child> {

	public ChildQuery()
	{}
	
	public List<Child> getQuery(EntityManager entityManager, Search search)
	{		
		String id = search.getId();
		String name = search.getName();
		String timePeriod = search.getTimePeriod();
		TimePeriodUnit timePeriodUnit = search.getTimePeriodUnit();
		String from = search.getFromDate();
		String to = search.getToDate();		
		Date fromDate = null;
		Date toDate = null;
		if (!StringUtil.isEmpty(from) && !StringUtil.isEmpty(to))
		{
			try
			{
				fromDate = DATE_FORMAT.parse(from);
				toDate = DATE_FORMAT.parse(to);
			}
			catch (ParseException ex) {
				ex.printStackTrace();
			}	
		}
		// TODO convert these to objects in the Search class and in UI
		String centre = search.getCentre();
		String country = search.getCountry();
		Long centreId = StringUtil.isEmpty(centre) ? null : Long.valueOf(centre);
		Long countryId = StringUtil.isEmpty(country) ? null : Long.valueOf(country); 
		return getQuery(entityManager, id, name, timePeriod, timePeriodUnit, fromDate, toDate, centreId, countryId);
	}
	
	public List<Child> getQuery(EntityManager entityManager, Report report)
	{
		DiabetesCentre centre = report.getCentre();
		Country country = report.getCountry();
		Long centreId = centre == null ? null : Long.valueOf(centre.getId());
		Long countryId = country == null ? null : Long.valueOf(country.getId());		
		return getQuery(entityManager, report.getRecordNumber(), null, report.getTimePeriod(), report.getTimeperiodunit(), 
				report.getFromDate(), report.getToDate(), centreId, countryId,
				report.getStatustype(), report.getShowoptiontype(), 
				report.getAge(), report.getOrderBy(), report.getThenOrderBy());
	}
	
	private List<Child> getQuery(EntityManager entityManager, String id, String name, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to, Long diabetesCentre, Long country)
	{
		return getQuery(entityManager, id, name, timePeriod, timePeriodUnit, from, to, diabetesCentre, country, null,
				null, null, null, null);
	}
	
	private List<Child> getQuery(EntityManager entityManager, String id, String name, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to, Long diabetesCentre, Long country,
			StatusType statusType, ShowOptionType showOptionType, String age, String orderBy, String thenOrderBy)
	{
		// restrict to only what they have access to by default
		Criteria criteria = findByAccessCriteria(entityManager);
		searchByID(criteria, id);
		searchByName(criteria, name);
		searchByTimePeriod(criteria, timePeriod, timePeriodUnit);
//		searchByDateRange(criteria, from, to);
		searchByDiabetesCentre(criteria, diabetesCentre);
		searchByCountry(criteria, country);
//		searchByStatusType(criteria, statusType);
//		searchByShowOptionType(criteria, showOptionType);
//		searchByAge(criteria, age);
//		orderBy(criteria, orderBy, thenOrderBy);		
		return criteria.list();

	}
	
	private void searchByID(Criteria criteria, String id)
	{
		if (!StringUtil.isEmpty(id))
			criteria.add(Restrictions.eq("individualId", id) );
	}
	
	private void searchByName(Criteria criteria, String name)
	{
		if (!StringUtil.isEmpty(name))
			criteria.add(Restrictions.like(Child.NAME_COLUMN, name) );
	}	
	
	
	private void searchByTimePeriod(Criteria criteria, String timePeriod, TimePeriodUnit timePeriodUnit)
	{
		if (!StringUtil.isEmpty(timePeriod) && timePeriodUnit != TimePeriodUnit.NONE)
		{
			DateRange dateRange = TimePeriodUnit.getDateRange(timePeriod, timePeriodUnit);
			// TODO what dates to compare against. child or record??
//			criteria.add(Restrictions.and(
//					Restrictions.ge(propertyName, dateRange.getFromDate()), 
//					Restrictions.le(propertyName, dateRange.getToDate())) );
		}
	}	
	private void searchByShowOptionType(Criteria criteria,
			ShowOptionType showOptionType) {
		
	}



	private void searchByAge(Criteria criteria, String age) {
		
	}

	private void searchByStatusType(Criteria criteria,
			StatusType statusType) {
		
	}

	private void searchByCountry(Criteria criteria, Long country) {
		if (country != null)
			criteria.add(Restrictions.eq("country.id", country) );
	}

	private void searchByDiabetesCentre(Criteria criteria,
			Long diabetesCentre) {
		if (diabetesCentre != null)
			criteria.add(Restrictions.eq("centre.id", diabetesCentre) );
	}

	private void orderBy(Criteria criteria, String orderBy, String thenOrderBy) {
		//if (!StringUtil.isEmpty(orderBy))
			//builder.orderBy(orderBy);
		//if (!StringUtil.isEmpty(thenOrderBy))
			//builder.orderBy(thenOrderBy);			
	}
	
	public Criteria findByAccessCriteria(EntityManager entityManager)
	{		
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Child.class);
		CountryQuery.findCountryByAccessCriteria(criteria);
    	DiabetesCentreQuery.findCentreByAccessCriteria(criteria);
    	return criteria;
	}	
}
