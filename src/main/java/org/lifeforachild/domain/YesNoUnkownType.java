package org.lifeforachild.domain;

public enum YesNoUnkownType {
	YES("Yes"),
	NO("No"),
	UNKNOWN("Unknown");
	
	YesNoUnkownType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
    }
}
