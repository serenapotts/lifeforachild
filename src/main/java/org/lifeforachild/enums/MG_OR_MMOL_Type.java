package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum MG_OR_MMOL_Type {
	MG_PER_DL("MG_OR_MMOL_Type.mgDL"),
	MMOL_PER_L("MG_OR_MMOL_Type.mmolL");
	
	MG_OR_MMOL_Type(String s) { label = s; }
    
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
	public static CustomExpression getCustomExpression(final String prop) {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	MG_OR_MMOL_Type type = (MG_OR_MMOL_Type)fields.get(prop);   
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
