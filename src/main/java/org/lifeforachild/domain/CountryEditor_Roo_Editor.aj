package org.lifeforachild.domain;

privileged aspect CountryEditor_Roo_Editor {
    
    declare parents: CountryEditor implements java.beans.PropertyEditorSupport;    
    
    org.springframework.beans.SimpleTypeConverter CountryEditor.typeConverter = new org.springframework.beans.SimpleTypeConverter();    
    
    public java.lang.String CountryEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((org.lifeforachild.domain.Country) obj).getId() , String.class);        
    }    
    
    public void CountryEditor.setAsText(java.lang.String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        java.lang.Long identifier = (java.lang.Long) typeConverter.convertIfNecessary(text, java.lang.Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(org.lifeforachild.domain.Country.findCountry(identifier));        
    }    
    
}
