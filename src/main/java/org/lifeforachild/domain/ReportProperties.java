package org.lifeforachild.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.lifeforachild.web.report.enums.ReportType;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class ReportProperties {
	
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "_id")    
    private Long _id; 
    
	private String query;
	
	private Long id;
	
	private String displayFields;
	
    @Enumerated
    @NotNull
	private ReportType reportType;
}
