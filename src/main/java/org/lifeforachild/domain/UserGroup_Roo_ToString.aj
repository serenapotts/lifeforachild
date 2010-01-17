package org.lifeforachild.domain;

import java.lang.String;

privileged aspect UserGroup_Roo_ToString {
    
    public String UserGroup.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("GroupName: ").append(getGroupName()).append(", ");        
        sb.append("Permissions: ").append(getPermissions() == null ? "null" : getPermissions().size());        
        return sb.toString();        
    }    
    
}
