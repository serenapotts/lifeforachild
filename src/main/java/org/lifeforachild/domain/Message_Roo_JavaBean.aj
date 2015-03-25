package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;

import org.lifeforachild.domain.DiabetesCentre;

privileged aspect Message_Roo_JavaBean {
    
    public Long Message.getId() {    
        return this.id;        
    }    
    
    public void Message.setId(Long id) {    
        this.id = id;        
    }      
    
    public String Message.getMessageKey() {    
        return this.messageKey;        
    }    
    
    public void Message.setMessageKey(String messageKey) {    
        this.messageKey = messageKey;        
    }    
    
    public String Message.getEnglish() {    
        return this.english;        
    }    
    
    public void Message.setEnglish(String english) {    
        this.english = english;        
    } 
    
    public String Message.getFrench() {    
        return this.french;        
    }    
    
    public void Message.setFrench(String french) {    
        this.french = french;        
    } 
    
    public String Message.getSpanish() {    
        return this.spanish;        
    }    
    
    public void Message.setSpanish(String spanish) {    
        this.spanish = spanish;        
    } 
    
    public String Message.getRussian() {    
        return this.russian;        
    }    
    
    public void Message.setRussian(String russian) {    
        this.russian = russian;        
    } 
}
