package org.lifeforachild.domain;

public enum ReportType {
	CHILD("Child"),
	CLINICAL_RECORD("Visit");
	
	ReportType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
