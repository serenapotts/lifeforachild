package org.lifeforachild.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import org.lifeforachild.enums.SexType;

import javax.persistence.Enumerated;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public abstract class LMS {

    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long id;  
    
    @Enumerated
    private SexType sex;

    private Float ageMonthsOld;

    private Float l;

    private Float m;

    private Float s;
}
