package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;

import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect ForgotPassword_Roo_JavaBean {
    
	public String ForgotPassword.getUsername() {
		return username;
	}

	public void ForgotPassword.setUsername(String username) {
		this.username = username;
	}
}
