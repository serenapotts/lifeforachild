package org.lifeforachild.web;

import javax.persistence.Transient;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.domain.ClinicalRecord;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Search;
import org.lifeforachild.security.SimpleStringCipher;
import org.lifeforachild.web.report.ChildReportGenerator;
import org.lifeforachild.web.report.ReportGenerator;
import org.lifeforachild.web.report.enums.ChildFields;
import org.lifeforachild.web.validation.ChildValidator;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.lifeforachild.enums.BloodGlucoseUnitsType;
import org.lifeforachild.enums.CauseOfDeathType;
import org.lifeforachild.enums.DiabetesType;
import org.lifeforachild.enums.DistanceType;
import org.lifeforachild.enums.KnownUnkownType;
import org.lifeforachild.enums.NoMildSevereUnknownType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.SurvivalStatusType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.lifeforachild.enums.YesUnknownType;
import org.lifeforachild.web.AppContext;

privileged aspect ChildController_Roo_Controller {
	
    private static final Log LOG = LogFactory.getLog(ChildController.class);
    
    @RequestMapping(value = "/child", method = RequestMethod.POST)    
    public String ChildController.create(@Valid Child child, BindingResult result, ModelMap modelMap) { 
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CHILD);
	        if (child == null) throw new IllegalArgumentException("A child is required"); 
	        validate(result, child);
	        if (result.hasErrors()) {        
	        	Country country = child.getCountry();
	            modelMap.addAttribute("child", child);            
	            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
	            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
	            modelMap.addAttribute("countrys", Country.findAllCountrys());  
	            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
	            modelMap.addAttribute("diabetescentres", centres);            
	            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
	            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
	            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
	            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
	            modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern());   
	            modelMap.addAttribute("KnownUnkownType_enum", KnownUnkownType.class.getEnumConstants());
	            modelMap.addAttribute("BloodGlucoseUnitsType_enum", BloodGlucoseUnitsType.class.getEnumConstants());
	            modelMap.addAttribute("NoMildSevereUnknownType_enum", NoMildSevereUnknownType.class.getEnumConstants());
	            modelMap.addAttribute("YesUnknownType_enum", YesUnknownType.class.getEnumConstants());
	            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());
	            modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());            
	            return "child/create"; 
	        }        
	        // encrypt after so validations work
	        child.setName(SimpleStringCipher.encrypt(child.getName()));
	        child.setLastName(SimpleStringCipher.encrypt(child.getLastName()));
	        child.setInitials(SimpleStringCipher.encrypt(child.getInitials()));
	        child.setAgeAtDiagnosis(child.calculatedAgeAtDiabetesDiagnosis());
	        child.persist();  
	        
	        // now that child is created auto generate individual id
	        Long countryId = child.getCountry().getId();
	        Long centreId = child.getCentre().getId();
	        // TODO is there a better way to do this as could cause a race condition and two have the same id but unlikely
	        long centreChildCount = Child.numberChildrenInCentre(countryId, centreId);
	        String id = StringUtil.padWithZeros(centreChildCount, 4);
	        String paddedCountryId = StringUtil.padWithZeros(countryId, 3);
	        String paddedCentreId = StringUtil.padWithZeros(centreId, 3);
	        child.setIndividualId(paddedCountryId + paddedCentreId + id);
	        child.persist();
	        return "redirect:/child/" + child.getId();    
    	} catch (AccessDeniedException ade) {
    		throw ade;
       	} catch (Exception e) {
    		LOG.error("Unable to save child for create");
    		e.printStackTrace();
    		return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/child/form", method = RequestMethod.GET)    
    public String ChildController.createForm(ModelMap modelMap) {  
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_CHILD);
	    	Child child = new Child();
	        child.setCreatedOn(new Date());
	        child.setUpdatedOn(new Date());
	        child.setIsDeleted(false);        
	        modelMap.addAttribute("child", child);     	    
	        modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());        
	        modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());        
	        modelMap.addAttribute("countrys", Country.findAllCountrys());        
	        modelMap.addAttribute("diabetescentres", null);        
	        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
	        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
	        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
	        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());    
	        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());
	        modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern()); 
	        modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString()); 
	        return "child/create"; 
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to populate child for create");
    		e.printStackTrace();
    		 return "unexpectedError";
    	}
    }    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.GET)    
    public String ChildController.show(@PathVariable("id") Long id, 
    		@RequestParam(value = "country", required = false) String country,
    		@RequestParam(value = "centre", required = false) String centre,
    		@RequestParam(value = "from", required = false) String fromDate,
    		@RequestParam(value = "to", required = false) String toDate,
    		@RequestParam(value = "createdFrom", required = false) String createdFromDate,
    		@RequestParam(value = "createdTo", required = false) String createdToDate,
    		@RequestParam(value = "firstname", required = false) String firstName,
    		@RequestParam(value = "lastname", required = false) String lastName,
    		@RequestParam(value = "localmedicalnum", required = false) String localMedicalNum,
    		ModelMap modelMap) {    
    	try {
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");    
	        Child child = Child.findChild(id);
	        modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern());
	        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern());
	        modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	        modelMap.addAttribute("child", child);  
	        
	        Search search = createSearchFromParams(country, centre, fromDate, toDate, createdFromDate, createdToDate, 
	        		lastName, firstName, localMedicalNum);
	        addSearchToModel(child, modelMap, search);
	        return "child/show";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to display child with id: " + id);
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/child", method = RequestMethod.GET)    
    public String ChildController.list(@RequestParam(value = "page", required = false) Integer page, 
    								   @RequestParam(value = "size", required = false) Integer size, 
    								   ModelMap modelMap) {    
    	try {
	        if (page != null || size != null) {        
	            int sizeNo = size == null ? 10 : size.intValue();            
	            modelMap.addAttribute("children", Child.findChildEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
	            float nrOfPages = (float) Child.countChildren() / sizeNo;            
	            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
	        } else {        
	            modelMap.addAttribute("children", Child.findAllChildren());            
	        }        
	        modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern());        
	        return "child/list"; 
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to list children");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ChildController.update(@Valid Child child, BindingResult result, ModelMap modelMap) { 
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
	        if (child == null) throw new IllegalArgumentException("A child is required");   
	        validate(result, child);
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("child", child);            
	            modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());            
	            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
	            modelMap.addAttribute("countrys", Country.findAllCountrys());      
	            Country country = child.getCountry();
	            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
	            modelMap.addAttribute("diabetescentres", centres);           
	            modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());            
	            modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());            
	            modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());            
	            modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());            
	            modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());            
	            modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern());
	            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern());
	            modelMap.addAttribute("KnownUnkownType_enum", KnownUnkownType.class.getEnumConstants());
	            modelMap.addAttribute("BloodGlucoseUnitsType_enum", BloodGlucoseUnitsType.class.getEnumConstants());
	            modelMap.addAttribute("NoMildSevereUnknownType_enum", NoMildSevereUnknownType.class.getEnumConstants());
	            modelMap.addAttribute("YesUnknownType_enum", YesUnknownType.class.getEnumConstants());
	            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());
	            modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	            return "child/update";            
	        }        
	        // encrypt after so validations work
	        child.setName(SimpleStringCipher.encrypt(child.getName()));
	        child.setLastName(SimpleStringCipher.encrypt(child.getLastName()));
	        child.setInitials(SimpleStringCipher.encrypt(child.getInitials()));        
	        child.setAgeAtDiagnosis(child.calculatedAgeAtDiabetesDiagnosis());
	        child.merge();        
	        return "redirect:/child/" + child.getId();    
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to update child");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/child/{id}/form", method = RequestMethod.GET)    
    public String ChildController.updateForm(@PathVariable("id") Long id, 
    		@RequestParam(value = "country", required = false) String country, 
    		@RequestParam(value = "centre", required = false) String centre,
    		@RequestParam(value = "from", required = false) String fromDate,
    		@RequestParam(value = "to", required = false) String toDate,
    		@RequestParam(value = "createdFrom", required = false) String createdFromDate,
    		@RequestParam(value = "createdTo", required = false) String createdToDate,
    		@RequestParam(value = "firstname", required = false) String firstName,
    		@RequestParam(value = "lastname", required = false) String lastName,
    		@RequestParam(value = "localmedicalnum", required = false) String localMedicalNum,
    		ModelMap modelMap) { 
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");     
	        Child child = Child.findChild(id);
	        child.setUpdatedOn(new Date()); 
	        modelMap.addAttribute("child", child);     
	        modelMap.addAttribute("causeofdeathtype_enum", CauseOfDeathType.class.getEnumConstants());        
	        modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());        
	        modelMap.addAttribute("countrys", Country.findAllCountrys());  
	        Country childCountry = child.getCountry();
	        List<DiabetesCentre> centres = (childCountry == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, childCountry.getId());
	        modelMap.addAttribute("diabetescentres", centres);        
	        modelMap.addAttribute("diabetestype_enum", DiabetesType.class.getEnumConstants());        
	        modelMap.addAttribute("distancetype_enum", DistanceType.class.getEnumConstants());        
	        modelMap.addAttribute("sextype_enum", SexType.class.getEnumConstants());        
	        modelMap.addAttribute("survivalstatustype_enum", SurvivalStatusType.class.getEnumConstants());        
	        modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());        
	        modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern());
	        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern());
	        modelMap.addAttribute("KnownUnkownType_enum", KnownUnkownType.class.getEnumConstants());
	        modelMap.addAttribute("BloodGlucoseUnitsType_enum", BloodGlucoseUnitsType.class.getEnumConstants());
	        modelMap.addAttribute("NoMildSevereUnknownType_enum", NoMildSevereUnknownType.class.getEnumConstants());
	        modelMap.addAttribute("YesUnknownType_enum", YesUnknownType.class.getEnumConstants());
	        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());
	        modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	        
	        Search search = createSearchFromParams(country, centre, fromDate, toDate, createdFromDate, createdToDate, 
	        		lastName, firstName, localMedicalNum);
	        addSearchToModel(child, modelMap, search);
	        
	        return "child/update";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to populate child for update");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/child/{id}/print", method = RequestMethod.GET)    
    public String ChildController.printForm(@PathVariable("id") Long id, ModelMap modelMap)
	{
    	try {
			SecurityUtil.getInstance().checkPermission(Permissions.EDIT_CHILD);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");     
	        Child child = Child.findChild(id); 
	        modelMap.addAttribute("child", child); 
	        modelMap.addAttribute("child_createdOn_date_format", AppContext.getDatePattern());            
	        modelMap.addAttribute("child_dateOfBirth_date_format", AppContext.getDatePattern());            
	        modelMap.addAttribute("child_diabetesDiagnosed_date_format", AppContext.getDatePattern());            
	        modelMap.addAttribute("child_insulinSince_date_format", AppContext.getDatePattern());            
	        modelMap.addAttribute("child_updatedOn_date_format", AppContext.getDatePattern());            
	        modelMap.addAttribute("child_dateOfDeath_date_format", AppContext.getDatePattern());            
	        modelMap.addAttribute("child_dateOfRegistration_date_format", AppContext.getDatePattern());        
			return "child/print";
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to print child with id: " + id);
    		e.printStackTrace();
    	}
    	return "unexpectedError";
	}
    
    @RequestMapping(value = "/child/print", method = RequestMethod.GET)    
    public void ChildController.printForm(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
	{
    	try {
	    	ReportGenerator repGen = new ChildReportGenerator();
	    	repGen.generateExcelReport("List Children", Child.findAllChildren(), 
	    			new ChildFields[] {ChildFields.ALL}, request, response);
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to print children list");
    		e.printStackTrace();
    	}
	}    
    
    @RequestMapping(value = "/child/{id}", method = RequestMethod.DELETE)    
    public String ChildController.delete(@PathVariable("id") Long id, 
    									 @RequestParam(value = "page", required = false) Integer page, 
    									 @RequestParam(value = "size", required = false) Integer size) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        Child child = Child.findChild(id);  
	        child.setIsDeleted(true);
	        child.persist();
	        return "redirect:/child?page=" + ((page == null) ? "1" : page.toString()) +
        		"&size=" + ((size == null) ? "10" : size.toString()); 
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to delete child with id:" + id);
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
	public void ChildController.validate(BindingResult result, Child child) {
		Errors errors = new BindException(result);
		ChildValidator validator = new ChildValidator();
		validator.validate(child, errors);
	}    
	
	private Search ChildController.createSearchFromParams(String country, String centre, String fromDate, 
			String toDate, String createdFromDate, String createdToDate, 
    		String lastName, String firstName, String localMedicalNum) {
		Search search = new Search();
		search.setCountry(country);
		search.setCentre(centre);
		search.setFromDate(fromDate);
		search.setToDate(toDate);
		search.setCreatedFromDate(createdFromDate);
		search.setCreatedToDate(createdToDate);
		search.setName(firstName);
		search.setLastName(lastName);
		search.setId(localMedicalNum);
		return search;
	}
	
	private void ChildController.addSearchToModel(Child child, ModelMap modelMap, Search search) {
        // TODO just get ids here ideally as this query could be expensive
        List<Child> children = Child.findChildren(search);
        int index = children.indexOf(child);
        Long previousId = (index == 0) ? null : children.get(index - 1).getId();
        Long nextId = (index == (children.size() -1)) ? null : children.get(index + 1).getId();
        modelMap.addAttribute("previousId", previousId);
        modelMap.addAttribute("nextId", nextId);
        modelMap.addAttribute("search", SearchController.buildSearchQueryParams(search));
	}
    
}
