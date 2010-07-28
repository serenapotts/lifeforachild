package org.lifeforachild.domain;

public enum CreatineUnitsType {
	MG_PER_DL("mg/dL"),
	MMOL_PER_L("mmol/L"),
	MICROMOL_PER_L("micromol/L");
	
	CreatineUnitsType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }	
    
    public String toString()
    {
    	return label;
    }    
}
