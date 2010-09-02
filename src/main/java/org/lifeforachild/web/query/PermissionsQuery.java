package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.lifeforachild.domain.Permissions;

public class PermissionsQuery extends BaseQuery<Permissions> {

	public Criteria findByAccessCriteria(EntityManager entityManager) {
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Permissions.class);
		criteria.addOrder(Order.asc("description"));
		return criteria;
		
	}

}
