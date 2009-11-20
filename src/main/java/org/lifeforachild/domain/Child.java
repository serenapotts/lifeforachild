package org.lifeforachild.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.lifeforachild.web.query.ChildQuery;
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
	public static final String UPDATED_ON_COLUMN = "updated_on";
	
    @Size(min = 1)
    private String initials;

    @Size(max = 30)
    private String name;

    @Size(max = 20)
    private String ethnicGroup;

    @NotNull
    private SexType sex;

    @NotNull
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

    @NotNull
    @Size(max = 60)
    private String diabetesTypeOther;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;

    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedOn;

    private DistanceType distanceLivesFromCentre;

    public float calculatedAgeAtDiabetesDiagnosis() {
        return ClinicalRecord.calculateAge(diabetesDiagnosed, dateOfBirth);
    }

    @OneToMany(cascade = CascadeType.ALL)
    private Set<ClinicalRecord> clinicalRecords = new HashSet<ClinicalRecord>();

    public static java.util.List<Child> findChildren(Search search) {  
    	return ChildQuery.getQuery(entityManager(), search);
        //return entityManager().createQuery(query).getResultList();        
    }    

}
