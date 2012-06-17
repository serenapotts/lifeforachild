package org.lifeforachild.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.lifeforachild.enums.BloodGlucoseUnitsType;
import org.lifeforachild.enums.CauseOfDeathType;
import org.lifeforachild.enums.DiabetesType;
import org.lifeforachild.enums.DistanceType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.KnownUnkownType;
import org.lifeforachild.enums.NoMildSevereUnknownType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.SurvivalStatusType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.lifeforachild.enums.YesUnknownType;
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
    @Length(max = 30)
    private String initials;
    
    @NotNull
    @Length(max = 30)
    private String name;
    
    @NotNull
    @Length(max = 30)
    private String lastName;
    
    @NotNull
	@ManyToOne
	Country country;
	
    @NotNull
	@ManyToOne
	DiabetesCentre centre;    
	
	private String localMedicalNumber;

	@Length(max = 20)
    private String ethnicGroup;

    @Enumerated
    @NotNull
    private SexType sex;

    @Enumerated
    @NotNull
    private SurvivalStatusType survivalStatus;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date dateOfDeath;

    @Enumerated
    private CauseOfDeathType causeOfDeath;

    @Length(max = 60)
    private String causeOfDeathOther;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date dateOfRegistration;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date dateOfBirth;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date diabetesDiagnosed;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date insulinSince;

    @Enumerated
    @NotNull
    private DiabetesType diabetesType;

    @NotNull
    @Length(max = 60)
    private String diabetesTypeOther;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date createdOn;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date updatedOn;

    private Boolean isDeleted;
    
    @Enumerated
    @NotNull
    private DistanceType distanceLivesFromCentre;

    private Float ageAtDiagnosis;
    
    @Enumerated
    @NotNull
    private KnownUnkownType bloodGlucoseAtDiagnosis;

    private Float bloodGlucoseValue;

    private BloodGlucoseUnitsType bloodGlucoseUnits;

    @Enumerated
    @NotNull
    private YesNoUnkownType hbA1cAtDiagnosis;

    @DecimalMin(value = "2.0")
    @DecimalMax(value = "20.0")
    private Float hbA1cPercentage;
    
    @Enumerated
    private HbA1cMethodType hbA1cMethod;

    @Size(max = 30)
    private String hbA1cMethodOther;
    
    @Enumerated
    @NotNull
    private NoMildSevereUnknownType ketoacidosisAtDiagnosis;

    @Enumerated
    @NotNull
    private YesNoUnkownType polyuriaAtDiagnosis;
    
    @Enumerated
    @NotNull
    private YesNoUnkownType thirstAtDiagnosis;
    
    @Enumerated
    @NotNull
    private YesNoUnkownType weightLossAtDiagnosis;
    
    @Enumerated
    @NotNull
    private YesUnknownType weightAtDiagnosis;
    
    @DecimalMin(value ="1.0")
    @DecimalMax(value = "150.0")
    private Float weightAtDiagnosisValue;
    
    @Enumerated
    @NotNull
    private YesUnknownType heightAtDiagnosis;
   
    @DecimalMin("45.0")
    @DecimalMax("230.0")
    private Float heightAtDiagnosisValue;

	@Enumerated
    @NotNull
    private YesNoUnkownType typeOneInFamily;
    
    private String typeOneRelativesDetails;
    
    @Enumerated
    @NotNull
    private YesNoUnkownType typeTwoInFamily;
    
    private String typeTwoRelativesDetails;
    
    @Enumerated
    @NotNull
    private YesNoUnkownType malnutrition;
    
    private String otherSyndromeAdditionalComment;
    

    public static float calculatedAgeAtDiabetesDiagnosis(Date diabetesDiagnosed, Date dateOfBirth) {
    	return ClinicalRecord.calculateAge(diabetesDiagnosed, dateOfBirth);
    }
    
    public float calculatedAgeAtDiabetesDiagnosis() {
        return calculatedAgeAtDiabetesDiagnosis(diabetesDiagnosed, dateOfBirth);
    }

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "child")
    @OrderBy
    private Set<ClinicalRecord> clinicalRecords = new HashSet<ClinicalRecord>();

    public static java.util.List<Child> findChildren(String query) {    
        return entityManager().createQuery(query).getResultList();        
    }    
    
    public static java.util.List<Child> findChildren(Search search) {     	
    	return new ChildQuery().getQuery(entityManager(), search);        
    }    

}
