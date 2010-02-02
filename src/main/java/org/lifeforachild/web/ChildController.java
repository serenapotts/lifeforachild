package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.Child;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "child", automaticallyMaintainView = false, formBackingObject = Child.class)
@RequestMapping("/child/**")
@Controller
public class ChildController {
}
