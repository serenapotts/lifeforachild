package org.lifeforachild.domain;

import java.lang.String;

privileged aspect HeightForAgeLMS_Roo_ToString {
    
    public String HeightForAgeLMS.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Sex: ").append(getSex()).append(", ");        
        sb.append("AgeMonthsOld: ").append(getAgeMonthsOld()).append(", ");        
        sb.append("L: ").append(getL()).append(", ");        
        sb.append("M: ").append(getM()).append(", ");        
        sb.append("S: ").append(getS());        
        return sb.toString();        
    }    
    
}
