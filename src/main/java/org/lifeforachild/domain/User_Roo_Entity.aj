package org.lifeforachild.domain;

import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;

import org.hibernate.Criteria;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.web.query.UserQuery;
import org.springframework.transaction.annotation.Transactional;

import ar.com.fdvs.dj.domain.CustomExpression;

privileged aspect User_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager User.entityManager;    
    
    @Version    
    @Column(name = "version")    
    private Integer User.version;    
    
    public Integer User.getVersion() {    
        return this.version;        
    }    
    
    public void User.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void User.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void User.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            User attached = this.entityManager.find(User.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void User.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void User.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        User merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager User.entityManager() {    
        EntityManager em = new User().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long User.countUsers() {  
    	UserQuery userQuery = new UserQuery();
        Criteria criteria = userQuery.findByAccessCriteria(entityManager());
        return userQuery.count(criteria);
    }    
    
    public static List<User> User.findAllUsers() 
    {    
    	UserQuery userQuery = new UserQuery();
        return userQuery.findByAccess(entityManager());       
    }    
    
    public static User User.findUser(Long id) { 
    	// set to false so any queries for users in fields will work
    	return findUser(id, false);       
    }     
    
    public static User User.findUser(Long id, boolean byAccess) {    
    	UserQuery userQuery = new UserQuery();
    	if (byAccess)
    		return (User)userQuery.findByAccess(entityManager(), id);
    	return userQuery.findUser(entityManager(), id);
    }     
    
    public static List<User> User.findUserEntries(int firstResult, int maxResults) {    
    	UserQuery userQuery = new UserQuery();
        return userQuery.findEntries(entityManager(), firstResult, maxResults);        
    }    
    
    public static User User.findUserbyUsername(String username) {   
    	if (username == null) return null;
    	UserQuery userQuery = new UserQuery();
    	return (User)userQuery.findUserByUsername(entityManager(), username);
    }  
    
    public static CustomExpression User.getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	User user = (User)fields.get("personCompletingForm");
	            	return user.getFirstName() + " " + user.getLastName();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}      
}
