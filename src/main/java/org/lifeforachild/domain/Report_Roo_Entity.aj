package org.lifeforachild.domain;

privileged aspect Report_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager Report.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "id")    
    private java.lang.Long Report.id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer Report.version;    
    
    public java.lang.Long Report.getId() {    
        return this.id;        
    }    
    
    public void Report.setId(java.lang.Long id) {    
        this.id = id;        
    }    
    
    public java.lang.Integer Report.getVersion() {    
        return this.version;        
    }    
    
    public void Report.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Report.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Report.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Report attached = this.entityManager.find(Report.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Report.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Report.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Report merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static javax.persistence.EntityManager Report.entityManager() {    
        javax.persistence.EntityManager em = new Report().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Report.countReports() {    
        return (Long) entityManager().createQuery("select count(o) from Report o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.Report> Report.findAllReports() {    
        return entityManager().createQuery("select o from Report o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.Report Report.findReport(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Report");        
        return entityManager().find(Report.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.Report> Report.findReportEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Report o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
