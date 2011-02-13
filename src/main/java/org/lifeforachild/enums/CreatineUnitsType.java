package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum CreatineUnitsType {
	MG_PER_DL("CreatineUnitsType.mgDL"),
	MMOL_PER_L("CreatineUnitsType.mmolL"),
	MICROMOL_PER_L("CreatineUnitsType.micromolL");
	
	CreatineUnitsType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }	
    
    public String toString()
    {
    	return getLabel();
    }    
}
