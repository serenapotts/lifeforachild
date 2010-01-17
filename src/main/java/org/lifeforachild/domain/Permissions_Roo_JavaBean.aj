package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Permissions_Roo_JavaBean {
    
    public String Permissions.getName() {    
        return this.name;        
    }    
    
    public void Permissions.setName(String name) {    
        this.name = name;        
    }    
    
}
