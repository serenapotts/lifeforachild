package org.lifeforachild.domain;

public enum StatusType {
	NONE("StatusType.None"),
	UPDATED("StatusType.Updated"),
	NOT_UPDATED("StatusType.NotUpdated");
	
	StatusType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
    }    
}
