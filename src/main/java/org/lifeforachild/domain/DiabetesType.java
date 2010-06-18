package org.lifeforachild.domain;

import java.util.Map;

import ar.com.fdvs.dj.domain.CustomExpression;

/**
 * Represents the type of diabetes the child has
 * @author hburgh
 */
public enum DiabetesType {
	TYPE1("Type 1"),
	TYPE2("Type 2"),
	OTHER("Diabetes Type Other – please specify");
	
	DiabetesType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }

    /**
     * Custom Expression that formats a DiabetesType enum in a report to display the label based
     * on the code.
     */
	 public static CustomExpression getCustomExpression() {
        return new CustomExpression() {
                public Object evaluate(Map fields, Map variables, Map parameters) {
                	DiabetesType type = (DiabetesType)fields.get("diabetes_type"); 
                	if (type == null)
                		return "";
                	return type.getLabel();
                }

                public String getClassName() {
                        return String.class.getName();
                }
        };
	 }
}
