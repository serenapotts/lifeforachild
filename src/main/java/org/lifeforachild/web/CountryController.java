package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.Country;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "country", automaticallyMaintainView = true, formBackingObject = Country.class)
@RequestMapping("/country/**")
@Controller
public class CountryController {
}
