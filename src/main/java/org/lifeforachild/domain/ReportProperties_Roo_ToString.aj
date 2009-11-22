package org.lifeforachild.domain;

import java.lang.String;

privileged aspect ReportProperties_Roo_ToString {
    
    public String ReportProperties.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("_id: ").append(get_id()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Query: ").append(getQuery()).append(", ");        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("DisplayFields: ").append(getDisplayFields()).append(", ");        
        sb.append("ReportType: ").append(getReportType());        
        return sb.toString();        
    }    
    
}
