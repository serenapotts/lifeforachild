package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum NoMildSevereUnknownType {
	NO("NoMildSevereUnknownType.No"),
	MILD("NoMildSevereUnknownType.Mild"),
	SEVERE("NoMildSevereUnknownType.Severe"),
	UNKNOWN("NoMildSevereUnknownType.Unknown");
	
	NoMildSevereUnknownType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }
}
