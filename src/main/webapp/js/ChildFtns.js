dojo.require('dijit.TitlePane');
dojo.require('dijit.form.FilteringSelect');
dojo.require('dijit.form.DateTextBox');
dojo.require('dijit.form.SimpleTextarea');
dojo.require('dojo.data.ItemFileReadStore');

dojo.addOnLoad(
	function(){
		if (dijit.byId("_survivalStatus_id").value != 'DEAD')
	  	{
		  	// hide death values as not dead
			dojo.style(dijit.byId("roo_child_dateOfDeath").domNode, "display", "none");
			dojo.style(dijit.byId("roo_child_causeOfDeath").domNode, "display", "none");
			dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "none");				  
	  	}
		else if (dijit.byId("_causeOfDeath_id").value != 'OTHER_DIABETES_RELATED_CONDITION')
		{
			// hide death other as other not selected
			dojo.style(dijit.byId("roo_child_causeOfDeathOther").domNode, "display", "none");
		}

		if (dijit.byId("_diabetesType_id").value != 'OTHER')
	  	{
			dojo.style(dijit.byId("roo_child_diabetesTypeOther").domNode, "display", "none");
	  	}
	}
);  

function survivalStatusOnChange(newValue) {
	if (newValue == 'DEAD')
	{
		dojo.style(dijit.byId("roo_child_dateOfDeath").domNode, "display", "block");
		dojo.style(dijit.byId("roo_child_causeOfDeath").domNode, "display", "block");
		if (dijit.byId("_causeOfDeath_id").value == 'OTHER_DIABETES_RELATED_CONDITION')
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
	if (newValue == 'OTHER_DIABETES_RELATED_CONDITION')
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
