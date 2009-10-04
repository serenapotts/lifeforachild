package org.lifeforachild.domain;

privileged aspect Child_Roo_JavaBean {
    
    public java.lang.String Child.getInitials() {    
        return this.initials;        
    }    
    
    public void Child.setInitials(java.lang.String initials) {    
        this.initials = initials;        
    }    
    
    public java.lang.String Child.getName() {    
        return this.name;        
    }    
    
    public void Child.setName(java.lang.String name) {    
        this.name = name;        
    }    
    
    public java.lang.String Child.getEthnicGroup() {    
        return this.ethnicGroup;        
    }    
    
    public void Child.setEthnicGroup(java.lang.String ethnicGroup) {    
        this.ethnicGroup = ethnicGroup;        
    }    
    
    public org.lifeforachild.domain.SexType Child.getSex() {    
        return this.sex;        
    }    
    
    public void Child.setSex(org.lifeforachild.domain.SexType sex) {    
        this.sex = sex;        
    }    
    
    public org.lifeforachild.domain.SurvivalStatusType Child.getSurvivalStatus() {    
        return this.survivalStatus;        
    }    
    
    public void Child.setSurvivalStatus(org.lifeforachild.domain.SurvivalStatusType survivalStatus) {    
        this.survivalStatus = survivalStatus;        
    }    
    
    public java.util.Date Child.getDateOfDeath() {    
        return this.dateOfDeath;        
    }    
    
    public void Child.setDateOfDeath(java.util.Date dateOfDeath) {    
        this.dateOfDeath = dateOfDeath;        
    }    
    
    public org.lifeforachild.domain.CauseOfDeathType Child.getCauseOfDeath() {    
        return this.causeOfDeath;        
    }    
    
    public void Child.setCauseOfDeath(org.lifeforachild.domain.CauseOfDeathType causeOfDeath) {    
        this.causeOfDeath = causeOfDeath;        
    }    
    
    public java.lang.String Child.getCauseOfDeathOther() {    
        return this.causeOfDeathOther;        
    }    
    
    public void Child.setCauseOfDeathOther(java.lang.String causeOfDeathOther) {    
        this.causeOfDeathOther = causeOfDeathOther;        
    }    
    
    public java.util.Date Child.getDateOfRegistration() {    
        return this.dateOfRegistration;        
    }    
    
    public void Child.setDateOfRegistration(java.util.Date dateOfRegistration) {    
        this.dateOfRegistration = dateOfRegistration;        
    }    
    
    public java.util.Date Child.getDateOfBirth() {    
        return this.dateOfBirth;        
    }    
    
    public void Child.setDateOfBirth(java.util.Date dateOfBirth) {    
        this.dateOfBirth = dateOfBirth;        
    }    
    
    public java.util.Date Child.getDiabetesDiagnosed() {    
        return this.diabetesDiagnosed;        
    }    
    
    public void Child.setDiabetesDiagnosed(java.util.Date diabetesDiagnosed) {    
        this.diabetesDiagnosed = diabetesDiagnosed;        
    }    
    
    public java.util.Date Child.getInsulinSince() {    
        return this.insulinSince;        
    }    
    
    public void Child.setInsulinSince(java.util.Date insulinSince) {    
        this.insulinSince = insulinSince;        
    }    
    
    public org.lifeforachild.domain.DiabetesType Child.getDiabetesType() {    
        return this.diabetesType;        
    }    
    
    public void Child.setDiabetesType(org.lifeforachild.domain.DiabetesType diabetesType) {    
        this.diabetesType = diabetesType;        
    }    
    
    public java.lang.String Child.getDiabetesTypeOther() {    
        return this.diabetesTypeOther;        
    }    
    
    public void Child.setDiabetesTypeOther(java.lang.String diabetesTypeOther) {    
        this.diabetesTypeOther = diabetesTypeOther;        
    }    
    
    public java.util.Date Child.getCreatedOn() {    
        return this.createdOn;        
    }    
    
    public void Child.setCreatedOn(java.util.Date createdOn) {    
        this.createdOn = createdOn;        
    }    
    
    public java.util.Date Child.getUpdatedOn() {    
        return this.updatedOn;        
    }    
    
    public void Child.setUpdatedOn(java.util.Date updatedOn) {    
        this.updatedOn = updatedOn;        
    }    
    
    public org.lifeforachild.domain.DistanceType Child.getDistanceLivesFromCentre() {    
        return this.distanceLivesFromCentre;        
    }    
    
    public void Child.setDistanceLivesFromCentre(org.lifeforachild.domain.DistanceType distanceLivesFromCentre) {    
        this.distanceLivesFromCentre = distanceLivesFromCentre;        
    }    
    
    public java.util.Set<org.lifeforachild.domain.ClinicalRecord> Child.getClinicalRecords() {    
        return this.clinicalRecords;        
    }    
    
    public void Child.setClinicalRecords(java.util.Set<org.lifeforachild.domain.ClinicalRecord> clinicalRecords) {    
        this.clinicalRecords = clinicalRecords;        
    }    
    
}
