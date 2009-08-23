package org.lifeforachild.domain;

privileged aspect Country_Roo_ToString {
    
    public java.lang.String Country.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("name: ").append(getName()).append(", ");        
        sb.append("diabetesCentres: ").append(getDiabetesCentres() == null ? "null" : getDiabetesCentres().size());        
        return sb.toString();        
    }    
    
}
