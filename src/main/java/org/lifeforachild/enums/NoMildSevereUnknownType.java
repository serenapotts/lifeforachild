package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum NoMildSevereUnknownType {
	NO("NoMildSevereUnknownType.No"),
	MILD("NoMildSevereUnknownType.Mild"),
	SEVERE("NoMildSevereUnknownType.Severe"),
	UNKNOWN("NoMildSevereUnknownType.Unknown");
	
	NoMildSevereUnknownType(String s) { label = s; }
    
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
	            	NoMildSevereUnknownType type = (NoMildSevereUnknownType)fields.get("ketoacidosisAtDiagnosis");   
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
