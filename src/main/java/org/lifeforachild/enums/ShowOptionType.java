package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;


public enum ShowOptionType {	
	ALL("ShowOptionType.All"),
	FIRST("ShowOptionType.First"),
	LAST("ShowOptionType.Last");
	
	ShowOptionType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
    }

    public String toString()
    {
    	return getLabel();
    }
}

