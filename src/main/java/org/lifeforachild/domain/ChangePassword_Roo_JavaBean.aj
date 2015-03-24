package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;

import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect ChangePassword_Roo_JavaBean {
    
	public String ChangePassword.getOldPassword() {
		return oldPassword;
	}

	public void ChangePassword.setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String ChangePassword.getNewPassword() {
		return newPassword;
	}

	public void ChangePassword.setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String ChangePassword.getConfirmPassword() {
		return confirmPassword;
	}

	public void ChangePassword.setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}
