package org.lifeforachild.domain;

import java.lang.Float;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.lifeforachild.domain.SexType;

privileged aspect WeightForAgeLMS_Roo_Finder {
    
    public static Query WeightForAgeLMS.findWeightForAgeLMSsBySexAndAgeMonthsOldEquals(SexType sex, Float ageMonthsOld) {    
        if (sex == null) throw new IllegalArgumentException("The sex argument is required");        
        if (ageMonthsOld == null) throw new IllegalArgumentException("The ageMonthsOld argument is required");        
        EntityManager em = WeightForAgeLMS.entityManager();        
        Query q = em.createQuery("SELECT WeightForAgeLMS FROM WeightForAgeLMS AS weightforagelms WHERE weightforagelms.sex = :sex AND weightforagelms.ageMonthsOld = :ageMonthsOld");        
        q.setParameter("sex", sex);        
        q.setParameter("ageMonthsOld", ageMonthsOld);        
        return q;        
    }    
    
}
