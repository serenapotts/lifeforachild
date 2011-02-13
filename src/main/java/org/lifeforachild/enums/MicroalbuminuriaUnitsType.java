package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

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
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }    
    
}
