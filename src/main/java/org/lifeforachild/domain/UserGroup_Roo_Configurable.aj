package org.lifeforachild.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect UserGroup_Roo_Configurable {
    
    declare @type: UserGroup: @Configurable;    
    
}
