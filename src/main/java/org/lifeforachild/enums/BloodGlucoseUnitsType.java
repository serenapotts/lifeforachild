package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum BloodGlucoseUnitsType {
	MG_PER_DL("BloodGlucoseUnitsType.mgDL"),
	MMOL_PER_L("BloodGlucoseUnitsType.mmolL");
	
	BloodGlucoseUnitsType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }	
    
    public String toString()
    {
    	return getLabel();
    }    
}
