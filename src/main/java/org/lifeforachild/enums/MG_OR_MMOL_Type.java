package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum MG_OR_MMOL_Type {
	MG_PER_DL("MG_OR_MMOL_Type.mgDL"),
	MMOL_PER_L("MG_OR_MMOL_Type.mmolL");
	
	MG_OR_MMOL_Type(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }    
}
