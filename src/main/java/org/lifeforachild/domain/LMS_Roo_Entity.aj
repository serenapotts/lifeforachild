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
import org.lifeforachild.domain.LMS;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LMS_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager LMS.entityManager;    
    
    @Version    
    @Column(name = "version")    
    private Integer LMS.version;    
    
    public Integer LMS.getVersion() {    
        return this.version;        
    }    
    
    public void LMS.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void LMS.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void LMS.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            LMS attached = this.entityManager.find(LMS.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void LMS.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void LMS.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        LMS merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager LMS.entityManager() {    
        EntityManager em = new LMS(){        
        }.entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long LMS.countLMSS() {    
        return (Long) entityManager().createQuery("select count(o) from LMS o").getSingleResult();        
    }    
    
    public static List<LMS> LMS.findAllLMSS() {    
        return entityManager().createQuery("select o from LMS o").getResultList();        
    }    
    
    public static LMS LMS.findLMS(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of LMS");        
        return entityManager().find(LMS.class, id);        
    }    
    
    public static List<LMS> LMS.findLMSEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from LMS o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
