package org.lifeforachild.web;

import org.lifeforachild.domain.Report;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "report", automaticallyMaintainView = false, formBackingObject = Report.class)
@RequestMapping("/report/**")
@Controller
public class ReportController {
}
