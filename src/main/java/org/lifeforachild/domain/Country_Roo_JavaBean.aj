package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;

import org.lifeforachild.domain.DiabetesCentre;

privileged aspect Country_Roo_JavaBean {
    
    public Long Country.getId() {    
        return this.id;        
    }    
    
    public void Country.setId(Long id) {    
        this.id = id;        
    }    
    
    public String Country.getName() {    
        return this.name;        
    }    
    
    public void Country.setName(String name) {    
        this.name = name;        
    }    
    
    public Set<DiabetesCentre> Country.getDiabetesCentres() {    
        return this.diabetesCentres;        
    }    
    
    public void Country.setDiabetesCentres(Set<DiabetesCentre> diabetesCentres) {    
        this.diabetesCentres = diabetesCentres;        
    }   
    
    public boolean Country.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void Country.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }    
}
