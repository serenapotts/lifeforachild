package org.lifeforachild.domain;

import java.util.Date;
import java.util.Set;

import org.lifeforachild.security.SimpleStringCipher;

privileged aspect Child_Roo_JavaBean {
    
    public String Child.getIndividualId() {    
        return this.individualId;        
    }    
    
    public void Child.setIndividualId(String individualId) {    
        this.individualId = individualId;        
    }    
    
    public String Child.getInitials() {    
        return this.initials;        
    }    
    
    public void Child.setInitials(String initials) {    
        this.initials = initials;        
    }    
    
    public String Child.getName() {  
    	try
    	{
    		return SimpleStringCipher.decrypt(this.name);   
    	} catch (Exception e) {
    		return this.name;
    	}    	
    }    
    
    public void Child.setName(String name) {    
    	try
    	{
    		this.name =  SimpleStringCipher.encrypt(name);   
    	} catch (Exception e) {
    		this.name = name;
    	}
    }    
    
    public String Child.getLastName() { 
    	try
    	{    	
    		return SimpleStringCipher.decrypt(this.lastName);
    	} catch (Exception e) {
    		return this.name;
    	}    	
    }    
    
    public void Child.setLastName(String lastName) {
    	try
    	{    	
    		this.lastName = SimpleStringCipher.encrypt(lastName);     
		} catch (Exception e) {
			this.lastName = lastName;
		}        
    }    
    
    public Country Child.getCountry() {    
        return this.country;        
    }    
    
    public void Child.setCountry(Country country) {    
        this.country = country;        
    }    
    
    public DiabetesCentre Child.getCentre() {    
        return this.centre;        
    }    
    
    public void Child.setCentre(DiabetesCentre centre) {    
        this.centre = centre;        
    }    
    
    public String Child.getEthnicGroup() {    
        return this.ethnicGroup;        
    }    
    
    public void Child.setEthnicGroup(String ethnicGroup) {    
        this.ethnicGroup = ethnicGroup;        
    }    
    
    public SexType Child.getSex() {    
        return this.sex;        
    }    
    
    public void Child.setSex(SexType sex) {    
        this.sex = sex;        
    }    
    
    public SurvivalStatusType Child.getSurvivalStatus() {    
        return this.survivalStatus;        
    }    
    
    public void Child.setSurvivalStatus(SurvivalStatusType survivalStatus) {    
        this.survivalStatus = survivalStatus;        
    }    
    
    public Date Child.getDateOfDeath() {    
        return this.dateOfDeath;        
    }    
    
    public void Child.setDateOfDeath(Date dateOfDeath) {    
        this.dateOfDeath = dateOfDeath;        
    }    
    
    public CauseOfDeathType Child.getCauseOfDeath() {    
        return this.causeOfDeath;        
    }    
    
    public void Child.setCauseOfDeath(CauseOfDeathType causeOfDeath) {    
        this.causeOfDeath = causeOfDeath;        
    }    
    
    public String Child.getCauseOfDeathOther() {    
        return this.causeOfDeathOther;        
    }    
    
    public void Child.setCauseOfDeathOther(String causeOfDeathOther) {    
        this.causeOfDeathOther = causeOfDeathOther;        
    }    
    
    public Date Child.getDateOfRegistration() {    
        return this.dateOfRegistration;        
    }    
    
    public void Child.setDateOfRegistration(Date dateOfRegistration) {    
        this.dateOfRegistration = dateOfRegistration;        
    }    
    
    public Date Child.getDateOfBirth() {    
        return this.dateOfBirth;        
    }    
    
    public void Child.setDateOfBirth(Date dateOfBirth) {    
        this.dateOfBirth = dateOfBirth;        
    }    
    
    public Date Child.getDiabetesDiagnosed() {    
        return this.diabetesDiagnosed;        
    }    
    
    public void Child.setDiabetesDiagnosed(Date diabetesDiagnosed) {    
        this.diabetesDiagnosed = diabetesDiagnosed;        
    }    
    
    public Date Child.getInsulinSince() {    
        return this.insulinSince;        
    }    
    
    public void Child.setInsulinSince(Date insulinSince) {    
        this.insulinSince = insulinSince;        
    }    
    
    public DiabetesType Child.getDiabetesType() {    
        return this.diabetesType;        
    }    
    
    public void Child.setDiabetesType(DiabetesType diabetesType) {    
        this.diabetesType = diabetesType;        
    }    
    
    public String Child.getDiabetesTypeOther() {    
        return this.diabetesTypeOther;        
    }    
    
    public void Child.setDiabetesTypeOther(String diabetesTypeOther) {    
        this.diabetesTypeOther = diabetesTypeOther;        
    }    
    
    public Date Child.getCreatedOn() {    
        return this.createdOn;        
    }    
    
    public void Child.setCreatedOn(Date createdOn) {    
        this.createdOn = createdOn;        
    }    
    
    public Date Child.getUpdatedOn() {    
        return this.updatedOn;        
    }    
    
    public void Child.setUpdatedOn(Date updatedOn) {    
        this.updatedOn = updatedOn;        
    }    
    
    public DistanceType Child.getDistanceLivesFromCentre() {    
        return this.distanceLivesFromCentre;        
    }    
    
    public void Child.setDistanceLivesFromCentre(DistanceType distanceLivesFromCentre) {    
        this.distanceLivesFromCentre = distanceLivesFromCentre;        
    }    
    
    public Float Child.getAgeAtDiagnosis() {    
        return this.ageAtDiagnosis;        
    }    
    
    public void Child.setAgeAtDiagnosis(Float ageAtDiagnosis) {    
        this.ageAtDiagnosis = ageAtDiagnosis;        
    }    
    
    public Set<ClinicalRecord> Child.getClinicalRecords() {    
        return this.clinicalRecords;        
    }    
    
    public void Child.setClinicalRecords(Set<ClinicalRecord> clinicalRecords) {    
        this.clinicalRecords = clinicalRecords;        
    }    
    
}
