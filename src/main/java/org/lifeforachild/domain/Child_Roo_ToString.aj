package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Child_Roo_ToString {
    
    public String Child.toString() {            
        return getName();       
    }    
    
}
