package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

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
	// has to contain 1 uppercase, 1 lowercase, 1 number of special char and be 8 characters in length
	@Pattern(regexp="(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$", 
			message ="Password is not strong enough. Must contain an uppercase, lowercase and number or special character and be 8 characters in length.")	
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
	
    private Boolean isDeleted;	
}
