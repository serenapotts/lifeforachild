package org.lifeforachild.domain;

public enum DiabetesCopingType {
	WELL("Well"), 
	SOME_PROBLEMS("Some problems"), 
	POORLY("Poorly");
	
	DiabetesCopingType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
