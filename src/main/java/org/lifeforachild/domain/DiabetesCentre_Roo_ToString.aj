package org.lifeforachild.domain;

import java.lang.String;

privileged aspect DiabetesCentre_Roo_ToString {
    
    public String DiabetesCentre.toString() {           
        return getName();     
    }    
    
}
