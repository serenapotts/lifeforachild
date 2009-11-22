package org.lifeforachild.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect ClinicalRecord_Roo_Configurable {
    
    declare @type: ClinicalRecord: @Configurable;    
    
}
