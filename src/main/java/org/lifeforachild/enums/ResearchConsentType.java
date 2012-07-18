package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum ResearchConsentType {
	YES("ResearchConsentType.Yes"), 
	NO("ResearchConsentType.No"), 
	NOT_ASKED("ResearchConsentType.NotAsked");
	
	ResearchConsentType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }    
    
    /**
     * Custom Expression that formats a SexType enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	ResearchConsentType consentType = (ResearchConsentType)fields.get("consentGiven");
	            	return consentType.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}    
}
