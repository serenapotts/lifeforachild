package org.lifeforachild.domain;

import java.lang.String;

privileged aspect User_Roo_ToString {
    
    public String User.toString() {            
        return getFirstName() + " " + getLastName();       
    }    
    
}
