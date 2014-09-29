package org.lifeforachild.web.ajax;

import java.util.List;

import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/centre/*")
@Controller
public class CentreController {
	
	@RequestMapping("/ajax/centre/{countryId}")
	public @ResponseBody String calculateAge(@PathVariable String countryId) {
		try {
			Long id = Long.parseLong(countryId);
			List<DiabetesCentre> centres = DiabetesCentre.findAllDiabetesCentres(true, id);
			String json = "{identifier: 'id', items: [";
			for (DiabetesCentre centre: centres)
			{
				json += "{id:" + centre.getId() + ", name: '" + centre.getName() + "'},";
				
			}
			return json.substring(0, json.length() - 1) + "]}"; 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
