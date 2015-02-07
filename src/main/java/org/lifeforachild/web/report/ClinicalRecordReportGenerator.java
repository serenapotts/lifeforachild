package org.lifeforachild.web.report;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.EntityManager;

import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.User;
import org.lifeforachild.enums.CreatineUnitsType;
import org.lifeforachild.enums.DiabetesCopingType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.MG_OR_MMOL_Type;
import org.lifeforachild.enums.MicroalbuminuriaUnitsType;
import org.lifeforachild.enums.NotAttendingSchoolReasonType;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.enums.WhoAdjustsInsulinType;
import org.lifeforachild.enums.YesNoLaterType;
import org.lifeforachild.enums.YesNoType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.lifeforachild.web.AppContext;
import org.lifeforachild.web.report.enums.ChildFields;
import org.lifeforachild.web.report.enums.ClinicalRecordFields;
import org.lifeforachild.web.query.ClinicalRecordQuery;

import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

/**
 * 
 * {@link ClinicalRecord} specific report generator.
 * 
 * @author Serena Potts
 *
 */
public class ClinicalRecordReportGenerator extends ReportGenerator {

    /**
     * Add columns specific to the child report.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	void addColumns(DynamicReportBuilder drb, Object[] fields) throws ColumnBuilderException {
		// these columns are displayed on every report
		addColumn(drb, "child.individualId", "Child ID", String.class, 85);
		addColumn(drb, "child.country.name", ChildFields.COUNTRY.getLabel(), String.class, 85);
		addColumn(drb, "child.centre.name", ChildFields.CENTRE.getLabel(), String.class, 85);
		boolean viewNameInfo = SecurityUtil.getInstance().hasPermission(Permissions.VIEW_CHILD_NAME);
        if (viewNameInfo)
        {
        	addColumn(drb, "child.name", "Child Name", String.class, 85);
        	addColumn(drb, "child.lastName", "Last Name", String.class, 85);
        }
        
        
        // configurable columns
		if (fields instanceof ClinicalRecordFields[])
        {
        	for (int i=0; i < fields.length; i++)
        	{
        		ClinicalRecordFields field = (ClinicalRecordFields)fields[i];
	        	switch (field) {
	        		case ALL:
	        		{
	        			addGeneralFields(drb);
	        			addDiabetesCareFields(drb);
	        			addClinicalMeasuresFields(drb);
	        			addEyesAndFeetFields(drb);
	        			addLabTestingFields(drb);
	        			addSchoolingFields(drb);
	        			addEmergenciesFields(drb);
	        			break;
	        		}
	        		case GENERAL:
	        		{
	        			addGeneralFields(drb);
	        			break;
	        		}
	        		case DIABETES_CARE:
	        		{
	        			addDiabetesCareFields(drb);
	        			break;
	        		}
	        		case CLINICAL_MEASURES:
	        		{
	        			addClinicalMeasuresFields(drb);
	        			break;
	        		}	        		
	        		case EYESANDFEET:
	        		{
	        			addEyesAndFeetFields(drb);	        		
	        			break;
	        		}
	        		case LAB_TESTING:
	        		{
	        			addLabTestingFields(drb);
	        			break;
	        		}
	        		case SCHOOLING:
	        		{
	        			addSchoolingFields(drb);
	        			break;
	        		}
	        		case EMERGENCIES:
	        		{
	        			addEmergenciesFields(drb);
	        			break;
	        		}
	        	}
        	}
        }
	}
	
	private String getColumnLabel(String code)
	{
		return AppContext.getMessage(code);
	}	

	private void addGeneralFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		
		drb.addField("personCompletingForm", String.class.getName()); 
		addColumn(drb, "personCompletingForm", getColumnLabel("record.personCompleting"), null, 85, null, User.getCustomExpression());
				
		addDateColumn(drb, "dateCompleted", getColumnLabel("record.dateCompleted"));
		addColumn(drb, "seniorPhysician", getColumnLabel("record.seniorPhysician"), String.class, 85);
		
		drb.addField("consentGiven", String.class.getName());        
        addColumn(drb, "consentGiven", getColumnLabel("record.consentGiven"), null, 85, null, ResearchConsentType.getCustomExpression());
        
        addColumn(drb, "exactAge", getColumnLabel("record.exactAge"), Float.class, 85);
        addColumn(drb, "insulinPerKg", getColumnLabel("record.insulinPerKg"), Float.class, 85);
	}
	
	private void addDiabetesCareFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		addColumn(drb, "bloodGlucoseSelfMonitoringPerWeek", getColumnLabel("record.bloodGlucose"), Integer.class, 85);
		addColumn(drb, "urineGlucoseSelfMonitoringPerWeek", getColumnLabel("record.urineGlucose"), Integer.class, 85);
		
		drb.addField("adjustInsulinDoseIfNeeded", String.class.getName());        
        addColumn(drb, "adjustInsulinDoseIfNeeded", getColumnLabel("record.whoAdjustsInsulinDose"), null, 85, null, WhoAdjustsInsulinType.getCustomExpression());
        
        addColumn(drb, "insulinUnitsPerDay", getColumnLabel("record.insulinPerDay"), Integer.class, 85);
		addColumn(drb, "numberOfInsulinInjectionsPerDay", getColumnLabel("record.numInjections"), Integer.class, 85);
		
		drb.addField("longActingHuman", String.class.getName());        
        addColumn(drb, "longActingHuman", getColumnLabel("record.longActingHuman"), null, 85, null, YesNoType.getCustomExpression("longActingHuman"));
        drb.addField("shortActingHuman", String.class.getName());        
        addColumn(drb, "shortActingHuman", getColumnLabel("record.shortActingHuman"), null, 85, null, YesNoType.getCustomExpression("shortActingHuman"));        
        drb.addField("analog", String.class.getName());        
        addColumn(drb, "analog", getColumnLabel("record.analog"), null, 85, null, YesNoType.getCustomExpression("analog"));
        
        drb.addField("oralAgents", String.class.getName());        
        addColumn(drb, "oralAgents", getColumnLabel("record.oralAgents"), null, 85, null, YesNoType.getCustomExpression("oralAgents"));
        addColumn(drb, "oralAgentsDescription", getColumnLabel("record.oralAgents.decription"), String.class, 85);
        
        addColumn(drb, "routineClinicReviewsLastYear", getColumnLabel("record.clinicReviews"), Integer.class, 85);
        
        drb.addField("bpMedications", String.class.getName());        
        addColumn(drb, "bpMedications", getColumnLabel("record.bpMedications"), null, 85, null, YesNoType.getCustomExpression("bpMedications"));        
        drb.addField("acearb", String.class.getName());        
        addColumn(drb, "acearb", getColumnLabel("record.acearbAgents"), null, 85, null, YesNoType.getCustomExpression("acearb"));
        addColumn(drb, "bpMedicationsOther", getColumnLabel("record.bpMedications.other"), String.class, 85);
        
        addColumn(drb, "otherTreatments", getColumnLabel("record.otherTreatments"), String.class, 85);        
	}
	
	private void addClinicalMeasuresFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		addDateColumn(drb, "dateOfMeasurement", getColumnLabel("record.dateOfMeasurement"));
		
		drb.addField("weightInLast12Months", String.class.getName());      
		addColumn(drb, "weightInLast12Months", getColumnLabel("record.weightInLast12Months"), null, 85, null, YesNoType.getCustomExpression("weightInLast12Months"));              
		addColumn(drb, "weightKG", getColumnLabel("record.weight"), Float.class, 85);
		
		drb.addField("heightInLast12Months", String.class.getName());      
		addColumn(drb, "heightInLast12Months", getColumnLabel("record.heightInLast12Months"), null, 85, null, YesNoType.getCustomExpression("heightInLast12Months"));
		addColumn(drb, "heightCM", getColumnLabel("record.height"), Float.class, 85);
		
		drb.addField("BPInLast12Months", String.class.getName());      
		addColumn(drb, "BPInLast12Months", getColumnLabel("record.BPInLast12Months"), null, 85, null, YesNoType.getCustomExpression("BPInLast12Months"));
		addColumn(drb, "bloodPressureSystolicMMHg", getColumnLabel("record.BPsystolic"), Integer.class, 85);
		addColumn(drb, "bloodPressureDiastolicMMHg", getColumnLabel("record.BPsystolicSD"), Integer.class, 85);
		
		drb.addField("hasPersistentHypertension", String.class.getName());        
        addColumn(drb, "hasPersistentHypertension", getColumnLabel("record.hypertension"), null, 85, null, 
        		YesNoUnkownType.getCustomExpression("hasPersistentHypertension"));
        
        drb.addField("hasPubertyTannerB2_P2orGreater", String.class.getName());        
        addColumn(drb, "hasPubertyTannerB2_P2orGreater", getColumnLabel("record.pubertyTanner"), null, 85, null, 
        		YesNoUnkownType.getCustomExpression("hasPubertyTannerB2_P2orGreater"));
        
        drb.addField("menarche", String.class.getName());        
        addColumn(drb, "menarche", getColumnLabel("record.menarche"), null, 85, null, YesNoUnkownType.getCustomExpression("menarche"));
        addColumn(drb, "ifMenarcheAge", getColumnLabel("record.menarcheAge"), String.class, 85);
        
        addColumn(drb, "bmi", getColumnLabel("record.bmi"), Float.class, 85);
        addColumn(drb, "heightSD", getColumnLabel("record.heightSD"), Float.class, 85);
        addColumn(drb, "weightSD", getColumnLabel("record.weightSD"), Float.class, 85);
        addColumn(drb, "bmiSD", getColumnLabel("record.bmiSD"), Float.class, 85);
        // TODO not working
        addColumn(drb, "bloodPressureSystolicSD", getColumnLabel("record.BPsystolicSD"), Float.class, 85);
        addColumn(drb, "bloodPressureDiastolicSD", getColumnLabel("record.BPdiastolicSD"), Float.class, 85);
	}

	private void addEyesAndFeetFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		drb.addField("eyesExaminedInLastYear", String.class.getName()); 
		addColumn(drb, "eyesExaminedInLastYear", getColumnLabel("record.eyesExaminedInLastYear"), null, 85, null, 
				YesNoUnkownType.getCustomExpression("eyesExaminedInLastYear"));        
        
		drb.addField("cateract", String.class.getName()); 
        addColumn(drb, "cateract", getColumnLabel("record.cataract"), null, 85, null, YesNoUnkownType.getCustomExpression("cateract"));
        
        addColumn(drb, "visualAcuityRight", getColumnLabel("record.VisualRight"), String.class, 85);
        addColumn(drb, "visualAcuityLeft", getColumnLabel("record.VisualLeft"), String.class, 85);
        addColumn(drb, "eyesComment", getColumnLabel("record.eyesComment"), String.class, 85);
        
        drb.addField("feetExaminedInLastYear", String.class.getName()); 
        addColumn(drb, "feetExaminedInLastYear", getColumnLabel("record.feetExaminedInLastYear"), null, 85, null, 
        		YesNoUnkownType.getCustomExpression("feetExaminedInLastYear"));
        
        drb.addField("monofilamentTested", String.class.getName());      
		addColumn(drb, "monofilamentTested", getColumnLabel("record.monoTested"), null, 85, null, YesNoType.getCustomExpression("monofilamentTested"));
		
		drb.addField("monofilamentAbnormal", String.class.getName());      
		addColumn(drb, "monofilamentAbnormal", getColumnLabel("record.monoAbnormal"), null, 85, null, YesNoType.getCustomExpression("monofilamentAbnormal"));
		
		drb.addField("tuningForkTested", String.class.getName());      
		addColumn(drb, "tuningForkTested", getColumnLabel("record.tuningForkTested"), null, 85, null, YesNoType.getCustomExpression("tuningForkTested"));
		
		drb.addField("tuningForkAbnormal", String.class.getName());      
		addColumn(drb, "tuningForkAbnormal", getColumnLabel("record.tuningForkAbnormal"), null, 85, null, YesNoType.getCustomExpression("tuningForkAbnormal"));
		
		addColumn(drb, "feetComment", getColumnLabel("record.feetComment"), String.class, 85);
	}

	private void addLabTestingFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		drb.addField("lastHbA1cInLast12Months", String.class.getName());      
		addColumn(drb, "lastHbA1cInLast12Months", getColumnLabel("record.lastHbA1c"), null, 85, null, 
				YesNoLaterType.getCustomExpression("lastHbA1cInLast12Months"));
		addColumn(drb, "hbA1cPercentage", getColumnLabel("record.hbA1cPercentage"), Float.class, 85);
		drb.addField("hbA1cMethod", String.class.getName());      
		addColumn(drb, "hbA1cMethod", getColumnLabel("record.hbA1cMethod"), null, 85, null, HbA1cMethodType.getCustomExpression());
		addColumn(drb, "hbA1cMethodOther", getColumnLabel("record.hbA1cMethodOther"), String.class, 85);		
		
		drb.addField("microalbuminuriaInLast12Months", String.class.getName());      
		addColumn(drb, "microalbuminuriaInLast12Months", getColumnLabel("record.lastMicroalbuminuria"), null, 85, null, 
				YesNoLaterType.getCustomExpression("microalbuminuriaInLast12Months"));
		addColumn(drb, "microalbuminuriaValue", getColumnLabel("record.microalbuminuriaValue"), String.class, 85);		
		drb.addField("microalbuminuriaUnitOfMeasure", String.class.getName());      
		addColumn(drb, "microalbuminuriaUnitOfMeasure", getColumnLabel("record.microalbuminuriaUnits"), null, 85, null, 
				MicroalbuminuriaUnitsType.getCustomExpression());
		
		addColumn(drb, "proteinuria_dipstick_other", getColumnLabel("record.proteinuria"), String.class, 85);	
		
		drb.addField("creatinineInLast12Months", String.class.getName());      
		addColumn(drb, "creatinineInLast12Months", getColumnLabel("record.lastCreatinine"), null, 85, null, 
				YesNoLaterType.getCustomExpression("creatinineInLast12Months"));
		addColumn(drb, "creatinineValue", getColumnLabel("record.creatinineValue"), Float.class, 85);		
		drb.addField("creatinineUnits", String.class.getName());      
		addColumn(drb, "creatinineUnits", getColumnLabel("record.creatinineUnits"), null, 85, null, 
				CreatineUnitsType.getCustomExpression());
		
		drb.addField("totalCholesterolInLast12Months", String.class.getName());      
		addColumn(drb, "totalCholesterolInLast12Months", getColumnLabel("record.lastCholesterol"), null, 85, null,
				YesNoLaterType.getCustomExpression("totalCholesterolInLast12Months"));
		addColumn(drb, "totalCholesterolValue", getColumnLabel("record.cholesterolValue"), Float.class, 85);		
		drb.addField("cholesterolUnits", String.class.getName());      
		addColumn(drb, "cholesterolUnits", getColumnLabel("record.cholesterolUnits"), null, 85, null, 
				MG_OR_MMOL_Type.getCustomExpression("cholesterolUnits"));
		
		drb.addField("hdlCholesterolInLast12Months", String.class.getName());      
		addColumn(drb, "hdlCholesterolInLast12Months", getColumnLabel("record.lastHdlCholesterol"), null, 85, null, 
				YesNoLaterType.getCustomExpression("hdlCholesterolInLast12Months"));
		addColumn(drb, "hdlCholesterolValue", getColumnLabel("record.hdlCholesterolValue"), Float.class, 85);		
		drb.addField("hdlUnits", String.class.getName());      
		addColumn(drb, "hdlUnits", getColumnLabel("record.hdlCholesterolUnits"), null, 85, null, 
				MG_OR_MMOL_Type.getCustomExpression("hdlUnits"));
		
		drb.addField("triglyceridesInLast12Months", String.class.getName());      
		addColumn(drb, "triglyceridesInLast12Months", getColumnLabel("record.lastTriglycerides"), null, 85, null, 
				YesNoLaterType.getCustomExpression("triglyceridesInLast12Months"));
		addColumn(drb, "triglyceridesValue", getColumnLabel("record.hdlCholesterolValue"), Float.class, 85);		
		drb.addField("triglyceridesUnits", String.class.getName());      
		addColumn(drb, "triglyceridesUnits", getColumnLabel("record.hdlCholesterolUnits"), null, 85, null, 
				MG_OR_MMOL_Type.getCustomExpression("triglyceridesUnits"));
		
		drb.addField("fasted", String.class.getName());      
		addColumn(drb, "fasted", getColumnLabel("record.fasted"), null, 85, null, 
				YesNoUnkownType.getCustomExpression("fasted"));
	}

	private void addSchoolingFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		drb.addField("attendingSchool", String.class.getName());      
		addColumn(drb, "attendingSchool", getColumnLabel("record.attendingSchool"), null, 85, null, 
				YesNoType.getCustomExpression("attendingSchool"));
		
		drb.addField("notAttendingSchoolWhy", String.class.getName());      
		addColumn(drb, "notAttendingSchoolWhy", getColumnLabel("record.whyNotAttendingSchool"), null, 85, null, 
				NotAttendingSchoolReasonType.getCustomExpression());
		
		drb.addField("diabetesLimitingAttendance", String.class.getName());      
		addColumn(drb, "diabetesLimitingAttendance", getColumnLabel("record.limitingAttendance"), null, 85, null, 
				YesNoType.getCustomExpression("diabetesLimitingAttendance"));
		
		drb.addField("appropriateGradeForAge", String.class.getName());      
		addColumn(drb, "appropriateGradeForAge", getColumnLabel("record.appropriateGrade"), null, 85, null, 
				YesNoType.getCustomExpression("appropriateGradeForAge"));
		
		drb.addField("diabetesCopingAbilities", String.class.getName());      
		addColumn(drb, "diabetesCopingAbilities", getColumnLabel("record.copingAbilities"), null, 85, null, 
				DiabetesCopingType.getCustomExpression());
	}

	private void addEmergenciesFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		addColumn(drb, "numberOfSevereHypoglycaemiaEpisodes", getColumnLabel("record.glyceamicEpisodes"), Integer.class, 85);
		addColumn(drb, "numberKetoacidosisEpisodes", getColumnLabel("record.ketoacidosisEpisodes"), Integer.class, 85);
		addColumn(drb, "numberOfHospitalAdmissionsRelatedToDiabetes", getColumnLabel("record.hospitalAdmissions"), Integer.class, 85);
		addColumn(drb, "additionalComment", getColumnLabel("record.additionalComment"), String.class, 85);
	}	

	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	public List<ClinicalRecord> buildQuery(Report report) {

		switch (report.getReporttype())
		{
			case INDIVIDUAL_CHILD_VISIT:
				return new ClinicalRecordQuery().getIndividualClinicalRecordQuery(report.getEntityManager(), report);
			case INDIVIDUAL_CHILD_MULTI_VISIT:
				return new ClinicalRecordQuery().getIndividualMultiVisitClinicalRecordQuery(report.getEntityManager(), report);
			case CHILD_RECENT_VISIT:
				return new ClinicalRecordQuery().getRecentVisitClinicalRecordQuery(report.getEntityManager(), report);
			case CHILD_SEEN_TIME_PERIOD:
				return new ClinicalRecordQuery().getBeenSeenVisitClinicalRecordQuery(report.getEntityManager(), report);
			default:
				return new ArrayList<ClinicalRecord>();				
		}
		//return null;
	}

	public Object[] getDisplayFieldsList(String fields)
	{
		ArrayList<ClinicalRecordFields> fieldList = new ArrayList<ClinicalRecordFields>();
		if (fields != null && fields.trim().length() > 0)
		{
			StringTokenizer st = new StringTokenizer(fields, DISPLAY_FIELD_SEPARATOR);
			while (st.hasMoreTokens())
			{
				fieldList.add(ClinicalRecordFields.valueOf(st.nextToken()));
			}
		}
		return fieldList.toArray();
	}
	
	public Object[] getDisplayFields(Report report)
	{
		return report.getClinicalrecordfields();
	}
	
	public String getFieldListAsString(Report report)
	{
		ClinicalRecordFields[] fields = report.getClinicalrecordfields();
		StringBuffer buffer = new StringBuffer();
		for (int i=0; i < fields.length; i++)
		{
			ClinicalRecordFields field = fields[i];
			if (i > 0)
				buffer.append(DISPLAY_FIELD_SEPARATOR);
			buffer.append(field.ordinal());
		}
		return buffer.toString();
	}
}
