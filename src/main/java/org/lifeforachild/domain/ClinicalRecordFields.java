package org.lifeforachild.domain;


public enum ClinicalRecordFields {
    DIABETES_CARE("Diabetes Care"), 
    TYPES_INSULIN("Types of Insulin"), 
    CLINICAL_MEASURES("Clinical Measures"), 
    PEBERTAL_STATUS("Perbertal Status"), 
    EYES("Eyes"), FEET("Feet"), 
    LAB_TESTING("Lab Testing"), 
    SCHOOL_STATUS("School Status"), 
    EMERGENCIES("Emergencies");

    ClinicalRecordFields(String s) {
        label = s;
    }

    String label;

    public String getLabel() {
        return label;
    }
}
