package org.lifeforachild.web.query;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import net.java.dev.querybuilder.JPAQueryBuilder;

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

public class ChildQuery extends BaseQuery {

	public static List getQuery(EntityManager entityManager, Search search)
	{
		String id = search.getId();
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
		return getQuery(entityManager, id, timePeriod, timePeriodUnit, fromDate, toDate, null, null);
	}
	
	public static List getQuery(EntityManager entityManager, Report report)
	{
		return getQuery(entityManager, null, report.getTimePeriod(), report.getTimeperiodunit(), 
				report.getFromDate(), report.getToDate(), report.getCentre(), report.getCountry(),
				report.getStatustype(), report.getShowoptiontype(), report.getRecordNumber(), 
				report.getAge(), report.getOrderBy(), report.getThenOrderBy());
	}
	
	private static List getQuery(EntityManager entityManager, String id, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to, DiabetesCentre diabetesCentre, Country country)
	{
		return getQuery(entityManager, id, timePeriod, timePeriodUnit, from, to, diabetesCentre, country, null,
				null, null, null, null, null);
	}
	
	private static List getQuery(EntityManager entityManager, String id, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to, DiabetesCentre diabetesCentre, Country country,
			StatusType statusType, ShowOptionType showOptionType, String recordNumber, String age, String orderBy, String thenOrderBy)
	{
		JPAQueryBuilder builder = new JPAQueryBuilder();
		builder.select("o");
		builder.from("Child o");
		
		searchByID(builder, id);
		searchByTimePeriod(builder, timePeriod, timePeriodUnit);
		searchByDateRange(builder, from, to);
		searchByDiabetesCentre(builder, diabetesCentre);
		searchByCountry(builder, country);
		searchByStatusType(builder, statusType);
		searchByShowOptionType(builder, showOptionType);
		searchByRecordNumber(builder, recordNumber);
		searchByAge(builder, age);
		orderBy(builder, orderBy, thenOrderBy);

		Query query = builder.build(entityManager);
		return query.getResultList();

	}
	
	private static void searchByShowOptionType(JPAQueryBuilder builder,
			ShowOptionType showOptionType) {
		// TODO Auto-generated method stub
		
	}

	private static void orderBy(JPAQueryBuilder builder, String orderBy, String thenOrderBy) {
		if (!StringUtil.isEmpty(orderBy))
			builder.orderBy(orderBy);
		if (!StringUtil.isEmpty(thenOrderBy))
			builder.orderBy(thenOrderBy);			
	}

	private static void searchByAge(JPAQueryBuilder builder, String age) {
		// TODO Auto-generated method stub
		
	}

	private static void searchByRecordNumber(JPAQueryBuilder builder,
			String recordNumber) {
		// TODO Auto-generated method stub
		
	}

	private static void searchByStatusType(JPAQueryBuilder builder,
			StatusType statusType) {
		// TODO Auto-generated method stub
		
	}

	private static void searchByCountry(JPAQueryBuilder builder, Country country) {
		// TODO Auto-generated method stub
		
	}

	private static void searchByDiabetesCentre(JPAQueryBuilder builder,
			DiabetesCentre diabetesCentre) {
		//builder.andIfNotNull(condition, object)
		
	}

	private static void searchByID(JPAQueryBuilder builder, String id)
	{
		if (!StringUtil.isEmpty(id))
			builder.and(Child.ID_COLUMN + "=?", new Long(id));
	}
	
	private static void searchByTimePeriod(JPAQueryBuilder builder, String timePeriod, TimePeriodUnit timePeriodUnit)
	{
		if (!StringUtil.isEmpty(timePeriod) && timePeriodUnit != TimePeriodUnit.NONE)
		{
			DateRange dateRange = TimePeriodUnit.getDateRange(timePeriod, timePeriodUnit);
			searchByDateRange(builder, dateRange.getFromDate(), dateRange.getToDate());
		}
	}
		
	private static void searchByDateRange(JPAQueryBuilder builder, Date fromDate, Date toDate)
	{
		if (fromDate != null && toDate != null)
		{
			builder.and(Child.UPDATED_ON_COLUMN + "<?", toDate);
			builder.and(Child.UPDATED_ON_COLUMN + ">?", fromDate);
		}
	}

}
