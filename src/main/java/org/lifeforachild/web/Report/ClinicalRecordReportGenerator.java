package org.lifeforachild.web.Report;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.lifeforachild.domain.ChildFields;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.ClinicalRecordFields;
import org.lifeforachild.domain.Report;

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
		addColumn(drb, "id", "ID", Integer.class, 85);
		addDateColumn(drb, "date_of_measurement", "Date of Measurement");
		addDateColumn(drb, "date_completed", "Date Form Completed");
        // configurable columns
		if (fields instanceof ClinicalRecordFields[])
        {
        	for (int i=0; i < fields.length; i++)
        	{
        		ClinicalRecordFields field = (ClinicalRecordFields)fields[i];
	        	switch (field) {
	        		case CLINICAL_MEASURES:
	        			break;
	        		case DIABETES_CARE:
	        			break;	        			
	        		case EMERGENCIES:
	        			break;
	        		case EYES:
	        			break;
	        		case FEET:
	        			break;
	        		case LAB_TESTING:
	        			break;
	        		case PEBERTAL_STATUS:
	        			break;
	        		case SCHOOL_STATUS:
	        			break;
	        		case TYPES_INSULIN:
	        			break;	        			
	        	}
        	}
        }
	}

	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	public String buildQuery(Report report) {
		// TODO
		return "select * from clinical_record";
	}

	public Object[] getDisplayFieldsList(String fields)
	{
		ArrayList<ClinicalRecordFields> fieldList = new ArrayList<ClinicalRecordFields>();
		StringTokenizer st = new StringTokenizer(fields, DISPLAY_FIELD_SEPARATOR);
		while (st.hasMoreTokens())
		{
			fieldList.add(ClinicalRecordFields.valueOf(st.nextToken()));
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
