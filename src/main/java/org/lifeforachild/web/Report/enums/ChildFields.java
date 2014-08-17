package org.lifeforachild.web.Report.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum ChildFields {	
	DATE_OF_BIRTH("child.dateOfBirth"),	
	INITIALS("child.initials"),
	ETHNIC_GROUP("child.ethnicGroup"),
	SURVIVAL_STATUS("child.survivalStatus"),
	DEATH("child.dateOfDeath"),
	DATE_REGO("child.dateOfReg"),
	DIABETES_DIAGNOSED("child.diabetesDiagnosed"),
	INSULIN_SINCE("child.insulinStarted"),
	AGE_AT_DIAGNOSIS("child.ageAtDiagnosis"),
	SEX("child.sex"),
	DIABETES_TYPE("child.diabetesType"),
	FIRST_NAME("child.firstName"),
	LAST_NAME("child.lastName"),
	COUNTRY("child.country"),
	CENTRE("child.centre"),
	LOCAL_MED_NO("child.localMedicalNumber"),
	INDIVIDUAL_ID("child.individualId"),
	DISTANCE_FROM_CENTRE("child.distanceFromCentre"),
	BLOOD_GLUCOSE_AT_DIAGNOSIS("child.bloodGlucoseAtDiagnosis"),
	HBA1C_AT_DIAGNOSIS("child.hbA1cAtDiagnosis"),
	KETOACIDOSIS_AT_DIAGNOSIS("child.ketoacidosisAtDiagnosis"),
	POLYURIA_AT_DIAGNOSIS("child.polyuriaAtDiagnosis"),
	THIRST_AT_DIAGNOSIS("child.thirstAtDiagnosis"),
	WEIGHT_LOSS_AT_DIAGNOSIS("child.weightLossAtDiagnosis"),
	WEIGHT_AT_DIAGNOSIS("child.weightAtDiagnosis"),
	HEIGHT_AT_DIAGNOSIS("child.heightAtDiagnosis"),
	TYPE_1_IN_FAMILY("child.typeOneInFamily"),
	TYPE_2_IN_FAMILY("child.typeTwoInFamily"),
	MALNUTRITION("child.malnutrition"),
	ADDITIONAL_COMMENTS("child.otherSyndromeAdditionalComment"),
	ALL("ChildFields.All");
	
	ChildFields(String s) { label = s;  }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
    }	
    
    public String toString()
    {
    	return getLabel();
    }    
    
    public String getId() {return name();}
}
