package org.lifeforachild.domain;

public enum YesNoType {
	YES("Yes"),
	NO("No");
	
	YesNoType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
    }
}
