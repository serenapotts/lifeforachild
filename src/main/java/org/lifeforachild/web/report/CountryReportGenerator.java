package org.lifeforachild.web.report;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Report;

import ar.com.fdvs.dj.domain.CustomExpression;
import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

/**
 * 
 * {@link Country} specific report generator.
 * 
 * @author Serena Potts
 *
 */
public class CountryReportGenerator extends ReportGenerator {

    /**
     * Add columns specific to the country report.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	void addColumns(DynamicReportBuilder drb, Object[] fields) throws ColumnBuilderException {
		// these columns are displayed on every report
		addColumn(drb, "name", "Name", String.class, 85);
		drb.addField("diabetesCentres", String.class.getName());        
        addColumn(drb, "diabetesCentres", "Centres", DiabetesCentre.class, 200, null, 
    		new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {	   
	            	Set centres = (Set)fields.get("diabetesCentres");
	            	StringBuffer centresStr = new StringBuffer();
	            	Iterator it = centres.iterator();
	            	while (it.hasNext())
	            	{
	            		DiabetesCentre centre = (DiabetesCentre)it.next();
	            		centresStr.append(centre.getName());
	            		if (it.hasNext())
	            			centresStr.append(", ");
	            	}
	            	return centresStr.toString();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
        	}
        );
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
