package org.lifeforachild.web.validation;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.YesNoLaterType;
import org.lifeforachild.enums.YesNoType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class ClinicalRecordValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ClinicalRecord record = (ClinicalRecord)target;
		
		Integer insUnits = record.getInsulinUnitsPerDay();
		if (insUnits != null && insUnits > 0)
		{
			// number injections mandatory when units greater than zero
			if (record.getNumberOfInsulinInjectionsPerDay() == null)
				errors.rejectValue("numberOfInsulinInjectionsPerDay", "record.required.numberOfInsulinInjectionsPerDay");
		}
		
		Integer numInjs = record.getNumberOfInsulinInjectionsPerDay();
		if (numInjs != null && numInjs > 0)
		{
			// mandatory when number injections is greater than zero
			if (record.getLongActingHuman() == null)
				errors.rejectValue("longActingHuman", "record.required.longActingHuman");
			if (record.getShortActingHuman() == null)
				errors.rejectValue("shortActingHuman", "record.required.shortActingHuman");
			if (record.getAnalog() == null)
				errors.rejectValue("analog", "record.required.analog");
		}	
		
		Child child = record.getChild(); 		
		if (child != null && child.getSex().equals(SexType.FEMALE))
		{
			// menarche is mandatory if child is female
			if (record.getMenarche() == null)
				errors.rejectValue("menarche", "record.required.menarche");
			else if (record.getMenarche().equals(YesNoUnkownType.YES) && (record.getIfMenarcheAge() == null
					|| (record.getIfMenarcheAge() != null && record.getIfMenarcheAge().isEmpty())))
				errors.rejectValue("ifMenarcheAge", "record.required.ifMenarcheAge");				
		}
		
		if (record.getOralAgents() != null && record.getOralAgents().equals(YesNoType.YES) 
				&& (record.getOralAgentsDescription() == null
			|| (record.getOralAgentsDescription() != null && record.getOralAgentsDescription().isEmpty())))
			// if completed description required
			errors.rejectValue("oralAgentsDescription", "record.required.oralAgentsDescription");
			
		if (record.getBpMedications() != null && record.getBpMedications().equals(YesNoType.YES))
		{
			// when BP meds is yes these are required
			if(record.getAcearb() == null)
				errors.rejectValue("acearb", "record.required.acearb");
			if(record.getBpMedicationsOther() == null 
					|| (record.getBpMedicationsOther() != null && record.getBpMedicationsOther().isEmpty()))
				errors.rejectValue("bpMedicationsOther", "record.required.bpMedicationsOther");
		}
		
		if (record.getEyesExaminedInLastYear() != null 
				&& record.getEyesExaminedInLastYear().equals(YesNoType.YES))
		{
			// if eyes examined then cateract required
			if (record.getCateract() == null)
				errors.rejectValue("cateract", "record.required.cateract");
		}
		
		if (record.getFeetExaminedInLastYear() != null
				&& record.getFeetExaminedInLastYear().equals(YesNoType.YES))
		{
			// if feet examined monofilament required
			if (record.getMonofilamentTested() == null)
				errors.rejectValue("monofilamentTested", "record.required.monofilamentTested");
			else if (record.getMonofilamentTested().equals(YesNoType.YES) 
					&& record.getMonofilamentAbnormal() == null)
				errors.rejectValue("monofilamentAbnormal", "record.required.monofilamentAbnormal");		
			
			// if feet examined tuning fork required
			if (record.getTuningForkTested() == null)
				errors.rejectValue("tuningForkTested", "record.required.tuningForkTested");
			else if (record.getTuningForkTested().equals(YesNoType.YES) 
					&& record.getTuningForkAbnormal() == null)
				errors.rejectValue("tuningForkAbnormal", "record.required.tuningForkAbnormal");				
		}
		
		if (record.getLastHbA1cInLast12Months() != null 
				&& record.getLastHbA1cInLast12Months().equals(YesNoType.YES))
		{
			if (record.getHbA1cPercentage() == null)
				errors.rejectValue("hbA1cPercentage", "record.required.hbA1cPercentage");	
			if (record.getHbA1cMethod() == null)
				errors.rejectValue("hbA1cMethod", "record.required.hbA1cMethod");
			else if (record.getHbA1cMethod().equals(HbA1cMethodType.OTHER) 
					&& (record.getHbA1cMethodOther() == null 
					|| (record.getHbA1cMethodOther() != null && record.getHbA1cMethodOther().isEmpty())))
				errors.rejectValue("hbA1cMethodOther", "record.required.hbA1cMethodOther");
		}
		
		if (record.getMicroalbuminuriaInLast12Months() != null 
				&& record.getMicroalbuminuriaInLast12Months().equals(YesNoLaterType.YES))
		{
			// if micro yes then need to complete value and units
			if (record.getMicroalbuminuriaValue() == null
					|| (record.getMicroalbuminuriaValue() != null && record.getMicroalbuminuriaValue().isEmpty()))
				errors.rejectValue("microalbuminuriaValue", "record.required.microalbuminuriaValue");
			if (record.getMicroalbuminuriaUnitOfMeasure() == null)
				errors.rejectValue("microalbuminuriaUnitOfMeasure", "record.required.microalbuminuriaUnitOfMeasure");
		}
		
		if (record.getCreatinineInLast12Months() != null 
				&& record.getCreatinineInLast12Months().equals(YesNoLaterType.YES))
		{
			// if creatinine yes then need to complete value and units
			if (record.getCreatinineValue() == null)
				errors.rejectValue("creatinineValue", "record.required.creatinineValue");
			if (record.getCreatinineUnits() == null)
				errors.rejectValue("creatinineUnits", "record.required.creatinineUnits");
		}		
		
		if (record.getTotalCholesterolInLast12Months() != null 
				&& record.getTotalCholesterolInLast12Months().equals(YesNoLaterType.YES))
		{
			// if Cholesterol yes then need to complete value and units
			if (record.getTotalCholesterolValue() == null)
				errors.rejectValue("totalCholesterolValue", "record.required.cholesterolValue");
			if (record.getCholesterolUnits() == null)
				errors.rejectValue("cholesterolUnits", "record.required.cholesterolUnits");
		}
		
		if (record.getHdlCholesterolInLast12Months() != null 
				&& record.getHdlCholesterolInLast12Months().equals(YesNoLaterType.YES))
		{
			// if HDL holesterol yes then need to complete value and units
			if (record.getHdlCholesterolValue() == null)
				errors.rejectValue("hdlCholesterolValue", "record.required.hdlCholesterolValue");
			if (record.getHdlUnits() == null)
				errors.rejectValue("hdlUnits", "record.required.hdlUnits");
		}	
		
		if (record.getTriglyceridesInLast12Months() != null 
				&& record.getTriglyceridesInLast12Months().equals(YesNoLaterType.YES))
		{
			// if Triglycerides yes then need to complete value and units
			if (record.getTriglyceridesValue() == null)
				errors.rejectValue("triglyceridesValue", "record.required.triglyceridesValue");
			if (record.getTriglyceridesUnits() == null)
				errors.rejectValue("triglyceridesUnits", "record.required.triglyceridesUnits");
		}
		
		if ((record.getTotalCholesterolInLast12Months() != null 
				&& record.getTotalCholesterolInLast12Months().equals(YesNoLaterType.YES)) ||
				(record.getHdlCholesterolInLast12Months() != null 
				&& record.getHdlCholesterolInLast12Months().equals(YesNoLaterType.YES)) ||
				(record.getTriglyceridesInLast12Months() != null 
				&& record.getTriglyceridesInLast12Months().equals(YesNoLaterType.YES))) {
			if (record.getFasted() == null)
				errors.rejectValue("fasted", "record.required.fasted");
		}
		
		if (record.getAttendingSchool() != null && record.getAttendingSchool().equals(YesNoType.NO))
		{
			if (record.getNotAttendingSchoolWhy() == null)
				errors.rejectValue("notAttendingSchoolWhy", "record.required.notAttendingSchoolWhy");
		}
		if (record.getAttendingSchool() != null && record.getAttendingSchool().equals(YesNoType.YES))
		{
			if (record.getDiabetesLimitingAttendance() == null)
				errors.rejectValue("diabetesLimitingAttendance", "record.required.diabetesLimitAttend");
			if (record.getAppropriateGradeForAge() == null)
				errors.rejectValue("appropriateGradeForAge", "record.required.appAgeForGrade");
		}
		
		if (record.getWeightInLast12Months() != null && record.getWeightInLast12Months().equals(YesNoType.YES))
		{
			if (record.getWeightKG() == null)
				errors.rejectValue("weightKG", "record.required.weight");
		}
		
		if (record.getHeightInLast12Months() != null && record.getHeightInLast12Months().equals(YesNoType.YES))
		{
			if (record.getHeightCM() == null)
				errors.rejectValue("heightCM", "record.required.height");
		}
		
		if (record.getBPInLast12Months() != null && record.getBPInLast12Months().equals(YesNoType.YES))
		{
			if (record.getBloodPressureDiastolicMMHg() == null)
				errors.rejectValue("bloodPressureDiastolicMMHg", "record.required.bpdiastolic");
			if (record.getBloodPressureSystolicMMHg() == null)
				errors.rejectValue("bloodPressureSystolicMMHg", "record.required.bpsystolic");
		}		
		
		// if any of the measurements are yes then date of measurement needs to be compelted
		if ((record.getWeightInLast12Months() != null && record.getWeightInLast12Months().equals(YesNoType.YES))
			|| (record.getHeightInLast12Months() != null && record.getHeightInLast12Months().equals(YesNoType.YES))
			|| (record.getBPInLast12Months() != null && record.getBPInLast12Months().equals(YesNoType.YES)))
		{
			if (record.getDateOfMeasurement() == null)
				errors.rejectValue("dateOfMeasurement", "record.required.dom");
		}
		
		String seniorPhys = record.getSeniorPhysician();
		if (seniorPhys == null || (seniorPhys != null && seniorPhys.isEmpty()))
		{
			errors.rejectValue("seniorPhysician", "record.required.seniorPhysician");
		}
	}

}
