package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
    
    @Transient
    private static final Log LOGGER = LogFactory.getLog(ClinicalRecord.class);
    
    @ManyToOne(targetEntity = Child.class)
    @JoinColumn
    private Child child;
    
    @Min(0L)
    @Max(70L)
    @NotNull(message = "Blood glucose monitoring is required.")
    private Integer bloodGlucoseSelfMonitoringPerWeek;

    @Min(0L)
    @Max(21L)
    @NotNull(message = "Urine glucose monitoring is required.")
    private Integer urineGlucoseSelfMonitoringPerWeek;

    @Enumerated
    private YesNoType adjustInsulinDoseIfNeeded;

    @Min(0L)
    @Max(200L)
    @NotNull(message = "Insulin units per day is required.")
    private Integer insulinUnitsPerDay;

    @Min(0L)
    @Max(9L)
    private Integer numberOfInsulinInjectionsPerDay;

    @Enumerated
    private YesNoType longActingHuman;

    @Enumerated
    private YesNoType shortActingHuman;

    @Enumerated
    private YesNoType analog;

    @Enumerated
    private YesNoType oralAgents;

    @Size(max = 40)
    private String oralAgentsDescription;

    @Min(0L)
    @Max(50L)
    @NotNull(message = "Rountine clinic reviews is required.")
    private Integer routineClinicReviewsLastYear;

    @Enumerated
    @NotNull(message = "BP medications is required.")
    private YesNoType bpMedications;

    private YesNoType acearb;

    @Size(max = 30)
    private String bpMedicationsOther;

    @Size(max = 50)
    private String otherTreatments;

    @Enumerated
    @NotNull(message = "Laser Rx in last 12 months is required.")
    private YesNoType LaserRxInLast12Months;

    @Enumerated
    @NotNull(message = "Weight in last 12 months is required.")
    private YesNoType weightInLast12Months;
    
    @DecimalMin(value ="3.0")
    @DecimalMax(value = "120.0")
    private Float weightKG;

    @Enumerated
    @NotNull(message = "Height in last 12 months is required.")
    private YesNoType heightInLast12Months;
    
    @DecimalMin("50.0")
    @DecimalMax("220.0")
    private Float heightCM;

    @Enumerated
    @NotNull(message = "BP last 12 months is required.")
    private YesNoType BPInLast12Months;
    
    @Min(40L)
    @Max(220L)
    private Integer bloodPressureSystolicMMHg;

    @Min(20L)
    @Max(130L)
    private Integer bloodPressureDiastolicMMHg;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateOfMeasurement;

    @Enumerated
    @NotNull(message = "Has persistent Hypertension is required.")
    private YesNoUnkownType hasPersistentHypertension;

    @Enumerated
    @NotNull(message = "Has puberty tanner is required.")
    private YesNoUnkownType hasPubertyTannerB2_P2orGreater;

    @Enumerated
    private YesNoUnkownType menarche;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date ifMenarcheAge;

    @Enumerated
    @NotNull(message = "Eyes examined is required.")
    private YesNoType eyesExaminedInLastYear;

    @Enumerated
    private YesNoUnkownType cateract;

    @Size(max = 20)
    private String visualAcuityRight;

    @Size(max = 20)
    private String visualAcuityLeft;

    @Enumerated
    @NotNull(message = "Feet examined is required.")
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
    @NotNull(message = "HbA1c in last 12 months is required.")
    private YesNoLaterType lastHbA1cInLast12Months;

    @DecimalMin(value = "2.0")
    @DecimalMax(value = "20.0")
    private Float hbA1cPercentage;

    @Enumerated
    private HbA1cMethodType hbA1cMethod;

    @Size(max = 30)
    private String hbA1cMethodOther;

    @Enumerated
    @NotNull(message = "Microalbuminuria in last 12 months is required.")
    private YesNoLaterType microalbuminuriaInLast12Months;
    
    private String microalbuminuriaValue;

    private MicroalbuminuriaUnitsType microalbuminuriaUnitOfMeasure;

    private String Proteinuria_dipstick_other;

    @Enumerated
    @NotNull(message = "Creatinine in last 12 months is required.")
    private YesNoLaterType creatinineInLast12Months;
    
    private Float creatinineValue;

    @Enumerated
    private CreatineUnitsType creatinineUnits;

    @Enumerated
    @NotNull(message = "Cholesterol in last 12 months is required.")
    private YesNoLaterType totalCholesterolInLast12Months;
    
    private Float totalCholesterolValue;

    @Enumerated
    private MG_OR_MMOL_Type cholesterolUnits;

    @Enumerated
    @NotNull(message = "HDL Cholesterol in last 12 months is required.")
    private YesNoLaterType hdlCholesterolInLast12Months;
    
    private Float hdlCholesterolValue;

    @Enumerated
    private MG_OR_MMOL_Type hdlUnits;

    @Enumerated
    @NotNull(message = "Triglycerides in last 12 months is required.")
    private YesNoLaterType triglyceridesInLast12Months;
    
    private Float triglyceridesValue;

    @Enumerated
    private MG_OR_MMOL_Type triglyceridesUnits;

    @Enumerated
    private YesNoUnkownType fasted;

    @Enumerated
    @NotNull(message = "Attending school is required.")
    private YesNoType attendingSchool;

    @Enumerated
    private NotAttendingSchoolReasonType notAttendingSchoolWhy;

    private YesNoType diabetesLimitingAttendance;

    private YesNoType appropriateGradeForAge;

    @Enumerated
    @NotNull(message = "Diabetes coping abilities is required.")
    private DiabetesCopingType diabetesCopingAbilities;

    @Min(0L)
    @Max(20L)
    @NotNull(message = "Number of severe hypoglycaemia episodes is required.")
    private Integer numberOfSevereHypoglycaemiaEpisodes;

   // ReasonNotEnteringType reasonHypoglycaemiaEpisodesNotEntered;

    @Min(0L)
    @Max(12L)
    @NotNull(message = "Number of ketoacidosis episodes is required.")
    private Integer numberKetoacidosisEpisodes;


    //ReasonNotEnteringType reasonKetoacidosisEpisodesNotEntered;

    @Min(0L)
    @Max(15L)
    @NotNull(message = "Number of hospital admissions is required.")
    private Integer numberOfHospitalAdmissionsRelatedToDiabetes;

    //ReasonNotEnteringType reasonHospitalAdmissionsNotEntered;

    @Size(max = 100)
    private String additionalComment;

    @NotNull(message = "Person completing form is required.")
    @ManyToOne
    private User personCompletingForm;

    @NotNull(message = "Date completed is required.")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateCompleted;

    @NotNull(message = "Senior physician is required.")
    @Size(max = 30)
    private String seniorPhysician;

    @Enumerated
    @NotNull(message = "Literate is required.")
    private YesNoType literate;

    private Float exactAge;
    private Float exactAgeMonths;
    
    private Float bmi;
    
    private Float insulinPerKg;
    
    private Float heightSD;
    
    private Float weightSD;
    
    private Float bmiSD;
    
    private Float BloodPressureSystolicSD;
    
    private Float BloodPressureDiastolicSD;    
    
    private Boolean isDeleted;    
    
    public float calculateBMI() {
        float result = 0.0f;
        if (weightKG != null && heightCM != null && !heightCM.equals(new Integer(0))) {
            result = (float) (weightKG.floatValue() / (heightCM * heightCM / 10000.0));
        }
        
        LOGGER.info("Weight: " + weightKG + ", Height: " + heightCM + ", BMI: " + result);
        
        return result;
    }
    
    public float calculateExactAge() {
        return calculateAge(dateOfMeasurement == null ? dateCompleted : dateOfMeasurement, child.getDateOfBirth());
    }
 
    public Float calculateInsulinPerKg() {
    	if (weightKG == null)
    		return null;
        return insulinUnitsPerDay / weightKG;
    }

    public static Float calculateAge(Date date, Date dob) {
    	if (date != null)
    		return (float) ((date.getTime() - dob.getTime()) / (1000 * 60 * 60 * 24 * 365.25));
    	return null;
    }
    
	public Float calculateExactAgeMonths() {
		float ageMonthsExact = exactAge * 12;
		double lowMidPoint = Math.floor(ageMonthsExact) + 0.5;
		if (ageMonthsExact <= lowMidPoint) {
			return new Float(lowMidPoint);
		} else {
			return new Float(lowMidPoint + 1);
		}
	}
    
    public Float calculateWeightSD() {
    	if(weightKG == null || weightKG == 0) {
    	    return new Float(0);
    	}
    	
        Float ageMonths = exactAgeMonths;
		if (ageMonths.compareTo(new Float(240)) > 0) {
			ageMonths = new Float(240);
		}
    	
    	WeightForAgeLMS weightForAgeLMS = null;
    	try
    	{
    	    LOGGER.info("Look up WeightForAgeLMS for child sex: " + child.getSex() + ", age: " + ageMonths);
    	    weightForAgeLMS = (WeightForAgeLMS) WeightForAgeLMS.findWeightForAgeLMSsBySexAndAgeMonthsOldEquals(child.getSex(), ageMonths).getSingleResult();
    	    logLMS(weightForAgeLMS);
    	}
    	catch(Exception e)
        {
            LOGGER.error(e);
        }
    	
    	if(weightForAgeLMS == null) {
    	    return new Float(0);
    	}
    	else {
    	    double weightSDCalculated = calculateSD((double) weightKG, weightForAgeLMS); 
            LOGGER.info("weight = " + weightKG);
            LOGGER.info("calculated weightSD = " + weightSDCalculated);

            return new Float(weightSDCalculated);
    	}
    }
    
    public Float calculateHeightSD() {
        if(heightCM == null || heightCM.intValue() == 0) {
            return new Float(0);
        }
        
        Float ageMonths = exactAgeMonths;
        //Just do 24-240 months, younger and older would be N/A
        if(ageMonths.floatValue() < 24 || ageMonths.floatValue() > 240) {
            return new Float(0);
        }
        
        HeightForAgeLMS heightForAgeLMS = null;
        try
        {
            LOGGER.info("Look up HeightForAgeLMS for child sex: " + child.getSex() + ", age: " + ageMonths);
            heightForAgeLMS = (HeightForAgeLMS) HeightForAgeLMS.findHeightForAgeLMSsBySexAndAgeMonthsOldEquals(child.getSex(), ageMonths).getSingleResult();
            logLMS(heightForAgeLMS);
        }
        catch(Exception e)
        {
            LOGGER.error(e);
        }
        
        if(heightForAgeLMS == null) {
            return new Float(0);
        }
        else {
            double heightSDCalculated = calculateSD(heightCM.doubleValue(), heightForAgeLMS);
            LOGGER.info("height = " + heightCM);
            LOGGER.info("calculated HeightSD = " + heightSDCalculated);
            return new Float(heightSDCalculated);
        }
    }
    
    private void logLMS(LMS lms)
    {
        if(lms != null)
        {
            LOGGER.info("L: " + lms.getL() + ", M: " + lms.getM() + ", S: " + lms.getS());
        }
        else
        {
            LOGGER.info("LMS is null.");
        }
    }
    
    public Float calculateBmiSD() {
        if(bmi == null || bmi.doubleValue() == 0) {
            return new Float(0);
        }
        
        Float ageMonths = exactAgeMonths;
        if(ageMonths.floatValue() < 24 || ageMonths.floatValue() > 240.5) {
            return new Float(0);
        }
       
        BMIForAgeLMS bmiForAgeLMS = null;
        try
        {
            LOGGER.info("Look up BMIForAgeLMS for child sex: " + child.getSex() + ", age: " + ageMonths);
            bmiForAgeLMS = (BMIForAgeLMS) BMIForAgeLMS.findBMIForAgeLMSsBySexAndAgeMonthsOldEquals(child.getSex(), ageMonths).getSingleResult();
            logLMS(bmiForAgeLMS);
        }
        catch(Exception e)
        {
            LOGGER.error(e);
        }
        
        if(bmiForAgeLMS == null) {
            return new Float(0);
        }
        else {
            double bmiSDCalculated = calculateSD(bmi.doubleValue(), bmiForAgeLMS);
            LOGGER.info("bmi = " + bmi);
            LOGGER.info("calculated bmiSD = " + bmiSDCalculated);

            return new Float(bmiSDCalculated);
        }
    }
    
    private double calculateSD(double value, LMS lms) {
        return (Math.pow(value / lms.getM(), lms.getL()) - 1) / (lms.getL() * lms.getS());
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
