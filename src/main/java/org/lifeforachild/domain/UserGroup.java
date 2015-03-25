package org.lifeforachild.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class UserGroup {

    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long id;
    
    @NotNull
    String groupName;
    
    @NotNull
    String groupCode;

    @ManyToMany(cascade =  {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private Set<Permissions> permissions = new HashSet<Permissions>();
    
    private Boolean isDeleted;    
}
