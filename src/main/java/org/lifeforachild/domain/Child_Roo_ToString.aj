package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Child_Roo_ToString {
    
    public String Child.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("IndividualId: ").append(getIndividualId()).append(", ");        
        sb.append("Initials: ").append(getInitials()).append(", ");        
        sb.append("Name: ").append(getName()).append(", ");        
        sb.append("EthnicGroup: ").append(getEthnicGroup()).append(", ");        
        sb.append("Sex: ").append(getSex()).append(", ");        
        sb.append("SurvivalStatus: ").append(getSurvivalStatus()).append(", ");        
        sb.append("DateOfDeath: ").append(getDateOfDeath()).append(", ");        
        sb.append("CauseOfDeath: ").append(getCauseOfDeath()).append(", ");        
        sb.append("CauseOfDeathOther: ").append(getCauseOfDeathOther()).append(", ");        
        sb.append("DateOfRegistration: ").append(getDateOfRegistration()).append(", ");        
        sb.append("DateOfBirth: ").append(getDateOfBirth()).append(", ");        
        sb.append("DiabetesDiagnosed: ").append(getDiabetesDiagnosed()).append(", ");        
        sb.append("InsulinSince: ").append(getInsulinSince()).append(", ");        
        sb.append("DiabetesType: ").append(getDiabetesType()).append(", ");        
        sb.append("DiabetesTypeOther: ").append(getDiabetesTypeOther()).append(", ");        
        sb.append("CreatedOn: ").append(getCreatedOn()).append(", ");        
        sb.append("UpdatedOn: ").append(getUpdatedOn()).append(", ");        
        sb.append("DistanceLivesFromCentre: ").append(getDistanceLivesFromCentre()).append(", ");        
        sb.append("ClinicalRecords: ").append(getClinicalRecords() == null ? "null" : getClinicalRecords().size());        
        return sb.toString();        
    }    
    
}
