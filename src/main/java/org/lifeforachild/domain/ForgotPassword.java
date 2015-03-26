package org.lifeforachild.domain;


import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooEntity
@RooJavaBean
@RooToString
public class ForgotPassword {

	@NotNull	
    String username;
}
