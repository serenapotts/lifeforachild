package org.lifeforachild.web.Report;

import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.DiabetesType;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.SexType;

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
	void addColumns(DynamicReportBuilder drb)
	throws ColumnBuilderException
	{
		// these columns are displayed on every report
        addColumn(drb, "id", "ID", Integer.class, 85);
        addColumn(drb, "name", "Name", String.class, 85);
        drb.addField("sex", String.class.getName());
        addColumn(drb, "sex", "Sex", Integer.class, 85, null, SexType.getCustomExpression());
        drb.addField("diabetes_type", String.class.getName());
        addColumn(drb, "diabetes_type", "Diabetes Type", Integer.class, 85, null, DiabetesType.getCustomExpression());
        addDateColumn(drb, "date_of_birth", "Date of Birth");
        // configurable columns
        // TODO
	}

	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	public String buildQuery(Report report) {
		// TODO build query based on report object
		return "select * from Child";
	}

}
