package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.CreatineUnitsType;
import org.lifeforachild.domain.DiabetesCopingType;
import org.lifeforachild.domain.HbA1cMethodType;
import org.lifeforachild.domain.MG_OR_MMOL_Type;
import org.lifeforachild.domain.MicroalbuminuriaUnitsType;
import org.lifeforachild.domain.NotAttendingSchoolReasonType;
import org.lifeforachild.domain.ReasonNotEnteringType;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.YesNoLaterType;
import org.lifeforachild.domain.YesNoNAType;
import org.lifeforachild.domain.YesNoUnkownType;
import org.lifeforachild.domain.YesNoType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ClinicalRecordController_Roo_Controller {
    
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.POST)    
    public String ClinicalRecordController.create(@Valid ClinicalRecord clinicalRecord, BindingResult result, ModelMap modelMap) {    
        if (clinicalRecord == null) throw new IllegalArgumentException("A clinicalRecord is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("clinicalRecord", clinicalRecord);                       
            modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());            
            modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());            
            modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());            
            modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());            
            modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());            
            modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());            
            modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants());            
            modelMap.addAttribute("users", User.findAllUsers());            
            modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());            
            modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants());     
            modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("clinicalRecord_ifMenarcheAge_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "clinicalrecord/create";            
        }        
        clinicalRecord.setExactAge(clinicalRecord.calculateExactAge());
        clinicalRecord.setInsulinPerKg(clinicalRecord.calculateInsulinPerKg());
        clinicalRecord.setWeightSD(clinicalRecord.calculateWeightSD());
        
        if (clinicalRecord.getHeightCM() != null) {
            clinicalRecord.setBmi(clinicalRecord.calculateBMI());
            clinicalRecord.setBmiSD(clinicalRecord.calculateBmiSD());
            clinicalRecord.setHeightSD(clinicalRecord.calculateHeightSD());
        }
        
        if(clinicalRecord.getHeightSD() != null && !clinicalRecord.getHeightSD().equals(new Float(0))) {
            clinicalRecord.setBloodPressureSystolicSD(clinicalRecord.calcSystolicBloodPressureSD());
            clinicalRecord.setBloodPressureDiastolicSD(clinicalRecord.calcDiastolicBloodPressureSD());
        }
        
        clinicalRecord.persist();        
        return "redirect:/clinicalrecord/" + clinicalRecord.getId();        
    }    
    
    @RequestMapping(value = "/clinicalrecord/form/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.createForm(@PathVariable("id") Long id, ModelMap modelMap) {  
    	ClinicalRecord record = new ClinicalRecord();
    	record.setChild(Child.findChild(id));
        modelMap.addAttribute("clinicalRecord", record);
        modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());        
        modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());        
        modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());        
        modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());        
        modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());        
        modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());        
        modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants());        
        modelMap.addAttribute("users", User.findAllUsers());        
        modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());        
        modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants());       
        modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_ifMenarcheAge_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "clinicalrecord/create";        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_ifMenarcheAge_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord", ClinicalRecord.findClinicalRecord(id));        
        return "clinicalrecord/show";        
    }    
    
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.GET)    
    public String ClinicalRecordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findClinicalRecordEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) ClinicalRecord.countClinicalRecords() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("clinicalrecords", ClinicalRecord.findAllClinicalRecords());            
        }        
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_ifMenarcheAge_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "clinicalrecord/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ClinicalRecordController.update(@Valid ClinicalRecord clinicalRecord, BindingResult result, ModelMap modelMap) {    
        if (clinicalRecord == null) throw new IllegalArgumentException("A clinicalRecord is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("clinicalRecord", clinicalRecord);                       
            modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());            
            modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());            
            modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());            
            modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());            
            modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());            
            modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());            
            modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants());            
            modelMap.addAttribute("users", User.findAllUsers());            
            modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());            
            modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants()); 
            modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());            
            modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("clinicalRecord_ifMenarcheAge_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "clinicalrecord/update";            
        }                
        clinicalRecord.setExactAge(clinicalRecord.calculateExactAge());
        clinicalRecord.setInsulinPerKg(clinicalRecord.calculateInsulinPerKg());
        clinicalRecord.setWeightSD(clinicalRecord.calculateWeightSD());
        
        if (clinicalRecord.getHeightCM() != null) {
            clinicalRecord.setBmi(clinicalRecord.calculateBMI());
            clinicalRecord.setBmiSD(clinicalRecord.calculateBmiSD());
            clinicalRecord.setHeightSD(clinicalRecord.calculateHeightSD());
        }
        
        if(clinicalRecord.getHeightSD() != null && !clinicalRecord.getHeightSD().equals(new Float(0))) {
            clinicalRecord.setBloodPressureSystolicSD(clinicalRecord.calcSystolicBloodPressureSD());
            clinicalRecord.setBloodPressureDiastolicSD(clinicalRecord.calcDiastolicBloodPressureSD());
        }
        
        clinicalRecord.merge();        
        return "redirect:/clinicalrecord/" + clinicalRecord.getId();        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}/form", method = RequestMethod.GET)    
    public String ClinicalRecordController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalRecord", ClinicalRecord.findClinicalRecord(id));                
        modelMap.addAttribute("creatineunitstype_enum", CreatineUnitsType.class.getEnumConstants());        
        modelMap.addAttribute("diabetescopingtype_enum", DiabetesCopingType.class.getEnumConstants());        
        modelMap.addAttribute("hba1cmethodtype_enum", HbA1cMethodType.class.getEnumConstants());        
        modelMap.addAttribute("mg_or_mmol_type_enum", MG_OR_MMOL_Type.class.getEnumConstants());        
        modelMap.addAttribute("microalbuminuriaunitstype_enum", MicroalbuminuriaUnitsType.class.getEnumConstants());        
        modelMap.addAttribute("notattendingschoolreasontype_enum", NotAttendingSchoolReasonType.class.getEnumConstants());        
        modelMap.addAttribute("reasonnotenteringtype_enum", ReasonNotEnteringType.class.getEnumConstants());        
        modelMap.addAttribute("users", User.findAllUsers());        
        modelMap.addAttribute("yesnolatertype_enum", YesNoLaterType.class.getEnumConstants());        
        modelMap.addAttribute("yesnonatype_enum", YesNoNAType.class.getEnumConstants());  
        modelMap.addAttribute("yesnotype_enum", YesNoType.class.getEnumConstants()); 
        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());        
        modelMap.addAttribute("clinicalRecord_dateOfMeasurement_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_ifMenarcheAge_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("clinicalRecord_dateCompleted_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "clinicalrecord/update";        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.DELETE)    
    public String ClinicalRecordController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        ClinicalRecord.findClinicalRecord(id).remove();        
        return "redirect:/clinicalrecord?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
