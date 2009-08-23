package org.lifeforachild.domain;

privileged aspect DiabetesCentre_Roo_JavaBean {
    
    public java.lang.String DiabetesCentre.getName() {    
        return this.name;        
    }    
    
    public void DiabetesCentre.setName(java.lang.String name) {    
        this.name = name;        
    }    
    
    public java.lang.String DiabetesCentre.getAddress() {    
        return this.address;        
    }    
    
    public void DiabetesCentre.setAddress(java.lang.String address) {    
        this.address = address;        
    }    
    
    public org.lifeforachild.domain.Country DiabetesCentre.getCountry() {    
        return this.country;        
    }    
    
    public void DiabetesCentre.setCountry(org.lifeforachild.domain.Country country) {    
        this.country = country;        
    }    
    
}
