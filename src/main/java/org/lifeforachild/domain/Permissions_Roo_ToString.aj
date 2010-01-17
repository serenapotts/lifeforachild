package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Permissions_Roo_ToString {
    
    public String Permissions.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Name: ").append(getName());        
        return sb.toString();        
    }    
    
}
