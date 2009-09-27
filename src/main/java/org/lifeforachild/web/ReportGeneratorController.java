package org.lifeforachild.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;

@RequestMapping("/reportgenerator/**")
@Controller
public class ReportGeneratorController {

    @RequestMapping
    public String get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	modelMap.addAttribute("children", org.lifeforachild.domain.Child.findAllChildren());
    	return "child/report";
    }

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public String post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	return "child/report";
    }
}
