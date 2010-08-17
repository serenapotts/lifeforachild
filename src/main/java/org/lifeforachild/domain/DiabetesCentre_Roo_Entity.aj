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
import org.lifeforachild.web.query.DiabetesCentreQuery;
import org.lifeforachild.web.query.UserQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DiabetesCentre_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager DiabetesCentre.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long DiabetesCentre.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer DiabetesCentre.version;    
    
    public Long DiabetesCentre.getId() {    
        return this.id;        
    }    
    
    public void DiabetesCentre.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer DiabetesCentre.getVersion() {    
        return this.version;        
    }    
    
    public void DiabetesCentre.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void DiabetesCentre.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void DiabetesCentre.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            DiabetesCentre attached = this.entityManager.find(DiabetesCentre.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void DiabetesCentre.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void DiabetesCentre.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        DiabetesCentre merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager DiabetesCentre.entityManager() {    
        EntityManager em = new DiabetesCentre().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long DiabetesCentre.countDiabetesCentres() {    
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	Criteria criteria = diabetesCentreQuery.findByAccessCriteria(entityManager());
        return diabetesCentreQuery.count(criteria);        
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findAllDiabetesCentres() { 
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	return diabetesCentreQuery.findByAccess(entityManager());       
    }    
    
    public static DiabetesCentre DiabetesCentre.findDiabetesCentre(Long id) {
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	return (DiabetesCentre)diabetesCentreQuery.findByAccess(entityManager(), id);      
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findDiabetesCentreEntries(int firstResult, int maxResults) { 
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
        return diabetesCentreQuery.findEntries(entityManager(), firstResult, maxResults);        
    }    
    
}
