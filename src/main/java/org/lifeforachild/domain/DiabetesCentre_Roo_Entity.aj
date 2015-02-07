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
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.enums.UserGroups;
import org.lifeforachild.web.query.CountryQuery;
import org.lifeforachild.web.query.DiabetesCentreQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DiabetesCentre_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager DiabetesCentre.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long DiabetesCentre.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer DiabetesCentre.version;    
    
    public Long DiabetesCentre.getId() {    
        return this.id;        
    }    
    
    public void DiabetesCentre.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer DiabetesCentre.getVersion() {    
        return this.version;        
    }    
    
    public void DiabetesCentre.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void DiabetesCentre.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void DiabetesCentre.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            DiabetesCentre attached = this.entityManager.find(DiabetesCentre.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void DiabetesCentre.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void DiabetesCentre.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        DiabetesCentre merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager DiabetesCentre.entityManager() {    
        EntityManager em = new DiabetesCentre().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long DiabetesCentre.countDiabetesCentres() {    
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	Criteria criteria = diabetesCentreQuery.findByAccessCriteria(entityManager());
        return diabetesCentreQuery.count(criteria);        
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findAllDiabetesCentres() { 
    	return findAllDiabetesCentres(null);
    }
    
    public static List<DiabetesCentre> DiabetesCentre.findAllDiabetesCentres(Long countryId) { 
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	return diabetesCentreQuery.findByCountryAccess(entityManager(), countryId);       
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findAllDiabetesCentres(boolean addBlank) { 
    	return findAllDiabetesCentres(addBlank, null);
    }
    
    public static List<DiabetesCentre> DiabetesCentre.findAllDiabetesCentres(boolean addBlank, Long countryId) {    
    	List<DiabetesCentre> centres = findAllDiabetesCentres(countryId);
    	return findEmptyDiabetesCentres(addBlank, centres);
    }  
    
    public static List<DiabetesCentre> DiabetesCentre.findEmptyDiabetesCentres(boolean addBlank, List<DiabetesCentre> centres) {    
    	if (addBlank)
    	{
    		DiabetesCentre blankCentre = new DiabetesCentre();
    		blankCentre.id = new Long(0);
    		blankCentre.setName("");
        	
    		UserGroup userGroup = SecurityUtil.getInstance().getCurrentUserGroup();
        	if (userGroup == null)
        		// TODO this will cause null pointer
        		return null;
        	else if (userGroup.getGroupCode().equals(UserGroups.PROGRAM_MANAGER.name()) ||
        			userGroup.getGroupCode().equals(UserGroups.PMS_ASSISTANTS.name()))
        		// they can see all countries so allow blank
        		centres.add(0, blankCentre);    	
    	}
    	return centres;     
    }      
    
    public static DiabetesCentre DiabetesCentre.findDiabetesCentre(String id) {
    	return findDiabetesCentre(Long.parseLong(id));
    }
    
    public static DiabetesCentre DiabetesCentre.findDiabetesCentre(Long id) {
    	if (id == null) return null;
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	return (DiabetesCentre)diabetesCentreQuery.findByAccess(entityManager(), id);      
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findDiabetesCentreEntries(int firstResult, int maxResults) { 
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
        return diabetesCentreQuery.findEntries(entityManager(), firstResult, maxResults);        
    }    
    
    public static DiabetesCentre DiabetesCentre.findDiabetesCentreByName(String name) { 
    	if (name == null) return null;
    	DiabetesCentreQuery diabetesCentreQuery = new DiabetesCentreQuery();
    	return (DiabetesCentre)diabetesCentreQuery.findDiabetesCentreByName(entityManager(), name);       
    }       
}
