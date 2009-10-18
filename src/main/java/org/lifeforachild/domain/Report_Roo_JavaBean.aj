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
    
    public org.lifeforachild.domain.DiabetesCentre Report.getCentre() {    
        return this.centre;        
    }    
    
    public void Report.setCentre(org.lifeforachild.domain.DiabetesCentre centre) {    
        this.centre = centre;        
    }    
    
    public org.lifeforachild.domain.Country Report.getCountry() {    
        return this.country;        
    }    
    
    public void Report.setCountry(org.lifeforachild.domain.Country country) {    
        this.country = country;        
    }    
    
    public org.lifeforachild.domain.ChildFields[] Report.getChildfields() {    
        return this.childfields;        
    }    
    
    public void Report.setChildfields(org.lifeforachild.domain.ChildFields[] childfields) {    
        this.childfields = childfields;        
    }    
    
    public org.lifeforachild.domain.ClinicalRecordFields[] Report.getClinicalrecordfields() {    
        return this.clinicalrecordfields;        
    }    
    
    public void Report.setClinicalrecordfields(org.lifeforachild.domain.ClinicalRecordFields[] clinicalrecordfields) {    
        this.clinicalrecordfields = clinicalrecordfields;        
    }    
    
}
