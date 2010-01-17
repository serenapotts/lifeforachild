package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.Permissions;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect PermissionsEditor_Roo_Editor {
    
    declare parents: PermissionsEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter PermissionsEditor.typeConverter = new SimpleTypeConverter();    
    
    public String PermissionsEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((Permissions) obj).getId(), String.class);        
    }    
    
    public void PermissionsEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(Permissions.findPermissions(identifier));        
    }    
    
}
