package org.lifeforachild.domain;

public enum YesNoLaterType {
	YES("Yes"),
	NO("No"),
	TO_BE_DONE_LATER("To be entered later");
	
	YesNoLaterType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
    }
}
