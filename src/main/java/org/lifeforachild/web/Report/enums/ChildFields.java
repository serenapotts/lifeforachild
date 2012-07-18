package org.lifeforachild.web.Report.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum ChildFields {	
	DATE_OF_BIRTH("child.dateOfBirth"),	
	INITIALS("child.initials"),
	ETHNIC_GROUP("child.ethnicGroup"),
	SURVIVAL_STATUS("child.survivalStatus"),
	DEATH("child.dateOfDeath"),
	DATE_REGO("child.dateOfReg"),
	DIABETES_DIAGNOSED("child.diabetesDiagnosed"),
	INSULIN_SINCE("child.insulinStarted"),
	AGE_AT_DIAGNOSIS("child.ageAtDiagnosis"),
	SEX("child.sex"),
	DIABETES_TYPE("child.diabetesType"),
	FIRST_NAME("child.firstName"),
	LAST_NAME("child.lastName"),
	COUNTRY("child.country"),
	CENTRE("child.centre"),
	ALL("ChildFields.All");
	
	ChildFields(String s) { label = s;  }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }	
    
    public String toString()
    {
    	return getLabel();
    }    
    
    public String getId() {return name();}
}
