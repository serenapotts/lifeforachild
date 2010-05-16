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

    private Float exactAge;
    
    private Float bmi;
    
    private Float insulinPerKg;
    
    private Float heightSD;
    
    private Float weightSD;
    
    private Float bmiSD;
    
    private Float BloodPressureSystolicSD;
    
    private Float BloodPressureDiastolicSD;    
    
    public float calculateBMI() {
        float result = 0.0f;
        if (heightCM != 0) result = weightKG / (heightCM * heightCM);
        return result;
    }
    
    public float calculateExactAge() {
        return calculateAge(dateCompleted, child.getDateOfBirth());
    }

    public float calculateInsulinPerKg() {
        return insulinUnitsPerDay / weightKG;
    }

    public static float calculateAge(Date date, Date dob) {
        return (float) ((date.getTime() - dob.getTime()) / (1000 * 60 * 60 * 24 * 365.25));
    }
    
	private static Float calculateAgeMonths(Date date, Date dob) {
		float ageMonthsExact = calculateAge(date, dob) * 12;
		double lowMidPoint = Math.floor(ageMonthsExact) + 0.5;
		if (ageMonthsExact <= lowMidPoint) {
			return new Float(lowMidPoint);
		} else {
			return new Float(lowMidPoint + 1);
		}
	}
    
    public Float calculateWeightSD() {
    	if(weightKG == 0) {
    	    return new Float(0);
    	}
    	
        Float ageMonths = calculateAgeMonths(dateCompleted, child.getDateOfBirth());
		if (ageMonths.compareTo(new Float(240)) > 0) {
			ageMonths = new Float(240);
		}
    	
    	WeightForAgeLMS weightForAgeLMS = (WeightForAgeLMS) WeightForAgeLMS.findWeightForAgeLMSsBySexAndAgeMonthsOldEquals(child.getSex(), ageMonths).getSingleResult();
    	if(weightForAgeLMS == null) {
    	    return new Float(0);
    	}
    	else {
    	    double weightSDCalculated = calculateSD((double) weightKG, weightForAgeLMS); 
            return new Float(weightSDCalculated);
    	}
    }
    
    public Float calculateHeightSD() {
        if(heightCM == null || heightCM.intValue() == 0) {
            return new Float(0);
        }
        
        Float ageMonths = calculateAgeMonths(dateCompleted, child.getDateOfBirth());
        //Just do 24-240 months, younger and older would be N/A
        if(ageMonths.floatValue() < 24 || ageMonths.floatValue() > 240) {
            return new Float(0);
        }
        
        HeightForAgeLMS heightForAgeLMS = (HeightForAgeLMS) HeightForAgeLMS.findHeightForAgeLMSsBySexAndAgeMonthsOldEquals(child.getSex(), ageMonths).getSingleResult();
        if(heightForAgeLMS == null) {
            return new Float(0);
        }
        else {
            double heightSDCalculated = calculateSD(heightCM.doubleValue(), heightForAgeLMS); 
            return new Float(heightSDCalculated);
        }
    }
    
    public Float calculateBmiSD() {
        if(bmi == null || bmi.intValue() == 0) {
            return new Float(0);
        }
        
        Float ageMonths = calculateAgeMonths(dateCompleted, child.getDateOfBirth());
        if(ageMonths.floatValue() < 24 || ageMonths.floatValue() > 240.5) {
            return new Float(0);
        }
       
        BMIForAgeLMS bmiForAgeLMS = (BMIForAgeLMS) BMIForAgeLMS.findBMIForAgeLMSsBySexAndAgeMonthsOldEquals(child.getSex(), ageMonths).getSingleResult();
        if(bmiForAgeLMS == null) {
            return new Float(0);
        }
        else {
            double bmiSDCalculated = calculateSD(bmi.doubleValue(), bmiForAgeLMS);
            return new Float(bmiSDCalculated);
        }
    }
    
    private double calculateSD(double value, LMS lms) {
        return (Math.pow(value / lms.getM(), lms.getL()) - 1) / (lms.getL() * lms.getS());
    }
    
    public Float calculateBloodPressureSystolicSD() {
        if (bloodPressureSystolicMMHg == null || bloodPressureSystolicMMHg.intValue() == 0) {
            return new Float(0);
        }

        if (heightSD == null || heightSD.equals(new Float(0))) {
            return new Float(0);
        }
        
        
        return null;
    }
    
    private double calcExpectedSystolicBP() {
        double age = this.getExactAge();
        double heightSDValue = getHeightSD().floatValue();
        
        if(child.getSex() == SexType.MALE) {
            return 102.19768 + 1.82416*(age-10) + 0.12776*Math.pow(age-10, 2) 
                  + 0.00249*Math.pow((age-10), 3) - 0.00135*Math.pow((age-10), 4) 
                  + 2.73157*(heightSDValue) - 0.19618*Math.pow(heightSDValue, 2) 
                  - 0.04659*Math.pow(heightSDValue, 3) + 0.00947*Math.pow(heightSDValue, 4);
            
        }
        else if(child.getSex() == SexType.FEMALE) {
            return 102.01027 + 1.94397*(age-10) + 0.00598*Math.pow((age-10), 2) 
                  - 0.00789*Math.pow((age-10), 3) - 0.00059*Math.pow((age-10), 4) 
                  + 2.03526*(heightSDValue) - 0.02534*Math.pow(heightSDValue, 2) - 0.01884*Math.pow(heightSDValue, 3)
                  + 0.00121*Math.pow(heightSDValue, 4);
        }
        else {
            return 0;
        }
    }
    
    public Float calcSystolicBloodPressureSD() {
        double expectedSystolicBP = calcExpectedSystolicBP();
        
        if(child.getSex() == SexType.MALE) {
            double value = (bloodPressureSystolicMMHg - expectedSystolicBP) / 10.7128;
            return new Float(value);
        }
        else if(child.getSex() == SexType.FEMALE) {
            double value = (bloodPressureSystolicMMHg - expectedSystolicBP) / 10.4855;
            return new Float(value);
        }
        else {
            return new Float(0);
        }
    }
    
    private double calcExpectedDiastolicBP() {
        double age = this.getExactAge();
        double heightSDValue = getHeightSD().floatValue();
        
        if(child.getSex() == SexType.MALE) {
            return 61.01207 + 0.68314*(age-10) - 0.09835*Math.pow((age-10), 2) 
                  + 0.01711*Math.pow((age-10), 3) + 0.00045*Math.pow((age-10), 4)
                  + 1.46993*(heightSDValue) - 0.07849*Math.pow(heightSDValue, 2)
                  - 0.03114*Math.pow(heightSDValue, 3) - 0.00967*Math.pow(heightSDValue, 4); 
        }
        else if(child.getSex() == SexType.FEMALE) {
            return 60.5051+1.01301*(age-10) + 0.01157*Math.pow((age-10), 2)
                  + 0.00424*Math.pow((age-10), 3) - 0.00137*Math.pow((age-10), 4)
                  + 1.16641*(heightSDValue) + 0.12795*Math.pow(heightSDValue, 2) 
                  - 0.03869*Math.pow(heightSDValue, 3) - 0.00079*Math.pow(heightSDValue, 4); 
        }
        else {
            return 0;
        }
    }
    
    public Float calcDiastolicBloodPressureSD() {
        double expectedDiastolicBP = calcExpectedDiastolicBP();
        
        if(child.getSex() == SexType.MALE) {
            double value = (bloodPressureDiastolicMMHg - expectedDiastolicBP) / 11.6032;
            return new Float(value);
        }
        else if(child.getSex() == SexType.FEMALE) {
            double value = (bloodPressureDiastolicMMHg - expectedDiastolicBP) / 10.9573;
            return new Float(value);
        }
        else {
            return new Float(0);
        }
    }
}
