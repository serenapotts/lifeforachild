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
import org.lifeforachild.domain.Permissions;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Permissions_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Permissions.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Permissions.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Permissions.version;    
    
    public Long Permissions.getId() {    
        return this.id;        
    }    
    
    public void Permissions.setId(Long id) {    
        this.id = id;        
    }    
    
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
        return (Long) entityManager().createQuery("select count(o) from Permissions o").getSingleResult();        
    }    
    
    public static List<Permissions> Permissions.findAllPermissionses() {    
        return entityManager().createQuery("select o from Permissions o").getResultList();        
    }    
    
    public static Permissions Permissions.findPermissions(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Permissions");        
        return entityManager().find(Permissions.class, id);        
    }    
    
    public static List<Permissions> Permissions.findPermissionsEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Permissions o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
