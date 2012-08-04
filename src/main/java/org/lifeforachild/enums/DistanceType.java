package org.lifeforachild.enums;

import java.util.Map;

import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.CustomExpression;

/**
 * Represents the distance from a diabetes centre
 * @author hburgh
 *
 */
public enum DistanceType {
	LESS_THAN_50_KMS("DistanceType.lessThan50"),
	BETWEEN_50_AND_200_KMS("DistanceType.50to200"),
	OVER_200_KMS("DistanceType.over200");
	
	DistanceType(String s) { label = s; }
	
    String label;
    
    public String getLabel() { 
    	return AppContext.getApplicationContext().getMessage(label, null, LocaleContextHolder.getLocale());
    }
    
    /**
     * Custom Expression that formats a Distance Type enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	DistanceType distanceType = (DistanceType)fields.get("distanceLivesFromCentre");   
	            	if (distanceType == null)
	            		return "";
	                return distanceType.getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}
}
