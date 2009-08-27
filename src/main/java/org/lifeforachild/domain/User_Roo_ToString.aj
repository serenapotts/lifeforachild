package org.lifeforachild.domain;

privileged aspect User_Roo_ToString {
    
    public java.lang.String User.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("name: ").append(getName());        
        return sb.toString();        
    }    
    
}
