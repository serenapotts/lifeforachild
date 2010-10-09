package org.lifeforachild.web.ajax;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.lifeforachild.Util.DecimalUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/bmiSD/*/*/*/*")
@Controller
public class BmiSDController
{
    @RequestMapping("/ajax/bmiSD/{measureDate}/{childId}/{weightKG}/{heightCM}")
    public @ResponseBody String calculateBmiSD(@PathVariable String measureDate, @PathVariable String childId, @PathVariable String weightKG, @PathVariable String heightCM)
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
                Float heightCMValue = Float.parseFloat(heightCM);
                
                Float bmi = ClinicalRecord.calculateBMI(weightKGValue, heightCMValue);
                Float bmiSD = ClinicalRecord.calculateBmiSD(exactAgeMonths, child.getSex(), bmi);

                return DecimalUtil.format(bmiSD);
            }
        }
        catch (ParseException e)
        {
        	e.printStackTrace();
        }
        catch (NumberFormatException e)
        {
        	e.printStackTrace();
        }
        return "";
    }
}
