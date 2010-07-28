package org.lifeforachild.domain;

import java.util.Map;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum CauseOfDeathType {
	KETOACIDOSIS("Ketoacidosis"),
	HYPOGLYCAEMIA("Hypoglcaemia"),
	OTHER_DIABETES_RELATED_CONDITION("Other diabetes related condition"),
	UNRELATED_TO_DIABETES("Unrelated to diabetes"),
	INFECTION("Infection"),
	UNKNOWN("Unknown"),
	COMBINATION_OF_CAUSES("Combination of causes");

	CauseOfDeathType(String s) { label = s; }
    
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
	            	CauseOfDeathType cause = (CauseOfDeathType)fields.get("cause_of_death"); 
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

