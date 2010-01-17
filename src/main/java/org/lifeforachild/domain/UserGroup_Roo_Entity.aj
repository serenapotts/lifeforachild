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
import org.lifeforachild.domain.UserGroup;
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
        return (Long) entityManager().createQuery("select count(o) from UserGroup o").getSingleResult();        
    }    
    
    public static List<UserGroup> UserGroup.findAllUserGroups() {    
        return entityManager().createQuery("select o from UserGroup o").getResultList();        
    }    
    
    public static UserGroup UserGroup.findUserGroup(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of UserGroup");        
        return entityManager().find(UserGroup.class, id);        
    }    
    
    public static List<UserGroup> UserGroup.findUserGroupEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from UserGroup o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
