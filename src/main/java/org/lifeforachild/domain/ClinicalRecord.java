package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
import org.lifeforachild.util.DecimalUtil;
import org.lifeforachild.enums.CreatineUnitsType;
import org.lifeforachild.enums.DiabetesCopingType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.MG_OR_MMOL_Type;
import org.lifeforachild.enums.MicroalbuminuriaUnitsType;
import org.lifeforachild.enums.NotAttendingSchoolReasonType;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.WhoAdjustsInsulinType;
import org.lifeforachild.enums.YesNoLaterType;
import org.lifeforachild.enums.YesNoType;
import org.lifeforachild.enums.YesNoUnkownType;
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
    
    private static final double AVERAGE_YEAR_MILLISECS = 1000 * 60 * 60 * 24 * 365.25;

    @Transient
    private static final Log LOGGER = LogFactory.getLog(ClinicalRecord.class);
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long id;
    
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
    private WhoAdjustsInsulinType adjustInsulinDoseIfNeeded;

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
    private YesNoUnkownType LaserRxInLast12Months;

    @Enumerated
    @NotNull(message = "Weight in last 12 months is required.")
    private YesNoType weightInLast12Months;
    
    @DecimalMin(value ="1.0")
    @DecimalMax(value = "150.0")
    private Float weightKG;

    @Enumerated
    @NotNull(message = "Height in last 12 months is required.")
    private YesNoType heightInLast12Months;
    
    @DecimalMin("45.0")
    @DecimalMax("230.0")
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
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date dateOfMeasurement;

    @Enumerated
    @NotNull(message = "Has persistent Hypertension is required.")
    private YesNoUnkownType hasPersistentHypertension;

    @Enumerated
    @NotNull(message = "Has puberty tanner is required.")
    private YesNoUnkownType hasPubertyTannerB2_P2orGreater;

    @Enumerated
    private YesNoUnkownType menarche;

    private String ifMenarcheAge;

    @Enumerated
    @NotNull(message = "Eyes examined is required.")
    private YesNoUnkownType eyesExaminedInLastYear;

    @Enumerated
    private YesNoUnkownType cateract;

    @Size(max = 20)
    private String visualAcuityRight;

    @Size(max = 20)
    private String visualAcuityLeft;

    @Size(max = 100)
    private String eyesComment;
    
    @Enumerated
    @NotNull(message = "Feet examined is required.")
    private YesNoUnkownType feetExaminedInLastYear;

    @Enumerated
    private YesNoType monofilamentTested;

    @Enumerated
    private YesNoType monofilamentAbnormal;

    @Enumerated
    private YesNoType tuningForkTested;

    @Enumerated
    private YesNoType tuningForkAbnormal;

    @Size(max = 100)
    private String feetComment;
    
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
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date dateCompleted;

    @NotNull(message = "Senior physician is required.")
    @Size(max = 30)
    private String seniorPhysician;

    @NotNull(message="Consent given is required")
    @Enumerated
    private ResearchConsentType consentGiven;    
    
    @Enumerated
    @NotNull(message = "Literate is required.")
    private YesNoType literate;

    private Float exactAge = null;
    private Float exactAgeMonths = null;
    
    private Float bmi = null;
    
    private Float insulinPerKg = null;
    
    private Float heightSD = null;
    
    private Float weightSD = null;
    
    private Float bmiSD = null;
    
    private Float bloodPressureSystolicSD = null;
    
    private Float bloodPressureDiastolicSD = null;    
    
    private Boolean isDeleted;   
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="dd/MM/yy", style = "S-")
    private Date dateReviewed;
    
    public static Float calculateBMI(Float weightKG, Float heightCM) {
        Float result = null;
        if (weightKG != null && heightCM != null && !heightCM.equals(new Integer(0))) {
            result = (float) (weightKG.floatValue() / (heightCM * heightCM / 10000.0));
            result = (float) DecimalUtil.roundToTwoDecimals(result);
        }
        
        LOGGER.debug("Weight: " + weightKG + ", Height: " + heightCM + ", BMI: " + result);
        
        return result;
    }
     
    public static Float calculateInsulinPerKg(Float weightKG, Integer insulinUnitsPerDay) {
    	if (weightKG == null || insulinUnitsPerDay == null)
    		return null;
        double value = insulinUnitsPerDay / weightKG;
        value = DecimalUtil.roundToOneDecimal(value);
    	return (float) value;
    }

    public static Float calculateAge(Date date, Date dob) {
    	if (date == null || dob == null)
    		return null;
        float result = (float) ((date.getTime() - dob.getTime()) / AVERAGE_YEAR_MILLISECS);
    	
    	result = (float) DecimalUtil.roundToTwoDecimals(result);
    	return result;
    }
    
	public static Float calculateExactAgeMonths(Float exactAgeInput) {
		if (exactAgeInput == null)
			return null;
		float ageMonthsExact = exactAgeInput * 12;
		double lowMidPoint = Math.floor(ageMonthsExact) + 0.5;
		if (ageMonthsExact <= lowMidPoint) {
			return new Float(lowMidPoint);
		} else {
			return new Float(lowMidPoint + 1);
		}
	}
    
    public static Float calculateWeightSD(Float exactAgeMonths, SexType childSex, Float weightKG) {
    	if(weightKG == null || weightKG == 0) {
    	    return null;
    	}
    	
        //calculated age is under 2 years or over 20 years, Weight SD should be left blank
		if (exactAgeMonths < 24 || exactAgeMonths > 240) {
			return null;
		}
    	
    	WeightForAgeLMS weightForAgeLMS = null;
    	try
    	{
    	    LOGGER.debug("Look up WeightForAgeLMS for child sex: " + childSex + ", age: " + exactAgeMonths);
    	    weightForAgeLMS = (WeightForAgeLMS) WeightForAgeLMS.findWeightForAgeLMSsBySexAndAgeMonthsOldEquals(childSex, exactAgeMonths).getSingleResult();
    	    logLMS(weightForAgeLMS);
    	}
    	catch(Exception e)
        {
            LOGGER.error("Exception while getting WeightLMS.", e);
        }
    	
    	if(weightForAgeLMS == null) {
    	    return null;
    	}
    	else {
    	    double weightSDCalculated = calculateSD((double) weightKG, weightForAgeLMS);
    	    weightSDCalculated = DecimalUtil.roundToTwoDecimals(weightSDCalculated);
    	    
            LOGGER.debug("weight = " + weightKG);
            LOGGER.debug("calculated weightSD = " + weightSDCalculated);

            return new Float(weightSDCalculated);
    	}
    }
    
    public static Float calculateHeightSD(Float exactAgeMonths, SexType childSex, Float heightCM) {
        if(heightCM == null || heightCM.intValue() == 0) {
            return null;
        }
        
        //if calculated age is under 2 years, heightSD is left blank
        if(exactAgeMonths < 24){
            return null;
        }
        
        //if calculated age is over 20 years, Height SD should calculate as per that for 240 months (20 years)
        if(exactAgeMonths > 240) {
            exactAgeMonths = new Float(240);
        }
        
        HeightForAgeLMS heightForAgeLMS = null;
        try
        {
            LOGGER.debug("Look up HeightForAgeLMS for child sex: " + childSex + ", age: " + exactAgeMonths);
            heightForAgeLMS = (HeightForAgeLMS) HeightForAgeLMS.findHeightForAgeLMSsBySexAndAgeMonthsOldEquals(childSex, exactAgeMonths).getSingleResult();
            logLMS(heightForAgeLMS);
        }
        catch(Exception e)
        {
            LOGGER.error("Exception while getting HeightLMS.", e);
        }
        
        if(heightForAgeLMS == null) {
            return null;
        }
        else {
            double heightSDCalculated = calculateSD(heightCM.doubleValue(), heightForAgeLMS);
            heightSDCalculated = DecimalUtil.roundToTwoDecimals(heightSDCalculated);
            LOGGER.debug("height = " + heightCM);
            LOGGER.debug("calculated HeightSD = " + heightSDCalculated);
            return new Float(heightSDCalculated);
        }
    }
    
    private static void logLMS(LMS lms)
    {
        if(lms != null)
        {
            LOGGER.debug("L: " + lms.getL() + ", M: " + lms.getM() + ", S: " + lms.getS());
        }
        else
        {
            LOGGER.debug("LMS is null.");
        }
    }
    
    public static Float calculateBmiSD(Float exactAgeMonths, SexType childSex, Float bmi) {
        if(bmi == null || bmi.doubleValue() == 0) {
            return null;
        }
        
        Float ageMonths = exactAgeMonths;
        //BMI LMS table has value for 240.5, so we take that into consideration
        if(ageMonths < 24 || ageMonths > 240.5) {
            return null;
        }
       
        BMIForAgeLMS bmiForAgeLMS = null;
        try
        {
            LOGGER.debug("Look up BMIForAgeLMS for child sex: " + childSex + ", age: " + exactAgeMonths);
            bmiForAgeLMS = (BMIForAgeLMS) BMIForAgeLMS.findBMIForAgeLMSsBySexAndAgeMonthsOldEquals(childSex, ageMonths).getSingleResult();
            logLMS(bmiForAgeLMS);
        }
        catch(Exception e)
        {
            LOGGER.error(e);
        }
        
        if(bmiForAgeLMS == null) {
            return null;
        }
        else {
            double bmiSDCalculated = calculateSD(bmi.doubleValue(), bmiForAgeLMS);
            bmiSDCalculated = DecimalUtil.roundToTwoDecimals(bmiSDCalculated);
            LOGGER.debug("bmi = " + bmi);
            LOGGER.debug("calculated bmiSD = " + bmiSDCalculated);

            return new Float(bmiSDCalculated);
        }
    }
    
    private static double calculateSD(double value, LMS lms) {
        return (Math.pow(value / lms.getM(), lms.getL()) - 1) / (lms.getL() * lms.getS());
    }
    
    private static double calcExpectedSystolicBP(Float exactAge, SexType childSex, Float heightSD) {
        if(childSex == SexType.MALE) {
            return 102.19768 + 1.82416*(exactAge-10) + 0.12776*Math.pow(exactAge-10, 2) 
                  + 0.00249*Math.pow((exactAge-10), 3) - 0.00135*Math.pow((exactAge-10), 4) 
                  + 2.73157*(heightSD) - 0.19618*Math.pow(heightSD, 2) 
                  - 0.04659*Math.pow(heightSD, 3) + 0.00947*Math.pow(heightSD, 4);
            
        }
        else if(childSex == SexType.FEMALE) {
            return 102.01027 + 1.94397*(exactAge-10) + 0.00598*Math.pow((exactAge-10), 2) 
                  - 0.00789*Math.pow((exactAge-10), 3) - 0.00059*Math.pow((exactAge-10), 4) 
                  + 2.03526*(heightSD) - 0.02534*Math.pow(heightSD, 2) - 0.01884*Math.pow(heightSD, 3)
                  + 0.00121*Math.pow(heightSD, 4);
        }
        else {
            return 0;
        }
    }
    
    public static Float calcSystolicBloodPressureSD(Float exactAge, SexType childSex, Float heightSD, Integer bloodPressureSystolicMMHg) {
        if(heightSD == null || heightSD == 0 || bloodPressureSystolicMMHg == null || bloodPressureSystolicMMHg == 0)
        {
            return null;
        }
        
        LOGGER.debug("calcSystolicBloodPressureSD parameters: exactAge = " + exactAge + ", childSex: " + childSex + ", heightSD: " + heightSD + ", bloodPressureSystolicMMHg: " + bloodPressureSystolicMMHg);
        
        double expectedSystolicBP = calcExpectedSystolicBP(exactAge, childSex, heightSD);
        
        if(childSex == SexType.MALE) {
            double value = (bloodPressureSystolicMMHg - expectedSystolicBP) / 10.7128;
            value = DecimalUtil.roundToTwoDecimals(value);
            LOGGER.debug("Calculated systolicBloodPressureSD: " + value);
            return new Float(value);
        }
        else if(childSex == SexType.FEMALE) {
            double value = (bloodPressureSystolicMMHg - expectedSystolicBP) / 10.4855;
            value = DecimalUtil.roundToTwoDecimals(value);
            LOGGER.debug("Calculated systolicBloodPressureSD: " + value);
            return new Float(value);
        }
        else {
            return null;
        }
    }
    
    private static double calcExpectedDiastolicBP(Float exactAge, SexType childSex, Float heightSD) {
        if(childSex == SexType.MALE) {
            return 61.01207 + 0.68314*(exactAge-10) - 0.09835*Math.pow((exactAge-10), 2) 
                  + 0.01711*Math.pow((exactAge-10), 3) + 0.00045*Math.pow((exactAge-10), 4)
                  + 1.46993*(heightSD) - 0.07849*Math.pow(heightSD, 2)
                  - 0.03114*Math.pow(heightSD, 3) - 0.00967*Math.pow(heightSD, 4); 
        }
        else if(childSex == SexType.FEMALE) {
            return 60.5051+1.01301*(exactAge-10) + 0.01157*Math.pow((exactAge-10), 2)
                  + 0.00424*Math.pow((exactAge-10), 3) - 0.00137*Math.pow((exactAge-10), 4)
                  + 1.16641*(heightSD) + 0.12795*Math.pow(heightSD, 2) 
                  - 0.03869*Math.pow(heightSD, 3) - 0.00079*Math.pow(heightSD, 4); 
        }
        else {
            return 0;
        }
    }
    
    public static Float calcDiastolicBloodPressureSD(Float exactAge, SexType childSex, Float heightSD, Integer bloodPressureDiastolicMMHg) {
        if(heightSD == null || heightSD == 0 || bloodPressureDiastolicMMHg == null || bloodPressureDiastolicMMHg == 0)
        {
            return null;
        }
        
        LOGGER.debug("calcDiastolicBloodPressureSD parameters: exactAge = " + exactAge + ", childSex: " + childSex + ", heightSD: " + heightSD + ", bloodPressureDiastolicMMHg: " + bloodPressureDiastolicMMHg);
        
        double expectedDiastolicBP = calcExpectedDiastolicBP(exactAge, childSex, heightSD);
        
        if(childSex == SexType.MALE) {
            double value = (bloodPressureDiastolicMMHg - expectedDiastolicBP) / 11.6032;
            value = DecimalUtil.roundToTwoDecimals(value);
            LOGGER.debug("Calculated diastolicBloodPressureSD: " + value);
            return new Float(value);
        }
        else if(childSex == SexType.FEMALE) {
            double value = (bloodPressureDiastolicMMHg - expectedDiastolicBP) / 10.9573;
            value = DecimalUtil.roundToTwoDecimals(value);
            LOGGER.debug("Calculated diastolicBloodPressureSD: " + value);
            return new Float(value);
        }
        else {
            return null;
        }
    }
}
