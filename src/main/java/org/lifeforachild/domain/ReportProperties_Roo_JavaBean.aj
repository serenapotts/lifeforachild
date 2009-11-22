package org.lifeforachild.domain;

import java.lang.Long;
import java.lang.String;
import org.lifeforachild.domain.ReportType;

privileged aspect ReportProperties_Roo_JavaBean {
    
    public String ReportProperties.getQuery() {    
        return this.query;        
    }    
    
    public void ReportProperties.setQuery(String query) {    
        this.query = query;        
    }    
    
    public Long ReportProperties.getId() {    
        return this.id;        
    }    
    
    public void ReportProperties.setId(Long id) {    
        this.id = id;        
    }    
    
    public String ReportProperties.getDisplayFields() {    
        return this.displayFields;        
    }    
    
    public void ReportProperties.setDisplayFields(String displayFields) {    
        this.displayFields = displayFields;        
    }    
    
    public ReportType ReportProperties.getReportType() {    
        return this.reportType;        
    }    
    
    public void ReportProperties.setReportType(ReportType reportType) {    
        this.reportType = reportType;        
    }    
    
}
