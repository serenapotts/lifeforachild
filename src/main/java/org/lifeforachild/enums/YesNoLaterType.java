package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum YesNoLaterType {
	YES("YesNoLaterType.Yes"),
	NO("YesNoLaterType.No"),
	TO_BE_DONE_LATER("YesNoLaterType.Later");
	
	YesNoLaterType(String s) { label = s; }
    
    String label;
    
    public String getLabel(){ 
    	return AppContext.getMessage(label);
    }
    
    public String toString()
    {
    	return getLabel();
    }
    
    /**
     * Custom Expression that formats a YesNoLater Type enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression(final String prop) {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	YesNoLaterType type = (YesNoLaterType)fields.get(prop);
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
