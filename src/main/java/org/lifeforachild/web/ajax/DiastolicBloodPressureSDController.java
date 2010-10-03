package org.lifeforachild.web.ajax;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/diastolicBloodPressureSD/*/*")
@Controller
public class DiastolicBloodPressureSDController
{
    @RequestMapping("/ajax/diastolicBloodPressureSD/{measureDate}/{childId}/{heightCM}/{bloodPressureDiastolicMMHg}")
    public @ResponseBody String calculateWeightSD(@PathVariable String measureDate, @PathVariable String childId, @PathVariable String heightCM, @PathVariable String bloodPressureDiastolicMMHg)
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
                Float bloodPressureDiastolicMMHgValue = Float.parseFloat(bloodPressureDiastolicMMHg);
                
                Float heightSD = ClinicalRecord.calculateHeightSD(exactAgeMonths, child.getSex(), heightCMValue);
                Float bloodPressureDiastolicSD = ClinicalRecord.calcDiastolicBloodPressureSD(age, child.getSex(), heightSD, bloodPressureDiastolicMMHgValue);

                return new DecimalFormat("0.##").format(bloodPressureDiastolicSD);
            }
        }
        catch (ParseException e)
        {
            return e.getMessage();
        }
        catch (NumberFormatException e)
        {
            return e.getMessage();
        }
        return "";
    }
}
