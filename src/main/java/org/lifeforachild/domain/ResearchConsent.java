package org.lifeforachild.domain;

public enum ResearchConsent {
	YES("Yes, approval given"), 
	NO("No, approval refused"), 
	NOT_ASKED("Not yet asked");
	
	ResearchConsent(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }
    
    public String toString()
    {
    	return label;
    }    
}
