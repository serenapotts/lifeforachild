package org.lifeforachild.domain;

privileged aspect DiabetesCentreEditor_Roo_Editor {
    
    declare parents: DiabetesCentreEditor implements java.beans.PropertyEditorSupport;    
    
    org.springframework.beans.SimpleTypeConverter DiabetesCentreEditor.typeConverter = new org.springframework.beans.SimpleTypeConverter();    
    
    public java.lang.String DiabetesCentreEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((org.lifeforachild.domain.DiabetesCentre) obj).getId() , String.class);        
    }    
    
    public void DiabetesCentreEditor.setAsText(java.lang.String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        java.lang.Long identifier = (java.lang.Long) typeConverter.convertIfNecessary(text, java.lang.Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(org.lifeforachild.domain.DiabetesCentre.findDiabetesCentre(identifier));        
    }    
    
}
