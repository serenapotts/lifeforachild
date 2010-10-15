package org.lifeforachild.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.CreatineUnitsType;
import org.lifeforachild.domain.DiabetesCopingType;
import org.lifeforachild.domain.HbA1cMethodType;
import org.lifeforachild.domain.MG_OR_MMOL_Type;
import org.lifeforachild.domain.MicroalbuminuriaUnitsType;
import org.lifeforachild.domain.NotAttendingSchoolReasonType;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.ReasonNotEnteringType;
import org.lifeforachild.domain.SexType;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.WhoAdjustsInsulinType;
import org.lifeforachild.domain.YesNoLaterType;
import org.lifeforachild.domain.YesNoNAType;
import org.lifeforachild.domain.YesNoType;
import org.lifeforachild.domain.YesNoUnkownType;
import org.lifeforachild.web.validation.ClinicalRecordValidator;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ClinicalRecordController_Roo_Controller {
    
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.POST)    
    public String ClinicalRecordController.create(@Valid ClinicalRecord clinicalRecord, BindingResult result, ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_RECORD);
    	if (clinicalRecord == null) throw new IllegalArgumentException("A clinicalRecord is required");
    	validate(result, clinicalRecord);
        if (result.hasErrors()) {                	        	
            modelMap.addAttribute("clinicalRecord", clinicalRecord);                       
            modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());            
            modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());            
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
            modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));                        
            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "clinicalrecord/create";            
        }        
        // still set age in case click update without clicking out of dom field
        clinicalRecord.setExactAge(clinicalRecord.calculateAge(clinicalRecord.getDateOfMeasurement(), clinicalRecord.getChild().getDateOfBirth()));
        clinicalRecord.setExactAgeMonths(ClinicalRecord.calculateExactAgeMonths(clinicalRecord.getExactAge()));
        
        Float exactAge = clinicalRecord.getExactAge();
        Float exactAgeMonths = clinicalRecord.getExactAgeMonths();
        SexType childSex = clinicalRecord.getChild().getSex();
        
        clinicalRecord.setInsulinPerKg(clinicalRecord.calculateInsulinPerKg(clinicalRecord.getWeightKG(), clinicalRecord.getInsulinUnitsPerDay()));
        clinicalRecord.setWeightSD(ClinicalRecord.calculateWeightSD(exactAgeMonths, childSex, clinicalRecord.getWeightKG()));
        clinicalRecord.setHeightSD(ClinicalRecord.calculateHeightSD(exactAgeMonths, childSex, clinicalRecord.getHeightCM()));
        
        clinicalRecord.setBmi(ClinicalRecord.calculateBMI(clinicalRecord.getWeightKG(), clinicalRecord.getHeightCM()));
        clinicalRecord.setBmiSD(ClinicalRecord.calculateBmiSD(exactAgeMonths, childSex, clinicalRecord.getBmi()));
        
        clinicalRecord.setBloodPressureSystolicSD(ClinicalRecord.calcSystolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureSystolicSD()));
        clinicalRecord.setBloodPressureDiastolicSD(clinicalRecord.calcDiastolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureDiastolicSD()));
        
        clinicalRecord.persist();        
        return "redirect:/clinicalrecord/" + clinicalRecord.getId();        
    }    
    
    @RequestMapping(value = "/clinicalrecord/form/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.createForm(@PathVariable("id") Long id, ModelMap modelMap) {  
    	SecurityUtil.getInstance().checkPermission(Permissions.CREATE_RECORD);
    	ClinicalRecord record = new ClinicalRecord();
    	// set child for record from child information passed when creating record
    	record.setChild(Child.findChild(id));
    	record.setIsDeleted(false); 
    	// set person completing to the current user
    	//record.setPersonCompletingForm(SecurityUtil.getInstance().getApplicationUserForCurrentUser());
    	// default date completed to today
    	record.setDateCompleted(new Date());
        modelMap.addAttribute("clinicalRecord", record);
        modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());        
        modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());        
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
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));                
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "clinicalrecord/create";        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));                
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord", ClinicalRecord.findClinicalRecord(id));        
        return "clinicalrecord/show";        
    }    
    
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.GET)    
    public String ClinicalRecordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
    	// users should never be able to view this page they have to go through the child
    	throw new AccessDeniedException("Denied");
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ClinicalRecordController.update(@Valid ClinicalRecord clinicalRecord, BindingResult result, ModelMap modelMap) {    
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
    	if (clinicalRecord == null) throw new IllegalArgumentException("A clinicalRecord is required");
    	validate(result, clinicalRecord);
        if (result.hasErrors()) {        
            modelMap.addAttribute("clinicalRecord", clinicalRecord);                       
            modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());            
            modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());            
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
            modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));                        
            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "clinicalrecord/update";            
        }
        
        clinicalRecord.setInsulinPerKg(clinicalRecord.calculateInsulinPerKg(clinicalRecord.getWeightKG(), clinicalRecord.getInsulinUnitsPerDay()));
        
        clinicalRecord.setExactAge(clinicalRecord.calculateAge(clinicalRecord.getDateOfMeasurement(), clinicalRecord.getChild().getDateOfBirth()));
        clinicalRecord.setExactAgeMonths(ClinicalRecord.calculateExactAgeMonths(clinicalRecord.getExactAge()));

        Float exactAge = clinicalRecord.getExactAge();
        Float exactAgeMonths = clinicalRecord.getExactAgeMonths();
        SexType childSex = clinicalRecord.getChild().getSex();
        
        clinicalRecord.setWeightSD(ClinicalRecord.calculateWeightSD(exactAgeMonths, childSex, clinicalRecord.getWeightKG()));
        clinicalRecord.setHeightSD(ClinicalRecord.calculateHeightSD(exactAgeMonths, childSex, clinicalRecord.getHeightCM()));
        
        clinicalRecord.setBmi(ClinicalRecord.calculateBMI(clinicalRecord.getWeightKG(), clinicalRecord.getHeightCM()));
        clinicalRecord.setBmiSD(ClinicalRecord.calculateBmiSD(exactAgeMonths, childSex, clinicalRecord.getBmi()));
        
        clinicalRecord.setBloodPressureSystolicSD(ClinicalRecord.calcSystolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureSystolicSD()));
        clinicalRecord.setBloodPressureDiastolicSD(ClinicalRecord.calcDiastolicBloodPressureSD(exactAge, childSex, clinicalRecord.getHeightSD(), clinicalRecord.getBloodPressureDiastolicSD()));
        
        clinicalRecord.merge();        
        return "redirect:/clinicalrecord/" + clinicalRecord.getId();
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}/form", method = RequestMethod.GET)    
    public String ClinicalRecordController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");  
        ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
        List<User> users = new ArrayList<User>();
        users.add(record.getPersonCompletingForm());
        modelMap.addAttribute("clinicalRecord", record);                
        modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());        
        modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());        
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
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));                
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "clinicalrecord/update";        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}/print", method = RequestMethod.GET)    
    public String ClinicalRecordController.printForm(@PathVariable("id") Long id, ModelMap modelMap) {
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");  
        ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
        modelMap.addAttribute("clinicalRecord", record);                
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));                
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "clinicalrecord/print";  
    }
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.DELETE)    
    public String ClinicalRecordController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
    	SecurityUtil.getInstance().checkPermission(Permissions.EDIT_RECORD);
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        ClinicalRecord record = ClinicalRecord.findClinicalRecord(id);
        record.setIsDeleted(true);
        record.persist();
        return "redirect:/clinicalrecord?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
    public void ClinicalRecordController.validate(BindingResult result, ClinicalRecord clinicalRecord)
    {
    	Errors errors = new BindException(result);
    	ClinicalRecordValidator validator = new ClinicalRecordValidator();
    	validator.validate(clinicalRecord, errors);
    }
    
}
