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

@RequestMapping("/ajax/systolicBloodPressureSD/*/*/*/*")
@Controller
public class SystolicBloodPressureSDController
{
    @RequestMapping("/ajax/systolicBloodPressureSD/{measureDate}/{childId}/{heightCM}/{bloodPressureSystolicMMHg}")
    public @ResponseBody String calculateSystolicBloodPressureSD(@PathVariable String measureDate, @PathVariable String childId, @PathVariable String heightCM, @PathVariable String bloodPressureSystolicMMHg)
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
                
                Float heightCMValue = Float.parseFloat(heightCM);
                Integer bloodPressureSystolicMMHgValue = new Float(bloodPressureSystolicMMHg).intValue();
                
                Float heightSD = ClinicalRecord.calculateHeightSD(exactAgeMonths, child.getSex(), heightCMValue);
                Float bloodPressureSystolicSD = ClinicalRecord.calcSystolicBloodPressureSD(age, child.getSex(), heightSD, bloodPressureSystolicMMHgValue);

                return (bloodPressureSystolicSD != null ? DecimalUtil.format(bloodPressureSystolicSD) : "");
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
