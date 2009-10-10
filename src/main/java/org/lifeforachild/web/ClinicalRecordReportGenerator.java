package org.lifeforachild.web;

import org.lifeforachild.domain.ClinicalRecord;
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
	void addColumns(DynamicReportBuilder drb) throws ColumnBuilderException {
		// these columns are displayed on every report
		addColumn(drb, "id", "ID", Integer.class, 85);
		addDateColumn(drb, "date_of_measurement", "Date of Measurement");
		addDateColumn(drb, "date_completed", "Date Form Completed");
        // configurable columns
        // TODO
	}

	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	String buildQuery(Report report) {
		// TODO
		return "select * from clinical_record";
	}


}
