dojo.require('dijit.TitlePane');
dojo.require('dijit.form.FilteringSelect');
dojo.require('dijit.form.DateTextBox');
dojo.require('dijit.form.SimpleTextarea');
dojo.require('dojo.data.ItemFileReadStore');
dojo.require('dijit.form.ValidationTextBox');

dojo.addOnLoad(
	function(){
		if (dijit.byId("_survivalStatus_id").value != 'DEAD')
	  	{
		  	// hide death values as not dead
			dojo.style(dijit.byId("roo_child_dateOfDeath").domNode, "display", "none");
			dojo.style(dijit.byId("roo_child_causeOfDeath").domNode, "display", "none");
			dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "none");				  
	  	}
		else if (dijit.byId("_causeOfDeath_id").value != 'OTHER_DIABETES_RELATED_CONDITION' &&
				dijit.byId("_causeOfDeath_id").value != 'COMBINATION_OF_CAUSES')
		{
			// hide death other as other not selected
			dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "none");
		}

		if (dijit.byId("_diabetesType_id").value != 'OTHER')
	  	{
			dojo.style(dijit.byId("roo_child_diabetesTypeOther").domNode, "display", "none");
	  	}
		
		if (dijit.byId("_bloodGlucoseAtDiagnosis_id").value != 'KNOWN')
	  	{
			dojo.style(dijit.byId("roo_child_bloodGlucoseValue").domNode, "display", "none");
			dojo.style(dijit.byId("roo_child_bloodGlucoseUnits").domNode, "display", "none");
	  	}
		
		if (dijit.byId("_typeOneInFamily_id").value != 'YES')
	  	{
			dojo.style(dijit.byId("roo_child_typeOneRelativesDetails").domNode, "display", "none");
	  	}
		
		if (dijit.byId("_typeTwoInFamily_id").value != 'YES')
	  	{
			dojo.style(dijit.byId("roo_child_typeTwoRelativesDetails").domNode, "display", "none");
	  	}
		
		if (dijit.byId("_weightAtDiagnosis_id").value != 'YES')
		{		
			dojo.style(dijit.byId("roo_child_weightAtDiagnosisValue").domNode, "display", "none");
		}
		
		if (dijit.byId("_heightAtDiagnosis_id").value != 'YES')
		{		
			dojo.style(dijit.byId("roo_child_heightAtDiagnosisValue").domNode, "display", "none");
		}
		
		if (dijit.byId("_hbA1cAtDiagnosis_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_child_hbA1cPercentage").domNode, "display", "none");
			dojo.style(dijit.byId("roo_child_hbA1cMethod").domNode, "display", "none");
		}  	
		
		if (dijit.byId("_hbA1cMethod_id") != null && dijit.byId("_hbA1cMethod_id").value != 'OTHER')
	  	{
			dojo.style(dijit.byId("roo_child_hbA1cMethodOther").domNode, "display", "none");
	  	}  
	}
);  

function survivalStatusOnChange(newValue) {
	if (newValue == 'DEAD')
	{
		dojo.style(dijit.byId("roo_child_dateOfDeath").domNode, "display", "block");
		dojo.style(dijit.byId("roo_child_causeOfDeath").domNode, "display", "block");
		if (dijit.byId("_causeOfDeath_id").value == 'OTHER_DIABETES_RELATED_CONDITION' ||
			dijit.byId("_causeOfDeath_id").value == 'COMBINATION_OF_CAUSES')
			dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_dateOfDeath").domNode, "display", "none");
		dojo.style(dijit.byId("roo_child_causeOfDeath").domNode, "display", "none");
		dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "none");
	}
}

function  causeOfDeathOnChange(newValue) {
	if (newValue == 'OTHER_DIABETES_RELATED_CONDITION' || newValue == 'COMBINATION_OF_CAUSES')
	{
		dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "none");
	}
} 

function diabetesTypeOnChange(newValue) {
	if (newValue == 'OTHER')
	{
		dojo.style(dijit.byId("roo_child_diabetesTypeOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_diabetesTypeOther").domNode, "display", "none");
	}
}

function bloodGlucoseAtDiagnosisOnChange(newValue) {
	if (newValue == 'KNOWN')
	{
		dojo.style(dijit.byId("roo_child_bloodGlucoseValue").domNode, "display", "block");
		dojo.style(dijit.byId("roo_child_bloodGlucoseUnits").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_bloodGlucoseValue").domNode, "display", "none");
		dojo.style(dijit.byId("roo_child_bloodGlucoseUnits").domNode, "display", "none");
	}
}

function hbA1cAtDiagnosisOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_child_hbA1cPercentage").domNode, "display", "block");
		dojo.style(dijit.byId("roo_child_hbA1cMethod").domNode, "display", "block");
		if (dijit.byId("_hbA1cMethod_id").value == 'OTHER')
			dojo.style(dijit.byId("roo_child_hbA1cMethodOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_hbA1cPercentage").domNode, "display", "none");
		dojo.style(dijit.byId("roo_child_hbA1cMethod").domNode, "display", "none");
		dojo.style(dijit.byId("roo_child_hbA1cMethodOther").domNode, "display", "none");
	}
}

function hbA1cMethodOnChange(newValue) {
	if (newValue == 'OTHER')
	{
		dojo.style(dijit.byId("roo_child_hbA1cMethodOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_hbA1cMethodOther").domNode, "display", "none");
	}
}

function weightAtDiagnosisOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_child_weightAtDiagnosisValue").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_weightAtDiagnosisValue").domNode, "display", "none");
	}
}

function heightAtDiagnosisOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_child_heightAtDiagnosisValue").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_heightAtDiagnosisValue").domNode, "display", "none");
	}
}

function typeOneInFamilyOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_child_typeOneRelativesDetails").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_typeOneRelativesDetails").domNode, "display", "none");
	}
}

function typeTwoInFamilyOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_child_typeTwoRelativesDetails").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_child_typeTwoRelativesDetails").domNode, "display", "none");
	}
}

// needed for the create page
function updateAgeAtDiagnosisFromCreate(newValue) {                                 		 	
	updateAgeAtDiagnosis("");
}

//Url's different for ajax call for update page
function updateAgeAtDiagnosisFromUpdate(newValue) {
	updateAgeAtDiagnosis("../");
}

function updateAgeAtDiagnosis(prefix)
{
	var dob = dijit.byId("_dateOfBirth_id").attr("value");
	var dd = dijit.byId("_diabetesDiagnosed_id").attr("value");
	 
	if (dob != null && dd != null)
	{
		var dobStr = dojo.date.stamp.toISOString(dob, {selector:'date'});
		var ddStr = dojo.date.stamp.toISOString(dd, {selector:'date'});
		
	    var ageURL = prefix + '../ajax/ageAtDiagnosis/' + ddStr + '/' + dobStr;
	 	if (document.location.href.indexOf('/form') == -1)
	 		ageURL = prefix + 'ajax/ageAtDiagnosis/' + ddStr + '/' + dobStr;
	 	
	    console.debug(" Doing Ajax call for Age at diagnosis" + ageURL);
	    dojo.xhrGet( { // 
	        // The following URL must match that used to test the server.
	        url: ageURL, 
	        preventCache: true,
	        handleAs: "text",
	        timeout: 10000, // Time in milliseconds

	        // The LOAD function will be called on a successful response.
	        load: function(response, ioArgs) { 
	          console.log("got back response ", response);
	          
	          dijit.byId("_ageAtDiagnosis_id").setValue(response);
	          return response; // 
	        },

	        // The ERROR function will be called in an error case.
	        error: function(response, ioArgs) { // 
	          console.error(response," - HTTP status code: ", ioArgs.xhr.status); //
	          return response; // 
	          }
	        }); 
	}
}
