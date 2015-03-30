dojo.require('dijit.TitlePane');
dojo.require('dijit.form.FilteringSelect');
dojo.require('dijit.form.DateTextBox');
dojo.require('dijit.form.SimpleTextarea');

var generalHasError = false;
var diabetesCareHasError = false;
var medicationsHasError = false;
var clinicalMeasuresHasError = false;
var eyesHasError = false;
var feetHasError = false;
var labTestingHasError = false;
var schoolingHasError = false;
var emergenciesHasError = false;

dojo.addOnLoad(
	function(){
		if (dijit.byId("_oralAgents_id").value != 'YES')
	  	{
		  	// hide desc if no oral agent
			dojo.style(dijit.byId("roo_clinicalRecord_oralAgentsDescription").domNode, "display", "none");
	  	}
		if (dijit.byId("_bpMedications_id").value != 'YES')
	  	{
		  	// hide fields if no BP medications
			dojo.style(dijit.byId("roo_clinicalRecord_acearb").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_bpMedicationsOther").domNode, "display", "none");
	  	}
		if (dijit.byId("_menarche_id") != null && dijit.byId("_menarche_id").value != 'YES')
	  	{
		  	// hide fields if not menarche
			dojo.style(dijit.byId("roo_clinicalRecord_ifMenarcheAge").domNode, "display", "none");
	  	}  
		if (dijit.byId("_eyesExaminedInLastYear_id").value != 'YES')
	  	{
		  	// hide fields if eyes not examined
			dojo.style(dijit.byId("roo_clinicalRecord_cateract").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_visualAcuityRight").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_visualAcuityLeft").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_eyesComment").domNode, "display", "none");
	  	}  			  	
		if (dijit.byId("_feetExaminedInLastYear_id").value != 'YES')
	  	{
		  	// hide fields if feet not examined
			dojo.style(dijit.byId("roo_clinicalRecord_monofilamentTested").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_tuningForkTested").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_feetComment").domNode, "display", "none");
	  	}   
		if (dijit.byId("_monofilamentTested_id") != null && dijit.byId("_monofilamentTested_id").value != 'YES')
	  	{
		  	// hide fields if monofilament not tested
			dojo.style(dijit.byId("roo_clinicalRecord_monofilamentAbnormal").domNode, "display", "none");
	  	}
		if (dijit.byId("_tuningForkTested_id") != null && dijit.byId("_tuningForkTested_id").value != 'YES')
	  	{
		  	// hide fields if tuning fork not tested
			dojo.style(dijit.byId("roo_clinicalRecord_tuningForkAbnormal").domNode, "display", "none");
	  	}  
		if (dijit.byId("_lastHbA1cInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_hbA1cPercentage").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethod").domNode, "display", "none");
		}  	
		if (dijit.byId("_hbA1cMethod_id") != null && dijit.byId("_hbA1cMethod_id").value != 'OTHER')
	  	{
		  	// hide fields if tuning fork not tested
			dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethodOther").domNode, "display", "none");
	  	}  
		if (dijit.byId("_attendingSchool_id").value == 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_notAttendingSchoolWhy").domNode, "display", "none");
		} 
		else if (dijit.byId("_attendingSchool_id").value == 'NO')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_diabetesLimitingAttendance").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_appropriateGradeForAge").domNode, "display", "none");
		}
		else
		{
			dojo.style(dijit.byId("roo_clinicalRecord_notAttendingSchoolWhy").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_diabetesLimitingAttendance").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_appropriateGradeForAge").domNode, "display", "none");
		} 
		if (dijit.byId("_triglyceridesInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_triglyceridesValue").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_triglyceridesUnits").domNode, "display", "none");
		} 
		if (dijit.byId("_hdlCholesterolInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_hdlCholesterolValue").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_hdlUnits").domNode, "display", "none");
		} 
		if (dijit.byId("_microalbuminuriaInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_microalbuminuriaValue").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_microalbuminuriaUnitOfMeasure").domNode, "display", "none");
		}  
		if (dijit.byId("_creatinineInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_creatinineValue").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_creatinineUnits").domNode, "display", "none");
		}     	
		if (dijit.byId("_totalCholesterolInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_totalCholesterolValue").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_cholesterolUnits").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_fasted").domNode, "display", "none");
		} 
		if (dijit.byId("_weightInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_weightKG").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_weightSD").domNode, "display", "none");			
		} 
		if (dijit.byId("_heightInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_heightCM").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_heightSD").domNode, "display", "none");			
		} 
		if (dijit.byId("_heightInLast12Months_id").value != 'YES' && 
				dijit.byId("_weightInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_bmi").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_bmiSD").domNode, "display", "none");
		}
		if (dijit.byId("_BPInLast12Months_id").value != 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureSystolicMMHg").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureDiastolicMMHg").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureDiastolicSD").domNode, "display", "none");
			dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureSystolicSD").domNode, "display", "none");
		}      	
		if (dijit.byId("_insulinUnitsPerDay_id").value != null && 
				dijit.byId("_insulinUnitsPerDay_id").value <= 0)
		{
			dojo.style(dijit.byId("roo_clinicalRecord_adjustInsulinDoseIfNeeded").domNode, "display", "none");
		}
		if (dojo.byId("_previousConsentGiven_id").value == '')
	  	{
			dojo.style(dojo.byId("roo_clinicalRecord_previousConsentGiven"), "display", "none");
	  	}
		if (dojo.byId("_previousConsentGiven_id").value == 'YES')
	  	{
			dojo.style(dojo.byId("roo_clinicalRecord_consentGiven"), "display", "none");
			dijit.byId("_consentGiven_id").value = 'YES';
	  	}
	}
);    	        

function insulinUnitsPerDayUpdateDepFields(newValue)
{
	if (newValue != null && newValue > 0)
	{
		dojo.style(dijit.byId("roo_clinicalRecord_adjustInsulinDoseIfNeeded").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_adjustInsulinDoseIfNeeded").domNode, "display", "none");
	}
}

function oralAgentsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_oralAgentsDescription").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_oralAgentsDescription").domNode, "display", "none");
	}
}

function bpMedicationsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_acearb").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_bpMedicationsOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_acearb").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_bpMedicationsOther").domNode, "display", "none");
	}
}

function weightInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_weightKG").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_weightSD").domNode, "display", "block");		
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_weightKG").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_weightSD").domNode, "display", "none");
	}
	updateBMIFields(newValue, dijit.byId("_heightInLast12Months_id").value);
}

function updateBMIFields(weightValue, heightValue)
{
	if (weightValue == 'YES' && heightValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_bmi").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_bmiSD").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_bmi").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_bmiSD").domNode, "display", "none");
	}
}

function heightInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_heightCM").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_heightSD").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_heightCM").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_heightSD").domNode, "display", "none");
	}
	updateBMIFields(dijit.byId("_weightInLast12Months_id").value, newValue);
}

function bpInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureSystolicMMHg").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureDiastolicMMHg").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureDiastolicSD").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureSystolicSD").domNode, "display", "block");				
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureSystolicMMHg").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureDiastolicMMHg").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureDiastolicSD").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_bloodPressureSystolicSD").domNode, "display", "none");
	}
}

function menarcheOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_ifMenarcheAge").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_ifMenarcheAge").domNode, "display", "none");
	}
}

function eyesExaminedInLastYearOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_cateract").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_visualAcuityRight").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_visualAcuityLeft").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_eyesComment").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_cateract").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_visualAcuityRight").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_visualAcuityLeft").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_eyesComment").domNode, "display", "none");
	}
}

function feetExaminedInLastYearOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_monofilamentTested").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_tuningForkTested").domNode, "display", "block");
		if (dijit.byId("_monofilamentTested_id") != null && dijit.byId("_monofilamentTested_id").value == 'YES')
	  	{
			dojo.style(dijit.byId("roo_clinicalRecord_monofilamentAbnormal").domNode, "display", "block");
	  	}
		if (dijit.byId("_tuningForkTested_id") != null && dijit.byId("_tuningForkTested_id").value == 'YES')
		{
			dojo.style(dijit.byId("roo_clinicalRecord_tuningForkAbnormal").domNode, "display", "block");
		}
		dojo.style(dijit.byId("roo_clinicalRecord_feetComment").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_monofilamentTested").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_tuningForkTested").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_monofilamentAbnormal").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_tuningForkAbnormal").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_feetComment").domNode, "display", "none");
	}
}

function monofilamentTestedOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_monofilamentAbnormal").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_monofilamentAbnormal").domNode, "display", "none");
	}
}

function tuningForkTestedOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_tuningForkAbnormal").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_tuningForkAbnormal").domNode, "display", "none");
	}
}

function lastHbA1cInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cPercentage").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethod").domNode, "display", "block");
		if (dijit.byId("_hbA1cMethod_id").value == 'OTHER')
			dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethodOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cPercentage").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethod").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethodOther").domNode, "display", "none");
	}
}

function hbA1cMethodOnChange(newValue) {
	if (newValue == 'OTHER')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethodOther").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_hbA1cMethodOther").domNode, "display", "none");
	}
}

function microalbuminuriaInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_microalbuminuriaValue").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_microalbuminuriaUnitOfMeasure").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_microalbuminuriaValue").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_microalbuminuriaUnitOfMeasure").domNode, "display", "none");
	}
}

function creatinineInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_creatinineValue").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_creatinineUnits").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_creatinineValue").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_creatinineUnits").domNode, "display", "none");
	}
}

function totalCholesterolInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_totalCholesterolValue").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_cholesterolUnits").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_fasted").domNode, "display", "block");			                		
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_totalCholesterolValue").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_cholesterolUnits").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_fasted").domNode, "display", "none");
	}
}

function hdlCholesterolInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_hdlCholesterolValue").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_hdlUnits").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_hdlCholesterolValue").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_hdlUnits").domNode, "display", "none");
	}
}

function triglyceridesInLast12MonthsOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_triglyceridesValue").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_triglyceridesUnits").domNode, "display", "block");
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_triglyceridesValue").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_triglyceridesUnits").domNode, "display", "none");
	}
}

function attendingSchoolOnChange(newValue) {
	if (newValue == 'YES')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_diabetesLimitingAttendance").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_appropriateGradeForAge").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_notAttendingSchoolWhy").domNode, "display", "none");
	}
	else if (newValue == 'NO')
	{
		dojo.style(dijit.byId("roo_clinicalRecord_notAttendingSchoolWhy").domNode, "display", "block");
		dojo.style(dijit.byId("roo_clinicalRecord_diabetesLimitingAttendance").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_appropriateGradeForAge").domNode, "display", "none");		                			
	}
	else
	{
		dojo.style(dijit.byId("roo_clinicalRecord_diabetesLimitingAttendance").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_appropriateGradeForAge").domNode, "display", "none");
		dojo.style(dijit.byId("roo_clinicalRecord_notAttendingSchoolWhy").domNode, "display", "none");
	}
}

//needed for the create page
function updateDateOfMeasFromCreate(newValue) {                                 		 	
	updateAge("");
	updateBMISD("");
	updateWeightSD("")
	updateHeightSD("");
	updateDiastolicBloodPressureSD("");
	updateSystolicBloodPressureSD("");
}

//Url's different for ajax call for update page
function updateDateOfMeasFromUpdate(newValue) {
	updateAge("../");
	updateBMISD("../");
	updateWeightSD("../");
	updateHeightSD("../");
	updateDiastolicBloodPressureSD("../");
	updateSystolicBloodPressureSD("../");
}

//needed for the create page
function updateWeightFromCreate(newValue) {                                 		 	
	updateWeightSD("");
	updateBMI("");
	updateBMISD("");
	updateInsulinUnitsPerKg("");
}

//Url's different for ajax call for update page
function updateWeightFromUpdate(newValue) {
	updateWeightSD("../");
	updateBMI("../");
	updateBMISD("../");
	updateInsulinUnitsPerKg("../");
}

//needed for the create page
function updateHeightFromCreate(newValue) {                                 		 	
	updateHeightSD("");
	updateBMI("");
	updateBMISD("");
	updateDiastolicBloodPressureSD("");
	updateSystolicBloodPressureSD("");
}

//Url's different for ajax call for update page
function updateHeightFromUpdate(newValue) {
	updateHeightSD("../");
	updateBMI("../");
	updateBMISD("../");
	updateDiastolicBloodPressureSD("../");
	updateSystolicBloodPressureSD("../");
}

//needed for the create page
function updateInsulinUnitsPerDayFromCreate(newValue) {                                 		 	
	updateInsulinUnitsPerKg("");
	insulinUnitsPerDayUpdateDepFields(newValue);
}

//Url's different for ajax call for update page
function updateInsulinUnitsPerDayFromUpdate(newValue) {
	updateInsulinUnitsPerKg("../");
	insulinUnitsPerDayUpdateDepFields(newValue);
}

//needed for the create page
function updateDiasBPFromCreate(newValue) {                                 		 	
	updateDiastolicBloodPressureSD("");
}

//Url's different for ajax call for update page
function updateDiasBPFromUpdate(newValue) {
	updateDiastolicBloodPressureSD("../");
}

//needed for the create page
function updateSysBPFromCreate(newValue) {                                 		 	
	updateSystolicBloodPressureSD("");
}

//Url's different for ajax call for update page
function updateSysBPFromUpdate(newValue) {
	updateSystolicBloodPressureSD("../");
}

function updateAge(prefix) {
	 var measurementDate = dijit.byId("_dateOfMeasurement_id").value;
	 if (!isEmpty(measurementDate))
	 {
	    var measurementDateStr = dojo.date.stamp.toISOString(measurementDate, {selector:'date'});
	    var url = 'ajax/age/' + measurementDateStr + '/' + dojo.byId("_child_id").value;
	    updateFieldViaAjax("_exactAge_id", url, prefix);
	 } 
}

function updateBMI(prefix) {
	 var height = dijit.byId("_heightCM_id").value;
	 var weight = dijit.byId("_weightKG_id").value;	 
	 if (!isEmpty(weight) && !isEmpty(height))
	 {
	    var url = 'ajax/bmi/' + weight + '/' + height;
	    updateFieldViaAjax("_bmi_id", url, prefix);
	 } 
}

function updateBMISD(prefix) {
	 var measurementDate = dijit.byId("_dateOfMeasurement_id").value;
	 var height = dijit.byId("_heightCM_id").value;
	 var weight = dijit.byId("_weightKG_id").value;
	 if (!isEmpty(measurementDate) && !isEmpty(weight) && !isEmpty(height))
	 {
		var measurementDateStr = dojo.date.stamp.toISOString(measurementDate, {selector:'date'});
	    var url = 'ajax/bmiSD/' + measurementDateStr + '/' + dojo.byId("_child_id").value + '/' 
	    	+ weight + '/' + height;
	    updateFieldViaAjax("_bmiSD_id", url, prefix);
	 } 
}

function updateInsulinUnitsPerKg(prefix) {
	 var weight = dijit.byId("_weightKG_id").value;
	 var insulinUnitsPerDay = dijit.byId("_insulinUnitsPerDay_id").value;
	 if (!isEmpty(weight) && !isEmpty(insulinUnitsPerDay))
	 {
	    var url = 'ajax/insulinUnitsPerKg/' + weight + '/' + insulinUnitsPerDay;
	    updateFieldViaAjax("_insulinPerKg_id", url, prefix);
	 } 
}

function updateWeightSD(prefix) {
	 var measurementDate = dijit.byId("_dateOfMeasurement_id").value;
	 var weight = dijit.byId("_weightKG_id").value;
	 if (!isEmpty(measurementDate) && !isEmpty(weight))
	 {
	    measurementDateStr = dojo.date.stamp.toISOString(measurementDate, {selector:'date'});
	    var url = 'ajax/weightSD/' + measurementDateStr + '/' + dojo.byId("_child_id").value+
    	'/' + weight;
	    updateFieldViaAjax("_weightSD_id", url, prefix);
	 } 
}

function updateHeightSD(prefix) {
	 var measurementDate = dijit.byId("_dateOfMeasurement_id").value;
	 var height = dijit.byId("_heightCM_id").value;
	 if (!isEmpty(measurementDate) && !isEmpty(height))
	 {
	    var measurementDateStr = dojo.date.stamp.toISOString(measurementDate, {selector:'date'});
	    var url = 'ajax/heightSD/' + measurementDateStr + '/' + dojo.byId("_child_id").value +
	    	'/' + height;
	    updateFieldViaAjax("_heightSD_id", url, prefix);
	 } 
}

function updateDiastolicBloodPressureSD(prefix) {
	 var measurementDate = dijit.byId("_dateOfMeasurement_id").value;
	 var height = dijit.byId("_heightCM_id").value;
	 var bpDias = dijit.byId("_bloodPressureDiastolicMMHg_id").value;
	 if (!isEmpty(measurementDate) && !isEmpty(height) && !isEmpty(bpDias))
	 {
	    var measurementDateStr = dojo.date.stamp.toISOString(measurementDate, {selector:'date'});
	    var url = 'ajax/diastolicBloodPressureSD/' + measurementDateStr + '/' + dojo.byId("_child_id").value
	    + '/' + height + '/' + bpDias;
	    updateFieldViaAjax("_bloodPressureDiastolicSD_id", url, prefix);
	 } 
}

function updateSystolicBloodPressureSD(prefix) {
	 var measurementDate = dijit.byId("_dateOfMeasurement_id").value;
	 var height = dijit.byId("_heightCM_id").value;
	 var bpSys = dijit.byId("_bloodPressureSystolicMMHg_id").value;
	 if (!isEmpty(measurementDate) && !isEmpty(height) && !isEmpty(bpSys))
	 {
	    var measurementDateStr = dojo.date.stamp.toISOString(measurementDate, {selector:'date'});
	    var url = 'ajax/systolicBloodPressureSD/' + measurementDateStr + '/' + dojo.byId("_child_id").value
	    	+ '/' + height + '/' + bpSys;
	    updateFieldViaAjax("_bloodPressureSystolicSD_id", url, prefix);
	 } 
}

function updateFieldViaAjax(fieldName, url, prefix)
{
	if (document.location.href.indexOf('/form') != -1)
    	url = "../../" + url;
	else
		url = prefix + url;
	console.debug(" Doing Ajax call for Age " + url);
	dojo.xhrGet( { // 
	    // The following URL must match that used to test the server.
	    url: url, 
	    preventCache: true,
	    handleAs: "text",
	    timeout: 10000, // Time in milliseconds
	
	    // The LOAD function will be called on a successful response.
	    load: function(response, ioArgs) { 
	      console.log("got back response ", response);
	      
	      dijit.byId(fieldName).setValue(response);
	      return response; // 
	    },
	
	    // The ERROR function will be called in an error case.
	    error: function(response, ioArgs) { // 
	      console.error(response," - HTTP status code: ", ioArgs.xhr.status); //
	      return response; // 
	    }
    });
}

function isEmpty(value)
{
	if (value == null || value == '')
		return true
	return false;
}
