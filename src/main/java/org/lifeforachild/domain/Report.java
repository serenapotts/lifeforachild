package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CollectionOfElements;
import org.hibernate.annotations.IndexColumn;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class Report {

    @NotNull
    @NotEmpty
    private String name;

    @ManyToOne    
    private User viewableBy;
    
    @Enumerated
    @NotNull
    private ReportType reporttype;

    @Enumerated
    //@NotNull
    private StatusType statustype;

    private String timePeriod;

    @Enumerated
    //@NotNull
    private TimePeriodUnit timeperiodunit;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date fromDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date toDate;

    @Enumerated
    //@NotNull
    private ShowOptionType showoptiontype;
    
    private String recordNumber;

    private String age;
    
    @Enumerated
    @ManyToOne
    private DiabetesCentre centre;

    @ManyToOne
    private Country country;

    @CollectionOfElements
    @IndexColumn(name = "child_fields")
    private ChildFields[] childfields;

    @CollectionOfElements
    @IndexColumn(name = "clinical_record_fields")
    private ClinicalRecordFields[] clinicalrecordfields;

    private String orderBy;

    private String thenOrderBy;
    
    private Boolean isDeleted;
    
    public EntityManager getEntityManager()
    {
    	return entityManager();
    }
}
