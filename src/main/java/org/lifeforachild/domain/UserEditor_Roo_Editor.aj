package org.lifeforachild.domain;

privileged aspect UserEditor_Roo_Editor {
    
    declare parents: UserEditor implements java.beans.PropertyEditorSupport;    
    
    org.springframework.beans.SimpleTypeConverter UserEditor.typeConverter = new org.springframework.beans.SimpleTypeConverter();    
    
    public java.lang.String UserEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((org.lifeforachild.domain.User) obj).getId() , String.class);        
    }    
    
    public void UserEditor.setAsText(java.lang.String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        java.lang.Long identifier = (java.lang.Long) typeConverter.convertIfNecessary(text, java.lang.Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(org.lifeforachild.domain.User.findUser(identifier));        
    }    
    
}
