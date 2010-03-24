package org.lifeforachild.domain;

import java.lang.Long;
import java.util.List;
import org.lifeforachild.domain.WeightForAgeLMS;

privileged aspect WeightForAgeLMS_Roo_Entity {
    
    public static long WeightForAgeLMS.countWeightForAgeLMSs() {    
        return (Long) entityManager().createQuery("select count(o) from WeightForAgeLMS o").getSingleResult();        
    }    
    
    public static List<WeightForAgeLMS> WeightForAgeLMS.findAllWeightForAgeLMSs() {    
        return entityManager().createQuery("select o from WeightForAgeLMS o").getResultList();        
    }    
    
    public static WeightForAgeLMS WeightForAgeLMS.findWeightForAgeLMS(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of WeightForAgeLMS");        
        return entityManager().find(WeightForAgeLMS.class, id);        
    }    
    
    public static List<WeightForAgeLMS> WeightForAgeLMS.findWeightForAgeLMSEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from WeightForAgeLMS o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
