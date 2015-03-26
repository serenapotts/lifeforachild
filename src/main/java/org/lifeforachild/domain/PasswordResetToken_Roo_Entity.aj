package org.lifeforachild.domain;

import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;

import org.hibernate.Criteria;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.web.query.UserQuery;
import org.springframework.transaction.annotation.Transactional;

import ar.com.fdvs.dj.domain.CustomExpression;

privileged aspect PasssordResetToken_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager PasswordResetToken.entityManager;         
    
    @Transactional    
    public void PasswordResetToken.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void PasswordResetToken.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            User attached = this.entityManager.find(User.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void PasswordResetToken.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void PasswordResetToken.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        PasswordResetToken merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager PasswordResetToken.entityManager() {    
        EntityManager em = new User().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
}
