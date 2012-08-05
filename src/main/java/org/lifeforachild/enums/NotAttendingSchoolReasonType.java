package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

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
    
    /**
     * Custom Expression that formats a Distance Type enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	NotAttendingSchoolReasonType type = (NotAttendingSchoolReasonType)fields.get("notAttendingSchoolWhy");   
	            	if (type == null)
	            		return "";
	                return type.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}  
}
