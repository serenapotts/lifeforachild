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

	public static String REQUIRED = "field.required";
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
				errors.rejectValue("numberOfInsulinInjectionsPerDay", REQUIRED);
		}
		
		Integer numInjs = record.getNumberOfInsulinInjectionsPerDay();
		if (numInjs != null && numInjs > 0)
		{
			// mandatory when number injections is greater than zero
			if (record.getLongActingHuman() == null)
				errors.rejectValue("longActingHuman", REQUIRED);
			if (record.getShortActingHuman() == null)
				errors.rejectValue("shortActingHuman", REQUIRED);
			if (record.getAnalog() == null)
				errors.rejectValue("analog", REQUIRED);
		}	
		
		Child child = record.getChild(); 		
		if (child != null && child.getSex().equals(SexType.FEMALE))
		{
			// menarche is mandatory if child is female
			if (record.getMenarche() == null)
				errors.rejectValue("menarche", REQUIRED);
			else if (record.getMenarche().equals(YesNoUnkownType.YES) && record.getIfMenarcheAge() == null)
				errors.rejectValue("ifMenarcheAge", REQUIRED);				
		}
		
		if (record.getOralAgents() != null && (record.getOralAgentsDescription() == null
			|| (record.getOralAgentsDescription() != null && record.getOralAgentsDescription().isEmpty())))
			// if completed description required
			errors.rejectValue("oralAgentsDescription", REQUIRED);
			
		if (record.getBpMedications() != null && record.getBpMedications().equals(YesNoType.YES))
		{
			// when BP meds is yes these are required
			if(record.getAcearb() == null)
				errors.rejectValue("acearb", REQUIRED);
			if(record.getBpMedicationsOther() == null 
					|| (record.getBpMedicationsOther() != null && record.getBpMedicationsOther().isEmpty()))
				errors.rejectValue("bpMedicationsOther", REQUIRED);
		}
		
		if (record.getEyesExaminedInLastYear() != null 
				&& record.getEyesExaminedInLastYear().equals(YesNoType.YES))
		{
			// if eyes examined then cateract required
			if (record.getCateract() == null)
				errors.rejectValue("cateract", REQUIRED);
		}
		
		if (record.getFeetExaminedInLastYear() != null
				&& record.getFeetExaminedInLastYear().equals(YesNoType.YES))
		{
			// if feet examined monofilament required
			if (record.getMonofilamentTested() == null)
				errors.rejectValue("monofilamentTested", REQUIRED);
			else if (record.getMonofilamentTested().equals(YesNoType.YES) 
					&& record.getMonofilamentAbnormal() == null)
				errors.rejectValue("monofilamentAbnormal", REQUIRED);		
			
			// if feet examined tuning fork required
			if (record.getTuningForkTested() == null)
				errors.rejectValue("tuningForkTested", REQUIRED);
			else if (record.getTuningForkTested().equals(YesNoType.YES) 
					&& record.getTuningForkAbnormal() == null)
				errors.rejectValue("tuningForkAbnormal", REQUIRED);				
		}
		
		if (record.getLastHbA1cInLast12Months() != null 
				&& record.getLastHbA1cInLast12Months().equals(YesNoType.YES))
		{
			if (record.getHbA1cPercentage() == null)
				errors.rejectValue("hbA1cPercentage", REQUIRED);	
			if (record.getHbA1cMethod() == null)
				errors.rejectValue("hbA1cMethod", REQUIRED);
			else if (record.getHbA1cMethod().equals(HbA1cMethodType.OTHER) 
					&& (record.getHbA1cMethodOther() == null 
					|| (record.getHbA1cMethodOther() != null && record.getHbA1cMethodOther().isEmpty())))
				errors.rejectValue("hbA1cMethodOther", REQUIRED);
		}
		
		if (record.getMicroalbuminuriaInLast12Months() != null 
				&& record.getMicroalbuminuriaInLast12Months().equals(YesNoLaterType.YES))
		{
			// if micro yes then need to complete value and units
			if (record.getMicroalbuminuriaValue() == null)
				errors.rejectValue("microalbuminuriaValue", REQUIRED);
			if (record.getMicroalbuminuriaUnitOfMeasure() == null
					|| (record.getMicroalbuminuriaUnitOfMeasure() != null && record.getMicroalbuminuriaUnitOfMeasure().isEmpty()))
				errors.rejectValue("microalbuminuriaUnitOfMeasure", REQUIRED);
		}
		
		if (record.getCreatinineInLast12Months() != null 
				&& record.getCreatinineInLast12Months().equals(YesNoLaterType.YES))
		{
			// if creatinine yes then need to complete value and units
			if (record.getCreatinineValue() == null)
				errors.rejectValue("creatinineValue", REQUIRED);
			if (record.getCreatinineUnits() == null)
				errors.rejectValue("creatinineUnits", REQUIRED);
		}		
		
		if (record.getTotalCholesterolInLast12Months() != null 
				&& record.getTotalCholesterolInLast12Months().equals(YesNoLaterType.YES))
		{
			// if Cholesterol yes then need to complete value and units
			if (record.getTotalCholesterolValue() == null)
				errors.rejectValue("totalCholesterolValue", REQUIRED);
			if (record.getCholesterolUnits() == null)
				errors.rejectValue("cholesterolUnits", REQUIRED);
			if (record.getFasted() == null)
				errors.rejectValue("fasted", REQUIRED);
		}
		
		if (record.getHdlCholesterolInLast12Months() != null 
				&& record.getHdlCholesterolInLast12Months().equals(YesNoLaterType.YES))
		{
			// if HDL holesterol yes then need to complete value and units
			if (record.getHdlCholesterolValue() == null)
				errors.rejectValue("hdlCholesterolValue", REQUIRED);
			if (record.getHdlUnits() == null)
				errors.rejectValue("hdlUnits", REQUIRED);
		}	
		
		if (record.getTriglyceridesInLast12Months() != null 
				&& record.getTriglyceridesInLast12Months().equals(YesNoLaterType.YES))
		{
			// if Triglycerides yes then need to complete value and units
			if (record.getTriglyceridesValue() == null)
				errors.rejectValue("triglyceridesValue", REQUIRED);
			if (record.getTriglyceridesUnits() == null)
				errors.rejectValue("triglyceridesUnits", REQUIRED);
		}
		
		if (record.getAttendingSchool() != null && record.getAttendingSchool().equals(YesNoType.NO))
		{
			if (record.getNotAttendingSchoolWhy() == null)
				errors.rejectValue("notAttendingSchoolWhy", REQUIRED);
		}
		if (record.getAttendingSchool() != null && record.getAttendingSchool().equals(YesNoType.YES))
		{
			if (record.getDiabetesLimitingAttendance() == null)
				errors.rejectValue("diabetesLimitingAttendance", REQUIRED);
			if (record.getAppropriateGradeForAge() == null)
				errors.rejectValue("appropriateGradeForAge", REQUIRED);
		}
	}

}
