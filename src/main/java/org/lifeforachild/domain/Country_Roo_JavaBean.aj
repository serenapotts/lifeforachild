package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;
import org.lifeforachild.domain.DiabetesCentre;

privileged aspect Country_Roo_JavaBean {
    
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
    
}
