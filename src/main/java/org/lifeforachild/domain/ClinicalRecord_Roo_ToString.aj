package org.lifeforachild.domain;

privileged aspect ClinicalRecord_Roo_ToString {
    
    public java.lang.String ClinicalRecord.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion());        
        return sb.toString();        
    }    
    
}
