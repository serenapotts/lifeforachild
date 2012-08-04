package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

/**
 * Represents the type of diabetes the child has
 * @author hburgh
 */
public enum DiabetesType {
	TYPE1("DiabetesType.Type1"),
	TYPE2("DiabetesType.Type2"),
	OTHER("DiabetesType.Other");
	
	DiabetesType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }

    public String toString()
    {
    	return getLabel();
    }
    
    /**
     * Custom Expression that formats a DiabetesType enum in a report to display the label based
     * on the code.
     */
	 public static CustomExpression getCustomExpression() {
        return new CustomExpression() {
                public Object evaluate(Map fields, Map variables, Map parameters) {
                	DiabetesType type = (DiabetesType)fields.get("diabetesType"); 
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
