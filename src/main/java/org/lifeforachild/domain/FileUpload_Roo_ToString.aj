package org.lifeforachild.domain;

import java.lang.String;

privileged aspect FileUpload_Roo_ToString {
    
    public String FileUpload.toString() {    
        return getName();        
    }    
    
}
