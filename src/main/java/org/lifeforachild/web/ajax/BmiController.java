package org.lifeforachild.web.ajax;

import org.lifeforachild.Util.DecimalUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/bmi/*/*")
@Controller
public class BmiController
{
    @RequestMapping("/ajax/bmi/{weightKG}/{heightCM}")
    public @ResponseBody String calculateBMI(@PathVariable String weightKG, @PathVariable String heightCM)
    {
        try
        {
            Float weightKGValue = Float.parseFloat(weightKG);
            Float heightCMValue = Float.parseFloat(heightCM);

            Float calculateBMI = ClinicalRecord.calculateBMI(weightKGValue, heightCMValue);
            
            return (calculateBMI != null ? DecimalUtil.format(calculateBMI) : "");
        }
        catch (NumberFormatException e)
        {
        	e.printStackTrace();
        }
        return "";
    }
}
