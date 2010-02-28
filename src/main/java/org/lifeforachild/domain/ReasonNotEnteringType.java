package org.lifeforachild.domain;

public enum ReasonNotEnteringType {
	DATA_BEING_RESEARCHED("Data being researched"),
	PHYSICIAN_DISCRETION("Physician discretion"),
	SPONSOR_ALLOWED("Sponsor allowed"),
	UNKNOWN("Unknown");
	
	ReasonNotEnteringType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
