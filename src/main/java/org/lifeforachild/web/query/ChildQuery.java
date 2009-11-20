package org.lifeforachild.web.query;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import net.java.dev.querybuilder.JPAQueryBuilder;

import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.DateRange;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.Search;
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
		String centre = search.getCentre();
		String country = search.getCountry(); 
		return getQuery(entityManager, id, timePeriod, timePeriodUnit, fromDate, toDate);
	}
	
	public static List getQuery(EntityManager entityManager, Report report)
	{
		return getQuery(entityManager, null, report.getTimePeriod(), report.getTimeperiodunit(), 
				report.getFromDate(), report.getToDate());
	}
	
	private static List getQuery(EntityManager entityManager, String id, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to)
	{
		JPAQueryBuilder builder = new JPAQueryBuilder();
		builder.select("o");
		builder.from("Child o");
		searchByID(builder, id);
		searchByTimePeriod(builder, timePeriod, timePeriodUnit);
		searchByDateRange(builder, from, to);
		/*if (!StringUtil.isEmpty(centre))
		appendOperator(buffer, "centre", centre, EQUALS_OPERATOR);
	if (!StringUtil.isEmpty(country))
		appendOperator(buffer, "country", country, EQUALS_OPERATOR);*/

		Query query = builder.build(entityManager);
		return query.getResultList();

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
