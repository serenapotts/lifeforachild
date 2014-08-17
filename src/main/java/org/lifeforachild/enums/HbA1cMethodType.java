package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum HbA1cMethodType {
	DCA2000("HbA1cMethodType.DCA"), 
	HPLC("HbA1cMethodType.HPLC"), 
	A1C_NOW("HbA1cMethodType.A1cNow"), 
	AFINION("HbA1cMethodType.Afinion"), 
	CLOVER("HbA1cMethodType.Clover"),
	OTHER("HbA1cMethodType.Other");
	
	HbA1cMethodType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
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
	            	HbA1cMethodType type = (HbA1cMethodType)fields.get("hbA1cMethod");   
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
