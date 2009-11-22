package org.lifeforachild.domain;

import java.lang.String;

privileged aspect DiabetesCentre_Roo_ToString {
    
    public String DiabetesCentre.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Name: ").append(getName()).append(", ");        
        sb.append("Address: ").append(getAddress()).append(", ");        
        sb.append("Country: ").append(getCountry());        
        return sb.toString();        
    }    
    
}
