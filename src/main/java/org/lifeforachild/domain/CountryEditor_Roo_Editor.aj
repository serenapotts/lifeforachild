package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.Country;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect CountryEditor_Roo_Editor {
    
    declare parents: CountryEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter CountryEditor.typeConverter = new SimpleTypeConverter();    
    
    public String CountryEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((Country) obj).getId(), String.class);        
    }    
    
    public void CountryEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(Country.findCountry(identifier));        
    }    
    
}
