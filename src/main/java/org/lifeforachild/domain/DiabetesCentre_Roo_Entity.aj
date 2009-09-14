package org.lifeforachild.domain;

privileged aspect DiabetesCentre_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager DiabetesCentre.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "id")    
    private java.lang.Long DiabetesCentre.id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer DiabetesCentre.version;    
    
    public java.lang.Long DiabetesCentre.getId() {    
        return this.id;        
    }    
    
    public void DiabetesCentre.setId(java.lang.Long id) {    
        this.id = id;        
    }    
    
    public java.lang.Integer DiabetesCentre.getVersion() {    
        return this.version;        
    }    
    
    public void DiabetesCentre.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void DiabetesCentre.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void DiabetesCentre.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            DiabetesCentre attached = this.entityManager.find(DiabetesCentre.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void DiabetesCentre.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void DiabetesCentre.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        DiabetesCentre merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static javax.persistence.EntityManager DiabetesCentre.entityManager() {    
        javax.persistence.EntityManager em = new DiabetesCentre().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long DiabetesCentre.countDiabetesCentres() {    
        return (Long) entityManager().createQuery("select count(o) from DiabetesCentre o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.DiabetesCentre> DiabetesCentre.findAllDiabetesCentres() {    
        return entityManager().createQuery("select o from DiabetesCentre o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.DiabetesCentre DiabetesCentre.findDiabetesCentre(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of DiabetesCentre");        
        return entityManager().find(DiabetesCentre.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.DiabetesCentre> DiabetesCentre.findDiabetesCentreEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from DiabetesCentre o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
