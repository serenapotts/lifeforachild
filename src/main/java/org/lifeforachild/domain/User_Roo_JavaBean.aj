package org.lifeforachild.domain;

privileged aspect User_Roo_JavaBean {
    
    public java.lang.String User.getName() {    
        return this.name;        
    }    
    
    public void User.setName(java.lang.String name) {    
        this.name = name;        
    }    
    
}
