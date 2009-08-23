package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(automaticallyMaintainView = true, formBackingObject = DiabetesCentre.class)
@RequestMapping("/diabetescentre/**")
@Controller
public class DiabetesCentreController {
}
