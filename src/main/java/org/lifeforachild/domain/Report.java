package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.sun.istack.internal.NotNull;
import java.util.Date;

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

    private String centre;

    private String country;

    private String displayFields;

}
