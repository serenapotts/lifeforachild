package org.lifeforachild.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
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
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ClinicalRecordController_Roo_Controller {
    
    @RequestMapping(value = "/clinicalrecord", method = RequestMethod.POST)    
    public String ClinicalRecordController.create(@ModelAttribute("clinicalrecord") ClinicalRecord clinicalrecord, BindingResult result, ModelMap modelMap) {    
        if (clinicalrecord == null) throw new IllegalArgumentException("A clinicalrecord is required");        
        for (ConstraintViolation<ClinicalRecord> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(clinicalrecord)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "clinicalrecord.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("clinicalrecord", clinicalrecord);            
            modelMap.addAttribute("children", Child.findAllChildren());            
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
            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());            
            return "clinicalrecord/create";            
        }        
        clinicalrecord.persist();        
        return "redirect:/clinicalrecord/" + clinicalrecord.getId();        
    }    
    
    @RequestMapping(value = "/clinicalrecord/form", method = RequestMethod.GET)    
    public String ClinicalRecordController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("clinicalrecord", new ClinicalRecord());        
        modelMap.addAttribute("children", Child.findAllChildren());        
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
        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());        
        return "clinicalrecord/create";        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.GET)    
    public String ClinicalRecordController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalrecord", ClinicalRecord.findClinicalRecord(id));        
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
        return "clinicalrecord/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String ClinicalRecordController.update(@ModelAttribute("clinicalrecord") ClinicalRecord clinicalrecord, BindingResult result, ModelMap modelMap) {    
        if (clinicalrecord == null) throw new IllegalArgumentException("A clinicalrecord is required");        
        for (ConstraintViolation<ClinicalRecord> constraint : Validation.buildDefaultValidatorFactory().getValidator().validate(clinicalrecord)) {        
            result.rejectValue(constraint.getPropertyPath().toString(), "clinicalrecord.error." + constraint.getPropertyPath(), constraint.getMessage());            
        }        
        if (result.hasErrors()) {        
            modelMap.addAllAttributes(result.getAllErrors());            
            modelMap.addAttribute("clinicalrecord", clinicalrecord);            
            modelMap.addAttribute("children", Child.findAllChildren());            
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
            modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());            
            return "clinicalrecord/update";            
        }        
        clinicalrecord.merge();        
        return "redirect:/clinicalrecord/" + clinicalrecord.getId();        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}/form", method = RequestMethod.GET)    
    public String ClinicalRecordController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("clinicalrecord", ClinicalRecord.findClinicalRecord(id));        
        modelMap.addAttribute("children", Child.findAllChildren());        
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
        modelMap.addAttribute("yesnounkowntype_enum", YesNoUnkownType.class.getEnumConstants());        
        return "clinicalrecord/update";        
    }    
    
    @RequestMapping(value = "/clinicalrecord/{id}", method = RequestMethod.DELETE)    
    public String ClinicalRecordController.delete(@PathVariable("id") Long id) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        ClinicalRecord.findClinicalRecord(id).remove();        
        return "redirect:/clinicalrecord";        
    }    
    
    @InitBinder    
    public void ClinicalRecordController.initBinder(WebDataBinder binder) {    
        binder.registerCustomEditor(java.util.Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(new java.text.SimpleDateFormat("d/MM/yy"), true));        
    }    
    
}
