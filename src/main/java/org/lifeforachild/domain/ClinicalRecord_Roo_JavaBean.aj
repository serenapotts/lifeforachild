package org.lifeforachild.domain;

import java.lang.Float;
import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.User;
import org.lifeforachild.enums.CreatineUnitsType;
import org.lifeforachild.enums.DiabetesCopingType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.MG_OR_MMOL_Type;
import org.lifeforachild.enums.MicroalbuminuriaUnitsType;
import org.lifeforachild.enums.NotAttendingSchoolReasonType;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.enums.WhoAdjustsInsulinType;
import org.lifeforachild.enums.YesNoLaterType;
import org.lifeforachild.enums.YesNoType;
import org.lifeforachild.enums.YesNoUnkownType;

privileged aspect ClinicalRecord_Roo_JavaBean {
    
    public Child ClinicalRecord.getChild() {    
        return this.child;        
    }    
    
    public void ClinicalRecord.setChild(Child child) {    
        this.child = child;        
    }    
    
    public Integer ClinicalRecord.getBloodGlucoseSelfMonitoringPerWeek() {    
        return this.bloodGlucoseSelfMonitoringPerWeek;        
    }    
    
    public void ClinicalRecord.setBloodGlucoseSelfMonitoringPerWeek(Integer bloodGlucoseSelfMonitoringPerWeek) {    
        this.bloodGlucoseSelfMonitoringPerWeek = bloodGlucoseSelfMonitoringPerWeek;        
    }    
    
    public Integer ClinicalRecord.getUrineGlucoseSelfMonitoringPerWeek() {    
        return this.urineGlucoseSelfMonitoringPerWeek;        
    }    
    
    public void ClinicalRecord.setUrineGlucoseSelfMonitoringPerWeek(Integer urineGlucoseSelfMonitoringPerWeek) {    
        this.urineGlucoseSelfMonitoringPerWeek = urineGlucoseSelfMonitoringPerWeek;        
    }    
    
    public WhoAdjustsInsulinType ClinicalRecord.getAdjustInsulinDoseIfNeeded() {    
        return this.adjustInsulinDoseIfNeeded;        
    }    
    
    public void ClinicalRecord.setAdjustInsulinDoseIfNeeded(WhoAdjustsInsulinType adjustInsulinDoseIfNeeded) {    
        this.adjustInsulinDoseIfNeeded = adjustInsulinDoseIfNeeded;        
    }    
    
    public Integer ClinicalRecord.getInsulinUnitsPerDay() {    
        return this.insulinUnitsPerDay;        
    }    
    
    public void ClinicalRecord.setInsulinUnitsPerDay(Integer insulinUnitsPerDay) {    
        this.insulinUnitsPerDay = insulinUnitsPerDay;        
    }    
    
    public Integer ClinicalRecord.getNumberOfInsulinInjectionsPerDay() {    
        return this.numberOfInsulinInjectionsPerDay;        
    }    
    
    public void ClinicalRecord.setNumberOfInsulinInjectionsPerDay(Integer numberOfInsulinInjectionsPerDay) {    
        this.numberOfInsulinInjectionsPerDay = numberOfInsulinInjectionsPerDay;        
    }    
    
    public YesNoType ClinicalRecord.getLongActingHuman() {    
        return this.longActingHuman;        
    }    
    
    public void ClinicalRecord.setLongActingHuman(YesNoType longActingHuman) {    
        this.longActingHuman = longActingHuman;        
    }    
    
    public YesNoType ClinicalRecord.getShortActingHuman() {    
        return this.shortActingHuman;        
    }    
    
    public void ClinicalRecord.setShortActingHuman(YesNoType shortActingHuman) {    
        this.shortActingHuman = shortActingHuman;        
    }    
    
    public YesNoType ClinicalRecord.getAnalog() {    
        return this.analog;        
    }    
    
    public void ClinicalRecord.setAnalog(YesNoType analog) {    
        this.analog = analog;        
    }    
    
    public YesNoType ClinicalRecord.getOralAgents() {    
        return this.oralAgents;        
    }    
    
    public void ClinicalRecord.setOralAgents(YesNoType oralAgents) {    
        this.oralAgents = oralAgents;        
    }    
    
    public String ClinicalRecord.getOralAgentsDescription() {    
        return this.oralAgentsDescription;        
    }    
    
    public void ClinicalRecord.setOralAgentsDescription(String oralAgentsDescription) {    
        this.oralAgentsDescription = oralAgentsDescription;        
    }    
    
    public Integer ClinicalRecord.getRoutineClinicReviewsLastYear() {    
        return this.routineClinicReviewsLastYear;        
    }    
    
    public void ClinicalRecord.setRoutineClinicReviewsLastYear(Integer routineClinicReviewsLastYear) {    
        this.routineClinicReviewsLastYear = routineClinicReviewsLastYear;        
    }    
    
    public YesNoType ClinicalRecord.getBpMedications() {    
        return this.bpMedications;        
    }    
    
    public void ClinicalRecord.setBpMedications(YesNoType bpMedications) {    
        this.bpMedications = bpMedications;        
    }    
    
    public YesNoType ClinicalRecord.getAcearb() {    
        return this.acearb;        
    }    
    
    public void ClinicalRecord.setAcearb(YesNoType acearb) {    
        this.acearb = acearb;        
    }    
    
    public String ClinicalRecord.getBpMedicationsOther() {    
        return this.bpMedicationsOther;        
    }    
    
    public void ClinicalRecord.setBpMedicationsOther(String bpMedicationsOther) {    
        this.bpMedicationsOther = bpMedicationsOther;        
    }    
    
    public String ClinicalRecord.getOtherTreatments() {    
        return this.otherTreatments;        
    }    
    
    public void ClinicalRecord.setOtherTreatments(String otherTreatments) {    
        this.otherTreatments = otherTreatments;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getLaserRxInLast12Months() {    
        return this.LaserRxInLast12Months;        
    }    
    
    public void ClinicalRecord.setLaserRxInLast12Months(YesNoUnkownType LaserRxInLast12Months) {    
        this.LaserRxInLast12Months = LaserRxInLast12Months;        
    }    
    
    public YesNoType ClinicalRecord.getWeightInLast12Months() {    
        return this.weightInLast12Months;        
    }    
    
    public void ClinicalRecord.setWeightInLast12Months(YesNoType weightInLast12Months) {    
        this.weightInLast12Months = weightInLast12Months;        
    }   
    
    public Float ClinicalRecord.getWeightKG() {    
        return this.weightKG;        
    }    
    
    public void ClinicalRecord.setWeightKG(Float weightKG) {    
        this.weightKG = weightKG;        
    }    
    
    public YesNoType ClinicalRecord.getHeightInLast12Months() {    
        return this.heightInLast12Months;        
    }    
    
    public void ClinicalRecord.setHeightInLast12Months(YesNoType heightInLast12Months) {    
        this.heightInLast12Months = heightInLast12Months;        
    }   
    
    public Float ClinicalRecord.getHeightCM() {    
        return this.heightCM;        
    }    
    
    public void ClinicalRecord.setHeightCM(Float heightCM) {    
        this.heightCM = heightCM;        
    }    
    
    public YesNoType ClinicalRecord.getBPInLast12Months() {    
        return this.BPInLast12Months;        
    }    
    
    public void ClinicalRecord.setBPInLast12Months(YesNoType BPInLast12Months) {    
        this.BPInLast12Months = BPInLast12Months;        
    }   
    
    public Integer ClinicalRecord.getBloodPressureSystolicMMHg() {    
        return this.bloodPressureSystolicMMHg;        
    }    
    
    public void ClinicalRecord.setBloodPressureSystolicMMHg(Integer bloodPressureSystolicMMHg) {    
        this.bloodPressureSystolicMMHg = bloodPressureSystolicMMHg;        
    }    
    
    public Integer ClinicalRecord.getBloodPressureDiastolicMMHg() {    
        return this.bloodPressureDiastolicMMHg;        
    }    
    
    public void ClinicalRecord.setBloodPressureDiastolicMMHg(Integer bloodPressureDiastolicMMHg) {    
        this.bloodPressureDiastolicMMHg = bloodPressureDiastolicMMHg;        
    }    
    
    public Date ClinicalRecord.getDateOfMeasurement() {    
        return this.dateOfMeasurement;        
    }    
    
    public void ClinicalRecord.setDateOfMeasurement(Date dateOfMeasurement) {    
        this.dateOfMeasurement = dateOfMeasurement;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getHasPersistentHypertension() {    
        return this.hasPersistentHypertension;        
    }    
    
    public void ClinicalRecord.setHasPersistentHypertension(YesNoUnkownType hasPersistentHypertension) {    
        this.hasPersistentHypertension = hasPersistentHypertension;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getHasPubertyTannerB2_P2orGreater() {    
        return this.hasPubertyTannerB2_P2orGreater;        
    }    
    
    public void ClinicalRecord.setHasPubertyTannerB2_P2orGreater(YesNoUnkownType hasPubertyTannerB2_P2orGreater) {    
        this.hasPubertyTannerB2_P2orGreater = hasPubertyTannerB2_P2orGreater;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getMenarche() {    
        return this.menarche;        
    }    
    
    public void ClinicalRecord.setMenarche(YesNoUnkownType menarche) {    
        this.menarche = menarche;        
    }    
    
    public String ClinicalRecord.getIfMenarcheAge() {    
        return this.ifMenarcheAge;        
    }    
    
    public void ClinicalRecord.setIfMenarcheAge(String ifMenarcheAge) {    
        this.ifMenarcheAge = ifMenarcheAge;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getEyesExaminedInLastYear() {    
        return this.eyesExaminedInLastYear;        
    }    
    
    public void ClinicalRecord.setEyesExaminedInLastYear(YesNoUnkownType eyesExaminedInLastYear) {    
        this.eyesExaminedInLastYear = eyesExaminedInLastYear;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getCateract() {    
        return this.cateract;        
    }    
    
    public void ClinicalRecord.setCateract(YesNoUnkownType cateract) {    
        this.cateract = cateract;        
    }    
    
    public String ClinicalRecord.getVisualAcuityRight() {    
        return this.visualAcuityRight;        
    }    
    
    public void ClinicalRecord.setVisualAcuityRight(String visualAcuityRight) {    
        this.visualAcuityRight = visualAcuityRight;        
    }    
    
    public String ClinicalRecord.getVisualAcuityLeft() {    
        return this.visualAcuityLeft;        
    }    
    
    public void ClinicalRecord.setVisualAcuityLeft(String visualAcuityLeft) {    
        this.visualAcuityLeft = visualAcuityLeft;        
    }    
    
    public String ClinicalRecord.getEyesComment() {    
        return this.eyesComment;        
    }    
    
    public void ClinicalRecord.setEyesComment(String eyesComment) {    
        this.eyesComment = eyesComment;        
    }       
    
    public YesNoUnkownType ClinicalRecord.getFeetExaminedInLastYear() {    
        return this.feetExaminedInLastYear;        
    }    
    
    public void ClinicalRecord.setFeetExaminedInLastYear(YesNoUnkownType feetExaminedInLastYear) {    
        this.feetExaminedInLastYear = feetExaminedInLastYear;        
    }    
    
    public YesNoType ClinicalRecord.getMonofilamentTested() {    
        return this.monofilamentTested;        
    }    
    
    public void ClinicalRecord.setMonofilamentTested(YesNoType monofilamentTested) {    
        this.monofilamentTested = monofilamentTested;        
    }    
    
    public YesNoType ClinicalRecord.getMonofilamentAbnormal() {    
        return this.monofilamentAbnormal;        
    }    
    
    public void ClinicalRecord.setMonofilamentAbnormal(YesNoType monofilamentAbnormal) {    
        this.monofilamentAbnormal = monofilamentAbnormal;        
    }    
    
    public YesNoType ClinicalRecord.getTuningForkTested() {    
        return this.tuningForkTested;        
    }    
    
    public void ClinicalRecord.setTuningForkTested(YesNoType tuningForkTested) {    
        this.tuningForkTested = tuningForkTested;        
    }    
    
    public YesNoType ClinicalRecord.getTuningForkAbnormal() {    
        return this.tuningForkAbnormal;        
    }    
    
    public void ClinicalRecord.setTuningForkAbnormal(YesNoType tuningForkAbnormal) {    
        this.tuningForkAbnormal = tuningForkAbnormal;        
    }    
    
    public String ClinicalRecord.getFeetComment() {    
        return this.feetComment;        
    }    
    
    public void ClinicalRecord.setFeetComment(String feetComment) {    
        this.feetComment = feetComment;        
    }   
    
    public YesNoLaterType ClinicalRecord.getLastHbA1cInLast12Months() {    
        return this.lastHbA1cInLast12Months;        
    }    
    
    public void ClinicalRecord.setLastHbA1cInLast12Months(YesNoLaterType lastHbA1cInLast12Months) {    
        this.lastHbA1cInLast12Months = lastHbA1cInLast12Months;        
    }    
    
    public Float ClinicalRecord.getHbA1cPercentage() {    
        return this.hbA1cPercentage;        
    }    
    
    public void ClinicalRecord.setHbA1cPercentage(Float hbA1cPercentage) {    
        this.hbA1cPercentage = hbA1cPercentage;        
    }    
    
    public HbA1cMethodType ClinicalRecord.getHbA1cMethod() {    
        return this.hbA1cMethod;        
    }    
    
    public void ClinicalRecord.setHbA1cMethod(HbA1cMethodType hbA1cMethod) {    
        this.hbA1cMethod = hbA1cMethod;        
    }    
    
    public String ClinicalRecord.getHbA1cMethodOther() {    
        return this.hbA1cMethodOther;        
    }    
    
    public void ClinicalRecord.setHbA1cMethodOther(String hbA1cMethodOther) {    
        this.hbA1cMethodOther = hbA1cMethodOther;        
    }    
    
    public YesNoLaterType ClinicalRecord.getMicroalbuminuriaInLast12Months() {    
        return this.microalbuminuriaInLast12Months;        
    }    
    
    public void ClinicalRecord.setMicroalbuminuriaInLast12Months(YesNoLaterType microalbuminuriaInLast12Months) {    
        this.microalbuminuriaInLast12Months = microalbuminuriaInLast12Months;        
    } 
    
    public String ClinicalRecord.getMicroalbuminuriaValue() {    
        return this.microalbuminuriaValue;        
    }    
    
    public void ClinicalRecord.setMicroalbuminuriaValue(String microalbuminuriaValue) {    
        this.microalbuminuriaValue = microalbuminuriaValue;        
    }    
    
    public MicroalbuminuriaUnitsType ClinicalRecord.getMicroalbuminuriaUnitOfMeasure() {    
        return this.microalbuminuriaUnitOfMeasure;        
    }    
    
    public void ClinicalRecord.setMicroalbuminuriaUnitOfMeasure(MicroalbuminuriaUnitsType microalbuminuriaUnitOfMeasure) {    
        this.microalbuminuriaUnitOfMeasure = microalbuminuriaUnitOfMeasure;        
    }    
    
    public String ClinicalRecord.getProteinuria_dipstick_other() {    
        return this.Proteinuria_dipstick_other;        
    }    
    
    public void ClinicalRecord.setProteinuria_dipstick_other(String Proteinuria_dipstick_other) {    
        this.Proteinuria_dipstick_other = Proteinuria_dipstick_other;        
    }    
    
    public YesNoLaterType ClinicalRecord.getCreatinineInLast12Months() {    
        return this.creatinineInLast12Months;        
    }    
    
    public void ClinicalRecord.setCreatinineInLast12Months(YesNoLaterType creatinineInLast12Months) {    
        this.creatinineInLast12Months = creatinineInLast12Months;        
    } 
    
    public Float ClinicalRecord.getCreatinineValue() {    
        return this.creatinineValue;        
    }    
    
    public void ClinicalRecord.setCreatinineValue(Float creatinineValue) {    
        this.creatinineValue = creatinineValue;        
    }    
    
    public CreatineUnitsType ClinicalRecord.getCreatinineUnits() {    
        return this.creatinineUnits;        
    }    
    
    public void ClinicalRecord.setCreatinineUnits(CreatineUnitsType creatinineUnits) {    
        this.creatinineUnits = creatinineUnits;        
    }    
    
    public YesNoLaterType ClinicalRecord.getTotalCholesterolInLast12Months() {    
        return this.totalCholesterolInLast12Months;        
    }    
    
    public void ClinicalRecord.setTotalCholesterolInLast12Months(YesNoLaterType totalCholesterolInLast12Months) {    
        this.totalCholesterolInLast12Months = totalCholesterolInLast12Months;        
    } 
    
    public Float ClinicalRecord.getTotalCholesterolValue() {    
        return this.totalCholesterolValue;        
    }    
    
    public void ClinicalRecord.setTotalCholesterolValue(Float totalCholesterolValue) {    
        this.totalCholesterolValue = totalCholesterolValue;        
    }    
    
    public MG_OR_MMOL_Type ClinicalRecord.getCholesterolUnits() {    
        return this.cholesterolUnits;        
    }    
    
    public void ClinicalRecord.setCholesterolUnits(MG_OR_MMOL_Type cholesterolUnits) {    
        this.cholesterolUnits = cholesterolUnits;        
    }    
    
    public YesNoLaterType ClinicalRecord.getHdlCholesterolInLast12Months() {    
        return this.hdlCholesterolInLast12Months;        
    }    
    
    public void ClinicalRecord.setHdlCholesterolInLast12Months(YesNoLaterType hdlCholesterolInLast12Months) {    
        this.hdlCholesterolInLast12Months = hdlCholesterolInLast12Months;        
    } 
    
    public Float ClinicalRecord.getHdlCholesterolValue() {    
        return this.hdlCholesterolValue;        
    }    
    
    public void ClinicalRecord.setHdlCholesterolValue(Float hdlCholesterolValue) {    
        this.hdlCholesterolValue = hdlCholesterolValue;        
    }    
    
    public MG_OR_MMOL_Type ClinicalRecord.getHdlUnits() {    
        return this.hdlUnits;        
    }    
    
    public void ClinicalRecord.setHdlUnits(MG_OR_MMOL_Type hdlUnits) {    
        this.hdlUnits = hdlUnits;        
    }    
    
    public YesNoLaterType ClinicalRecord.getTriglyceridesInLast12Months() {    
        return this.triglyceridesInLast12Months;        
    }    
    
    public void ClinicalRecord.setTriglyceridesInLast12Months(YesNoLaterType triglyceridesInLast12Months) {    
        this.triglyceridesInLast12Months = triglyceridesInLast12Months;        
    } 
    
    public Float ClinicalRecord.getTriglyceridesValue() {    
        return this.triglyceridesValue;        
    }    
    
    public void ClinicalRecord.setTriglyceridesValue(Float triglyceridesValue) {    
        this.triglyceridesValue = triglyceridesValue;        
    }    
    
    public MG_OR_MMOL_Type ClinicalRecord.getTriglyceridesUnits() {    
        return this.triglyceridesUnits;        
    }    
    
    public void ClinicalRecord.setTriglyceridesUnits(MG_OR_MMOL_Type triglyceridesUnits) {    
        this.triglyceridesUnits = triglyceridesUnits;        
    }    
    
    public YesNoUnkownType ClinicalRecord.getFasted() {    
        return this.fasted;        
    }    
    
    public void ClinicalRecord.setFasted(YesNoUnkownType fasted) {    
        this.fasted = fasted;        
    }    
    
    public YesNoType ClinicalRecord.getAttendingSchool() {    
        return this.attendingSchool;        
    }    
    
    public void ClinicalRecord.setAttendingSchool(YesNoType attendingSchool) {    
        this.attendingSchool = attendingSchool;        
    }    
    
    public NotAttendingSchoolReasonType ClinicalRecord.getNotAttendingSchoolWhy() {    
        return this.notAttendingSchoolWhy;        
    }    
    
    public void ClinicalRecord.setNotAttendingSchoolWhy(NotAttendingSchoolReasonType notAttendingSchoolWhy) {    
        this.notAttendingSchoolWhy = notAttendingSchoolWhy;        
    }    
    
    public YesNoType ClinicalRecord.getDiabetesLimitingAttendance() {    
        return this.diabetesLimitingAttendance;        
    }    
    
    public void ClinicalRecord.setDiabetesLimitingAttendance(YesNoType diabetesLimitingAttendance) {    
        this.diabetesLimitingAttendance = diabetesLimitingAttendance;        
    }    
    
    public YesNoType ClinicalRecord.getAppropriateGradeForAge() {    
        return this.appropriateGradeForAge;        
    }    
    
    public void ClinicalRecord.setAppropriateGradeForAge(YesNoType appropriateGradeForAge) {    
        this.appropriateGradeForAge = appropriateGradeForAge;        
    }    
    
    public DiabetesCopingType ClinicalRecord.getDiabetesCopingAbilities() {    
        return this.diabetesCopingAbilities;        
    }    
    
    public void ClinicalRecord.setDiabetesCopingAbilities(DiabetesCopingType diabetesCopingAbilities) {    
        this.diabetesCopingAbilities = diabetesCopingAbilities;        
    }    
    
    public Integer ClinicalRecord.getNumberOfSevereHypoglycaemiaEpisodes() {    
        return this.numberOfSevereHypoglycaemiaEpisodes;        
    }    
    
    public void ClinicalRecord.setNumberOfSevereHypoglycaemiaEpisodes(Integer numberOfSevereHypoglycaemiaEpisodes) {    
        this.numberOfSevereHypoglycaemiaEpisodes = numberOfSevereHypoglycaemiaEpisodes;        
    }       
    
    public Integer ClinicalRecord.getNumberKetoacidosisEpisodes() {    
        return this.numberKetoacidosisEpisodes;        
    }    
    
    public void ClinicalRecord.setNumberKetoacidosisEpisodes(Integer numberKetoacidosisEpisodes) {    
        this.numberKetoacidosisEpisodes = numberKetoacidosisEpisodes;        
    }    
    
    
    public Integer ClinicalRecord.getNumberOfHospitalAdmissionsRelatedToDiabetes() {    
        return this.numberOfHospitalAdmissionsRelatedToDiabetes;        
    }    
    
    public void ClinicalRecord.setNumberOfHospitalAdmissionsRelatedToDiabetes(Integer numberOfHospitalAdmissionsRelatedToDiabetes) {    
        this.numberOfHospitalAdmissionsRelatedToDiabetes = numberOfHospitalAdmissionsRelatedToDiabetes;        
    }        
    
    public String ClinicalRecord.getAdditionalComment() {    
        return this.additionalComment;        
    }    
    
    public void ClinicalRecord.setAdditionalComment(String additionalComment) {    
        this.additionalComment = additionalComment;        
    }    
    
    public User ClinicalRecord.getPersonCompletingForm() {    
        return this.personCompletingForm;        
    }    
    
    public void ClinicalRecord.setPersonCompletingForm(User personCompletingForm) {    
        this.personCompletingForm = personCompletingForm;        
    }    
    
    public Date ClinicalRecord.getDateCompleted() {    
        return this.dateCompleted;        
    }    
    
    public void ClinicalRecord.setDateCompleted(Date dateCompleted) {    
        this.dateCompleted = dateCompleted;        
    }    
    
    public String ClinicalRecord.getSeniorPhysician() {    
        return this.seniorPhysician;        
    }    
    
    public void ClinicalRecord.setSeniorPhysician(String seniorPhysician) {    
        this.seniorPhysician = seniorPhysician;        
    }    
    
    public YesNoType ClinicalRecord.getLiterate() {    
        return this.literate;        
    }    
    
    public void ClinicalRecord.setLiterate(YesNoType literate) {    
        this.literate = literate;        
    }    
    
    public Float ClinicalRecord.getExactAge() {    
        return this.exactAge;        
    }    
    
    public void ClinicalRecord.setExactAge(Float exactAge) {    
        this.exactAge = exactAge;        
    }  
    
    public void ClinicalRecord.setExactAgeMonths(Float exactAgeMonths) {    
        this.exactAgeMonths = exactAgeMonths;        
    } 
    
    public Float ClinicalRecord.getExactAgeMonths() {    
        return this.exactAgeMonths;        
    }
    
    public Float ClinicalRecord.getBmi() {    
        return this.bmi;        
    }    
    
    public void ClinicalRecord.setBmi(Float bmi) {    
        this.bmi = bmi;        
    }    
    
    public Float ClinicalRecord.getInsulinPerKg() {    
        return this.insulinPerKg;        
    }    
    
    public void ClinicalRecord.setInsulinPerKg(Float insulinPerKg) {    
        this.insulinPerKg = insulinPerKg;        
    }    
    
    public Float ClinicalRecord.getHeightSD() {    
        return this.heightSD;        
    }    
    
    public void ClinicalRecord.setHeightSD(Float heightSD) {    
        this.heightSD = heightSD;        
    }    
    
    public Float ClinicalRecord.getWeightSD() {    
        return this.weightSD;        
    }    
    
    public void ClinicalRecord.setWeightSD(Float weightSD) {    
        this.weightSD = weightSD;        
    }    
    
    public Float ClinicalRecord.getBmiSD() {    
        return this.bmiSD;        
    }    
    
    public void ClinicalRecord.setBmiSD(Float bmiSD) {    
        this.bmiSD = bmiSD;        
    }    
    
    public Float ClinicalRecord.getBloodPressureSystolicSD() {    
        return this.BloodPressureSystolicSD;        
    }    
    
    public void ClinicalRecord.setBloodPressureSystolicSD(Float BloodPressureSystolicSD) {    
        this.BloodPressureSystolicSD = BloodPressureSystolicSD;        
    }    
    
    public Float ClinicalRecord.getBloodPressureDiastolicSD() {    
        return this.BloodPressureDiastolicSD;        
    }    
    
    public void ClinicalRecord.setBloodPressureDiastolicSD(Float BloodPressureDiastolicSD) {    
        this.BloodPressureDiastolicSD = BloodPressureDiastolicSD;        
    }    
    
    public boolean ClinicalRecord.getIsDeleted() {    
        return this.isDeleted;        
    }    
    
    public void ClinicalRecord.setIsDeleted(boolean isDeleted) {    
        this.isDeleted = isDeleted;        
    }
    
    public ResearchConsentType ClinicalRecord.getConsentGiven() {    
        return this.consentGiven;        
    }    
    
    public void ClinicalRecord.setConsentGiven(ResearchConsentType consentGiven) {    
        this.consentGiven = consentGiven;        
    }    
      
}
