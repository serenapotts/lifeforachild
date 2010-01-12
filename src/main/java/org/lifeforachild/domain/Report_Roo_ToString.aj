package org.lifeforachild.domain;

import java.lang.String;

privileged aspect Report_Roo_ToString {
    
    public String Report.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("EntityManager: ").append(getEntityManager()).append(", ");        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Name: ").append(getName()).append(", ");        
        sb.append("ViewableBy: ").append(getViewableBy()).append(", ");        
        sb.append("Reporttype: ").append(getReporttype()).append(", ");        
        sb.append("Statustype: ").append(getStatustype()).append(", ");        
        sb.append("TimePeriod: ").append(getTimePeriod()).append(", ");        
        sb.append("Timeperiodunit: ").append(getTimeperiodunit()).append(", ");        
        sb.append("FromDate: ").append(getFromDate()).append(", ");        
        sb.append("ToDate: ").append(getToDate()).append(", ");        
        sb.append("Showoptiontype: ").append(getShowoptiontype()).append(", ");        
        sb.append("RecordNumber: ").append(getRecordNumber()).append(", ");        
        sb.append("Age: ").append(getAge()).append(", ");        
        sb.append("Centre: ").append(getCentre()).append(", ");        
        sb.append("Country: ").append(getCountry()).append(", ");        
        sb.append("Childfields: ").append(java.util.Arrays.toString(getChildfields())).append(", ");        
        sb.append("Clinicalrecordfields: ").append(java.util.Arrays.toString(getClinicalrecordfields())).append(", ");        
        sb.append("OrderBy: ").append(getOrderBy()).append(", ");        
        sb.append("ThenOrderBy: ").append(getThenOrderBy());        
        return sb.toString();        
    }    
    
}
