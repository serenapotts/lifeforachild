package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.ClinicalRecord;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(automaticallyMaintainView = true, formBackingObject = ClinicalRecord.class)
@RequestMapping("/clinicalrecord/**")
@Controller
public class ClinicalRecordController {
}
