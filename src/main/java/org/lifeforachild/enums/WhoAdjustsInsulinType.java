package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;


public enum WhoAdjustsInsulinType {
	DOCTOR_NURSE("WhoAdjustsInsulinType.DoctorNurse"),
	DOCTOR_NURSE_FAMILY("WhoAdjustsInsulinType.DoctorNurseFamily");
	
	WhoAdjustsInsulinType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
    }
    
    public String toString()
    {
    	return getLabel();
    }
    
    /**
     * Custom Expression that formats a YesNoUnknown Type enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	WhoAdjustsInsulinType type = (WhoAdjustsInsulinType)fields.get("adjustInsulinDoseIfNeeded");
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

