package org.lifeforachild.web.report.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;


public enum ClinicalRecordFields {
    ALL("ClinicalRecordFields.All"),
    GENERAL("ClinicalRecordFields.General"),
	DIABETES_CARE("ClinicalRecordFields.DiabetesCare"),
	CLINICAL_MEASURES("ClinicalRecordFields.ClinicalMeasures"),
	EYESANDFEET("ClinicalRecordFields.EyesAndFeet"),     
    LAB_TESTING("ClinicalRecordFields.LabTesting"), 
    SCHOOLING("ClinicalRecordFields.SchoolStatus"), 
    EMERGENCIES("ClinicalRecordFields.Emergencies");

    ClinicalRecordFields(String s) {
        label = s;
    }

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
