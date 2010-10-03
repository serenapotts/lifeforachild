package org.lifeforachild.web.ajax;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.lifeforachild.Util.DecimalUtil;
import org.lifeforachild.domain.Child;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/ageAtDiagnosis/*/*")
@Controller
public class AgeAtDiagnosisController {
	
	@RequestMapping("/ajax/ageAtDiagnosis/{diabetesDiagnosed}/{dateOfBirth}")
	public @ResponseBody String calculateAgeAtDiagnosis(@PathVariable String diabetesDiagnosed, @PathVariable String dateOfBirth) {
		
		try {				
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date dd = dateFormat.parse(diabetesDiagnosed);
			Date dob = dateFormat.parse(dateOfBirth);
			
			// Just after years so daylight saving won't make a huge difference
			return DecimalUtil.format(Child.calculatedAgeAtDiabetesDiagnosis(dd, dob));
		}catch(ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
}
