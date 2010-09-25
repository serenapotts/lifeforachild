package org.lifeforachild.web.ajax;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/age/*/*")
@Controller
public class AgeController {
	
	@RequestMapping("/ajax/age/{measureDate}/{childId}")
	public @ResponseBody String calculateAge(@PathVariable String measureDate, @PathVariable String childId) {
		
		try {
		Child child = Child.findChild(Long.parseLong(childId));
		if (child != null)
		{
			Date dobDate = child.getDateOfBirth();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date measDate = dateFormat.parse(measureDate);
			
			// Just after years so daylight saving won't make a huge difference
			return new DecimalFormat("0.##").format(ClinicalRecord.calculateAge(measDate, dobDate));
		}
		}catch(ParseException e) {
			return e.getMessage();
		}
		return "";
	}

}
