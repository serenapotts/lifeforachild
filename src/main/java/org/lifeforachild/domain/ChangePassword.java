package org.lifeforachild.domain;


import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooEntity
@RooJavaBean
@RooToString
public class ChangePassword {

	@NotNull	
    String newPassword;
    
	@NotNull
	String oldPassword;

	@NotNull
	String confirmPassword;
}
