package org.lifeforachild.domain;

import java.lang.String;

privileged aspect PasswordResetToken_Roo_ToString {
    
    public String PasswordResetToken.toString() {            
        return getId().toString();       
    }    
    
}
