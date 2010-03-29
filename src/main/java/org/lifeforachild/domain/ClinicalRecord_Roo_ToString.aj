package org.lifeforachild.domain;

import java.lang.String;

privileged aspect ClinicalRecord_Roo_ToString {
    
    public String ClinicalRecord.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Child: ").append(getChild()).append(", ");        
        sb.append("BloodGlucoseSelfMonitoringPerWeek: ").append(getBloodGlucoseSelfMonitoringPerWeek()).append(", ");        
        sb.append("UrineGlucoseSelfMonitoringPerWeek: ").append(getUrineGlucoseSelfMonitoringPerWeek()).append(", ");        
        sb.append("AdjustInsulinDoseIfNeeded: ").append(getAdjustInsulinDoseIfNeeded()).append(", ");        
        sb.append("InsulinUnitsPerDay: ").append(getInsulinUnitsPerDay()).append(", ");        
        sb.append("NumberOfInsulinInjectionsPerDay: ").append(getNumberOfInsulinInjectionsPerDay()).append(", ");        
        sb.append("LongActingHuman: ").append(getLongActingHuman()).append(", ");        
        sb.append("ShortActingHuman: ").append(getShortActingHuman()).append(", ");        
        sb.append("Analog: ").append(getAnalog()).append(", ");        
        sb.append("OralAgents: ").append(getOralAgents()).append(", ");        
        sb.append("OralAgentsDescription: ").append(getOralAgentsDescription()).append(", ");        
        sb.append("RoutineClinicReviewsLastYear: ").append(getRoutineClinicReviewsLastYear()).append(", ");        
        sb.append("BpMedications: ").append(getBpMedications()).append(", ");        
        sb.append("Acearb: ").append(getAcearb()).append(", ");        
        sb.append("BpMedicationsOther: ").append(getBpMedicationsOther()).append(", ");        
        sb.append("OtherTreatments: ").append(getOtherTreatments()).append(", ");        
        sb.append("LaserRxInLast12Months: ").append(getLaserRxInLast12Months()).append(", ");        
        sb.append("WeightKG: ").append(getWeightKG()).append(", ");        
        sb.append("HeightCM: ").append(getHeightCM()).append(", ");        
        sb.append("BloodPressureSystolicMMHg: ").append(getBloodPressureSystolicMMHg()).append(", ");        
        sb.append("BloodPressureDiastolicMMHg: ").append(getBloodPressureDiastolicMMHg()).append(", ");        
        sb.append("DateOfMeasurement: ").append(getDateOfMeasurement()).append(", ");        
        sb.append("Age: ").append(getAge()).append(", ");        
        sb.append("HasPersistentHypertension: ").append(getHasPersistentHypertension()).append(", ");        
        sb.append("HasPubertyTannerB2_P2orGreater: ").append(getHasPubertyTannerB2_P2orGreater()).append(", ");        
        sb.append("Menarche: ").append(getMenarche()).append(", ");        
        sb.append("IfMenarcheAge: ").append(getIfMenarcheAge()).append(", ");        
        sb.append("EyesExaminedInLastYear: ").append(getEyesExaminedInLastYear()).append(", ");        
        sb.append("Cateract: ").append(getCateract()).append(", ");        
        sb.append("VisualAcuityRight: ").append(getVisualAcuityRight()).append(", ");        
        sb.append("VisualAcuityLeft: ").append(getVisualAcuityLeft()).append(", ");        
        sb.append("FeetExaminedInLastYear: ").append(getFeetExaminedInLastYear()).append(", ");        
        sb.append("MonofilamentTested: ").append(getMonofilamentTested()).append(", ");        
        sb.append("MonofilamentAbnormal: ").append(getMonofilamentAbnormal()).append(", ");        
        sb.append("TuningForkTested: ").append(getTuningForkTested()).append(", ");        
        sb.append("TuningForkAbnormal: ").append(getTuningForkAbnormal()).append(", ");        
        sb.append("LastHbA1cInLast12Months: ").append(getLastHbA1cInLast12Months()).append(", ");        
        sb.append("HbA1cPercentage: ").append(getHbA1cPercentage()).append(", ");        
        sb.append("HbA1cMethod: ").append(getHbA1cMethod()).append(", ");        
        sb.append("HbA1cMethodOther: ").append(getHbA1cMethodOther()).append(", ");        
        sb.append("MicroalbuminuriaValue: ").append(getMicroalbuminuriaValue()).append(", ");        
        sb.append("MicroalbuminuriaUnitOfMeasure: ").append(getMicroalbuminuriaUnitOfMeasure()).append(", ");        
        sb.append("Proteinuria_dipstick_other: ").append(getProteinuria_dipstick_other()).append(", ");        
        sb.append("CreatinineValue: ").append(getCreatinineValue()).append(", ");        
        sb.append("CreatinineUnits: ").append(getCreatinineUnits()).append(", ");        
        sb.append("TotalCholesterolValue: ").append(getTotalCholesterolValue()).append(", ");        
        sb.append("CholesterolUnits: ").append(getCholesterolUnits()).append(", ");        
        sb.append("HdlCholesterolValue: ").append(getHdlCholesterolValue()).append(", ");        
        sb.append("HdlUnits: ").append(getHdlUnits()).append(", ");        
        sb.append("TriglyceridesValue: ").append(getTriglyceridesValue()).append(", ");        
        sb.append("TriglyceridesUnits: ").append(getTriglyceridesUnits()).append(", ");        
        sb.append("Fasted: ").append(getFasted()).append(", ");        
        sb.append("AttendingSchool: ").append(getAttendingSchool()).append(", ");        
        sb.append("NotAttendingSchoolWhy: ").append(getNotAttendingSchoolWhy()).append(", ");        
        sb.append("DiabetesLimitingAttendance: ").append(getDiabetesLimitingAttendance()).append(", ");        
        sb.append("AppropriateGradeForAge: ").append(getAppropriateGradeForAge()).append(", ");        
        sb.append("DiabetesCopingAbilities: ").append(getDiabetesCopingAbilities()).append(", ");        
        sb.append("NumberOfSevereHypoglycaemiaEpisodes: ").append(getNumberOfSevereHypoglycaemiaEpisodes()).append(", ");        
        sb.append("ReasonHypoglycaemiaEpisodesNotEntered: ").append(getReasonHypoglycaemiaEpisodesNotEntered()).append(", ");        
        sb.append("NumberKetoacidosisEpisodes: ").append(getNumberKetoacidosisEpisodes()).append(", ");        
        sb.append("ReasonKetoacidosisEpisodesNotEntered: ").append(getReasonKetoacidosisEpisodesNotEntered()).append(", ");        
        sb.append("NumberOfHospitalAdmissionsRelatedToDiabetes: ").append(getNumberOfHospitalAdmissionsRelatedToDiabetes()).append(", ");        
        sb.append("ReasonHospitalAdmissionsNotEntered: ").append(getReasonHospitalAdmissionsNotEntered()).append(", ");        
        sb.append("AdditionalComment: ").append(getAdditionalComment()).append(", ");        
        sb.append("PersonCompletingForm: ").append(getPersonCompletingForm()).append(", ");        
        sb.append("DateCompleted: ").append(getDateCompleted()).append(", ");        
        sb.append("SeniorPhysician: ").append(getSeniorPhysician()).append(", ");        
        sb.append("Literate: ").append(getLiterate());        
        return sb.toString();        
    }    
    
}
