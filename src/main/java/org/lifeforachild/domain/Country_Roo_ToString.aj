package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Country_Roo_ToString {
    
    public String Country.toString() {    
        return getName();        
    }    
    
}
