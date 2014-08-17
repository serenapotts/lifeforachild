package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum SexType {
	MALE("sexType.male"),
	FEMALE("sexType.female");
	
	SexType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
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
	            	SexType sex = (SexType)fields.get("sex");
	            	return sex.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}

}
