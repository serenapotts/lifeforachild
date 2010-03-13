package org.lifeforachild.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;

import org.hibernate.Criteria;
import org.lifeforachild.domain.Child;
import org.lifeforachild.web.query.ChildQuery;
import org.lifeforachild.web.query.UserGroupQuery;
import org.lifeforachild.web.query.UserQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Child_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Child.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Child.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Child.version;    
    
    public Long Child.getId() {    
        return this.id;        
    }    
    
    public void Child.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Child.getVersion() {    
        return this.version;        
    }    
    
    public void Child.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Child.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Child.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Child attached = this.entityManager.find(Child.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Child.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Child.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Child merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Child.entityManager() {    
        EntityManager em = new Child().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Child.countChildren() {    
    	Criteria criteria = ChildQuery.getChildrenByAccessCriteria(entityManager());
        return ChildQuery.count(criteria);        
    }    
    
    public static List<Child> Child.findAllChildren() {    
        return ChildQuery.getChildrenByAccess(entityManager());        
    }    
    
    public static Child Child.findChild(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Child");        
        return entityManager().find(Child.class, id);        
    }    
    
    public static List<Child> Child.findChildEntries(int firstResult, int maxResults) {    
        return ChildQuery.getChildrenByAccessCriteria(entityManager()).setFirstResult(firstResult).setMaxResults(maxResults).list();        
    }    
    
}
