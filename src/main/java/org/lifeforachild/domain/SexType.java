package org.lifeforachild.domain;

import java.util.Map;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum SexType {
	MALE("Male"),
	FEMALE("Female");
	
	SexType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }

    /**
     * Custom Expression that formats a SexType enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	SexType sex = (SexType)fields.get("sex");
	            	return sex.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}

}
