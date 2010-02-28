package org.lifeforachild.domain;

public enum YesNoNAType {
	YES("Yes"),
	NO("No"),
	NOT_APPLICABLE("Not Applicable");
	
	YesNoNAType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
