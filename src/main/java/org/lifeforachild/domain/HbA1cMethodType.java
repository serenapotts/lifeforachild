package org.lifeforachild.domain;

public enum HbA1cMethodType {
	DCA2000("DCA-2000"), 
	HPLC("HPLC"), 
	A1C_NOW("A1c Now"), 
	AFINION("Afinion"), 
	OTHER("Other");
	
	HbA1cMethodType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
