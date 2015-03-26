package org.lifeforachild.domain;

import java.lang.String;

privileged aspect ForgotPassword_Roo_ToString {
    
    public String ForgotPassword.toString() {    
        return getUsername();        
    }    
}
