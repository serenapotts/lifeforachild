package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "user", automaticallyMaintainView = true, formBackingObject = User.class)
@RequestMapping("/user/**")
@Controller
public class UserController {
}
