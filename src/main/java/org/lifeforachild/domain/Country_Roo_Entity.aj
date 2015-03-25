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
import org.lifeforachild.web.query.CountryQuery;
import org.springframework.transaction.annotation.Transactional;

/**
 * Entity class for managing persistence of the {@link Country} class to the database though the 
 * JPA EntityManager.
 * 
 * @author Serena Keating
 *
 */
privileged aspect Country_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Country.entityManager;    
    
    @Version    
    @Column(name = "version")    
    private Integer Country.version;    
    
    public Integer Country.getVersion() {    
        return this.version;        
    }    
    
    public void Country.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Country.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Country.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Country attached = this.entityManager.find(Country.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Country.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Country.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Country merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Country.entityManager() {    
        EntityManager em = new Country().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    /**
     * Return the number of countries the user has access to.
     */
    public static long Country.countCountrys() {   
    	CountryQuery countryQuery = new CountryQuery();
    	Criteria criteria = countryQuery.findByAccessCriteria(entityManager());
        return countryQuery.count(criteria);        
    }    
    
    /**
     * Return a list of all countries the user has access to.
     */
    public static List<Country> Country.findAllCountrys() {   
    	CountryQuery countryQuery = new CountryQuery();
        return countryQuery.findByAccess(entityManager());        
    }    

    /**
     * Return a list of all the countries the user has access to, adding a blank to the list if specified to.
     */
    public static List<Country> Country.findAllCountrys(boolean addBlank) {   
    	List<Country> countries = findAllCountrys();
    	if (addBlank)
    	{
    		Country blankCountry = new Country();
        	blankCountry.id = new Long(0);
        	blankCountry.setName("");
        	countries.add(0, blankCountry);    	
    	}
    	return countries;
    }    

    /**
     * Return the country with the given id, or null if it does not exist.
     */
    public static Country Country.findCountry(Long id) { 
    	if (id == null) return null;
    	CountryQuery countryQuery = new CountryQuery();
    	return (Country)countryQuery.findByAccess(entityManager(), id);       
    }    
    
    /**
     * Get the list of countries giving a start result up to a maximum number of results.
     */
    public static List<Country> Country.findCountryEntries(int firstResult, int maxResults) {  
    	CountryQuery countryQuery = new CountryQuery();
        return countryQuery.findEntries(entityManager(), firstResult, maxResults);        
    }   
    
    /**
     * Return the country with the given name, or null if it does not exist.
     */
    public static Country Country.findCountryByName(String name) { 
    	if (name == null) return null;
    	CountryQuery countryQuery = new CountryQuery();
    	return (Country)countryQuery.findCountryByName(entityManager(), name);       
    }      
    
}
