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

@RequestMapping("/ajax/heightSD/*/*")
@Controller
public class HeightSDController
{
    @RequestMapping("/ajax/heightSD/{measureDate}/{childId}/{heightCM}")
    public @ResponseBody String calculateHeightSD(@PathVariable String measureDate, @PathVariable String childId, @PathVariable String heightCM)
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
                Float heightSD = ClinicalRecord.calculateHeightSD(exactAgeMonths, child.getSex(), heightCMValue);

                return DecimalUtil.format(heightSD);
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
