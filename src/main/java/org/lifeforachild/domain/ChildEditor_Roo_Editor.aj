package org.lifeforachild.domain;

privileged aspect ChildEditor_Roo_Editor {
    
    declare parents: ChildEditor implements java.beans.PropertyEditorSupport;    
    
    org.springframework.beans.SimpleTypeConverter ChildEditor.typeConverter = new org.springframework.beans.SimpleTypeConverter();    
    
    public java.lang.String ChildEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((org.lifeforachild.domain.Child) obj).getId() , String.class);        
    }    
    
    public void ChildEditor.setAsText(java.lang.String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        java.lang.Long identifier = (java.lang.Long) typeConverter.convertIfNecessary(text, java.lang.Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(org.lifeforachild.domain.Child.findChild(identifier));        
    }    
    
}
