package org.lifeforachild.domain;

privileged aspect Country_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager Country.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "id")    
    private java.lang.Long Country.id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer Country.version;    
    
    public java.lang.Long Country.getId() {    
        return this.id;        
    }    
    
    public void Country.setId(java.lang.Long id) {    
        this.id = id;        
    }    
    
    public java.lang.Integer Country.getVersion() {    
        return this.version;        
    }    
    
    public void Country.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Country.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Country.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Country attached = this.entityManager.find(Country.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Country.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Country.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Country merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static javax.persistence.EntityManager Country.entityManager() {    
        javax.persistence.EntityManager em = new Country().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Country.countCountrys() {    
        return (Long) entityManager().createQuery("select count(o) from Country o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.Country> Country.findAllCountrys() {    
        return entityManager().createQuery("select o from Country o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.Country Country.findCountry(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Country");        
        return entityManager().find(Country.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.Country> Country.findCountryEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Country o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
