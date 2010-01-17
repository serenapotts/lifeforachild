package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;
import org.lifeforachild.domain.Permissions;

privileged aspect UserGroup_Roo_JavaBean {
    
    public String UserGroup.getGroupName() {    
        return this.groupName;        
    }    
    
    public void UserGroup.setGroupName(String groupName) {    
        this.groupName = groupName;        
    }    
    
    public Set<Permissions> UserGroup.getPermissions() {    
        return this.permissions;        
    }    
    
    public void UserGroup.setPermissions(Set<Permissions> permissions) {    
        this.permissions = permissions;        
    }    
    
}
