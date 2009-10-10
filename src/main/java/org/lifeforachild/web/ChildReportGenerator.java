package org.lifeforachild.web;

import java.util.Date;

import org.lifeforachild.domain.DiabetesType;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.SexType;

import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

public class ChildReportGenerator extends ReportGenerator {

	@Override
	void addColumns(DynamicReportBuilder drb)
	throws ColumnBuilderException
	{
        addColumn(drb, "id", "ID", Integer.class, 85);
        addColumn(drb, "name", "Name", String.class, 85);
        drb.addField("sex", String.class.getName());
        addColumn(drb, "sex", "Sex", Integer.class, 85, null, SexType.getCustomExpression());
        drb.addField("diabetes_type", String.class.getName());
        addColumn(drb, "diabetes_type", "Diabetes Type", Integer.class, 85, null, DiabetesType.getCustomExpression());
        addDateColumn(drb, "date_of_birth", "Date of Birth");
	}

	@Override
	String buildQuery(Report report) {
		return "select * from Child";
	}

}
