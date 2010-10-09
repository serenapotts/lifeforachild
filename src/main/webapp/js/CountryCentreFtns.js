//needed for the create page
function countryOnChangeFromCreate(newValue) {
	countryOnChange(newValue, "");
}

//Url's different for ajax call for update page
function countryOnChangeFromUpdate(newValue) {
	countryOnChange(newValue, "../");
}

function countryOnChange(newValue, prefix) {
	var centreSelect = dijit.byId('_centre_id');
	if (newValue == null || newValue == '' || newValue == '0')
	{
		centreSelect.store = "";
		return;
	}
	
	centreSelect.setDisabled(true);

	// after save and there are errors the url changes
	var url = prefix + 'ajax/centre/' + newValue;
	// first create url
	if (document.location.href.indexOf('/form') != -1)
		url = prefix + '../ajax/centre/' + newValue;
		                        		
	var newDataStore = new dojo.data.ItemFileReadStore({
		id: 'centres',
		urlPreventCache : true, 
		url: url});
	
	newDataStore.data = newDataStore._jsonData;
	centreSelect.store = newDataStore;

	 var resetCentres = function(items, request){
		 centreSelect.setDisplayedValue("");
		 centreSelect.setDisabled(false);									 
	 }

	 var gotError = function(error, request){
	 displayError("The request to the centre has failed. " + error);
	 }

	 newDataStore.fetch({onComplete: resetCentres, onError: gotError});
}