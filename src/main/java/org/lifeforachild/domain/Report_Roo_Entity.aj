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
import org.lifeforachild.domain.Report;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Report_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Report.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Report.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Report.version;    
    
    public Long Report.getId() {    
        return this.id;        
    }    
    
    public void Report.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Report.getVersion() {    
        return this.version;        
    }    
    
    public void Report.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Report.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Report.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Report attached = this.entityManager.find(Report.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Report.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Report.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Report merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Report.entityManager() {    
        EntityManager em = new Report().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Report.countReports() {    
        return (Long) entityManager().createQuery("select count(o) from Report o").getSingleResult();        
    }    
    
    public static List<Report> Report.findAllReports() {    
        return entityManager().createQuery("select o from Report o").getResultList();        
    }    
    
    public static Report Report.findReport(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Report");        
        return entityManager().find(Report.class, id);        
    }    
    
    public static List<Report> Report.findReportEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Report o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
