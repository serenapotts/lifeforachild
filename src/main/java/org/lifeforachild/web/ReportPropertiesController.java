package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.ReportProperties;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "reportproperties", automaticallyMaintainView = true, formBackingObject = ReportProperties.class)
@RequestMapping("/reportproperties/**")
@Controller
public class ReportPropertiesController {
}
