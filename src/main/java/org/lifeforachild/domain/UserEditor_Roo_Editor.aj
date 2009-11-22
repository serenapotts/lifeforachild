package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.User;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect UserEditor_Roo_Editor {
    
    declare parents: UserEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter UserEditor.typeConverter = new SimpleTypeConverter();    
    
    public String UserEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((User) obj).getId(), String.class);        
    }    
    
    public void UserEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(User.findUser(identifier));        
    }    
    
}
