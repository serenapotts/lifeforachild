package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum HbA1cMethodType {
	DCA2000("HbA1cMethodType.DCA"), 
	HPLC("HbA1cMethodType.HPLC"), 
	A1C_NOW("HbA1cMethodType.A1cNow"), 
	AFINION("HbA1cMethodType.Afinion"), 
	CLOVER("HbA1cMethodType.Clover"),
	OTHER("HbA1cMethodType.Other");
	
	HbA1cMethodType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }    
}
