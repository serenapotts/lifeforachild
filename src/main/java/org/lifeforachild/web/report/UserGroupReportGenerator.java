package org.lifeforachild.web.report;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.lifeforachild.domain.Permissions;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.UserGroup;

import ar.com.fdvs.dj.domain.CustomExpression;
import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;

/**
 * 
 * {@link UserGroup} specific report generator.
 * 
 * @author Serena Potts
 *
 */
public class UserGroupReportGenerator extends ReportGenerator {

    /**
     * Add columns specific to the user group report.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	void addColumns(DynamicReportBuilder drb, Object[] fields) throws ColumnBuilderException {
		// these columns are displayed on every report
		addColumn(drb, "groupName", "Group Name", String.class, 85);
		drb.addField("permissions", String.class.getName());        
        addColumn(drb, "permissions", "Permissions", Permissions.class, 200, null, 
    		new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {	   
	            	Set permissions = (Set)fields.get("permissions");
	            	StringBuffer permissionsStr = new StringBuffer();
	            	Iterator it = permissions.iterator();
	            	while (it.hasNext())
	            	{
	            		Permissions permission = (Permissions)it.next();
	            		permissionsStr.append(permission.getDescription());
	            		if (it.hasNext())
	            			permissionsStr.append(", ");
	            	}
	            	return permissionsStr.toString();
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
