package org.lifeforachild.domain;

import javax.persistence.Entity;
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

    @Enumerated
    private SexType sex;

    private Float ageMonthsOld;

    private Float l;

    private Float m;

    private Float s;
}
