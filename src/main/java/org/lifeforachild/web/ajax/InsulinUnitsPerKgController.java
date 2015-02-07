package org.lifeforachild.web.ajax;

import org.lifeforachild.util.DecimalUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ajax/insulinUnitsPerKg/*/*")
@Controller
public class InsulinUnitsPerKgController
{
    @RequestMapping("/ajax/insulinUnitsPerKg/{weightKG}/{insulinUnitsPerDay}")
    public @ResponseBody String calculateInsulinUnitsPerKg(@PathVariable String weightKG, @PathVariable String insulinUnitsPerDay)
    {
        try
        {
            Integer insulinUnitsPerDayValue = Integer.parseInt(insulinUnitsPerDay);
            Float weightKGValue = Float.parseFloat(weightKG);

            Float insulinePerKg = ClinicalRecord.calculateInsulinPerKg(weightKGValue, insulinUnitsPerDayValue);
            return (insulinePerKg != null ? DecimalUtil.format(insulinePerKg) : "");
        } catch (NumberFormatException e)
        {
            e.printStackTrace();
        } catch(Exception e) {
			e.printStackTrace();
		}
        return "";
    }
}
