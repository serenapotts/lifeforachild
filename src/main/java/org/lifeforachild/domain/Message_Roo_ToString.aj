package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Message_Roo_ToString {
    
    public String Message.toString() {    
        return getMessageKey();        
    }    
    
}
