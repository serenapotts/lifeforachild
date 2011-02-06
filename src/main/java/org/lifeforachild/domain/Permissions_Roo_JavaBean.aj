package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Permissions_Roo_JavaBean {
    
    public String Permissions.getName() {    
        return this.name;        
    }    
    
    public void Permissions.setName(String name) {    
        this.name = name;        
    }    
    
    public String Permissions.getDescription() {    
        return this.description;        
    }    
    
    public void Permissions.setDescription(String description) {    
        this.description = description;        
    }  
   
    public boolean Permissions.getIsDeleted() {    
        return this.isDeleted;        
    }
    
    public void Permissions.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }
}
