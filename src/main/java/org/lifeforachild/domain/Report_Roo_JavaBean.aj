package org.lifeforachild.domain;

privileged aspect Report_Roo_JavaBean {
    
    public java.lang.String Report.getName() {    
        return this.name;        
    }    
    
    public void Report.setName(java.lang.String name) {    
        this.name = name;        
    }    
    
    public org.lifeforachild.domain.ReportType Report.getReporttype() {    
        return this.reporttype;        
    }    
    
    public void Report.setReporttype(org.lifeforachild.domain.ReportType reporttype) {    
        this.reporttype = reporttype;        
    }    
    
    public org.lifeforachild.domain.StatusType Report.getStatustype() {    
        return this.statustype;        
    }    
    
    public void Report.setStatustype(org.lifeforachild.domain.StatusType statustype) {    
        this.statustype = statustype;        
    }    
    
    public java.lang.String Report.getTimePeriod() {    
        return this.timePeriod;        
    }    
    
    public void Report.setTimePeriod(java.lang.String timePeriod) {    
        this.timePeriod = timePeriod;        
    }    
    
    public org.lifeforachild.domain.TimePeriodUnit Report.getTimeperiodunit() {    
        return this.timeperiodunit;        
    }    
    
    public void Report.setTimeperiodunit(org.lifeforachild.domain.TimePeriodUnit timeperiodunit) {    
        this.timeperiodunit = timeperiodunit;        
    }    
    
    public java.util.Date Report.getFromDate() {    
        return this.fromDate;        
    }    
    
    public void Report.setFromDate(java.util.Date fromDate) {    
        this.fromDate = fromDate;        
    }    
    
    public java.util.Date Report.getToDate() {    
        return this.toDate;        
    }    
    
    public void Report.setToDate(java.util.Date toDate) {    
        this.toDate = toDate;        
    }    
    
    public java.lang.String Report.getCentre() {    
        return this.centre;        
    }    
    
    public void Report.setCentre(java.lang.String centre) {    
        this.centre = centre;        
    }    
    
    public java.lang.String Report.getCountry() {    
        return this.country;        
    }    
    
    public void Report.setCountry(java.lang.String country) {    
        this.country = country;        
    }    
    
    public java.lang.String Report.getDisplayFields() {    
        return this.displayFields;        
    }    
    
    public void Report.setDisplayFields(java.lang.String displayFields) {    
        this.displayFields = displayFields;        
    }    
    
}
