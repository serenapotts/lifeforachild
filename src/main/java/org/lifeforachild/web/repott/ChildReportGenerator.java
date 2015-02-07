package org.lifeforachild.web.Report;

import java.util.ArrayList;
import java.util.List;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Report;
import org.lifeforachild.enums.BloodGlucoseUnitsType;
import org.lifeforachild.enums.CauseOfDeathType;
import org.lifeforachild.enums.DiabetesType;
import org.lifeforachild.enums.DistanceType;
import org.lifeforachild.enums.HbA1cMethodType;
import org.lifeforachild.enums.KnownUnkownType;
import org.lifeforachild.enums.NoMildSevereUnknownType;
import org.lifeforachild.enums.SexType;
import org.lifeforachild.enums.SurvivalStatusType;
import org.lifeforachild.enums.YesNoUnkownType;
import org.lifeforachild.enums.YesUnknownType;
import org.lifeforachild.web.AppContext;
import org.lifeforachild.web.Report.enums.ChildFields;
import org.lifeforachild.web.query.ChildQuery;
import org.springframework.context.i18n.LocaleContextHolder;

import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

/**
 * 
 * {@link Child} specific report generator.
 * 
 * @author Serena Potts
 *
 */
public class ChildReportGenerator extends ReportGenerator {

    /**
     * Add columns specific to the child report.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	void addColumns(DynamicReportBuilder drb, Object[] fields)
	throws ColumnBuilderException
	{
		// these columns are displayed on every report
		// TODO change the field names to use the constants in the child class 
        
        
        boolean viewNameInfo = SecurityUtil.getInstance().hasPermission(Permissions.VIEW_CHILD_NAME);
                     
        // configurable columns
        if (fields instanceof ChildFields[])
        {
        	for (int i=0; i < fields.length; i++)
        	{
        		ChildFields field = (ChildFields)fields[i];
	        	switch (field) {
	        	case ALL:
	        	{
	        		addIndividualId(drb);
	        		addFirstNameField(drb, viewNameInfo);
	        		addInitialsField(drb, viewNameInfo);
	        		addLastNameField(drb, viewNameInfo);
	        		addCountry(drb);
	        		addCentre(drb);
	        		addLocalMedicalNumber(drb);
	        		addSexField(drb);
	        		addEthnicGroup(drb);
	        		addSurvialStatus(drb);
	        		addDeathFields(drb);
	        		addDiabetesType(drb);
	        		addAgeAtDiagnosis(drb);
	        		addDOB(drb);
	        		addDateOfReg(drb);	        		
	        		addDiabetesDiagnosedDate(drb);	        		
	        		addDateInsulinSince(drb);
	        		addDistanceFromCentre(drb);
	        		addBloodGlucoseAtDiagnosis(drb);
	        		addHbA1cAtDiagnosis(drb);
	        		addKAtDiagnosis(drb);
	        		addPolyuriaAtDiagnosis(drb);
	        		addThirstAtDiagnosis(drb);
	        		addWeightLossAtDiagnosis(drb);
	        		addWeightAtDiagnosis(drb);
	        		addHeightAtDiagnosis(drb);
	        		addTypeOneInFamily(drb);
	        		addTypeTwoInFamily(drb);
	        		addMalnutrition(drb);
	        		addOtherComment(drb);
	        		break;
	        	}
	        	case INDIVIDUAL_ID:
	        		addIndividualId(drb);
	        		break;
	        	case INITIALS:
	        		addInitialsField(drb, viewNameInfo);
	        		break;
	        	case FIRST_NAME:
	        		addFirstNameField(drb, viewNameInfo);
	        		break;
	        	case LAST_NAME:
	        		addLastNameField(drb, viewNameInfo);
	        		break;
	        	case COUNTRY:
	        		addCountry(drb);
	        		break;
	        	case CENTRE:
	        		addCentre(drb);
	        		break;
	        	case LOCAL_MED_NO:
	        		addLocalMedicalNumber(drb);
	        		break;
	        	case SEX:
	        		addSexField(drb);
	        		break;
	        	case DIABETES_TYPE:
	        		addDiabetesType(drb);
	        		break;
				case AGE_AT_DIAGNOSIS:
					addAgeAtDiagnosis(drb);
					break;
				case DATE_OF_BIRTH:
					addDOB(drb);					
					break;
				case DATE_REGO:
					addDateOfReg(drb);
					break;
				case DEATH:
					addDeathFields(drb);
					break;
				case DIABETES_DIAGNOSED:
					addDiabetesDiagnosedDate(drb);
					break;
				case ETHNIC_GROUP:
					addEthnicGroup(drb);
					break;
				case INSULIN_SINCE:
					addDateInsulinSince(drb);
					break;
				case SURVIVAL_STATUS:
					addSurvialStatus(drb);
					break;
				case DISTANCE_FROM_CENTRE:
					addDistanceFromCentre(drb);
					break;
				case BLOOD_GLUCOSE_AT_DIAGNOSIS:
					addBloodGlucoseAtDiagnosis(drb);
					break;
				case HBA1C_AT_DIAGNOSIS:
					addHbA1cAtDiagnosis(drb);
					break;
				case KETOACIDOSIS_AT_DIAGNOSIS:
					addKAtDiagnosis(drb);
					break;
				case POLYURIA_AT_DIAGNOSIS:
					addPolyuriaAtDiagnosis(drb);
					break;
				case THIRST_AT_DIAGNOSIS:
					addThirstAtDiagnosis(drb);
					break;
				case WEIGHT_LOSS_AT_DIAGNOSIS:
					addWeightLossAtDiagnosis(drb);
					break;
				case WEIGHT_AT_DIAGNOSIS:
					addWeightAtDiagnosis(drb);
					break;
				case HEIGHT_AT_DIAGNOSIS:
					addHeightAtDiagnosis(drb);
					break;
				case TYPE_1_IN_FAMILY:
					addTypeOneInFamily(drb);
					break;
				case TYPE_2_IN_FAMILY:
					addTypeTwoInFamily(drb);
					break;
				case MALNUTRITION:
					addMalnutrition(drb);
					break;
				case ADDITIONAL_COMMENTS:
					addOtherComment(drb);
					break;
				default:
					break;
	        	}
			}
        }
	}
	
	private void addIndividualId(DynamicReportBuilder drb)  throws ColumnBuilderException
	{
		addColumn(drb, "individualId", ChildFields.INDIVIDUAL_ID.getLabel(), String.class, 85);
	}

	private void addFirstNameField(DynamicReportBuilder drb, boolean viewNameInfo) throws ColumnBuilderException
	{        
        if (viewNameInfo)
        	addColumn(drb, "name", ChildFields.FIRST_NAME.getLabel(), String.class, 85);
	}
	
	private void addLastNameField(DynamicReportBuilder drb, boolean viewNameInfo) throws ColumnBuilderException
	{        
        if (viewNameInfo)
        	addColumn(drb, "lastName", ChildFields.LAST_NAME.getLabel(), String.class, 85);
	}
	
	private void addInitialsField(DynamicReportBuilder drb, boolean viewNameInfo) throws ColumnBuilderException
	{        
        if (viewNameInfo)       
        	addColumn(drb, "initials", ChildFields.INITIALS.getLabel(), String.class, 85);  
	}
	
	private void addCountry(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addColumn(drb, "country.name", ChildFields.COUNTRY.getLabel(), String.class, 85);
	}
	
	private void addCentre(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addColumn(drb, "centre.name", ChildFields.CENTRE.getLabel(), String.class, 85);
	}
	
	private void addLocalMedicalNumber(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addColumn(drb, "localMedicalNumber", "Record Number", String.class, 85);
	}
	
	private void addSexField(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("sex", String.class.getName());        
        addColumn(drb, "sex", ChildFields.SEX.getLabel(), SexType.class, 85, null, SexType.getCustomExpression());
	}
	
	private void addDiabetesType(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("diabetesType", String.class.getName());
        addColumn(drb, "diabetesType", ChildFields.DIABETES_TYPE.getLabel(), 
        		DiabetesType.class, 85, null, DiabetesType.getCustomExpression());
        addColumn(drb, "diabetesTypeOther", getLabel("child.diabetesTypeOther"), String.class, 85);
	}
	
	private void addAgeAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addColumn(drb, "ageAtDiagnosis", ChildFields.AGE_AT_DIAGNOSIS.getLabel(), Float.class, 85);
	}
	
	private void addDOB(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addDateColumn(drb, "dateOfBirth", ChildFields.DATE_OF_BIRTH.getLabel());	
	}
	
	private void addDateOfReg(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addDateColumn(drb, "dateOfRegistration", ChildFields.DATE_REGO.getLabel());
	}
	
	private void addDeathFields(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addDateColumn(drb, "dateOfDeath", "Date of Death");
        drb.addField("causeOfDeath", String.class.getName());
        addColumn(drb, "causeOfDeath", "Cause of Death", Integer.class, 
        		85, null, CauseOfDeathType.getCustomExpression());
        addColumn(drb, "causeOfDeathOther", getLabel("child.causeOfDeathOther"), String.class, 85);
	}
	
	private void addDiabetesDiagnosedDate(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addDateColumn(drb, "diabetesDiagnosed", ChildFields.DIABETES_DIAGNOSED.getLabel());
	}
	
	private void addEthnicGroup(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addColumn(drb, "ethnicGroup", ChildFields.ETHNIC_GROUP.getLabel(), String.class, 85);
	}
	
	private void addDateInsulinSince(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addDateColumn(drb, "insulinSince", ChildFields.INSULIN_SINCE.getLabel());
	}
	
	private void addSurvialStatus(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("survivalStatus", String.class.getName());
        addColumn(drb, "survivalStatus", ChildFields.SURVIVAL_STATUS.getLabel(), 
        		Integer.class, 85, null, SurvivalStatusType.getCustomExpression());
	}
	
	private void addDistanceFromCentre(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("distanceLivesFromCentre", String.class.getName());
        addColumn(drb, "distanceLivesFromCentre", ChildFields.DISTANCE_FROM_CENTRE.getLabel(), 
        		Integer.class, 85, null, DistanceType.getCustomExpression());
	}
	
	private void addBloodGlucoseAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("bloodGlucoseAtDiagnosis", String.class.getName());
        addColumn(drb, "bloodGlucoseAtDiagnosis", ChildFields.BLOOD_GLUCOSE_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, KnownUnkownType.getCustomExpression());
        addColumn(drb, "bloodGlucoseValue", getLabel("child.bloodGlucoseValue"), Float.class, 85);
        drb.addField("bloodGlucoseUnits", String.class.getName());
        addColumn(drb, "bloodGlucoseUnits", getLabel("child.bloodGlucoseUnits"),  
        		Integer.class, 85, null, BloodGlucoseUnitsType.getCustomExpression());
	}
	
	private void addHbA1cAtDiagnosis(DynamicReportBuilder drb)  throws ColumnBuilderException
	{
		drb.addField("hbA1cAtDiagnosis", String.class.getName());
        addColumn(drb, "hbA1cAtDiagnosis", ChildFields.HBA1C_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("hbA1cAtDiagnosis"));
        addColumn(drb, "hbA1cPercentage", getLabel("child.hbA1cPercentage"), Float.class, 85);
        drb.addField("hbA1cMethod", String.class.getName());
        addColumn(drb, "hbA1cMethod", getLabel("child.hbA1cMethod"),  
        		Integer.class, 85, null, HbA1cMethodType.getCustomExpression());
        addColumn(drb, "hbA1cMethodOther", getLabel("child.hbA1cMethodOther"), String.class, 85);
	}
	
	private void addKAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("ketoacidosisAtDiagnosis", String.class.getName());
        addColumn(drb, "ketoacidosisAtDiagnosis", ChildFields.KETOACIDOSIS_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, NoMildSevereUnknownType.getCustomExpression());
	}
		
	private void addPolyuriaAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("polyuriaAtDiagnosis", String.class.getName());
        addColumn(drb, "polyuriaAtDiagnosis", ChildFields.POLYURIA_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("polyuriaAtDiagnosis"));
	}
	
	private void addThirstAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("thirstAtDiagnosis", String.class.getName());
        addColumn(drb, "thirstAtDiagnosis", ChildFields.THIRST_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("thirstAtDiagnosis"));
	}
	
	private void addWeightLossAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("weightLossAtDiagnosis", String.class.getName());
        addColumn(drb, "weightLossAtDiagnosis", ChildFields.WEIGHT_LOSS_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("weightLossAtDiagnosis"));
	}
	
	private void addWeightAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("weightAtDiagnosis", String.class.getName());
        addColumn(drb, "weightAtDiagnosis", ChildFields.WEIGHT_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, YesUnknownType.getCustomExpression("weightAtDiagnosis"));
        addColumn(drb, "weightAtDiagnosisValue", getLabel("child.weightAtDiagnosisValue"), Float.class, 85);        
	}
	
	private void addHeightAtDiagnosis(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("heightAtDiagnosis", String.class.getName());
        addColumn(drb, "heightAtDiagnosis", ChildFields.HEIGHT_AT_DIAGNOSIS.getLabel(), 
        		Integer.class, 85, null, YesUnknownType.getCustomExpression("heightAtDiagnosis"));
        addColumn(drb, "heightAtDiagnosisValue", getLabel("child.heightAtDiagnosisValue"), Float.class, 85);
	}
	
	private void addTypeOneInFamily(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("typeOneInFamily", String.class.getName());
        addColumn(drb, "typeOneInFamily", ChildFields.TYPE_1_IN_FAMILY.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("typeOneInFamily"));
        addColumn(drb, "typeOneRelativesDetails", getLabel("child.typeOneRelativesDetails"), String.class, 200);
	}
	
	private void addTypeTwoInFamily(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("typeTwoInFamily", String.class.getName());
        addColumn(drb, "typeTwoInFamily", ChildFields.TYPE_2_IN_FAMILY.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("typeTwoInFamily"));
        addColumn(drb, "typeTwoRelativesDetails", getLabel("child.typeTwoRelativesDetails"), String.class, 200);
	}
	
	private void addMalnutrition(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		drb.addField("malnutrition", String.class.getName());
        addColumn(drb, "malnutrition", ChildFields.MALNUTRITION.getLabel(), 
        		Integer.class, 85, null, YesNoUnkownType.getCustomExpression("malnutrition"));
	}
	
	private void addOtherComment(DynamicReportBuilder drb) throws ColumnBuilderException
	{
		addColumn(drb, "otherSyndromeAdditionalComment", ChildFields.ADDITIONAL_COMMENTS.getLabel(), String.class, 200);
	}
	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	public List buildQuery(Report report) {
		// TODO build query based on report object
		
		switch (report.getReporttype())
		{
			case CHILD:
			case INDIVIDUAL_CHILD:
			{
				return new ChildQuery().getQuery(report.getEntityManager(), report);				
			}
			case CHILD_NOT_SEEN_TIME_PERIOD:
			{
				return new ChildQuery().getNotSeenVisitClinicalRecordQuery(report.getEntityManager(), report);
			}
		}
		return null;
		//return "select * from Child";
	}
	
	public Object[] getDisplayFieldsList(String fields)
	{
		ArrayList<ChildFields> fieldList = new ArrayList<ChildFields>();
		/*if (fields != null && fields.trim().length() > 0)
		{
			StringTokenizer st = new StringTokenizer(fields, DISPLAY_FIELD_SEPARATOR);
			while (st.hasMoreTokens())
			{
				fieldList.add(ChildFields.valueOf(st.nextToken()));
			}
		}*/
		return fieldList.toArray();
	}
	
	public Object[] getDisplayFields(Report report)
	{
		return report.getChildfields();
	}

	public String getFieldListAsString(Report report)
	{
		ChildFields[] fields = report.getChildfields();
		StringBuffer buffer = new StringBuffer();
		for (int i=0; i < fields.length; i++)
		{
			ChildFields field = fields[i];
			if (i > 0)
				buffer.append(DISPLAY_FIELD_SEPARATOR);
			buffer.append(field.ordinal());
		}
		return buffer.toString();
	}
	
	private String getLabel(String code)
	{
		return AppContext.getMessage(code);
	}
}
