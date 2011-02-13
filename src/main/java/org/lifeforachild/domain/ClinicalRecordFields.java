package org.lifeforachild.domain;


public enum ClinicalRecordFields {
    DIABETES_CARE("ClinicalRecordFields.DiabetesCare"), 
    TYPES_INSULIN("ClinicalRecordFields.TypesofInsulin"), 
    CLINICAL_MEASURES("ClinicalRecordFields.ClinicalMeasures"), 
    PEBERTAL_STATUS("ClinicalRecordFields.PubertalStatus"), 
    EYES("ClinicalRecordFields.Eyes"), 
    FEET("ClinicalRecordFields.Feet"), 
    LAB_TESTING("ClinicalRecordFields.LabTesting"), 
    SCHOOL_STATUS("ClinicalRecordFields.SchoolStatus"), 
    EMERGENCIES("ClinicalRecordFields.Emergencies");

    ClinicalRecordFields(String s) {
        label = s;
    }

    String label;

    public String getLabel() {
        return label;
    }
    
    public String getId() {return name();}
}
