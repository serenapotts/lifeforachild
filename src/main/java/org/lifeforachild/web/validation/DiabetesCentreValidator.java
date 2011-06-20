package org.lifeforachild.web.validation;

import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class DiabetesCentreValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		DiabetesCentre centre = (DiabetesCentre)target;

		if (DiabetesCentre.findDiabetesCentreByName(centre.getName()) != null)
		{
			errors.rejectValue("name", "centre.name.notUnique");
		}
	}

}
