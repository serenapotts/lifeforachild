package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum CreatineUnitsType {
	MG_PER_DL("CreatineUnitsType.mgDL"),
	MMOL_PER_L("CreatineUnitsType.mmolL"),
	MICROMOL_PER_L("CreatineUnitsType.micromolL");
	
	CreatineUnitsType(String s) { label = s; }
    
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
	            	CreatineUnitsType type = (CreatineUnitsType)fields.get("creatinineUnits");   
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
