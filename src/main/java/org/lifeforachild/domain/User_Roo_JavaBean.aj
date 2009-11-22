package org.lifeforachild.domain;

import java.lang.String;

privileged aspect User_Roo_JavaBean {
    
    public String User.getName() {    
        return this.name;        
    }    
    
    public void User.setName(String name) {    
        this.name = name;        
    }    
    
}
