package org.lifeforachild.domain;

import java.lang.Long;
import java.util.List;
import org.lifeforachild.domain.BMIForAgeLMS;

privileged aspect BMIForAgeLMS_Roo_Entity {
    
    public static long BMIForAgeLMS.countBMIForAgeLMSs() {    
        return (Long) entityManager().createQuery("select count(o) from BMIForAgeLMS o").getSingleResult();        
    }    
    
    public static List<BMIForAgeLMS> BMIForAgeLMS.findAllBMIForAgeLMSs() {    
        return entityManager().createQuery("select o from BMIForAgeLMS o").getResultList();        
    }    
    
    public static BMIForAgeLMS BMIForAgeLMS.findBMIForAgeLMS(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of BMIForAgeLMS");        
        return entityManager().find(BMIForAgeLMS.class, id);        
    }    
    
    public static List<BMIForAgeLMS> BMIForAgeLMS.findBMIForAgeLMSEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from BMIForAgeLMS o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
