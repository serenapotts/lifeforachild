package org.lifeforachild.domain;

import java.lang.String;
import java.util.Date;

import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.UserGroup;

privileged aspect User_Roo_JavaBean {
    
    public String User.getFirstName() {    
        return this.firstName;        
    }    
    
    public void User.setFirstName(String firstName) {    
        this.firstName = firstName;        
    }    
    
    public String User.getLastName() {    
        return this.lastName;        
    }    
    
    public void User.setLastName(String lastName) {    
        this.lastName = lastName;        
    }    
    
    public String User.getUsername() {    
        return this.username;        
    }    
    
    public void User.setUsername(String username) {    
        this.username = username;        
    }    
    
    public String User.getPassword() {    
        return this.password;        
    }    
    
    public void User.setPassword(String password) {    
        this.password = password;        
    }    
    
    public boolean User.isEnabled() {    
        return this.enabled;        
    }    
    
    public void User.setEnabled(boolean enabled) {    
        this.enabled = enabled;        
    }    
    
    public UserGroup User.getUserGroup() {    
        return this.userGroup;        
    }    
    
    public void User.setUserGroup(UserGroup userGroup) {    
        this.userGroup = userGroup;        
    }    
    
    public Country User.getCountry() {    
        return this.country;        
    }    
    
    public void User.setCountry(Country country) {    
        this.country = country;        
    }    
    
    public DiabetesCentre User.getCentre() {    
        return this.centre;        
    }    
    
    public void User.setCentre(DiabetesCentre centre) {    
        this.centre = centre;        
    }    
    
    public String User.getOldPassword() {    
        return this.oldPassword;        
    }    
    
    public void User.setOldPassword(String oldPassword) {    
        this.oldPassword = oldPassword;        
    }    
    
    public boolean User.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void User.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }    
    
    public Date User.getCreatedOn() {    
        return this.createdOn;        
    }    
    
    public void User.setCreatedOn(Date createdOn) {    
        this.createdOn = createdOn;        
    }    
    
    public Date User.getUpdatedOn() {    
        return this.updatedOn;        
    }    
    
    public void User.setUpdatedOn(Date updatedOn) {    
        this.updatedOn = updatedOn;        
    }    
    
    public String User.getCreatedBy() {    
        return this.createdBy;        
    }    
    
    public void User.setCreatedBy(String createdBy) {    
        this.createdBy = createdBy;        
    }    
    
    public String User.getUpdatedBy() {    
        return this.updatedBy;        
    }    
    
    public void User.setUpdatedBy(String updatedBy) {    
        this.updatedBy = updatedBy;        
    }        
    
    public String User.getOldUsername() {    
        return this.oldUsername;        
    }    
    
    public void User.setOldUsername(String oldUsername) {    
        this.oldUsername = oldUsername;        
    }    
}
