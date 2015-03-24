package org.lifeforachild.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.lifeforachild.domain.Message;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "forgotpassword", automaticallyMaintainView = false, formBackingObject = Message.class)
@RequestMapping("/forgotpassword/**")
@Controller
public class ForgotPasswordController {
}
