package org.lifeforachild.domain;

privileged aspect Report_Roo_JavaBean {
    
    public org.lifeforachild.domain.ReportType Report.getReporttype() {    
        return this.reporttype;        
    }    
    
    public void Report.setReporttype(org.lifeforachild.domain.ReportType reporttype) {    
        this.reporttype = reporttype;        
    }    
    
}
