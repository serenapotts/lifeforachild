package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Permissions_Roo_ToString {
    
    public String Permissions.toString() {           
        return getDescription();        
    }    
    
}
