package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Permissions {
	
	public static final String EDIT_CHILD = "EDIT_CHILD";
	public static final String CAN_DELETE = "CAN_DELETE";
	public static final String CREATE_CHILD = "CREATE_CHILD";
	public static final String CREATE_RECORD = "CREATE_RECORD";
	public static final String EDIT_RECORD = "EDIT_RECORD";
	public static final String CREATE_COUNTRY = "CREATE_COUNTRY";	
	public static final String EDIT_COUNTRY = "EDIT_COUNTRY";
	public static final String CREATE_CENTRE = "CREATE_CENTRE";
	public static final String EDIT_CENTRE = "EDIT_CENTRE";
	public static final String VIEW_REPORT = "VIEW_REPORT";
	public static final String EDIT_REPORT = "EDIT_REPORT";
	public static final String CREATE_REPORT = "CREATE_REPORT";	
	public static final String VIEW_CHILD_NAME = "VIEW_CHILD_NAME";
	public static final String USER_ADMIN = "USER_ADMIN";
	public static final String USER_GROUP_ADMIN = "USER_GROUP_ADMIN";
	public static final String EDIT_TRANSLATIONS = "EDIT_TRANSLATIONS";
	public static final String IMPORT_DATA = "IMPORT_DATA";
	
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)  
    private Long id; 
    
	@NotNull
	String name;
	String description;
    
	private Boolean isDeleted; 
    
}
