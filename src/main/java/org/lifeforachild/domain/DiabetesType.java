package org.lifeforachild.domain;

import java.util.Map;

import net.sf.jasperreports.engine.fill.JRFillField;

import ar.com.fdvs.dj.domain.CustomExpression;

/**
 * Represents the type of diabetes the child has
 * @author hburgh
 */
public enum DiabetesType {
	TYPE1("Type 1"),
	TYPE2("Type 2"),
	OTHER("Other");
	
	DiabetesType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }

	 public static CustomExpression getCustomExpression() {
        return new CustomExpression() {
                public Object evaluate(Map fields, Map variables, Map parameters) {
                	String type = (String)fields.get("diabetes_type"); 
                	if (type == null)
                		return "";
                    return values()[Integer.valueOf(type)].getLabel();
                }

                public String getClassName() {
                        return String.class.getName();
                }
        };
	 }
}
