package org.lifeforachild.domain;

public enum StatusType {
	NONE(""),
	UPDATED("Updated"),
	NOT_UPDATED("Not Updated");
	
	StatusType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
