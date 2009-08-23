package org.lifeforachild.domain;

privileged aspect ClinicalRecordEditor_Roo_Editor {
    
    declare parents: ClinicalRecordEditor implements java.beans.PropertyEditorSupport;    
    
    org.springframework.beans.SimpleTypeConverter ClinicalRecordEditor.typeConverter = new org.springframework.beans.SimpleTypeConverter();    
    
    public java.lang.String ClinicalRecordEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((org.lifeforachild.domain.ClinicalRecord) obj).getId() , String.class);        
    }    
    
    public void ClinicalRecordEditor.setAsText(java.lang.String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        java.lang.Long identifier = (java.lang.Long) typeConverter.convertIfNecessary(text, java.lang.Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(org.lifeforachild.domain.ClinicalRecord.findClinicalRecord(identifier));        
    }    
    
}
