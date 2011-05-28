package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.web.AppContext;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;

privileged aspect UserGroup_Roo_JavaBean {
    
    public String UserGroup.getGroupName() {      	
    	try
    	{
    		return AppContext.getApplicationContext().getMessage(this.groupName, null, LocaleContextHolder.getLocale());
    	}
    	catch (NoSuchMessageException e)
    	{
    		return this.groupName;
    	}    	      
    }    
    
    public void UserGroup.setGroupName(String groupName) {    
        this.groupName = groupName;        
    }    
    
    public String UserGroup.getGroupCode() {    
        return this.groupCode;        
    }    
    
    public void UserGroup.setGroupCode(String groupCode) {    
        this.groupCode = groupCode;        
    }   
    
    public Set<Permissions> UserGroup.getPermissions() {    
        return this.permissions;        
    }    
    
    public void UserGroup.setPermissions(Set<Permissions> permissions) {    
        this.permissions = permissions;        
    }    
    
    public boolean UserGroup.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void UserGroup.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }    
}
