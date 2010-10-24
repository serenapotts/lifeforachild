package org.lifeforachild.web.validation;

import org.lifeforachild.domain.CauseOfDeathType;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.DiabetesType;
import org.lifeforachild.domain.SurvivalStatusType;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class ChildValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		Child child = (Child)target;
		
		if (child.getSurvivalStatus() != null && child.getSurvivalStatus().equals(SurvivalStatusType.DEAD))
		{
			if (child.getDateOfDeath() == null)
				errors.rejectValue("dateOfDeath", "child.required.dateOfDeath");
			if (child.getCauseOfDeath() == null)
				errors.rejectValue("causeOfDeath", "child.required.causeOfDeath");
			else if (child.getCauseOfDeath() != null 
					&& child.getCauseOfDeath().equals(CauseOfDeathType.OTHER_DIABETES_RELATED_CONDITION)
					&& (child.getCauseOfDeathOther() == null || (child.getCauseOfDeathOther() != null &&
							child.getCauseOfDeathOther().isEmpty())))
				errors.rejectValue("causeOfDeathOther", "child.required.causeOfDeathOther");				
		}
		
		if (child.getDiabetesType() != null && child.getDiabetesType().equals(DiabetesType.OTHER) &&
				(child.getDiabetesTypeOther() == null || (child.getDiabetesTypeOther() != null &&
						child.getDiabetesTypeOther().isEmpty())))
			errors.rejectValue("diabetesTypeOther", "child.required.diabetesTypeOther");

	}

}
