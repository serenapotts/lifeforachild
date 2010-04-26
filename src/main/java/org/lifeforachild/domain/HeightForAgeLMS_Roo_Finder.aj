package org.lifeforachild.domain;

import java.lang.Float;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.lifeforachild.domain.SexType;

privileged aspect HeightForAgeLMS_Roo_Finder {
    
    public static Query HeightForAgeLMS.findHeightForAgeLMSsBySexAndAgeMonthsOldEquals(SexType sex, Float ageMonthsOld) {    
        if (sex == null) throw new IllegalArgumentException("The sex argument is required");        
        if (ageMonthsOld == null) throw new IllegalArgumentException("The ageMonthsOld argument is required");        
        EntityManager em = HeightForAgeLMS.entityManager();        
        Query q = em.createQuery("SELECT HeightForAgeLMS FROM HeightForAgeLMS AS heightforagelms WHERE heightforagelms.sex = :sex AND heightforagelms.ageMonthsOld = :ageMonthsOld");        
        q.setParameter("sex", sex);        
        q.setParameter("ageMonthsOld", ageMonthsOld);        
        return q;        
    }    
    
}
