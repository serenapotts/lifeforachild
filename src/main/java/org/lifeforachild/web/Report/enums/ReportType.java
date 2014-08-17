package org.lifeforachild.web.Report.enums;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

public enum ReportType {
	CHILD("child.baseline.data"),
	INDIVIDUAL_CHILD("individual.child.baseline.data"),
	INDIVIDUAL_CHILD_VISIT("individual.child.single.visit"),
	INDIVIDUAL_CHILD_MULTI_VISIT("inidividual.child.multi.visit"),
	CHILD_RECENT_VISIT("child.recent.visit"),
	CHILD_SEEN_TIME_PERIOD("child.seen.time.period"),
	CHILD_NOT_SEEN_TIME_PERIOD("child.not.seen.time.period")
	;
	//,
	//CLINICAL_RECORD("Visit");
	
	ReportType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { 
    	return AppContext.getMessage(label);
    }	
    
    public String toString()
    {
    	return getLabel();
    }    
}
