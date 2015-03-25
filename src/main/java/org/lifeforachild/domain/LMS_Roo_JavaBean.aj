package org.lifeforachild.domain;

import java.lang.Float;

import org.lifeforachild.enums.SexType;

privileged aspect LMS_Roo_JavaBean {
    
    public Long LMS.getId() {    
        return this.id;        
    }    
    
    public void LMS.setId(Long id) {    
        this.id = id;        
    }    
    
    public SexType LMS.getSex() {    
        return this.sex;        
    }    
    
    public void LMS.setSex(SexType sex) {    
        this.sex = sex;        
    }    
    
    public Float LMS.getAgeMonthsOld() {    
        return this.ageMonthsOld;        
    }    
    
    public void LMS.setAgeMonthsOld(Float ageMonthsOld) {    
        this.ageMonthsOld = ageMonthsOld;        
    }    
    
    public Float LMS.getL() {    
        return this.l;        
    }    
    
    public void LMS.setL(Float l) {    
        this.l = l;        
    }    
    
    public Float LMS.getM() {    
        return this.m;        
    }    
    
    public void LMS.setM(Float m) {    
        this.m = m;        
    }    
    
    public Float LMS.getS() {    
        return this.s;        
    }    
    
    public void LMS.setS(Float s) {    
        this.s = s;        
    }    
    
}
