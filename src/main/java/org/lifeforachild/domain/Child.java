package org.lifeforachild.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.lifeforachild.web.query.ChildQuery;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * The Child in a 3rd world country who will be supported by the LifeForAChild
 * program. This child will receive medical supplies and care from their local
 * diabetes centre. Their progress will be tracked regularly in the form of a ClinicalRecord.
 * @see ClinicalRecord
 * @author hburgh
 *
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class Child {

	// Name of database column for properties
	public static final String ID_COLUMN = "id";
	public static final String INDIVIDUAL_ID_COLUMN = "individual_id";
	public static final String COUNTRY_COLUMN = "country.id";
	public static final String CENTRE_COLUMN = "centre.id";
	public static final String NAME_COLUMN = "name";
	public static final String UPDATED_ON_COLUMN = "updated_on";
	
	@NotNull
	@Size(max=20)
	private String individualId;
	
	@NotNull
    @Size(min = 1)
    private String initials;
    
    @NotNull
    @Size(max = 30)
    private String name;
    
    @NotNull
    @Size(max = 30)
    private String lastName;
    
	@ManyToOne
	Country country;
	
	@ManyToOne
	DiabetesCentre centre;    

    @Size(max = 20)
    private String ethnicGroup;

    @Enumerated
    @NotNull
    private SexType sex;

    @Enumerated
    @NotNull
    private SurvivalStatusType survivalStatus;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateOfDeath;

    @Enumerated
    private CauseOfDeathType causeOfDeath;

    @Size(max = 60)
    private String causeOfDeathOther;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateOfRegistration;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateOfBirth;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date diabetesDiagnosed;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date insulinSince;

    @Enumerated
    @NotNull
    private DiabetesType diabetesType;

    @NotNull
    @Size(max = 60)
    private String diabetesTypeOther;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date createdOn;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date updatedOn;

    @Enumerated
    @NotNull
    private DistanceType distanceLivesFromCentre;
    
    private Float ageAtDiagnosis;

    public float calculatedAgeAtDiabetesDiagnosis() {
        return ClinicalRecord.calculateAge(diabetesDiagnosed, dateOfBirth);
    }

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "child")
    private Set<ClinicalRecord> clinicalRecords = new HashSet<ClinicalRecord>();

    public static java.util.List<Child> findChildren(String query) {    
        return entityManager().createQuery(query).getResultList();        
    }    
    
    public static java.util.List<Child> findChildren(Search search) {     	
    	return new ChildQuery().getQuery(entityManager(), search);        
    }    

}
