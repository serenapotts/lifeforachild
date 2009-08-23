package org.lifeforachild.domain;

privileged aspect Child_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager Child.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "id")    
    private java.lang.Long Child.id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer Child.version;    
    
    public java.lang.Long Child.getId() {    
        return this.id;        
    }    
    
    public void Child.setId(java.lang.Long id) {    
        this.id = id;        
    }    
    
    public java.lang.Integer Child.getVersion() {    
        return this.version;        
    }    
    
    public void Child.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Child.persist() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Child.remove() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        this.entityManager.remove(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Child.flush() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void Child.merge() {    
        if (this.entityManager == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        Child merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static long Child.countChildren() {    
        javax.persistence.EntityManager em = new Child().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return (Long) em.createQuery("select count(o) from Child o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.Child> Child.findAllChildren() {    
        javax.persistence.EntityManager em = new Child().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em.createQuery("select o from Child o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.Child Child.findChild(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Child");        
        javax.persistence.EntityManager em = new Child().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em.find(Child.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.Child> Child.findChildEntries(int firstResult, int maxResults) {    
        javax.persistence.EntityManager em = new Child().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em.createQuery("select o from Child o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
