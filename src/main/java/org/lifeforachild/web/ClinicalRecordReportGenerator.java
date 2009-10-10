package org.lifeforachild.web;

import org.lifeforachild.domain.Report;

import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

public class ClinicalRecordReportGenerator extends ReportGenerator {

	@Override
	void addColumns(DynamicReportBuilder drb) throws ColumnBuilderException {
		addColumn(drb, "id", "ID", Integer.class, 85);
		addDateColumn(drb, "date_of_measurement", "Date of Measurement");
		addDateColumn(drb, "date_completed", "Date Form Completed");
	}

	@Override
	String buildQuery(Report report) {
		return "select * from clinical_record";
	}


}
