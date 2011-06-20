package org.lifeforachild.web.validation;

import org.lifeforachild.domain.Country;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class CountryValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		Country country = (Country)target;

		if (Country.findCountryByName(country.getName()) != null)
		{
			errors.rejectValue("name", "country.name.notUnique");
		}
	}

}
