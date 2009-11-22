package org.lifeforachild.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Child_Roo_Configurable {
    
    declare @type: Child: @Configurable;    
    
}
