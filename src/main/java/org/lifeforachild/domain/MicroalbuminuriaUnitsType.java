package org.lifeforachild.domain;

public enum MicroalbuminuriaUnitsType {
	MICROALBUMIN_MG_PER_L("Microalbumin mg/L"),
	MICROALBUMIN_G_PER_DL("Microalbumin g/dL "),
	MICROALBUMIN_MCG_PER_MIN("Microalbumin mcg/min"), 
	MICROALBUMIN_MG_PER_24HR("Microalbumin mg/24hr"), 
	ALBUMIN_CREATININE_RATIO_MG_ALB_PER_GM_CREAT("Albumin/creatinine ratio mg alb/gm creat"), 
	ALBUMIN_CREATININE_RATIO_MG_ALB_PER_MMOL_CREAT("Albumin/creatinine ratio mg alb/mmol creat");

	MicroalbuminuriaUnitsType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
}
