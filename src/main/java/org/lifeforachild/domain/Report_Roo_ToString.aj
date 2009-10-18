package org.lifeforachild.domain;

privileged aspect Report_Roo_ToString {
    
    public java.lang.String Report.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("name: ").append(getName()).append(", ");        
        sb.append("reporttype: ").append(getReporttype()).append(", ");        
        sb.append("statustype: ").append(getStatustype()).append(", ");        
        sb.append("timePeriod: ").append(getTimePeriod()).append(", ");        
        sb.append("timeperiodunit: ").append(getTimeperiodunit()).append(", ");        
        sb.append("fromDate: ").append(getFromDate()).append(", ");        
        sb.append("toDate: ").append(getToDate()).append(", ");        
        sb.append("centre: ").append(getCentre()).append(", ");        
        sb.append("country: ").append(getCountry()).append(", ");        
        sb.append("childfields: ").append(java.util.Arrays.toString(getChildfields())).append(", ");        
        sb.append("clinicalrecordfields: ").append(java.util.Arrays.toString(getClinicalrecordfields()));        
        return sb.toString();        
    }    
    
}
