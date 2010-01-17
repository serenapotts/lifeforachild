package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.UserGroup;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "usergroup", automaticallyMaintainView = true, formBackingObject = UserGroup.class)
@RequestMapping("/usergroup/**")
@Controller
public class UserGroupController {
}
