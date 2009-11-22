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
import org.lifeforachild.domain.ReportProperties;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ReportProperties_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager ReportProperties.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "_id")    
    private Long ReportProperties._id;    
    
    @Version    
    @Column(name = "version")    
    private Integer ReportProperties.version;    
    
    public Long ReportProperties.get_id() {    
        return this._id;        
    }    
    
    public void ReportProperties.set_id(Long id) {    
        this._id = id;        
    }    
    
    public Integer ReportProperties.getVersion() {    
        return this.version;        
    }    
    
    public void ReportProperties.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void ReportProperties.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void ReportProperties.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            ReportProperties attached = this.entityManager.find(ReportProperties.class, this._id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void ReportProperties.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void ReportProperties.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        ReportProperties merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this._id = merged.get_id();        
    }    
    
    public static final EntityManager ReportProperties.entityManager() {    
        EntityManager em = new ReportProperties().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long ReportProperties.countReportPropertieses() {    
        return (Long) entityManager().createQuery("select count(o) from ReportProperties o").getSingleResult();        
    }    
    
    public static List<ReportProperties> ReportProperties.findAllReportPropertieses() {    
        return entityManager().createQuery("select o from ReportProperties o").getResultList();        
    }    
    
    public static ReportProperties ReportProperties.findReportProperties(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of ReportProperties");        
        return entityManager().find(ReportProperties.class, id);        
    }    
    
    public static List<ReportProperties> ReportProperties.findReportPropertiesEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from ReportProperties o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
