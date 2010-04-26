package org.lifeforachild.domain;

import java.lang.Long;
import java.util.List;
import org.lifeforachild.domain.HeightForAgeLMS;

privileged aspect HeightForAgeLMS_Roo_Entity {
    
    public static long HeightForAgeLMS.countHeightForAgeLMSs() {    
        return (Long) entityManager().createQuery("select count(o) from HeightForAgeLMS o").getSingleResult();        
    }    
    
    public static List<HeightForAgeLMS> HeightForAgeLMS.findAllHeightForAgeLMSs() {    
        return entityManager().createQuery("select o from HeightForAgeLMS o").getResultList();        
    }    
    
    public static HeightForAgeLMS HeightForAgeLMS.findHeightForAgeLMS(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of HeightForAgeLMS");        
        return entityManager().find(HeightForAgeLMS.class, id);        
    }    
    
    public static List<HeightForAgeLMS> HeightForAgeLMS.findHeightForAgeLMSEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from HeightForAgeLMS o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
