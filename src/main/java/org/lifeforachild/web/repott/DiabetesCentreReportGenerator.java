package org.lifeforachild.web.Report;

import java.util.List;

import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Report;

import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

/**
 * 
 * {@link DiabetesCentre} specific report generator.
 * 
 * @author Serena Potts
 *
 */
public class DiabetesCentreReportGenerator extends ReportGenerator {

    /**
     * Add columns specific to the centre report.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	void addColumns(DynamicReportBuilder drb, Object[] fields) throws ColumnBuilderException {
		// these columns are displayed on every report
		addColumn(drb, "name", "Name", String.class, 85);
		addColumn(drb, "address", "Address", String.class, 200);
		addColumn(drb, "country.name", "Country", String.class, 85);	
	}

	// none of these methods are used but need to be defined to extend the report generator class
	
	public List buildQuery(Report report) {
		return null;
	}

	public Object[] getDisplayFieldsList(String fields)
	{
		return new Object[] {};
	}
	
	public Object[] getDisplayFields(Report report)
	{
		return new Object[] {};
	}
	
	public String getFieldListAsString(Report report)
	{
		return "";
	}
}
