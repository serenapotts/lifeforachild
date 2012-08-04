package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum CauseOfDeathType {
	KETOACIDOSIS("CauseOfDeathType.Ketoacidosis"),
	HYPOGLYCAEMIA("CauseOfDeathType.Hypoglcaemia"),
	OTHER_DIABETES_RELATED_CONDITION("CauseOfDeathType.Other"),
	UNRELATED_TO_DIABETES("CauseOfDeathType.Unrelated"),
	INFECTION("CauseOfDeathType.Infection"),
	UNKNOWN("CauseOfDeathType.Unknown"),
	COMBINATION_OF_CAUSES("CauseOfDeathType.Combination");

	CauseOfDeathType(String s) { label = s; }
    
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
	            	CauseOfDeathType cause = (CauseOfDeathType)fields.get("causeOfDeath"); 
	            	if (cause == null)
	            		return "";
	            	return cause.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}
}

