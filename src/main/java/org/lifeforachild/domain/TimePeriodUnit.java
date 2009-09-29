package org.lifeforachild.domain;

public enum TimePeriodUnit {
	YEARS("Years"),
	MONTHS("Months");
	
	TimePeriodUnit(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
