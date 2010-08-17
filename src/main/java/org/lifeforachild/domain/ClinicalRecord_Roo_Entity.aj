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
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.web.query.ChildQuery;
import org.lifeforachild.web.query.ClinicalRecordQuery;
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
    	ClinicalRecordQuery clinicalRecordQuery = new ClinicalRecordQuery();
    	Criteria criteria = clinicalRecordQuery.findByAccessCriteria(entityManager());
        return clinicalRecordQuery.count(criteria);        
    }    
    
    public static List<ClinicalRecord> ClinicalRecord.findAllClinicalRecords() {  
    	ClinicalRecordQuery clinicalRecordQuery = new ClinicalRecordQuery();
        return (List<ClinicalRecord>)clinicalRecordQuery.findByAccess(entityManager());       
    }    
    
    public static ClinicalRecord ClinicalRecord.findClinicalRecord(Long id) {    
    	ClinicalRecordQuery clinicalRecordQuery = new ClinicalRecordQuery();
    	return (ClinicalRecord)clinicalRecordQuery.findByAccess(entityManager(), id);       
    }    
    
    public static List<ClinicalRecord> ClinicalRecord.findClinicalRecordEntries(int firstResult, int maxResults) {
    	ClinicalRecordQuery clinicalRecordQuery = new ClinicalRecordQuery();
    	return (List<ClinicalRecord>)clinicalRecordQuery.findEntries(entityManager(), firstResult, maxResults);        
    }    
    
}
