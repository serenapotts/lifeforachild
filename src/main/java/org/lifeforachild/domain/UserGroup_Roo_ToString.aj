package org.lifeforachild.domain;

import java.lang.String;

import org.lifeforachild.web.AppContext;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;

privileged aspect UserGroup_Roo_ToString {
    
    public String UserGroup.toString() {  
    	return getGroupName();
    }    
    
}
