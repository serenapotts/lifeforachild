package org.lifeforachild.web.validation;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.HbA1cMethodType;
import org.lifeforachild.domain.SexType;
import org.lifeforachild.domain.YesNoLaterType;
import org.lifeforachild.domain.YesNoType;
import org.lifeforachild.domain.YesNoUnkownType;
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
				errors.rejectValue("numberOfInsulinInjectionsPerDay", "numberOfInsulinInjectionsPerDay.required");
		}
		
		Integer numInjs = record.getNumberOfInsulinInjectionsPerDay();
		if (numInjs != null && numInjs > 0)
		{
			// mandatory when number injections is greater than zero
			if (record.getLongActingHuman() == null)
				errors.rejectValue("longActingHuman", "longActingHuman.required");
			if (record.getShortActingHuman() == null)
				errors.rejectValue("shortActingHuman", "shortActingHuman.required");
			if (record.getAnalog() == null)
				errors.rejectValue("analog", "analog.required");
		}	
		
		Child child = record.getChild(); 		
		if (child != null && child.getSex().equals(SexType.FEMALE))
		{
			// menarche is mandatory if child is female
			if (record.getMenarche() == null)
				errors.rejectValue("menarche", "menarche.required");
			else if (record.getMenarche().equals(YesNoUnkownType.YES) && record.getIfMenarcheAge() == null)
				errors.rejectValue("ifMenarcheAge", "ifMenarcheAge.required");				
		}
		
		if (record.getOralAgents() != null && record.getOralAgents().equals(YesNoType.YES) 
				&& (record.getOralAgentsDescription() == null
			|| (record.getOralAgentsDescription() != null && record.getOralAgentsDescription().isEmpty())))
			// if completed description required
			errors.rejectValue("oralAgentsDescription", "oralAgentsDescription.required");
			
		if (record.getBpMedications() != null && record.getBpMedications().equals(YesNoType.YES))
		{
			// when BP meds is yes these are required
			if(record.getAcearb() == null)
				errors.rejectValue("acearb", "acearb.required");
			if(record.getBpMedicationsOther() == null 
					|| (record.getBpMedicationsOther() != null && record.getBpMedicationsOther().isEmpty()))
				errors.rejectValue("bpMedicationsOther", "bpMedicationsOther.required");
		}
		
		if (record.getEyesExaminedInLastYear() != null 
				&& record.getEyesExaminedInLastYear().equals(YesNoType.YES))
		{
			// if eyes examined then cateract required
			if (record.getCateract() == null)
				errors.rejectValue("cateract", "cateract.required");
		}
		
		if (record.getFeetExaminedInLastYear() != null
				&& record.getFeetExaminedInLastYear().equals(YesNoType.YES))
		{
			// if feet examined monofilament required
			if (record.getMonofilamentTested() == null)
				errors.rejectValue("monofilamentTested", "monofilamentTested.required");
			else if (record.getMonofilamentTested().equals(YesNoType.YES) 
					&& record.getMonofilamentAbnormal() == null)
				errors.rejectValue("monofilamentAbnormal", "monofilamentAbnormal.required");		
			
			// if feet examined tuning fork required
			if (record.getTuningForkTested() == null)
				errors.rejectValue("tuningForkTested", "tuningForkTested.required");
			else if (record.getTuningForkTested().equals(YesNoType.YES) 
					&& record.getTuningForkAbnormal() == null)
				errors.rejectValue("tuningForkAbnormal", "tuningForkAbnormal.required");				
		}
		
		if (record.getLastHbA1cInLast12Months() != null 
				&& record.getLastHbA1cInLast12Months().equals(YesNoType.YES))
		{
			if (record.getHbA1cPercentage() == null)
				errors.rejectValue("hbA1cPercentage", "hbA1cPercentage.required");	
			if (record.getHbA1cMethod() == null)
				errors.rejectValue("hbA1cMethod", "hbA1cMethod.required");
			else if (record.getHbA1cMethod().equals(HbA1cMethodType.OTHER) 
					&& (record.getHbA1cMethodOther() == null 
					|| (record.getHbA1cMethodOther() != null && record.getHbA1cMethodOther().isEmpty())))
				errors.rejectValue("hbA1cMethodOther", "hbA1cMethodOther.required");
		}
		
		if (record.getMicroalbuminuriaInLast12Months() != null 
				&& record.getMicroalbuminuriaInLast12Months().equals(YesNoLaterType.YES))
		{
			// if micro yes then need to complete value and units
			if (record.getMicroalbuminuriaValue() == null
					|| (record.getMicroalbuminuriaValue() != null && record.getMicroalbuminuriaValue().isEmpty()))
				errors.rejectValue("microalbuminuriaValue", "microalbuminuriaValue.required");
			if (record.getMicroalbuminuriaUnitOfMeasure() == null)
				errors.rejectValue("microalbuminuriaUnitOfMeasure", "microalbuminuriaUnitOfMeasure.required");
		}
		
		if (record.getCreatinineInLast12Months() != null 
				&& record.getCreatinineInLast12Months().equals(YesNoLaterType.YES))
		{
			// if creatinine yes then need to complete value and units
			if (record.getCreatinineValue() == null)
				errors.rejectValue("creatinineValue", "creatinineValue.required");
			if (record.getCreatinineUnits() == null)
				errors.rejectValue("creatinineUnits", "creatinineUnits.required");
		}		
		
		if (record.getTotalCholesterolInLast12Months() != null 
				&& record.getTotalCholesterolInLast12Months().equals(YesNoLaterType.YES))
		{
			// if Cholesterol yes then need to complete value and units
			if (record.getTotalCholesterolValue() == null)
				errors.rejectValue("totalCholesterolValue", "cholesterolValue.required");
			if (record.getCholesterolUnits() == null)
				errors.rejectValue("cholesterolUnits", "cholesterolUnits.required");
			if (record.getFasted() == null)
				errors.rejectValue("fasted", "fasted.required");
		}
		
		if (record.getHdlCholesterolInLast12Months() != null 
				&& record.getHdlCholesterolInLast12Months().equals(YesNoLaterType.YES))
		{
			// if HDL holesterol yes then need to complete value and units
			if (record.getHdlCholesterolValue() == null)
				errors.rejectValue("hdlCholesterolValue", "hdlCholesterolValue.required");
			if (record.getHdlUnits() == null)
				errors.rejectValue("hdlUnits", "hdlUnits.required");
		}	
		
		if (record.getTriglyceridesInLast12Months() != null 
				&& record.getTriglyceridesInLast12Months().equals(YesNoLaterType.YES))
		{
			// if Triglycerides yes then need to complete value and units
			if (record.getTriglyceridesValue() == null)
				errors.rejectValue("triglyceridesValue", "triglyceridesValue.required");
			if (record.getTriglyceridesUnits() == null)
				errors.rejectValue("triglyceridesUnits", "triglyceridesUnits.required");
		}
		
		if (record.getAttendingSchool() != null && record.getAttendingSchool().equals(YesNoType.NO))
		{
			if (record.getNotAttendingSchoolWhy() == null)
				errors.rejectValue("notAttendingSchoolWhy", "notAttendingSchoolWhy.required");
		}
		if (record.getAttendingSchool() != null && record.getAttendingSchool().equals(YesNoType.YES))
		{
			if (record.getDiabetesLimitingAttendance() == null)
				errors.rejectValue("diabetesLimitingAttendance", "diabetesLimitAttend.required");
			if (record.getAppropriateGradeForAge() == null)
				errors.rejectValue("appropriateGradeForAge", "appAgeForGrade.required");
		}
		
		if (record.getWeightInLast12Months() != null && record.getWeightInLast12Months().equals(YesNoType.YES))
		{
			if (record.getWeightKG() == null)
				errors.rejectValue("weightKG", "weight.required");
		}
		
		if (record.getHeightInLast12Months() != null && record.getHeightInLast12Months().equals(YesNoType.YES))
		{
			if (record.getHeightCM() == null)
				errors.rejectValue("heightCM", "height.required");
		}
		
		if (record.getBPInLast12Months() != null && record.getBPInLast12Months().equals(YesNoType.YES))
		{
			if (record.getBloodPressureDiastolicMMHg() == null)
				errors.rejectValue("bloodPressureDiastolicMMHg", "bpdiastolic.required");
			if (record.getBloodPressureSystolicMMHg() == null)
				errors.rejectValue("bloodPressureSystolicMMHg", "bpsystolic.required");
		}		
		
		// if any of the measurements are yes then date of measurement needs to be compelted
		if ((record.getWeightInLast12Months() != null && record.getWeightInLast12Months().equals(YesNoType.YES))
			|| (record.getHeightInLast12Months() != null && record.getHeightInLast12Months().equals(YesNoType.YES))
			|| (record.getBPInLast12Months() != null && record.getBPInLast12Months().equals(YesNoType.YES)))
		{
			if (record.getDateOfMeasurement() == null)
				errors.rejectValue("dateOfMeasurement", "dom.required");
		}
		
		String seniorPhys = record.getSeniorPhysician();
		if (seniorPhys == null || (seniorPhys != null && seniorPhys.isEmpty()))
		{
			errors.rejectValue("seniorPhysician", "seniorPhysician.required");
		}
	}

}
