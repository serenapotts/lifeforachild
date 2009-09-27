package org.lifeforachild.domain;

privileged aspect Report_Roo_ToString {
    
    public java.lang.String Report.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("reporttype: ").append(getReporttype());        
        return sb.toString();        
    }    
    
}
