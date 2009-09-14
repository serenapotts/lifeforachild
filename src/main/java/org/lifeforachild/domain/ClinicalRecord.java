package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class ClinicalRecord {
	@Min(0)
	private Integer bloodGlucoseSelfMonitoringPerWeek;

	private Integer urineGlucoseSelfMonitoringPerWeek;
	
	private boolean adjustInsulinDoseIfNeeded;
	
	private Integer insulinUnitsPerDay;

	private Integer numberOfInsulinInjectionsPerDay;

	// Types of Insulin / RX used
	
	private boolean longActingHuman;
	
	private boolean shortActingHuman;
	
	private boolean analog;
	
	private boolean oralAgents;
	
	@Size (max=40)
	private String oralAgentsDescription;
	
	private Integer routineClinicReviewsLastYear;

	private boolean bpMedications;
	
	private boolean ACE_ARB;
	
	@Size (max=30)
	private String bpMedicationsOther;
	
	@Size(max=50)
	private String otherTreatments;
	
	private boolean LaserRxInLast12Months;
	
	private float weightKG;
	
	private Integer heightCM;
	
	public float bmi() {
		float result = 0.0f;
		if (heightCM != 0)
			result = weightKG / (heightCM * heightCM);
		
		return result;
	}
	
	private Integer bloodPressureSystolicMMHg;
	private Integer bloodPressureDiastolicMMHg;

	@Temporal(TemporalType.DATE)
	private Date dateOfMeasurement;

	private Integer age;
	
	private boolean hasPersistentHypertension;
	
	private boolean hasPubertyTannerB2_P2orGreater;
	
	private boolean menarche;
	
	@Temporal(TemporalType.DATE)
	private Date ifMenarcheAge;

	private boolean eyesExaminedInLastYear;
	
	private YesNoUnkownType cateract;
	
	@Size(max=20)
	private String visualAcuityRight;
	
	@Size(max=20)
	private String visualAcuityLeft;

	private boolean feetExaminedInLastYear;
	
	private boolean monofilamentTested;
	
	private boolean monofilamentAbnormal;
	
	private boolean tuningForkTested;
	
	private boolean tuningForkAbnormal;
	
	private YesNoLaterType lastHbA1cInLast12Months;
	
	private HbA1cMethodType hbA1cMethod;
	
	private String hbA1cMethodOther;
	
	private Integer microalbuminuriaValue;
	
	private MicroalbuminuriaUnitsType microalbuminuriaUnitOfMeasure;
	
	private String Proteinuria_dipstick_other; // TODO Make Enum
	
	private float creatinineValue;
	
	private CreatineUnitsType creatinineUnits;
	
	private float totalCholesterolValue;
	
	private MG_OR_MMOL_Type cholesterolUnits;
	
	private float hdlCholesterolValue;
	
	private MG_OR_MMOL_Type hdlUnits;
	
	private float triglyceridesValue;
	
	private MG_OR_MMOL_Type triglyceridesUnits;
	
	private YesNoUnkownType fasted;
	
	// Schooling
	private boolean attendingSchool;
	
	private NotAttendingSchoolReasonType notAttendingSchoolWhy;

	private boolean diabetesLimitingAttendance;
	
	private boolean appropriateGradeForAge;
	
	private DiabetesCopingType diabetesCopingAbilities;
	
	private Integer numberOfSevereHypoglycaemiaEpisodes;

	private Integer numberKetoacidosisEpisodes;
	
	private Integer numberOfHospitalAdmissionsRelatedToDiabetes;
	
	@Size(max=100)
	private String additionalComment;

	@ManyToOne
	private User personCompletingForm;
	
	private Date dateCompleted;
	
	@Size(max=30)
	private String seniorPhysician;
	
	private YesNoNAType literate;
	
	public float calculatedAge() {
		return calculateAge(dateCompleted, child.getDateOfBirth());
	}
	
	public float insulinPerKg() {
		return insulinUnitsPerDay/weightKG;
	}
	
	public static float calculateAge(Date date, Date dob) {
		return (float)((date.getTime() - dob.getTime())/(1000*60*60*24*365.25));
	}
	
	@ManyToOne
	Child child;
}
