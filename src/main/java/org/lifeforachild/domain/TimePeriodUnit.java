package org.lifeforachild.domain;

public enum TimePeriodUnit {
	NONE(""),
	MONTHS("Months"),
	YEARS("Years");		
	
	TimePeriodUnit(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
}
