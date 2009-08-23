package org.lifeforachild.domain;

privileged aspect Country_Roo_JavaBean {
    
    public java.lang.String Country.getName() {    
        return this.name;        
    }    
    
    public void Country.setName(java.lang.String name) {    
        this.name = name;        
    }    
    
    public java.util.Set<org.lifeforachild.domain.DiabetesCentre> Country.getDiabetesCentres() {    
        return this.diabetesCentres;        
    }    
    
    public void Country.setDiabetesCentres(java.util.Set<org.lifeforachild.domain.DiabetesCentre> diabetesCentres) {    
        this.diabetesCentres = diabetesCentres;        
    }    
    
}
