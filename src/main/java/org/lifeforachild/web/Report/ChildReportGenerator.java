package org.lifeforachild.web.Report;

import java.util.ArrayList;
import java.util.List;

import org.lifeforachild.domain.CauseOfDeathType;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ChildFields;
import org.lifeforachild.domain.DiabetesType;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.SexType;
import org.lifeforachild.domain.SurvivalStatusType;
import org.lifeforachild.web.query.ChildQuery;

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
        addColumn(drb, "id", "ID", Long.class, 85);
        addColumn(drb, "name", "Name", String.class, 85);
        //addColumn(drb, "sex", "Sex", SexType.class, 85);
        drb.addField("sex", String.class.getName());        
        addColumn(drb, "sex", "Sex", SexType.class, 85, null, SexType.getCustomExpression());
        drb.addField("diabetesType", String.class.getName());
        addColumn(drb, "diabetesType", "Diabetes Type", DiabetesType.class, 85, null, DiabetesType.getCustomExpression());
        
        // TODO always show country and centre
        
        // configurable columns
        if (fields instanceof ChildFields[])
        {
        	for (int i=0; i < fields.length; i++)
        	{
        		ChildFields field = (ChildFields)fields[i];
	        	switch (field) {
				case AGE_AT_DIAGNOSIS:
					// TODO field not in database
					break;
				case AGE_FIRST_INSULIN:
					// TODO field not in database
					break;
				case DATE_OF_BIRTH:
					addDateColumn(drb, "dateOfBirth", ChildFields.DATE_OF_BIRTH.getLabel());
					break;
				case DATE_REGO:
					addDateColumn(drb, "dateOfRegistration", ChildFields.DATE_REGO.getLabel());
					break;
				case DEATH:
					addDateColumn(drb, "dateOfDeath", "Date of Death");
			        drb.addField("causeOfDeath", String.class.getName());
			        addColumn(drb, "causeOfDeath", "Cause of Death", Integer.class, 
			        		85, null, CauseOfDeathType.getCustomExpression());
					break;
				case DIABETES_DIAGNOSED:
					addDateColumn(drb, "diabetesDiagnosed", ChildFields.DIABETES_DIAGNOSED.getLabel());
					break;
				case ETHNIC_GROUP:
					addColumn(drb, "ethnicGroup", ChildFields.ETHNIC_GROUP.getLabel(), String.class, 85);
					break;
				case INITIALS:
					addColumn(drb, "initials", ChildFields.INITIALS.getLabel(), String.class, 85);
					break;
				case INSULIN_SINCE:
					addDateColumn(drb, "insulinSince", ChildFields.INSULIN_SINCE.getLabel());
					break;
				case SURVIVAL_STATUS:
			        drb.addField("survivalStatus", String.class.getName());
			        addColumn(drb, "survivalStatus", ChildFields.SURVIVAL_STATUS.getLabel(), 
			        		Integer.class, 85, null, SurvivalStatusType.getCustomExpression());
					break;
				default:
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
	public List buildQuery(Report report) {
		// TODO build query based on report object
		
		return new ChildQuery().getQuery(report.getEntityManager(), report);		
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
}
