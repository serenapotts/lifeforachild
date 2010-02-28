package org.lifeforachild.domain;

import java.util.Map;

import ar.com.fdvs.dj.domain.CustomExpression;

/**
 * Represents the distance from a diabetes centre
 * @author hburgh
 *
 */
public enum DistanceType {
	LESS_THAN_50_KMS("Less than 50 Kms"),
	BETWEEN_50_AND_200_KMS("50 to 200 Kms"),
	OVER_200_KMS("Over 200 Kms");
	
	DistanceType(String s) { label = s; }
	
    String label;
    
    public String getLabel() { return label; }
    
    /**
     * Custom Expression that formats a Distance Type enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	DistanceType distanceType = (DistanceType)fields.get("distance_lives_from_centre");   
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
