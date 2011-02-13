package org.lifeforachild.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;


public enum WhoAdjustsInsulinType {
	DOCTOR_NURSE("WhoAdjustsInsulinType.DoctorNurse"),
	DOCTOR_NURSE_FAMILY("WhoAdjustsInsulinType.DoctorNurseFamily");
	
	WhoAdjustsInsulinType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    public String toString()
    {
    	return getLabel();
    }
    
}

