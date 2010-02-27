package org.lifeforachild.domain;

public enum ChildFields {
	DATE_OF_BIRTH("Date of Birth"),	
	INITIALS("Initals"),
	ETHNIC_GROUP("Ethnic Group"),
	SURVIVAL_STATUS("Survial Status"),
	DEATH("Death"),
	DATE_REGO("Date of Registration"),
	DIABETES_DIAGNOSED("Diabetes Diagnosed"),
	INSULIN_SINCE("Insulin Since"),
	AGE_AT_DIAGNOSIS("Calulated Age at Diagnosis"),
	AGE_FIRST_INSULIN("Calculated Age at First Insulin");
	
	ChildFields(String s) { label = s;  }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String getId() {return name();}
}
