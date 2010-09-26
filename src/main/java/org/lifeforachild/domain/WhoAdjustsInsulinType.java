package org.lifeforachild.domain;


public enum WhoAdjustsInsulinType {
	DOCTOR_NURSE("Doctor/Nurse"),
	DOCTOR_NURSE_FAMILY("Doctor/Nurse and patient/family");
	
	WhoAdjustsInsulinType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
    }
    
}

