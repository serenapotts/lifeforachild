package org.lifeforachild.domain;

import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.CreatineUnitsType;
import org.lifeforachild.domain.DiabetesCopingType;
import org.lifeforachild.domain.HbA1cMethodType;
import org.lifeforachild.domain.MG_OR_MMOL_Type;
import org.lifeforachild.domain.MicroalbuminuriaUnitsType;
import org.lifeforachild.domain.NotAttendingSchoolReasonType;
import org.lifeforachild.domain.ReasonNotEnteringType;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.YesNoLaterType;
import org.lifeforachild.domain.YesNoNAType;
import org.lifeforachild.domain.YesNoUnkownType;

privileged aspect ClinicalRecord_Roo_JavaBean {
    
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
    
    public boolean ClinicalRecord.isAdjustInsulinDoseIfNeeded() {    
        return this.adjustInsulinDoseIfNeeded;        
    }    
    
    public void ClinicalRecord.setAdjustInsulinDoseIfNeeded(boolean adjustInsulinDoseIfNeeded) {    
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
    
    public boolean ClinicalRecord.isLongActingHuman() {    
        return this.longActingHuman;        
    }    
    
    public void ClinicalRecord.setLongActingHuman(boolean longActingHuman) {    
        this.longActingHuman = longActingHuman;        
    }    
    
    public boolean ClinicalRecord.isShortActingHuman() {    
        return this.shortActingHuman;        
    }    
    
    public void ClinicalRecord.setShortActingHuman(boolean shortActingHuman) {    
        this.shortActingHuman = shortActingHuman;        
    }    
    
    public boolean ClinicalRecord.isAnalog() {    
        return this.analog;        
    }    
    
    public void ClinicalRecord.setAnalog(boolean analog) {    
        this.analog = analog;        
    }    
    
    public boolean ClinicalRecord.isOralAgents() {    
        return this.oralAgents;        
    }    
    
    public void ClinicalRecord.setOralAgents(boolean oralAgents) {    
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
    
    public boolean ClinicalRecord.isBpMedications() {    
        return this.bpMedications;        
    }    
    
    public void ClinicalRecord.setBpMedications(boolean bpMedications) {    
        this.bpMedications = bpMedications;        
    }    
    
    public boolean ClinicalRecord.isAcearb() {    
        return this.acearb;        
    }    
    
    public void ClinicalRecord.setAcearb(boolean acearb) {    
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
    
    public boolean ClinicalRecord.isLaserRxInLast12Months() {    
        return this.LaserRxInLast12Months;        
    }    
    
    public void ClinicalRecord.setLaserRxInLast12Months(boolean LaserRxInLast12Months) {    
        this.LaserRxInLast12Months = LaserRxInLast12Months;        
    }    
    
    public float ClinicalRecord.getWeightKG() {    
        return this.weightKG;        
    }    
    
    public void ClinicalRecord.setWeightKG(float weightKG) {    
        this.weightKG = weightKG;        
    }    
    
    public Integer ClinicalRecord.getHeightCM() {    
        return this.heightCM;        
    }    
    
    public void ClinicalRecord.setHeightCM(Integer heightCM) {    
        this.heightCM = heightCM;        
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
    
    public Integer ClinicalRecord.getAge() {    
        return this.age;        
    }    
    
    public void ClinicalRecord.setAge(Integer age) {    
        this.age = age;        
    }    
    
    public boolean ClinicalRecord.isHasPersistentHypertension() {    
        return this.hasPersistentHypertension;        
    }    
    
    public void ClinicalRecord.setHasPersistentHypertension(boolean hasPersistentHypertension) {    
        this.hasPersistentHypertension = hasPersistentHypertension;        
    }    
    
    public boolean ClinicalRecord.isHasPubertyTannerB2_P2orGreater() {    
        return this.hasPubertyTannerB2_P2orGreater;        
    }    
    
    public void ClinicalRecord.setHasPubertyTannerB2_P2orGreater(boolean hasPubertyTannerB2_P2orGreater) {    
        this.hasPubertyTannerB2_P2orGreater = hasPubertyTannerB2_P2orGreater;        
    }    
    
    public boolean ClinicalRecord.isMenarche() {    
        return this.menarche;        
    }    
    
    public void ClinicalRecord.setMenarche(boolean menarche) {    
        this.menarche = menarche;        
    }    
    
    public Date ClinicalRecord.getIfMenarcheAge() {    
        return this.ifMenarcheAge;        
    }    
    
    public void ClinicalRecord.setIfMenarcheAge(Date ifMenarcheAge) {    
        this.ifMenarcheAge = ifMenarcheAge;        
    }    
    
    public boolean ClinicalRecord.isEyesExaminedInLastYear() {    
        return this.eyesExaminedInLastYear;        
    }    
    
    public void ClinicalRecord.setEyesExaminedInLastYear(boolean eyesExaminedInLastYear) {    
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
    
    public boolean ClinicalRecord.isFeetExaminedInLastYear() {    
        return this.feetExaminedInLastYear;        
    }    
    
    public void ClinicalRecord.setFeetExaminedInLastYear(boolean feetExaminedInLastYear) {    
        this.feetExaminedInLastYear = feetExaminedInLastYear;        
    }    
    
    public boolean ClinicalRecord.isMonofilamentTested() {    
        return this.monofilamentTested;        
    }    
    
    public void ClinicalRecord.setMonofilamentTested(boolean monofilamentTested) {    
        this.monofilamentTested = monofilamentTested;        
    }    
    
    public boolean ClinicalRecord.isMonofilamentAbnormal() {    
        return this.monofilamentAbnormal;        
    }    
    
    public void ClinicalRecord.setMonofilamentAbnormal(boolean monofilamentAbnormal) {    
        this.monofilamentAbnormal = monofilamentAbnormal;        
    }    
    
    public boolean ClinicalRecord.isTuningForkTested() {    
        return this.tuningForkTested;        
    }    
    
    public void ClinicalRecord.setTuningForkTested(boolean tuningForkTested) {    
        this.tuningForkTested = tuningForkTested;        
    }    
    
    public boolean ClinicalRecord.isTuningForkAbnormal() {    
        return this.tuningForkAbnormal;        
    }    
    
    public void ClinicalRecord.setTuningForkAbnormal(boolean tuningForkAbnormal) {    
        this.tuningForkAbnormal = tuningForkAbnormal;        
    }    
    
    public YesNoLaterType ClinicalRecord.getLastHbA1cInLast12Months() {    
        return this.lastHbA1cInLast12Months;        
    }    
    
    public void ClinicalRecord.setLastHbA1cInLast12Months(YesNoLaterType lastHbA1cInLast12Months) {    
        this.lastHbA1cInLast12Months = lastHbA1cInLast12Months;        
    }    
    
    public float ClinicalRecord.getHbA1cPercentage() {    
        return this.hbA1cPercentage;        
    }    
    
    public void ClinicalRecord.setHbA1cPercentage(float hbA1cPercentage) {    
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
    
    public float ClinicalRecord.getMicroalbuminuriaValue() {    
        return this.microalbuminuriaValue;        
    }    
    
    public void ClinicalRecord.setMicroalbuminuriaValue(float microalbuminuriaValue) {    
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
    
    public float ClinicalRecord.getCreatinineValue() {    
        return this.creatinineValue;        
    }    
    
    public void ClinicalRecord.setCreatinineValue(float creatinineValue) {    
        this.creatinineValue = creatinineValue;        
    }    
    
    public CreatineUnitsType ClinicalRecord.getCreatinineUnits() {    
        return this.creatinineUnits;        
    }    
    
    public void ClinicalRecord.setCreatinineUnits(CreatineUnitsType creatinineUnits) {    
        this.creatinineUnits = creatinineUnits;        
    }    
    
    public float ClinicalRecord.getTotalCholesterolValue() {    
        return this.totalCholesterolValue;        
    }    
    
    public void ClinicalRecord.setTotalCholesterolValue(float totalCholesterolValue) {    
        this.totalCholesterolValue = totalCholesterolValue;        
    }    
    
    public MG_OR_MMOL_Type ClinicalRecord.getCholesterolUnits() {    
        return this.cholesterolUnits;        
    }    
    
    public void ClinicalRecord.setCholesterolUnits(MG_OR_MMOL_Type cholesterolUnits) {    
        this.cholesterolUnits = cholesterolUnits;        
    }    
    
    public float ClinicalRecord.getHdlCholesterolValue() {    
        return this.hdlCholesterolValue;        
    }    
    
    public void ClinicalRecord.setHdlCholesterolValue(float hdlCholesterolValue) {    
        this.hdlCholesterolValue = hdlCholesterolValue;        
    }    
    
    public MG_OR_MMOL_Type ClinicalRecord.getHdlUnits() {    
        return this.hdlUnits;        
    }    
    
    public void ClinicalRecord.setHdlUnits(MG_OR_MMOL_Type hdlUnits) {    
        this.hdlUnits = hdlUnits;        
    }    
    
    public float ClinicalRecord.getTriglyceridesValue() {    
        return this.triglyceridesValue;        
    }    
    
    public void ClinicalRecord.setTriglyceridesValue(float triglyceridesValue) {    
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
    
    public boolean ClinicalRecord.isAttendingSchool() {    
        return this.attendingSchool;        
    }    
    
    public void ClinicalRecord.setAttendingSchool(boolean attendingSchool) {    
        this.attendingSchool = attendingSchool;        
    }    
    
    public NotAttendingSchoolReasonType ClinicalRecord.getNotAttendingSchoolWhy() {    
        return this.notAttendingSchoolWhy;        
    }    
    
    public void ClinicalRecord.setNotAttendingSchoolWhy(NotAttendingSchoolReasonType notAttendingSchoolWhy) {    
        this.notAttendingSchoolWhy = notAttendingSchoolWhy;        
    }    
    
    public boolean ClinicalRecord.isDiabetesLimitingAttendance() {    
        return this.diabetesLimitingAttendance;        
    }    
    
    public void ClinicalRecord.setDiabetesLimitingAttendance(boolean diabetesLimitingAttendance) {    
        this.diabetesLimitingAttendance = diabetesLimitingAttendance;        
    }    
    
    public boolean ClinicalRecord.isAppropriateGradeForAge() {    
        return this.appropriateGradeForAge;        
    }    
    
    public void ClinicalRecord.setAppropriateGradeForAge(boolean appropriateGradeForAge) {    
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
    
    public ReasonNotEnteringType ClinicalRecord.getReasonHypoglycaemiaEpisodesNotEntered() {    
        return this.reasonHypoglycaemiaEpisodesNotEntered;        
    }    
    
    public void ClinicalRecord.setReasonHypoglycaemiaEpisodesNotEntered(ReasonNotEnteringType reasonHypoglycaemiaEpisodesNotEntered) {    
        this.reasonHypoglycaemiaEpisodesNotEntered = reasonHypoglycaemiaEpisodesNotEntered;        
    }    
    
    public Integer ClinicalRecord.getNumberKetoacidosisEpisodes() {    
        return this.numberKetoacidosisEpisodes;        
    }    
    
    public void ClinicalRecord.setNumberKetoacidosisEpisodes(Integer numberKetoacidosisEpisodes) {    
        this.numberKetoacidosisEpisodes = numberKetoacidosisEpisodes;        
    }    
    
    public ReasonNotEnteringType ClinicalRecord.getReasonKetoacidosisEpisodesNotEntered() {    
        return this.reasonKetoacidosisEpisodesNotEntered;        
    }    
    
    public void ClinicalRecord.setReasonKetoacidosisEpisodesNotEntered(ReasonNotEnteringType reasonKetoacidosisEpisodesNotEntered) {    
        this.reasonKetoacidosisEpisodesNotEntered = reasonKetoacidosisEpisodesNotEntered;        
    }    
    
    public Integer ClinicalRecord.getNumberOfHospitalAdmissionsRelatedToDiabetes() {    
        return this.numberOfHospitalAdmissionsRelatedToDiabetes;        
    }    
    
    public void ClinicalRecord.setNumberOfHospitalAdmissionsRelatedToDiabetes(Integer numberOfHospitalAdmissionsRelatedToDiabetes) {    
        this.numberOfHospitalAdmissionsRelatedToDiabetes = numberOfHospitalAdmissionsRelatedToDiabetes;        
    }    
    
    public ReasonNotEnteringType ClinicalRecord.getReasonHospitalAdmissionsNotEntered() {    
        return this.reasonHospitalAdmissionsNotEntered;        
    }    
    
    public void ClinicalRecord.setReasonHospitalAdmissionsNotEntered(ReasonNotEnteringType reasonHospitalAdmissionsNotEntered) {    
        this.reasonHospitalAdmissionsNotEntered = reasonHospitalAdmissionsNotEntered;        
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
    
    public YesNoNAType ClinicalRecord.getLiterate() {    
        return this.literate;        
    }    
    
    public void ClinicalRecord.setLiterate(YesNoNAType literate) {    
        this.literate = literate;        
    }    
    
    public Child ClinicalRecord.getChild() {    
        return this.child;        
    }    
    
    public void ClinicalRecord.setChild(Child child) {    
        this.child = child;        
    }    
    
}
