package org.lifeforachild.web.query;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.lifeforachild.domain.Permissions;

public class PermissionsQuery extends BaseQuery<Permissions> {

	public Criteria findByAccessCriteria(EntityManager entityManager) {
		return((Session)entityManager.getDelegate()).createCriteria(Permissions.class);
	}

}
