package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * A user of the LifeForAChild database
 * @author hburgh
 *
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class User {

	@NotNull
	String firstName;
	
	@NotNull
	String lastName;	
	
	@NotNull
    String username;
    
	@NotNull	
    String password;
    
	@NotNull
    boolean enabled;
	
	@NotNull
	@ManyToOne
	UserGroup userGroup;
	
	@ManyToOne
	Country country;
	
	@ManyToOne
	DiabetesCentre centre;
	
	String oldPassword;
	
	String oldUsername;
	
    boolean isDeleted;
    
    @NotNull
    String email;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date createdOn;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date updatedOn;
    
    private String createdBy;
    
    private String updatedBy;
}
