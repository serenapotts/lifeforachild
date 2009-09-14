package org.lifeforachild.domain;

privileged aspect ClinicalRecord_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager ClinicalRecord.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "id")    
    private java.lang.Long ClinicalRecord.id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer ClinicalRecord.version;    
    
    public java.lang.Long ClinicalRecord.getId() {    
        return this.id;        
    }    
    
    public void ClinicalRecord.setId(java.lang.Long id) {    
        this.id = id;        
    }    
    
    public java.lang.Integer ClinicalRecord.getVersion() {    
        return this.version;        
    }    
    
    public void ClinicalRecord.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            ClinicalRecord attached = this.entityManager.find(ClinicalRecord.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        ClinicalRecord merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static javax.persistence.EntityManager ClinicalRecord.entityManager() {    
        javax.persistence.EntityManager em = new ClinicalRecord().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long ClinicalRecord.countClinicalRecords() {    
        return (Long) entityManager().createQuery("select count(o) from ClinicalRecord o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.ClinicalRecord> ClinicalRecord.findAllClinicalRecords() {    
        return entityManager().createQuery("select o from ClinicalRecord o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.ClinicalRecord ClinicalRecord.findClinicalRecord(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of ClinicalRecord");        
        return entityManager().find(ClinicalRecord.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.ClinicalRecord> ClinicalRecord.findClinicalRecordEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from ClinicalRecord o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
