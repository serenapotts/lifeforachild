package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class DiabetesCentre {
    @Size(max = 30)
    private String name;
    
    @Size(max = 200)
    private String address;
    
    @ManyToOne
    private Country country;
}
