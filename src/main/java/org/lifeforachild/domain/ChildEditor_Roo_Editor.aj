package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.Child;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect ChildEditor_Roo_Editor {
    
    declare parents: ChildEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter ChildEditor.typeConverter = new SimpleTypeConverter();    
    
    public String ChildEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((Child) obj).getId(), String.class);        
    }    
    
    public void ChildEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(Child.findChild(identifier));        
    }    
    
}
