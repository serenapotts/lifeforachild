package org.lifeforachild.domain;

import java.util.Date;
import java.util.Set;

import org.lifeforachild.enums.BloodGlucoseUnitsType;
import org.lifeforachild.enums.CauseOfDeathType;
import org.lifeforachild.enums.DiabetesType;
import org.lifeforachild.enums.DistanceType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.KnownUnkownType;
import org.lifeforachild.enums.NoMildSevereUnknownType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.SurvivalStatusType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.lifeforachild.enums.YesUnknownType;
import org.lifeforachild.security.SimpleStringCipher;

privileged aspect Child_Roo_JavaBean {
    
    public Long Child.getId() {    
        return this.id;        
    }    
    
    public void Child.setId(Long id) {    
        this.id = id;        
    }    
    
    public String Child.getIndividualId() {    
        return this.individualId;        
    }    
    
    public void Child.setIndividualId(String individualId) {    
        this.individualId = individualId;        
    }    
    
    public String Child.getInitials() {  
    	try
    	{
    		return SimpleStringCipher.decrypt(this.initials);   
    	} catch (Exception e) {
    		return this.initials;
    	}          
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
   		this.name =  name;   

    }    
    
    public String Child.getLastName() { 
    	try
    	{    	
    		return SimpleStringCipher.decrypt(this.lastName);
    	} catch (Exception e) {
    		return this.lastName;
    	}    	
    }    
    
    public void Child.setLastName(String lastName) {  	
    	this.lastName = lastName;     
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
    
    public String Child.getLocalMedicalNumber() {    
        return this.localMedicalNumber;        
    }    
    
    public void Child.setLocalMedicalNumber(String localMedicalNumber) {    
        this.localMedicalNumber = localMedicalNumber;        
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
   
    public boolean Child.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void Child.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
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

    public KnownUnkownType Child.getBloodGlucoseAtDiagnosis() {
 		return this.bloodGlucoseAtDiagnosis;
 	}

 	public void Child.setBloodGlucoseAtDiagnosis(KnownUnkownType bloodGlucoseAtDiagnosis) {
 		this.bloodGlucoseAtDiagnosis = bloodGlucoseAtDiagnosis;
 	}

 	public Float Child.getBloodGlucoseValue() {
 		return bloodGlucoseValue;
 	}

 	public void Child.setBloodGlucoseValue(Float bloodGlucoseValue) {
 		this.bloodGlucoseValue = bloodGlucoseValue;
 	}

 	public BloodGlucoseUnitsType Child.getBloodGlucoseUnits() {
 		return bloodGlucoseUnits;
 	}

 	public void Child.setBloodGlucoseUnits(BloodGlucoseUnitsType bloodGlucoseUnits) {
 		this.bloodGlucoseUnits = bloodGlucoseUnits;
 	}

 	public YesNoUnkownType Child.getHbA1cAtDiagnosis() {
 		return hbA1cAtDiagnosis;
 	}

 	public void Child.setHbA1cAtDiagnosis(YesNoUnkownType hbA1cAtDiagnosis) {
 		this.hbA1cAtDiagnosis = hbA1cAtDiagnosis;
 	}
 	
 	public Float Child.getHbA1cPercentage() {
 		return hbA1cPercentage;
 	}

 	public void Child.setHbA1cPercentage(Float hbA1cPercentage) {
 		this.hbA1cPercentage = hbA1cPercentage;
 	} 	

 	public HbA1cMethodType Child.getHbA1cMethod() {
 		return hbA1cMethod;
 	}

 	public void Child.setHbA1cMethod(HbA1cMethodType hbA1cMethod) {
 		this.hbA1cMethod = hbA1cMethod;
 	}
 	
 	public String Child.getHbA1cMethodOther() {
 		return hbA1cMethodOther;
 	}

 	public void Child.setHbA1cMethodOther(String hbA1cMethodOther) {
 		this.hbA1cMethodOther = hbA1cMethodOther;
 	} 	

 	public NoMildSevereUnknownType Child.getKetoacidosisAtDiagnosis() {
 		return ketoacidosisAtDiagnosis;
 	}

 	public void Child.setKetoacidosisAtDiagnosis(
 			NoMildSevereUnknownType ketoacidosisAtDiagnosis) {
 		this.ketoacidosisAtDiagnosis = ketoacidosisAtDiagnosis;
 	}

 	public YesNoUnkownType Child.getPolyuriaAtDiagnosis() {
 		return polyuriaAtDiagnosis;
 	}

 	public void Child.setPolyuriaAtDiagnosis(YesNoUnkownType polyuriaAtDiagnosis) {
 		this.polyuriaAtDiagnosis = polyuriaAtDiagnosis;
 	}

 	public YesNoUnkownType Child.getThirstAtDiagnosis() {
 		return thirstAtDiagnosis;
 	}

 	public void Child.setThirstAtDiagnosis(YesNoUnkownType thirstAtDiagnosis) {
 		this.thirstAtDiagnosis = thirstAtDiagnosis;
 	}

 	public YesNoUnkownType Child.getWeightLossAtDiagnosis() {
 		return weightLossAtDiagnosis;
 	}

 	public void Child.setWeightLossAtDiagnosis(YesNoUnkownType weightLossAtDiagnosis) {
 		this.weightLossAtDiagnosis = weightLossAtDiagnosis;
 	}

 	public YesUnknownType Child.getWeightAtDiagnosis() {
 		return weightAtDiagnosis;
 	}

 	public void Child.setWeightAtDiagnosis(YesUnknownType weightAtDiagnosis) {
 		this.weightAtDiagnosis = weightAtDiagnosis;
 	}

 	public Float Child.getWeightAtDiagnosisValue() {
 		return weightAtDiagnosisValue;
 	}

 	public void Child.setWeightAtDiagnosisValue(Float weightAtDiagnosisValue) {
 		this.weightAtDiagnosisValue = weightAtDiagnosisValue;
 	}

 	public YesUnknownType Child.getHeightAtDiagnosis() {
 		return heightAtDiagnosis;
 	}

 	public void Child.setHeightAtDiagnosis(YesUnknownType heightAtDiagnosis) {
 		this.heightAtDiagnosis = heightAtDiagnosis;
 	}

 	public Float Child.getHeightAtDiagnosisValue() {
 		return heightAtDiagnosisValue;
 	}

 	public void Child.setHeightAtDiagnosisValue(Float heightAtDiagnosisValue) {
 		this.heightAtDiagnosisValue = heightAtDiagnosisValue;
 	}

 	public YesNoUnkownType Child.getTypeOneInFamily() {
 		return typeOneInFamily;
 	}

 	public void Child.setTypeOneInFamily(YesNoUnkownType typeOneInFamily) {
 		this.typeOneInFamily = typeOneInFamily;
 	}

 	public String Child.getTypeOneRelativesDetails() {
 		return typeOneRelativesDetails;
 	}

 	public void Child.setTypeOneRelativesDetails(String typeOneRelativesDetails) {
 		this.typeOneRelativesDetails = typeOneRelativesDetails;
 	}

 	public YesNoUnkownType Child.getTypeTwoInFamily() {
 		return typeTwoInFamily;
 	}

 	public void Child.setTypeTwoInFamily(YesNoUnkownType typeTwoInFamily) {
 		this.typeTwoInFamily = typeTwoInFamily;
 	}

 	public String Child.getTypeTwoRelativesDetails() {
 		return typeTwoRelativesDetails;
 	}

 	public void Child.setTypeTwoRelativesDetails(String typeTwoRelativesDetails) {
 		this.typeTwoRelativesDetails = typeTwoRelativesDetails;
 	}

 	public YesNoUnkownType Child.getMalnutrition() {
 		return malnutrition;
 	}

 	public void Child.setMalnutrition(YesNoUnkownType malnutrition) {
 		this.malnutrition = malnutrition;
 	}

 	public String Child.getOtherSyndromeAdditionalComment() {
 		return otherSyndromeAdditionalComment;
 	}

 	public void Child.setOtherSyndromeAdditionalComment(
 			String otherSyndromeAdditionalComment) {
 		this.otherSyndromeAdditionalComment = otherSyndromeAdditionalComment;
 	}
}
