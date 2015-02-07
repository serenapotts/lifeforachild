package org.lifeforachild.domain;

import java.lang.String;
import java.util.Date;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.User;
import org.lifeforachild.enums.ShowOptionType;
import org.lifeforachild.web.report.enums.ChildFields;
import org.lifeforachild.web.report.enums.ClinicalRecordFields;
import org.lifeforachild.web.report.enums.ReportType;
import org.lifeforachild.web.report.enums.StatusType;
import org.lifeforachild.web.report.enums.TimePeriodUnit;

privileged aspect Report_Roo_JavaBean {
    
    public String Report.getName() {    
        return this.name;        
    }    
    
    public void Report.setName(String name) {    
        this.name = name;        
    }    
    
    public User Report.getViewableBy() {    
        return this.viewableBy;        
    }    
    
    public void Report.setViewableBy(User viewableBy) {    
        this.viewableBy = viewableBy;        
    }    
    
    public ReportType Report.getReporttype() {    
        return this.reporttype;        
    }    
    
    public void Report.setReporttype(ReportType reporttype) {    
        this.reporttype = reporttype;        
    }    
    
    public StatusType Report.getStatustype() {    
        return this.statustype;        
    }    
    
    public void Report.setStatustype(StatusType statustype) {    
        this.statustype = statustype;        
    }    
    
    public String Report.getTimePeriod() {    
        return this.timePeriod;        
    }    
    
    public void Report.setTimePeriod(String timePeriod) {    
        this.timePeriod = timePeriod;        
    }    
    
    public TimePeriodUnit Report.getTimeperiodunit() {    
        return this.timeperiodunit;        
    }    
    
    public void Report.setTimeperiodunit(TimePeriodUnit timeperiodunit) {    
        this.timeperiodunit = timeperiodunit;        
    }    
    
    public Date Report.getFromDate() {    
        return this.fromDate;        
    }    
    
    public void Report.setFromDate(Date fromDate) {    
        this.fromDate = fromDate;        
    }    
    
    public Date Report.getToDate() {    
        return this.toDate;        
    }    
    
    public void Report.setToDate(Date toDate) {    
        this.toDate = toDate;        
    }    
    
    public ShowOptionType Report.getShowoptiontype() {    
        return this.showoptiontype;        
    }    
    
    public void Report.setShowoptiontype(ShowOptionType showoptiontype) {    
        this.showoptiontype = showoptiontype;        
    }    
    
    public String Report.getRecordNumber() {    
        return this.recordNumber;        
    }    
    
    public void Report.setRecordNumber(String recordNumber) {    
        this.recordNumber = recordNumber;        
    }    
    
    public String Report.getAge() {    
        return this.age;        
    }    
    
    public void Report.setAge(String age) {    
        this.age = age;        
    }    
    
    public DiabetesCentre Report.getCentre() {    
        return this.centre;        
    }    
    
    public void Report.setCentre(DiabetesCentre centre) {    
        this.centre = centre;        
    }    
    
    public Country Report.getCountry() {    
        return this.country;        
    }    
    
    public void Report.setCountry(Country country) {    
        this.country = country;        
    }    
    
    public ChildFields[] Report.getChildfields() {    
        return this.childfields;        
    }    
    
    public void Report.setChildfields(ChildFields[] childfields) {    
        this.childfields = childfields;        
    }    
    
    public ClinicalRecordFields[] Report.getClinicalrecordfields() {    
        return this.clinicalrecordfields;        
    }    
    
    public void Report.setClinicalrecordfields(ClinicalRecordFields[] clinicalrecordfields) {    
        this.clinicalrecordfields = clinicalrecordfields;        
    }    
    
    public String Report.getOrderBy() {    
        return this.orderBy;        
    }    
    
    public void Report.setOrderBy(String orderBy) {    
        this.orderBy = orderBy;        
    }    
    
    public String Report.getThenOrderBy() {    
        return this.thenOrderBy;        
    }    
    
    public void Report.setThenOrderBy(String thenOrderBy) {    
        this.thenOrderBy = thenOrderBy;        
    }    
    
    public boolean Report.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void Report.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }    
    
    public String Report.getFirstName() {    
        return this.firstName;        
    }    
    
    public void Report.setFirstName(String firstName) {    
        this.firstName = firstName;        
    } 
    
    public String Report.getLastName() {    
        return this.lastName;        
    }    
    
    public void Report.setLastName(String lastName) {    
        this.lastName = lastName;        
    }
    
    public String Report.getLocalMedicalNumber() {    
        return this.localMedicalNumber;        
    }    
    
    public void Report.setLocalMedicalNumber(String localMedicalNumber) {    
        this.localMedicalNumber = localMedicalNumber;        
    }    
}
