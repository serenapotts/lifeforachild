package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect DiabetesCentreEditor_Roo_Editor {
    
    declare parents: DiabetesCentreEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter DiabetesCentreEditor.typeConverter = new SimpleTypeConverter();    
    
    public String DiabetesCentreEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((DiabetesCentre) obj).getId(), String.class);        
    }    
    
    public void DiabetesCentreEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(DiabetesCentre.findDiabetesCentre(identifier));        
    }    
    
}
