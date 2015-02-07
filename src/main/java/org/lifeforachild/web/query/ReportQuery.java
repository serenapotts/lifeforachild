package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.AllUserDetails;
import org.lifeforachild.domain.Report;

public class ReportQuery extends BaseQuery<Report> {

	public Criteria findByAccessCriteria(EntityManager entityManager)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Report.class);
		AllUserDetails user = SecurityUtil.getInstance().getCurrentUser();
		// restrict to reports by user or ones all users have access to
		criteria.createAlias("viewableBy", "vb", CriteriaSpecification.LEFT_JOIN)
			.add(Restrictions.or(Restrictions.isNull("viewableBy"), Restrictions.eq("vb.id", user.getId())));	
		CountryQuery.findReportCountryByAccessCriteria(criteria);
    	DiabetesCentreQuery.findReportCentreByAccessCriteria(criteria);
		return criteria;
	}
}
