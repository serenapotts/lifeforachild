package org.lifeforachild.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import com.sun.istack.internal.NotNull;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class Report {

	@NotNull
    private ReportType reporttype;
}
