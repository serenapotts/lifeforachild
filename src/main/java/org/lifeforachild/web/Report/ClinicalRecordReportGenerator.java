package org.lifeforachild.web.Report;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.EntityManager;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.User;
import org.lifeforachild.enums.ResearchConsentType;
import org.lifeforachild.web.AppContext;
import org.lifeforachild.web.Report.enums.ClinicalRecordFields;
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
		addColumn(drb, "personCompletingForm", getColumnLabel("record.personCompleting"), User.class, 85, null, User.getCustomExpression());
				
		addDateColumn(drb, "dateCompleted", getColumnLabel("record.dateCompleted"));
		addColumn(drb, "seniorPhysician", getColumnLabel("record.seniorPhysician"), String.class, 85);
		
		drb.addField("consentGiven", String.class.getName());        
        addColumn(drb, "consentGiven", getColumnLabel("record.consentGiven"), ResearchConsentType.class, 85, null, ResearchConsentType.getCustomExpression());
        
        addColumn(drb, "exactAge", getColumnLabel("record.exactAge"), Float.class, 85);
        addColumn(drb, "insulinPerKg", getColumnLabel("record.insulinPerKg"), Float.class, 85);
	}

	private void addEmergenciesFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		
	}

	private void addSchoolingFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		
	}

	private void addLabTestingFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		
	}

	private void addEyesAndFeetFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		
	}

	private void addClinicalMeasuresFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		//addDateColumn(drb, "dateOfMeasurement", "Date of Measurement");
	}

	private void addDiabetesCareFields(DynamicReportBuilder drb) throws ColumnBuilderException {
		
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
