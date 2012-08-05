package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum YesNoType {
	YES("YesNoType.Yes"),
	NO("YesNoType.No");
	
	YesNoType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }
    
    /**
     * Custom Expression that formats a YesNoUnknown Type enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression(final String prop) {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	YesNoType type = (YesNoType)fields.get(prop);
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
