package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * A data sheet which is periodically filled out for a patient. It
 * tracks diabetes related information including Clinical Measures, 
 * Laboratory Tests,Eye's, Feet, Schooling, Emergencies etc.
 * @author hburgh
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class ClinicalRecord {
    @ManyToOne(targetEntity = Child.class)
    @JoinColumn
    private Child child;
    
    @Min(0L)
    @Max(56L)
    @NotNull
    private Integer bloodGlucoseSelfMonitoringPerWeek;

    @Min(0L)
    @Max(21L)
    @NotNull
    private Integer urineGlucoseSelfMonitoringPerWeek;

    @Enumerated
    @NotNull
    private YesNoType adjustInsulinDoseIfNeeded;

    @Min(0L)
    @Max(200L)
    @NotNull
    private Integer insulinUnitsPerDay;

    @Min(1L)
    @Max(9L)
    private Integer numberOfInsulinInjectionsPerDay;

    @Enumerated
    @NotNull
    private YesNoType longActingHuman;

    @Enumerated
    @NotNull
    private YesNoType shortActingHuman;

    @Enumerated
    @NotNull
    private YesNoType analog;

    @Enumerated
    @NotNull
    private YesNoType oralAgents;

    @Size(max = 40)
    private String oralAgentsDescription;

    @Min(0L)
    @Max(50L)
    @NotNull
    private Integer routineClinicReviewsLastYear;

    @Enumerated
    @NotNull
    private YesNoType bpMedications;

    private YesNoType acearb;

    @Size(max = 30)
    private String bpMedicationsOther;

    @Size(max = 50)
    private String otherTreatments;

    @Enumerated
    @NotNull
    private YesNoType LaserRxInLast12Months;

    @NotNull
    @DecimalMin(value ="3.0")
    @DecimalMax(value = "120.0")
    private float weightKG;

    @Min(50L)
    @Max(200L)
    private Integer heightCM;

    public float bmi() {
        float result = 0.0f;
        if (heightCM != 0) result = weightKG / (heightCM * heightCM);
        return result;
    }

    @Min(20L)
    @Max(130L)
    private Integer bloodPressureSystolicMMHg;

    @Min(40L)
    @Max(220L)
    private Integer bloodPressureDiastolicMMHg;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateOfMeasurement;

    @NotNull
    @Min(1L)
    @Max(60L)
    private Integer age;

    @Enumerated
    @NotNull
    private YesNoType hasPersistentHypertension;

    @Enumerated
    @NotNull
    private YesNoType hasPubertyTannerB2_P2orGreater;

    @Enumerated
    @NotNull
    private YesNoType menarche;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date ifMenarcheAge;

    @Enumerated
    @NotNull
    private YesNoType eyesExaminedInLastYear;

    @Enumerated
    private YesNoUnkownType cateract;

    @Size(max = 20)
    private String visualAcuityRight;

    @Size(max = 20)
    private String visualAcuityLeft;

    @Enumerated
    @NotNull
    private YesNoType feetExaminedInLastYear;

    @Enumerated
    private YesNoType monofilamentTested;

    @Enumerated
    private YesNoType monofilamentAbnormal;

    @Enumerated
    private YesNoType tuningForkTested;

    @Enumerated
    private YesNoType tuningForkAbnormal;

    @Enumerated
    @NotNull
    private YesNoLaterType lastHbA1cInLast12Months;

    private float hbA1cPercentage;

    @Enumerated
    @NotNull
    private HbA1cMethodType hbA1cMethod;

    @Size(max = 30)
    private String hbA1cMethodOther;

    @DecimalMin(value = "0.1")
    @DecimalMax(value = "9999.9")
    private float microalbuminuriaValue;

    @Enumerated
    @NotNull
    private MicroalbuminuriaUnitsType microalbuminuriaUnitOfMeasure;

    private String Proteinuria_dipstick_other;

    private float creatinineValue;

    @Enumerated
    @NotNull
    private CreatineUnitsType creatinineUnits;

    private float totalCholesterolValue;

    @Enumerated
    @NotNull
    private MG_OR_MMOL_Type cholesterolUnits;

    private float hdlCholesterolValue;

    @Enumerated
    @NotNull
    private MG_OR_MMOL_Type hdlUnits;

    private float triglyceridesValue;

    @Enumerated
    @NotNull
    private MG_OR_MMOL_Type triglyceridesUnits;

    @Enumerated
    @NotNull
    private YesNoUnkownType fasted;

    @Enumerated
    @NotNull
    private YesNoType attendingSchool;

    @Enumerated
    @NotNull
    private NotAttendingSchoolReasonType notAttendingSchoolWhy;

    private YesNoType diabetesLimitingAttendance;

    private YesNoType appropriateGradeForAge;

    @Enumerated
    @NotNull
    private DiabetesCopingType diabetesCopingAbilities;

    @Min(0L)
    @Max(20L)
    private Integer numberOfSevereHypoglycaemiaEpisodes;

    @Enumerated
    @NotNull
    ReasonNotEnteringType reasonHypoglycaemiaEpisodesNotEntered;

    @Min(0L)
    @Max(10L)
    private Integer numberKetoacidosisEpisodes;

    @Enumerated
    @NotNull
    ReasonNotEnteringType reasonKetoacidosisEpisodesNotEntered;

    @Min(0L)
    @Max(15L)
    private Integer numberOfHospitalAdmissionsRelatedToDiabetes;

    @Enumerated
    @NotNull
    ReasonNotEnteringType reasonHospitalAdmissionsNotEntered;

    @Size(max = 100)
    private String additionalComment;

    @NotNull
    @ManyToOne
    private User personCompletingForm;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateCompleted;

    @NotNull
    @Size(max = 30)
    private String seniorPhysician;

    @Enumerated
    @NotNull
    private YesNoNAType literate;

    public float calculatedAge() {
        return calculateAge(dateCompleted, child.getDateOfBirth());
    }

    public float insulinPerKg() {
        return insulinUnitsPerDay / weightKG;
    }

    public static float calculateAge(Date date, Date dob) {
        return (float) ((date.getTime() - dob.getTime()) / (1000 * 60 * 60 * 24 * 365.25));
    }
}
