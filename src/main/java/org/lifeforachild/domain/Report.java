package org.lifeforachild.domain;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.CollectionOfElements;
import org.hibernate.annotations.IndexColumn;
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
    private String name;

    @NotNull
    private ReportType reporttype;

    @NotNull
    private StatusType statustype;

    private String timePeriod;

    @NotNull
    private TimePeriodUnit timeperiodunit;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fromDate;

    @Temporal(TemporalType.TIMESTAMP)
    private Date toDate;

    @NotNull
    private ShowOptionType showoptiontype;
    
    private String recordNumber;

    private String age;

    private String weight;

    private String height;
    
    @NotNull
    @ManyToOne
    private DiabetesCentre centre;

    @NotNull
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
}
