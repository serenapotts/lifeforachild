package org.lifeforachild.domain;

import java.lang.String;

privileged aspect User_Roo_ToString {
    
    public String User.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Username: ").append(getUsername()).append(", ");        
        sb.append("Password: ").append(getPassword()).append(", ");        
        sb.append("Enabled: ").append(isEnabled()).append(", ");        
        sb.append("UserGroup: ").append(getUserGroup());        
        return sb.toString();        
    }    
    
}
