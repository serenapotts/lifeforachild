package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum ReasonNotEnteringType {
	DATA_BEING_RESEARCHED("ReasonNotEnteringType.research"),
	PHYSICIAN_DISCRETION("ReasonNotEnteringType.physician"),
	SPONSOR_ALLOWED("ReasonNotEnteringType.sponser"),
	UNKNOWN("ReasonNotEnteringType.unknown");
	
	ReasonNotEnteringType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
    }
    
    public String toString()
    {
    	return getLabel();
    }
}
