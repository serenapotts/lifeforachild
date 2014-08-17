package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.Set;

import org.hibernate.validator.constraints.NotEmpty;
import org.lifeforachild.domain.DiabetesCentre;

import java.util.HashSet;

import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

/**
 * Internationalisation of messages.properties
 * @author skeating
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class Message {
    @Size(max = 255)
    @NotNull
    @NotEmpty
    private String messageKey;

    @Size(max = 255)
    @NotNull
    @NotEmpty
    private String english;
    
    @Size(max = 255)
    private String french;
    
    @Size(max = 255)
    private String spanish;
    
    @Size(max = 255)
    private String russian;   
}
