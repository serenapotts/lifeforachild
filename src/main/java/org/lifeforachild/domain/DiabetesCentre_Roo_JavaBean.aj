package org.lifeforachild.domain;

import java.lang.String;
import org.lifeforachild.domain.Country;

privileged aspect DiabetesCentre_Roo_JavaBean {
    
    public String DiabetesCentre.getName() {    
        return this.name;        
    }    
    
    public void DiabetesCentre.setName(String name) {    
        this.name = name;        
    }    
    
    public String DiabetesCentre.getAddress() {    
        return this.address;        
    }    
    
    public void DiabetesCentre.setAddress(String address) {    
        this.address = address;        
    }    
    
    public boolean DiabetesCentre.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void DiabetesCentre.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }    
    public Country DiabetesCentre.getCountry() {    
        return this.country;        
    }    
    
    public void DiabetesCentre.setCountry(Country country) {    
        this.country = country;        
    }    
    
}
