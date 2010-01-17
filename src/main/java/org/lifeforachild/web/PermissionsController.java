package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.Permissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "permissions", automaticallyMaintainView = true, formBackingObject = Permissions.class)
@RequestMapping("/permissions/**")
@Controller
public class PermissionsController {
}
