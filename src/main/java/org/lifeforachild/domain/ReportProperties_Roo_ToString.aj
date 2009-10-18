package org.lifeforachild.domain;

privileged aspect ReportProperties_Roo_ToString {
    
    public java.lang.String ReportProperties.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("_id: ").append(get_id()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("query: ").append(getQuery()).append(", ");        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("displayFields: ").append(getDisplayFields()).append(", ");        
        sb.append("reportType: ").append(getReportType());        
        return sb.toString();        
    }    
    
}
