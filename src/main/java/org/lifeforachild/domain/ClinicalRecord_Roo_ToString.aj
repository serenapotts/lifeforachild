package org.lifeforachild.domain;

privileged aspect ClinicalRecord_Roo_ToString {
    
    public java.lang.String ClinicalRecord.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("id: ").append(getId()).append(", ");        
        sb.append("version: ").append(getVersion()).append(", ");        
        sb.append("bloodGlucoseSelfMonitoringPerWeek: ").append(getBloodGlucoseSelfMonitoringPerWeek()).append(", ");        
        sb.append("urineGlucoseSelfMonitoringPerWeek: ").append(getUrineGlucoseSelfMonitoringPerWeek()).append(", ");        
        sb.append("adjustInsulinDoseIfNeeded: ").append(getAdjustInsulinDoseIfNeeded()).append(", ");        
        sb.append("insulinUnitsPerDay: ").append(getInsulinUnitsPerDay()).append(", ");        
        sb.append("numberOfInsulinInjectionsPerDay: ").append(getNumberOfInsulinInjectionsPerDay()).append(", ");        
        sb.append("longActingHuman: ").append(getLongActingHuman()).append(", ");        
        sb.append("shortActingHuman: ").append(getShortActingHuman()).append(", ");        
        sb.append("analog: ").append(getAnalog()).append(", ");        
        sb.append("oralAgents: ").append(getOralAgents()).append(", ");        
        sb.append("oralAgentsDescription: ").append(getOralAgentsDescription()).append(", ");        
        sb.append("routineClinicReviewsLastYear: ").append(getRoutineClinicReviewsLastYear()).append(", ");        
        sb.append("bpMedications: ").append(getBpMedications()).append(", ");        
        sb.append("aCE_ARB: ").append(getACE_ARB()).append(", ");        
        sb.append("bpMedicationsOther: ").append(getBpMedicationsOther()).append(", ");        
        sb.append("otherTreatments: ").append(getOtherTreatments()).append(", ");        
        sb.append("laserRxInLast12Months: ").append(getLaserRxInLast12Months()).append(", ");        
        sb.append("weightKG: ").append(getWeightKG()).append(", ");        
        sb.append("heightCM: ").append(getHeightCM()).append(", ");        
        sb.append("bloodPressureSystolicMMHg: ").append(getBloodPressureSystolicMMHg()).append(", ");        
        sb.append("bloodPressureDiastolicMMHg: ").append(getBloodPressureDiastolicMMHg()).append(", ");        
        sb.append("dateOfMeasurement: ").append(getDateOfMeasurement()).append(", ");        
        sb.append("age: ").append(getAge()).append(", ");        
        sb.append("hasPersistentHypertension: ").append(getHasPersistentHypertension()).append(", ");        
        sb.append("hasPubertyTannerB2_P2orGreater: ").append(getHasPubertyTannerB2_P2orGreater()).append(", ");        
        sb.append("menarche: ").append(getMenarche()).append(", ");        
        sb.append("ifMenarcheAge: ").append(getIfMenarcheAge()).append(", ");        
        sb.append("eyesExaminedInLastYear: ").append(getEyesExaminedInLastYear()).append(", ");        
        sb.append("cateract: ").append(getCateract()).append(", ");        
        sb.append("visualAcuityRight: ").append(getVisualAcuityRight()).append(", ");        
        sb.append("visualAcuityLeft: ").append(getVisualAcuityLeft()).append(", ");        
        sb.append("feetExaminedInLastYear: ").append(getFeetExaminedInLastYear()).append(", ");        
        sb.append("monofilamentTested: ").append(getMonofilamentTested()).append(", ");        
        sb.append("monofilamentAbnormal: ").append(getMonofilamentAbnormal()).append(", ");        
        sb.append("tuningForkTested: ").append(getTuningForkTested()).append(", ");        
        sb.append("tuningForkAbnormal: ").append(getTuningForkAbnormal()).append(", ");        
        sb.append("lastHbA1cInLast12Months: ").append(getLastHbA1cInLast12Months()).append(", ");        
        sb.append("hbA1cMethod: ").append(getHbA1cMethod()).append(", ");        
        sb.append("hbA1cMethodOther: ").append(getHbA1cMethodOther());        
        return sb.toString();        
    }    
    
}
