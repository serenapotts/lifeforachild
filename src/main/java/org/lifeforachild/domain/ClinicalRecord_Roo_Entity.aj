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
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.remove() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        this.entityManager.remove(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.flush() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ClinicalRecord.merge() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        ClinicalRecord merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static long ClinicalRecord.countClinicalRecords() {    
        javax.persistence.EntityManager em = new ClinicalRecord().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return (Long) em.createQuery("select count(o) from ClinicalRecord o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.ClinicalRecord> ClinicalRecord.findAllClinicalRecords() {    
        javax.persistence.EntityManager em = new ClinicalRecord().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em.createQuery("select o from ClinicalRecord o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.ClinicalRecord ClinicalRecord.findClinicalRecord(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of ClinicalRecord");        
        javax.persistence.EntityManager em = new ClinicalRecord().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em.find(ClinicalRecord.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.ClinicalRecord> ClinicalRecord.findClinicalRecordEntries(int firstResult, int maxResults) {    
        javax.persistence.EntityManager em = new ClinicalRecord().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em.createQuery("select o from ClinicalRecord o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
