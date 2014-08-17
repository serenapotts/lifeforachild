package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum MicroalbuminuriaUnitsType {
	MICROALBUMIN_MG_PER_L("MicroalbuminuriaUnitsType.mgL"),
	MICROALBUMIN_G_PER_DL("MicroalbuminuriaUnitsType.gDL"),
	MICROALBUMIN_MCG_PER_MIN("MicroalbuminuriaUnitsType.mcgMin"), 
	MICROALBUMIN_MG_PER_24HR("MicroalbuminuriaUnitsType.mg24hr"), 
	ALBUMIN_CREATININE_RATIO_MG_ALB_PER_GM_CREAT("MicroalbuminuriaUnitsType.albGm"), 
	ALBUMIN_CREATININE_RATIO_MG_ALB_PER_MMOL_CREAT("MicroalbuminuriaUnitsType.albMmol");

	MicroalbuminuriaUnitsType(String s) { label = s; }
    
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
	            	MicroalbuminuriaUnitsType type = (MicroalbuminuriaUnitsType)fields.get("microalbuminuriaUnitOfMeasure");   
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
