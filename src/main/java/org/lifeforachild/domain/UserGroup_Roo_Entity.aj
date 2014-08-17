package org.lifeforachild.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.hibernate.Criteria;
import org.lifeforachild.web.query.UserGroupQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserGroup_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager UserGroup.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long UserGroup.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer UserGroup.version;    
    
    public Long UserGroup.getId() {    
        return this.id;        
    }    
    
    public void UserGroup.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer UserGroup.getVersion() {    
        return this.version;        
    }    
    
    public void UserGroup.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void UserGroup.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void UserGroup.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            UserGroup attached = this.entityManager.find(UserGroup.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void UserGroup.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void UserGroup.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        UserGroup merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager UserGroup.entityManager() {    
        EntityManager em = new UserGroup().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long UserGroup.countUserGroups() {    
    	UserGroupQuery userGroupQuery = new UserGroupQuery();
    	Criteria criteria = userGroupQuery.findByAccessCriteria(entityManager());
        return userGroupQuery.count(criteria);       
    }    
    
    public static List<UserGroup> UserGroup.findAllUserGroups() {
    	UserGroupQuery userGroupQuery = new UserGroupQuery();
        return userGroupQuery.findByAccess(entityManager());        
    }    
    
    public static UserGroup UserGroup.findUserGroup(Long id) {
    	UserGroupQuery userGroupQuery = new UserGroupQuery();   
    	return (UserGroup)userGroupQuery.findByAccess(entityManager(), id); 
    }    
    
    public static List<UserGroup> UserGroup.findUserGroupEntries(int firstResult, int maxResults) {  
    	UserGroupQuery userGroupQuery = new UserGroupQuery();
        return userGroupQuery.findEntries(entityManager(), firstResult, maxResults);        
    }        
}
