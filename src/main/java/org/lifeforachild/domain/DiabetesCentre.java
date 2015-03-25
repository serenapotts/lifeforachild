package org.lifeforachild.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * The local diabetes centre which is supported with funds and supplies to
 * help needy children receive proper diabetes care.
 * @author hburgh
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class DiabetesCentre {
	
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long id; 
    
    @Size(max = 30)
    @NotNull
    @NotEmpty
    private String name;
    
    @Size(max = 200)
    private String address;
    
    @ManyToOne(targetEntity = Country.class)
    @JoinColumn
    @NotNull
    private Country country;
    
    private Boolean isDeleted;    
}
