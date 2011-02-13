package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum NotAttendingSchoolReasonType {
	TOO_YOUNG_FOR_SCHOOL("NotAttendingSchoolReasonType.tooYoung"), 
	GRADUATED("NotAttendingSchoolReasonType.Graduated"), 
	NOT_ATTENDING_DUE_TO_DIABETES("NotAttendingSchoolReasonType.diabetes"), 
	NOT_ATTENDING_DUE_TO_FINANCIAL_REASONS("NotAttendingSchoolReasonType.financial"), 
	NOT_ATTENDING_FOR_OTHER("NotAttendingSchoolReasonType.other");
	
	NotAttendingSchoolReasonType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }    
}
