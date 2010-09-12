package org.lifeforachild.web.validation;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.SexType;
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
		}
	}

}
