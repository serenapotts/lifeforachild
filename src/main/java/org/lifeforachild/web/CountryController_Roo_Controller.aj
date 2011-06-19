package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.web.Report.CountryReportGenerator;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.validation.CountryValidator;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CountryController_Roo_Controller {
    
    @RequestMapping(value = "/country", method = RequestMethod.POST)    
    public String CountryController.create(@Valid Country country, BindingResult result, ModelMap modelMap) {
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_COUNTRY);
        if (country == null) throw new IllegalArgumentException("A country is required");
        validate(result, country);
        if (result.hasErrors()) {        
            modelMap.addAttribute("country", country);                       
            return "country/create";            
        }        
        country.persist();        
        return "redirect:/country/" + country.getId();        
    }    
    
    @RequestMapping(value = "/country/form", method = RequestMethod.GET)    
    public String CountryController.createForm(ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_COUNTRY);
    	Country country = new Country();
    	country.setIsDeleted(false); 
        modelMap.addAttribute("country", country);              
        return "country/create";        
    }    
    
    @RequestMapping(value = "/country/{id}", method = RequestMethod.GET)    
    public String CountryController.show(@PathVariable("id") Long id, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_COUNTRY);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("country", Country.findCountry(id));        
        return "country/show";        
    }    
    
    @RequestMapping(value = "/country", method = RequestMethod.GET)    
    public String CountryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_COUNTRY);
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("countrys", Country.findCountryEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Country.countCountrys() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("countrys", Country.findAllCountrys());            
        }        
        return "country/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String CountryController.update(@Valid Country country, BindingResult result, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_COUNTRY);
        if (country == null) throw new IllegalArgumentException("A country is required");       
        validate(result, country);
        if (result.hasErrors()) {        
            modelMap.addAttribute("country", country);                       
            return "country/update";            
        }        
        country.merge();        
        return "redirect:/country/" + country.getId();        
    }    
    
    @RequestMapping(value = "/country/{id}/form", method = RequestMethod.GET)    
    public String CountryController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) { 
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_COUNTRY);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("country", Country.findCountry(id));            
        return "country/update";        
    }    
    
    @RequestMapping(value = "/country/{id}", method = RequestMethod.DELETE)    
    public String CountryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_COUNTRY);
    	if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Country country = Country.findCountry(id);    
        country.setIsDeleted(true);
        country.persist();
        return "redirect:/country?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
    @RequestMapping(value = "/country/print", method = RequestMethod.GET)    
    public void CountryController.printForm(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
	{
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_COUNTRY);
    	ReportGenerator repGen = new CountryReportGenerator();
    	repGen.generateExcelReport("List Countries", Country.findAllCountrys(), null, request, response);
	}      
    
	public void CountryController.validate(BindingResult result, Country country) {
		Errors errors = new BindException(result);
		CountryValidator validator = new CountryValidator();
		validator.validate(country, errors);
	}       
}
