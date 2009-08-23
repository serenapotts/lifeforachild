package org.lifeforachild.domain;

privileged aspect Child_Roo_ToString {
    
    public java.lang.String Child.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("initials: ").append(getInitials()).append(", ");        
        sb.append("name: ").append(getName()).append(", ");        
        sb.append("ethnicGroup: ").append(getEthnicGroup()).append(", ");        
        sb.append("sex: ").append(getSex()).append(", ");        
        sb.append("survivalStatus: ").append(getSurvivalStatus()).append(", ");        
        sb.append("dateOfDeath: ").append(getDateOfDeath()).append(", ");        
        sb.append("causeOfDeath: ").append(getCauseOfDeath()).append(", ");        
        sb.append("causeOfDeathOther: ").append(getCauseOfDeathOther()).append(", ");        
        sb.append("dateOfRegistration: ").append(getDateOfRegistration()).append(", ");        
        sb.append("dateOfBirth: ").append(getDateOfBirth()).append(", ");        
        sb.append("diabetesDiagnosed: ").append(getDiabetesDiagnosed()).append(", ");        
        sb.append("insulinSince: ").append(getInsulinSince()).append(", ");        
        sb.append("diabetesType: ").append(getDiabetesType()).append(", ");        
        sb.append("diabetesTypeOther: ").append(getDiabetesTypeOther()).append(", ");        
        sb.append("clinicalRecords: ").append(getClinicalRecords() == null ? "null" : getClinicalRecords().size());        
        return sb.toString();        
    }    
    
}
