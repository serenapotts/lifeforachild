package org.lifeforachild.domain;

privileged aspect User_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager User.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "id")    
    private java.lang.Long User.id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer User.version;    
    
    public java.lang.Long User.getId() {    
        return this.id;        
    }    
    
    public void User.setId(java.lang.Long id) {    
        this.id = id;        
    }    
    
    public java.lang.Integer User.getVersion() {    
        return this.version;        
    }    
    
    public void User.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void User.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void User.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            User attached = this.entityManager.find(User.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void User.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void User.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        User merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static javax.persistence.EntityManager User.entityManager() {    
        javax.persistence.EntityManager em = new User().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long User.countUsers() {    
        return (Long) entityManager().createQuery("select count(o) from User o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.User> User.findAllUsers() {    
        return entityManager().createQuery("select o from User o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.User User.findUser(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of User");        
        return entityManager().find(User.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.User> User.findUserEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from User o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
