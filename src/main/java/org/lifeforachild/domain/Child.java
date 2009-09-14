package org.lifeforachild.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Set;
import org.lifeforachild.domain.ClinicalRecord;
import java.util.HashSet;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class Child {

    @Size(min = 1)
    private String initials;

    @Size(max = 30)
    private String name;

    @Size(max = 20)
    private String ethnicGroup;

    private SexType sex;

    private SurvivalStatusType survivalStatus;

    @Temporal(TemporalType.DATE)
    private Date dateOfDeath;

    private CauseOfDeathType causeOfDeath;

    @Size(max = 60)
    private String causeOfDeathOther;

    @Temporal(TemporalType.DATE)
    private Date dateOfRegistration;

    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;

    @Temporal(TemporalType.DATE)
    private Date diabetesDiagnosed;

    @Temporal(TemporalType.DATE)
    private Date insulinSince;

    private DiabetesType diabetesType;

    @Size(max = 60)
    private String diabetesTypeOther;
    
    private DistanceType distanceLivesFromCentre;

	public float calculatedAgeAtDiabetesDiagnosis() {
		return ClinicalRecord.calculateAge(diabetesDiagnosed, dateOfBirth);
	}
	
	
    @OneToMany(cascade = CascadeType.ALL)
    private Set<ClinicalRecord> clinicalRecords = new HashSet<ClinicalRecord>();
}
