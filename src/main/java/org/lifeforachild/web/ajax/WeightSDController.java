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

@RequestMapping("/ajax/weightSD/*/*/*")
@Controller
public class WeightSDController
{
    @RequestMapping("/ajax/weightSD/{measureDate}/{childId}/{weightKG}")
    public @ResponseBody String calculateWeightSD(@PathVariable String measureDate, @PathVariable String childId, @PathVariable String weightKG)
    {
        try
        {
            Child child = Child.findChild(Long.parseLong(childId));
            if (child != null)
            {
                Date dobDate = child.getDateOfBirth();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date measDate = dateFormat.parse(measureDate);
                
                Float age = ClinicalRecord.calculateAge(measDate, dobDate);
                Float exactAgeMonths = ClinicalRecord.calculateExactAgeMonths(age);
                
                Float weightKGValue = Float.parseFloat(weightKG);
                Float weightSD = ClinicalRecord.calculateWeightSD(exactAgeMonths, child.getSex(), weightKGValue);

                return (weightSD != null ? DecimalUtil.format(weightSD) : "");
            }
        } catch (ParseException e)
        {
        	e.printStackTrace();
        } catch (NumberFormatException e)
        {
        	e.printStackTrace();
        } catch(Exception e) {
			e.printStackTrace();
		}
        return "";
    }
}
