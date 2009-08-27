package org.lifeforachild.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooEntity
@RooJavaBean
@RooToString
public class ClinicalRecord {
	@Size(max=56)
	private int bloodGlucoseSelfMonitoringPerWeek;

	private int urineGlucoseSelfMonitoringPerWeek;
	
	private boolean adjustInsulinDoseIfNeeded;

	@Size(max=200)
	private int insulinUnitsPerDay;

	@Size (max=9)
	private int numberOfInsulinInjectionsPerDay;

	// Types of Insulin / RX used
	
	private boolean longActingHuman;
	
	private boolean shortActingHuman;
	
	private boolean analog;
	
	private boolean oralAgents;
	
	@Size (max=40)
	private String oralAgentsDescription;
	
	@Size (max=50)
	private int routineClinicReviewsLastYear;

	private boolean bpMedications;
	
	private boolean ACE_ARB;
	
	@Size (max=30)
	private String bpMedicationsOther;
	
	@Size(max=50)
	private String otherTreatments;
	
	private boolean LaserRxInLast12Months;
	
	private float weightKG;
	
	private int heightCM;
	
	private int bloodPressureSystolicMMHg;
	private int bloodPressureDiastolicMMHg;

	@Temporal(TemporalType.DATE)
	private Date dateOfMeasurement;

	private int age;
	
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
	
	private int microalbuminuriaValue;
	
	private MicroalbuminuriaUnitsType microalbuminuriaUnitOfMeasure;
	
	private String Proteinuria_dipstick_other; // TODO Make Enum
	
	private float creatinineValue;
	
	private CreatineUnitsType creatinineUnits;
	
	private float totalCholesterolValue;
	
	private MG_OR_MMOL_Type cholesterolUnits;
	
	private float hDLCholesterolValue;
	
	private MG_OR_MMOL_Type hDLUnits;
	
	private float triglyceridesValue;
	
	private MG_OR_MMOL_Type triglyceridesUnits;
	
	private YesNoUnkownType fasted;
	
	// Schooling
	private boolean attendingSchool;
	
	private NotAttendingSchoolReasonType notAttendingSchoolWhy;

	private boolean diabetesLimitingAttendance;
	
	private boolean appropriateGradeForAge;
	
	private DiabetesCopingType diabetesCopingAbilities;
	
	private int numberOfSevereHypoglycaemiaEpisodes;

	private int numberKetoacidosisEpisodes;
	
	private int numberOfHospitalAdmissionsRelatedToDiabetes;
	
	@Size(max=100)
	private String additionalComment;

	@ManyToOne
	private User personCompletingForm;
	
	private Date dateCompleted;
	
	@Size(max=30)
	private String seniorPhysician;
	
	@ManyToOne
	Child child;
}
