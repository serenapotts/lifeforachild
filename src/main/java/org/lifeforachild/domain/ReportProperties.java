package org.lifeforachild.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class ReportProperties {
	
	private String query;
	
	private Long id;
	
	private String displayFields;
	
	private ReportType reportType;
}
