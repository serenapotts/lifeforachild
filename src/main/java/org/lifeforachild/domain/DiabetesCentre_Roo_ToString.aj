package org.lifeforachild.domain;

privileged aspect DiabetesCentre_Roo_ToString {
    
    public java.lang.String DiabetesCentre.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("name: ").append(getName()).append(", ");        
        sb.append("address: ").append(getAddress()).append(", ");        
        sb.append("country: ").append(getCountry());        
        return sb.toString();        
    }    
    
}
