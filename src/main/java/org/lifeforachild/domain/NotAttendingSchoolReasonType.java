package org.lifeforachild.domain;

public enum NotAttendingSchoolReasonType {
	TOO_YOUNG_FOR_SCHOOL("Too young for school"), 
	GRADUATED("Graduated"), 
	NOT_ATTENDING_DUE_TO_DIABETES("Not attending due to diabetes"), 
	NOT_ATTENDING_DUE_TO_FINANCIAL_REASONS("Not attending due to financial reasons"), 
	NOT_ATTENDING_FOR_OTHER("Not attending for other reasons");
	
	NotAttendingSchoolReasonType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
