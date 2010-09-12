package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Set;
import org.lifeforachild.domain.DiabetesCentre;
import java.util.HashSet;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

/**
 * The Country which contains the diabetes centres supported by the
 * LifeForAChild program
 * @author hburgh
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class Country {
    @Size(max = 60)
    private String name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "country")
    private Set<DiabetesCentre> diabetesCentres = new HashSet<DiabetesCentre>();
    
    private Boolean isDeleted;
}
