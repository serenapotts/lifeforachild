package org.lifeforachild.web;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/age/*/*")
@Controller
public class AgeController {
	
	@RequestMapping("/ajax/age/{measureDate}/{dob}")
	public @ResponseBody String calculateAge(@PathVariable String measureDate, @PathVariable String dob) {
		// TODO make this locale independent
		try {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
		Date measDate = dateFormat.parse(measureDate);
		Date dobDate = dateFormat.parse(dob);
		
		// Just after years so daylight saving won't make a hugh difference
			return Integer.toString((int)((measDate.getTime() - dobDate.getTime())/(1000*60*60*24*365.25)));
		}catch(ParseException e) {
			return "";
		}
	}

}
