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
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClinicalRecord_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager ClinicalRecord.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long ClinicalRecord.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer ClinicalRecord.version;    
    
    public Long ClinicalRecord.getId() {    
        return this.id;        
    }    
    
    public void ClinicalRecord.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer ClinicalRecord.getVersion() {    
        return this.version;        
    }    
    
    public void ClinicalRecord.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void ClinicalRecord.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void ClinicalRecord.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            ClinicalRecord attached = this.entityManager.find(ClinicalRecord.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void ClinicalRecord.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void ClinicalRecord.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        ClinicalRecord merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager ClinicalRecord.entityManager() {    
        EntityManager em = new ClinicalRecord().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long ClinicalRecord.countClinicalRecords() {    
        return (Long) entityManager().createQuery("select count(o) from ClinicalRecord o").getSingleResult();        
    }    
    
    public static List<ClinicalRecord> ClinicalRecord.findAllClinicalRecords() {    
        return entityManager().createQuery("select o from ClinicalRecord o").getResultList();        
    }    
    
    public static ClinicalRecord ClinicalRecord.findClinicalRecord(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of ClinicalRecord");        
        return entityManager().find(ClinicalRecord.class, id);        
    }    
    
    public static List<ClinicalRecord> ClinicalRecord.findClinicalRecordEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from ClinicalRecord o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
