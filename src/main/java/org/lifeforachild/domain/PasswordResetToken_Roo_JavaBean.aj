package org.lifeforachild.domain;

import java.lang.String;
import java.util.Date;

import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.UserGroup;

privileged aspect PasswordResetToken_Roo_JavaBean {
    
    public Long PasswordResetToken.getId() {    
        return this.id;        
    }    
    
    public void PasswordResetToken.setId(Long id) {    
        this.id = id;        
    }   
    
    public String PasswordResetToken.getToken() {    
        return this.token;        
    }    
    
    public void PasswordResetToken.setToken(String token) {    
        this.token = token;        
    }    
    
    public User PasswordResetToken.getUser() {    
        return this.user;        
    }    
    
    public void PasswordResetToken.setUser(User user) {    
        this.user = user;        
    }    
    
    public Date PasswordResetToken.getExpiryDate() {    
        return this.expiryDate;        
    }    
    
    public void PasswordResetToken.setExpiryDate(Date expiryDate) {    
        this.expiryDate = expiryDate;        
    }    
    
}
