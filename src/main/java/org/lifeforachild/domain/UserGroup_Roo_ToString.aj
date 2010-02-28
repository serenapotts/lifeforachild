package org.lifeforachild.domain;

import java.lang.String;

privileged aspect UserGroup_Roo_ToString {
    
    public String UserGroup.toString() {            
        return getGroupName();     
    }    
    
}
