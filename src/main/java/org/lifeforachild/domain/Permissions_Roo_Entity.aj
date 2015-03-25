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
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.web.query.PermissionsQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Permissions_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Permissions.entityManager;    
    
    @Version    
    @Column(name = "version")    
    private Integer Permissions.version;     
    
    public Integer Permissions.getVersion() {    
        return this.version;        
    }    
    
    public void Permissions.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Permissions.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Permissions.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Permissions attached = this.entityManager.find(Permissions.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Permissions.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Permissions.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Permissions merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Permissions.entityManager() {    
        EntityManager em = new Permissions().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Permissions.countPermissionses() {    
    	PermissionsQuery permissionsQuery = new PermissionsQuery();
    	Criteria criteria = permissionsQuery.findByAccessCriteria(entityManager());
        return permissionsQuery.count(criteria);        
    }    
    
    public static List<Permissions> Permissions.findAllPermissionses() {  
    	PermissionsQuery permissionsQuery = new PermissionsQuery();
    	return permissionsQuery.findByAccess(entityManager());       
    }    
    
    public static Permissions Permissions.findPermissions(Long id) {   
    	PermissionsQuery permissionsQuery = new PermissionsQuery();
    	return (Permissions)permissionsQuery.findByAccess(entityManager(), id);         
    }    
    
    public static List<Permissions> Permissions.findPermissionsEntries(int firstResult, int maxResults) {
    	PermissionsQuery permissionsQuery = new PermissionsQuery();
    	return permissionsQuery.findEntries(entityManager(), firstResult, maxResults);        
    }    
    
}
