package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum YesNoLaterType {
	YES("YesNoLaterType.Yes"),
	NO("YesNoLaterType.No"),
	TO_BE_DONE_LATER("YesNoLaterType.Later");
	
	YesNoLaterType(String s) { label = s; }
    
    String label;
    
    public String getLabel(){ 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }
}
