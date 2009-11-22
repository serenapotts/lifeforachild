package org.lifeforachild.domain;

import java.beans.PropertyEditorSupport;
import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.beans.SimpleTypeConverter;

privileged aspect ClinicalRecordEditor_Roo_Editor {
    
    declare parents: ClinicalRecordEditor implements PropertyEditorSupport;    
    
    private SimpleTypeConverter ClinicalRecordEditor.typeConverter = new SimpleTypeConverter();    
    
    public String ClinicalRecordEditor.getAsText() {    
        Object obj = getValue();        
        if (obj == null) {        
            return null;            
        }        
        return (String) typeConverter.convertIfNecessary(((ClinicalRecord) obj).getId(), String.class);        
    }    
    
    public void ClinicalRecordEditor.setAsText(String text) {    
        if (text == null || 0 == text.length()) {        
            setValue(null);            
            return;            
        }        
        
        Long identifier = (Long) typeConverter.convertIfNecessary(text, Long.class);        
        if (identifier == null) {        
            setValue(null);            
            return;            
        }        
        
        setValue(ClinicalRecord.findClinicalRecord(identifier));        
    }    
    
}
