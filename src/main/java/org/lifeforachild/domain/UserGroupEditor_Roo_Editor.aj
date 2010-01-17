package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.UserGroup;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect UserGroupEditor_Roo_Editor {
    
    declare parents: UserGroupEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter UserGroupEditor.typeConverter = new SimpleTypeConverter();    
    
    public String UserGroupEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((UserGroup) obj).getId(), String.class);        
    }    
    
    public void UserGroupEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(UserGroup.findUserGroup(identifier));        
    }    
    
}
