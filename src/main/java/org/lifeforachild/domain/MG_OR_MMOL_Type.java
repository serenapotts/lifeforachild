package org.lifeforachild.domain;

public enum MG_OR_MMOL_Type {
	MG_PER_DL("mg/dL("),
	MMOL_PER_L("mmol/L");
	
	MG_OR_MMOL_Type(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
