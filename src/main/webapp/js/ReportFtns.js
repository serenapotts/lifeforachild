dojo.require('dijit.form.FilteringSelect');
dojo.require('dijit.form.DateTextBox');
dojo.require('dijit.form.ValidationTextBox');

dojo.addOnLoad(
	function(){		
		if (dijit.byId("_reporttype_id").value != null) {
			reportTypeOnChange(dijit.byId("_reporttype_id").value);
		}
	}
);

function reportTypeOnChange(newValue) {
	if (newValue == 'CHILD')
	{
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_country").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_centre").domNode, "display", "block");
		
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "none");	
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "none");			
	}
	else if (newValue == "INDIVIDUAL_CHILD")
	{
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "block");
		
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_country").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_centre").domNode, "display", "none");		
	}
	else if (newValue == "INDIVIDUAL_CHILD_VISIT")
	{
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");		
		//dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "block");		
		
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		//dojo.style(dijit.byId("roo_report_country").domNode, "display", "block");
		//dojo.style(dijit.byId("roo_report_centre").domNode, "display", "block");		
	}
	else if (newValue == "INDIVIDUAL_CHILD_MULTI_VISIT")
	{
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");		
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "block");	
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "block");		
		
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "none");		
		dojo.style(dijit.byId("roo_report_country").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_centre").domNode, "display", "none");		
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "none");
	}
	else if (newValue == "CHILD_RECENT_VISIT")
	{
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");		
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_country").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_centre").domNode, "display", "block");
		
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "none");	
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "none");		
	}
	else if (newValue == "CHILD_SEEN_TIME_PERIOD")
	{
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");		
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_country").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_centre").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "block");
		
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "none");
	}
	else if (newValue == "CHILD_NOT_SEEN_TIME_PERIOD")
	{
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "block");		
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_country").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_centre").domNode, "display", "block");
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "block");
		
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "none");
	}
	else
	{
		dojo.style(dijit.byId("roo_report_childfields").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_clinicalrecordfields").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_name").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_viewableBy").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_timeperiodunit").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_fromDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_toDate").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_recordNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_localMedicalNumber").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_firstName").domNode, "display", "none");
		dojo.style(dijit.byId("roo_report_lastName").domNode, "display", "none");		
		//dojo.style(dijit.byId("roo_report_country").domNode, "display", "none");
		//dojo.style(dijit.byId("roo_report_centre").domNode, "display", "none");
	}
}