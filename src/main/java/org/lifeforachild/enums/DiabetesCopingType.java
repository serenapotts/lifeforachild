package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum DiabetesCopingType {
	WELL("DiabetesCopingType.Well"), 
	SOME_PROBLEMS("DiabetesCopingType.Problems"), 
	POORLY("DiabetesCopingType.Poorly");
	
	DiabetesCopingType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }    
}
