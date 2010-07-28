package org.lifeforachild.domain;

import java.util.Map;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum SurvivalStatusType {
	ALIVE("Alive"),
	DEAD("Dead"),
	UNKNOWN("Unknown");
	
	SurvivalStatusType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
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
