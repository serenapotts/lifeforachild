package org.lifeforachild.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.User;
import org.lifeforachild.enums.CreatineUnitsType;
import org.lifeforachild.enums.DiabetesCopingType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.MG_OR_MMOL_Type;
import org.lifeforachild.enums.MicroalbuminuriaUnitsType;
import org.lifeforachild.enums.NotAttendingSchoolReasonType;
import org.lifeforachild.enums.ReasonNotEnteringType;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.WhoAdjustsInsulinType;
import org.lifeforachild.enums.YesNoLaterType;
import org.lifeforachild.enums.YesNoNAType;
import org.lifeforachild.enums.YesNoType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.lifeforachild.web.validation.ClinicalRecordValidator;
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
import org.lifeforachild.web.AppContext;

privileged aspect ClinicalRecordController_Roo_Controller {
    
	private static final Log LOG = LogFactory.getLog(ClinicalRecordController.class);
	
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.POST)    
    public String ClinicalRecordController.create(@Valid ClinicalRecord clinicalRecord, 
    											  BindingResult result, ModelMap modelMap, HttpServletRequest request) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_RECORD);
	    	if (clinicalRecord == null) throw new IllegalArgumentException("A clinicalRecord is required");
	    	validate(result, clinicalRecord);
	        if (result.hasErrors()) {                	
	            modelMap.addAttribute("clinicalRecord", clinicalRecord);                       
	            modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());            
	            modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());   
	            modelMap.addAttribute("researchconsenttype_enum", ResearchConsentType.class.getEnumConstants()); 
	            modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());            
	            modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());            
	            modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());            
	            modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());            
	            modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants()); 
	            modelMap.addAttribute("whoAdjustsInsulinType_enum", WhoAdjustsInsulinType.class.getEnumConstants());
	            modelMap.addAttribute("users", SecurityUtil.getInstance().getApplicationUserForCurrentUserAsList());            
	            modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());            
	            modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants());     
	            modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
	            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());            
	            modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", AppContext.getDatePattern());                        
	            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern());
	            modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	            return "clinicalrecord/create";            
	        }        
	        // still set age in case click update without clicking out of dom field
	        clinicalRecord.setExactAge(ClinicalRecord.calculateAge(clinicalRecord.getDateOfMeasurement(), clinicalRecord.getChild().getDateOfBirth()));
	        clinicalRecord.setExactAgeMonths(ClinicalRecord.calculateExactAgeMonths(clinicalRecord.getExactAge()));
	        
	        Float exactAge = clinicalRecord.getExactAge();
	        Float exactAgeMonths = clinicalRecord.getExactAgeMonths();
	        SexType childSex = clinicalRecord.getChild().getSex();
	        
	        clinicalRecord.setInsulinPerKg(ClinicalRecord.calculateInsulinPerKg(clinicalRecord.getWeightKG(), clinicalRecord.getInsulinUnitsPerDay()));
	        clinicalRecord.setWeightSD(ClinicalRecord.calculateWeightSD(exactAgeMonths, childSex, clinicalRecord.getWeightKG()));
	        clinicalRecord.setHeightSD(ClinicalRecord.calculateHeightSD(exactAgeMonths, childSex, clinicalRecord.getHeightCM()));
	        
	        clinicalRecord.setBmi(ClinicalRecord.calculateBMI(clinicalRecord.getWeightKG(), clinicalRecord.getHeightCM()));
	        clinicalRecord.setBmiSD(ClinicalRecord.calculateBmiSD(exactAgeMonths, childSex, clinicalRecord.getBmi()));
	        
	        clinicalRecord.setBloodPressureSystolicSD(ClinicalRecord.calcSystolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureSystolicMMHg()));
	        clinicalRecord.setBloodPressureDiastolicSD(ClinicalRecord.calcDiastolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureDiastolicMMHg()));
	        
	        clinicalRecord.persist();        
	        AppContext.getMailSender().send(true, false, request.getRequestURL() + "/form");
	        return "redirect:/clinicalrecord/" + clinicalRecord.getId();    
    	} catch (AccessDeniedException ade) {
    		throw ade;
     	} catch (Exception e) {
    		LOG.error("Unable to save clinical record for create");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/clinicalrecord/form/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.createForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_RECORD);
	    	ClinicalRecord record = new ClinicalRecord();
	    	Child child = Child.findChild(id);
	    	// set child for record from child information passed when creating record
	    	record.setChild(child);
	    	record.setIsDeleted(false); 
	    	// default date completed to today
	    	record.setDateCompleted(new Date());
	    	ClinicalRecord maxRecord = ClinicalRecord.findMaxClinicalRecordEntries(child.getId());
	    	record.setPreviousConsentGivenCode(maxRecord != null ? maxRecord.getConsentGiven().name() : "");
	        modelMap.addAttribute("clinicalRecord", record);
	        modelMap.addAttribute("previousConsentGiven", maxRecord != null ? maxRecord.getConsentGiven() : "");
	        modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());        
	        modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());
	        modelMap.addAttribute("researchconsenttype_enum", ResearchConsentType.class.getEnumConstants()); 
	        modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());        
	        modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());        
	        modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());        
	        modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());        
	        modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants()); 
	        modelMap.addAttribute("whoAdjustsInsulinType_enum", WhoAdjustsInsulinType.class.getEnumConstants());
	        modelMap.addAttribute("users", SecurityUtil.getInstance().getApplicationUserForCurrentUserAsList());        
	        modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());        
	        modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants());       
	        modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
	        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());        
	        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", AppContext.getDatePattern());                
	        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern()); 
	        modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	        return "clinicalrecord/create";     
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate clinical record for create");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.show(@PathVariable("id") Long id, ModelMap modelMap) {   
    	try {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", AppContext.getDatePattern());                
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern());     
        modelMap.addAttribute("clinicalRecord_dateReviewed_date_format", AppContext.getDatePattern());  
        modelMap.addAttribute("clinicalRecord", ClinicalRecord.findClinicalRecord(id));        
        return "clinicalrecord/show";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to get clinical record with id" + id);
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.GET)    
    public String ClinicalRecordController.list(@RequestParam(value = "page", required = false) Integer page, 
    											@RequestParam(value = "size", required = false) Integer size, 
    											ModelMap modelMap, HttpServletRequest request) {
    	// users should never be able to view this page they have to go through the child
    	throw new AccessDeniedException("Denied");
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ClinicalRecordController.update(@Valid ClinicalRecord clinicalRecord, 
    											  BindingResult result, ModelMap modelMap, 
    											  HttpServletRequest request) {    
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
	    	if (clinicalRecord == null) throw new IllegalArgumentException("A clinicalRecord is required");
	    	validate(result, clinicalRecord);
	        if (result.hasErrors()) {        
	            modelMap.addAttribute("clinicalRecord", clinicalRecord);                       
	            modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());            
	            modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());   
	            modelMap.addAttribute("researchconsenttype_enum", ResearchConsentType.class.getEnumConstants()); 
	            modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());            
	            modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());            
	            modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());            
	            modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());            
	            modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants()); 
	            modelMap.addAttribute("whoAdjustsInsulinType_enum", WhoAdjustsInsulinType.class.getEnumConstants());
	            modelMap.addAttribute("users", SecurityUtil.getInstance().getApplicationUserForCurrentUserAsList());            
	            modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());            
	            modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants()); 
	            modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
	            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());            
	            modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", AppContext.getDatePattern());                        
	            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern()); 
	            modelMap.addAttribute("clinicalRecord_dateReviewed_date_format", AppContext.getDatePattern());
	            modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	            return "clinicalrecord/update";            
	        }
	        
	        clinicalRecord.setInsulinPerKg(ClinicalRecord.calculateInsulinPerKg(clinicalRecord.getWeightKG(), clinicalRecord.getInsulinUnitsPerDay()));
	        
	        clinicalRecord.setExactAge(ClinicalRecord.calculateAge(clinicalRecord.getDateOfMeasurement(), clinicalRecord.getChild().getDateOfBirth()));
	        clinicalRecord.setExactAgeMonths(ClinicalRecord.calculateExactAgeMonths(clinicalRecord.getExactAge()));
	
	        Float exactAge = clinicalRecord.getExactAge();
	        Float exactAgeMonths = clinicalRecord.getExactAgeMonths();
	        SexType childSex = clinicalRecord.getChild().getSex();
	        
	        clinicalRecord.setWeightSD(ClinicalRecord.calculateWeightSD(exactAgeMonths, childSex, clinicalRecord.getWeightKG()));
	        clinicalRecord.setHeightSD(ClinicalRecord.calculateHeightSD(exactAgeMonths, childSex, clinicalRecord.getHeightCM()));
	        
	        clinicalRecord.setBmi(ClinicalRecord.calculateBMI(clinicalRecord.getWeightKG(), clinicalRecord.getHeightCM()));
	        clinicalRecord.setBmiSD(ClinicalRecord.calculateBmiSD(exactAgeMonths, childSex, clinicalRecord.getBmi()));
	        
	        clinicalRecord.setBloodPressureSystolicSD(ClinicalRecord.calcSystolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureSystolicMMHg()));
	        clinicalRecord.setBloodPressureDiastolicSD(ClinicalRecord.calcDiastolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureDiastolicMMHg()));
	        
	        clinicalRecord.merge();        
	        AppContext.getMailSender().send(false, false, request.getRequestURL() + "/form");
	        return "redirect:/clinicalrecord/" + clinicalRecord.getId();
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to update clinical record");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}/form", method = RequestMethod.GET)    
    public String ClinicalRecordController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");  
	        ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
	        List<User> users = new ArrayList<User>();
	        users.add(record.getPersonCompletingForm());
	        modelMap.addAttribute("clinicalRecord", record);                
	        modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());        
	        modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());   
	        modelMap.addAttribute("researchconsenttype_enum", ResearchConsentType.class.getEnumConstants()); 
	        modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());        
	        modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());        
	        modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());        
	        modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());        
	        modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants());   
	        modelMap.addAttribute("whoAdjustsInsulinType_enum", WhoAdjustsInsulinType.class.getEnumConstants());
	        modelMap.addAttribute("users", users);        
	        modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());        
	        modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants());  
	        modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
	        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());        
	        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", AppContext.getDatePattern());                
	        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern()); 
	        modelMap.addAttribute("clinicalRecord_dateReviewed_date_format", AppContext.getDatePattern());
	        modelMap.addAttribute("locale", LocaleContextHolder.getLocale().toString());
	        return "clinicalrecord/update";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to populate clinical record for update");
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}/print", method = RequestMethod.GET)    
    public String ClinicalRecordController.printForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");  
	        ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
	        modelMap.addAttribute("clinicalRecord", record);                
	        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", AppContext.getDatePattern());                
	        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", AppContext.getDatePattern());    
	        modelMap.addAttribute("clinicalRecord_dateReviewed_date_format", AppContext.getDatePattern());
	        return "clinicalrecord/print";  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to print clinical record with id " + id);
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.DELETE)    
    public String ClinicalRecordController.delete(@PathVariable("id") Long id, 
    		@RequestParam(value = "page", required = false) Integer page, 
    		@RequestParam(value = "size", required = false) Integer size) {
    	try {
	    	SecurityUtil.getInstance().checkPermission(Permissions.CAN_DELETE);
	        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
	        ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
	        record.setIsDeleted(true);
	        record.persist();
	        return "redirect:/clinicalrecord?page=" + ((page == null) ? "1" : page.toString()) 
	        		+ "&size=" + ((size == null) ? "10" : size.toString());  
    	} catch (AccessDeniedException ade) {
    		throw ade;
    	} catch (Exception e) {
    		LOG.error("Unable to delete clinical record with id " + id);
    		e.printStackTrace();
    	}
    	return "unexpectedError";
    }    
    
    public void ClinicalRecordController.validate(BindingResult result, ClinicalRecord clinicalRecord)
    {
    	Errors errors = new BindException(result);
    	ClinicalRecordValidator validator = new ClinicalRecordValidator();
    	validator.validate(clinicalRecord, errors);
    }
    
}
