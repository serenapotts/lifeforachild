package org.lifeforachild.domain;

import java.lang.Float;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.lifeforachild.domain.SexType;

privileged aspect BMIForAgeLMS_Roo_Finder {
    
    public static Query BMIForAgeLMS.findBMIForAgeLMSsBySexAndAgeMonthsOldEquals(SexType sex, Float ageMonthsOld) {    
        if (sex == null) throw new IllegalArgumentException("The sex argument is required");        
        if (ageMonthsOld == null) throw new IllegalArgumentException("The ageMonthsOld argument is required");        
        EntityManager em = BMIForAgeLMS.entityManager();        
        Query q = em.createQuery("SELECT BMIForAgeLMS FROM BMIForAgeLMS AS bmiforagelms WHERE bmiforagelms.sex = :sex AND bmiforagelms.ageMonthsOld = :ageMonthsOld");        
        q.setParameter("sex", sex);        
        q.setParameter("ageMonthsOld", ageMonthsOld);        
        return q;        
    }    
    
}
