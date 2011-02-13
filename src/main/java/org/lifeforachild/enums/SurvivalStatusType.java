package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum SurvivalStatusType {
	ALIVE("SurvivalStatusType.Alive"),
	DEAD("SurvivalStatusType.Dead"),
	UNKNOWN("SurvivalStatusType.Unknown");
	
	SurvivalStatusType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }
    
    /**
     * Custom Expression that formats a Survival Status enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	SurvivalStatusType survivalStatus = (SurvivalStatusType)fields.get("survival_status");   
	            	if (survivalStatus == null)
	            		return "";
	                return survivalStatus.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}
}
