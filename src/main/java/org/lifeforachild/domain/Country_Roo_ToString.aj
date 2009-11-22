package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Country_Roo_ToString {
    
    public String Country.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Name: ").append(getName()).append(", ");        
        sb.append("DiabetesCentres: ").append(getDiabetesCentres() == null ? "null" : getDiabetesCentres().size());        
        return sb.toString();        
    }    
    
}
