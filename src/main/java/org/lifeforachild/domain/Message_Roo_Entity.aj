package org.lifeforachild.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.lifeforachild.web.query.UserQuery;
import org.springframework.transaction.annotation.Transactional;

/**
 * Entity class for managing persistence of the {@link Message} class to the database though the 
 * JPA EntityManager.
 * 
 * @author Serena Keating
 *
 */
privileged aspect Message_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Message.entityManager;    
    
    @Id     
    @GeneratedValue(strategy = GenerationType.AUTO) 
    @Column(name = "id")    
    private Long Message.id; 
    
    @Version    
    @Column(name = "version")    
    private Integer Message.version;  
    
    public Long Message.getId() {    
        return this.id;        
    }    
    
    public void Message.setId(Long id) {    
        this.id = id;        
    }      
    
    public Integer Message.getVersion() {    
        return this.version;        
    }    
    
    public void Message.setVersion(Integer version) {    
        this.version = version;        
    }   
    
    @Transactional    
    public void Message.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Message.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
        	Message attached = this.entityManager.find(Message.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Message.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Message.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Message merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Message.entityManager() {    
        EntityManager em = new Message().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    } 
    
    public static List<Message> Message.list() {
    	return entityManager().createQuery("select o from Message o order by o.english").getResultList(); 
    }
    
    public static Message Message.find(Long id) {
    	return entityManager().find(Message.class, id);
    }
    
    public static List<Message> Message.findMessageEntries(int firstResult, int maxResults) {    
		return entityManager().createQuery("select o from Message o order by o.english").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();       
    }
    
    public static long Message.countMessages() {  
    	return (Long) entityManager().createQuery("select count(o) from Message o").getSingleResult();
    }
}
