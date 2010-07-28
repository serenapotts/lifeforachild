package org.lifeforachild.domain;


public enum ShowOptionType {	
	ALL("All"),
	FIRST("First"),
	LAST("Last");
	
	ShowOptionType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }

    public String toString()
    {
    	return label;
    }
}

