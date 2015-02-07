package org.lifeforachild.web.ajax;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.lifeforachild.util.DecimalUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
				Float calculateAge = ClinicalRecord.calculateAge(measDate, dobDate);
	            return (calculateAge != null ? DecimalUtil.format(calculateAge) : "");
			}
		} catch(ParseException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
