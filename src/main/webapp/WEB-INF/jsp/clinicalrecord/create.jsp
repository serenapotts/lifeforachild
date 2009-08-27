<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.SimpleTextarea");dojo.require("dijit.form.DateTextBox");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Create New ClinicalRecord">
<form:form action="/LifeForAChild/clinicalrecord" method="POST" modelAttribute="clinicalrecord">
<div id="roo_clinicalrecord_bloodGlucoseSelfMonitoringPerWeek">
<label for="_bloodGlucoseSelfMonitoringPerWeek">Blood Glucose Self Monitoring Per Week:</label>
<form:textarea cssStyle="width:250px" id="_bloodGlucoseSelfMonitoringPerWeek" path="bloodGlucoseSelfMonitoringPerWeek"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_bloodGlucoseSelfMonitoringPerWeek", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_bloodGlucoseSelfMonitoringPerWeek" path="bloodGlucoseSelfMonitoringPerWeek"/>
</div>
<br/>
<div id="roo_clinicalrecord_urineGlucoseSelfMonitoringPerWeek">
<label for="_urineGlucoseSelfMonitoringPerWeek">Urine Glucose Self Monitoring Per Week:</label>
<form:input cssStyle="width:250px" id="_urineGlucoseSelfMonitoringPerWeek" maxlength="30" path="urineGlucoseSelfMonitoringPerWeek" size="0"/>
<br/>
<form:errors cssClass="errors" id="_urineGlucoseSelfMonitoringPerWeek" path="urineGlucoseSelfMonitoringPerWeek"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_urineGlucoseSelfMonitoringPerWeek", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Urine Glucose Self Monitoring Per Week", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_adjustInsulinDoseIfNeeded">
<label for="_adjustInsulinDoseIfNeeded">Adjust Insulin Dose If Needed:</label>
<form:checkbox id="_adjustInsulinDoseIfNeeded" path="adjustInsulinDoseIfNeeded"/>
</div>
<br/>
<div id="roo_clinicalrecord_insulinUnitsPerDay">
<label for="_insulinUnitsPerDay">Insulin Units Per Day:</label>
<form:textarea cssStyle="width:250px" id="_insulinUnitsPerDay" path="insulinUnitsPerDay"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_insulinUnitsPerDay", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_insulinUnitsPerDay" path="insulinUnitsPerDay"/>
</div>
<br/>
<div id="roo_clinicalrecord_numberOfInsulinInjectionsPerDay">
<label for="_numberOfInsulinInjectionsPerDay">Number Of Insulin Injections Per Day:</label>
<form:input cssStyle="width:250px" id="_numberOfInsulinInjectionsPerDay" maxlength="9" path="numberOfInsulinInjectionsPerDay" size="0"/>
<br/>
<form:errors cssClass="errors" id="_numberOfInsulinInjectionsPerDay" path="numberOfInsulinInjectionsPerDay"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_numberOfInsulinInjectionsPerDay", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Number Of Insulin Injections Per Day", invalidMessage: "Integer numbers only", regExp: "-?[0-9]{1,9}", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_longActingHuman">
<label for="_longActingHuman">Long Acting Human:</label>
<form:checkbox id="_longActingHuman" path="longActingHuman"/>
</div>
<br/>
<div id="roo_clinicalrecord_shortActingHuman">
<label for="_shortActingHuman">Short Acting Human:</label>
<form:checkbox id="_shortActingHuman" path="shortActingHuman"/>
</div>
<br/>
<div id="roo_clinicalrecord_analog">
<label for="_analog">Analog:</label>
<form:checkbox id="_analog" path="analog"/>
</div>
<br/>
<div id="roo_clinicalrecord_oralAgents">
<label for="_oralAgents">Oral Agents:</label>
<form:checkbox id="_oralAgents" path="oralAgents"/>
</div>
<br/>
<div id="roo_clinicalrecord_oralAgentsDescription">
<label for="_oralAgentsDescription">Oral Agents Description:</label>
<form:textarea cssStyle="width:250px" id="_oralAgentsDescription" path="oralAgentsDescription"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_oralAgentsDescription", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_oralAgentsDescription" path="oralAgentsDescription"/>
</div>
<br/>
<div id="roo_clinicalrecord_routineClinicReviewsLastYear">
<label for="_routineClinicReviewsLastYear">Routine Clinic Reviews Last Year:</label>
<form:textarea cssStyle="width:250px" id="_routineClinicReviewsLastYear" path="routineClinicReviewsLastYear"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_routineClinicReviewsLastYear", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_routineClinicReviewsLastYear" path="routineClinicReviewsLastYear"/>
</div>
<br/>
<div id="roo_clinicalrecord_bpMedications">
<label for="_bpMedications">Bp Medications:</label>
<form:checkbox id="_bpMedications" path="bpMedications"/>
</div>
<br/>
<div id="roo_clinicalrecord_bpMedicationsOther">
<label for="_bpMedicationsOther">Bp Medications Other:</label>
<form:input cssStyle="width:250px" id="_bpMedicationsOther" maxlength="30" path="bpMedicationsOther" size="0"/>
<br/>
<form:errors cssClass="errors" id="_bpMedicationsOther" path="bpMedicationsOther"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_bpMedicationsOther", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Bp Medications Other", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_otherTreatments">
<label for="_otherTreatments">Other Treatments:</label>
<form:textarea cssStyle="width:250px" id="_otherTreatments" path="otherTreatments"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_otherTreatments", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_otherTreatments" path="otherTreatments"/>
</div>
<br/>
<div id="roo_clinicalrecord_weightKG">
<label for="_weightKG">Weight K G:</label>
<form:input cssStyle="width:250px" id="_weightKG" maxlength="30" path="weightKG" size="0"/>
<br/>
<form:errors cssClass="errors" id="_weightKG" path="weightKG"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_weightKG", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Weight K G", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_heightCM">
<label for="_heightCM">Height C M:</label>
<form:input cssStyle="width:250px" id="_heightCM" maxlength="30" path="heightCM" size="0"/>
<br/>
<form:errors cssClass="errors" id="_heightCM" path="heightCM"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_heightCM", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Height C M", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_bloodPressureSystolicMMHg">
<label for="_bloodPressureSystolicMMHg">Blood Pressure Systolic M M Hg:</label>
<form:input cssStyle="width:250px" id="_bloodPressureSystolicMMHg" maxlength="30" path="bloodPressureSystolicMMHg" size="0"/>
<br/>
<form:errors cssClass="errors" id="_bloodPressureSystolicMMHg" path="bloodPressureSystolicMMHg"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_bloodPressureSystolicMMHg", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Blood Pressure Systolic M M Hg", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_bloodPressureDiastolicMMHg">
<label for="_bloodPressureDiastolicMMHg">Blood Pressure Diastolic M M Hg:</label>
<form:input cssStyle="width:250px" id="_bloodPressureDiastolicMMHg" maxlength="30" path="bloodPressureDiastolicMMHg" size="0"/>
<br/>
<form:errors cssClass="errors" id="_bloodPressureDiastolicMMHg" path="bloodPressureDiastolicMMHg"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_bloodPressureDiastolicMMHg", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Blood Pressure Diastolic M M Hg", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_dateOfMeasurement">
<label for="_dateOfMeasurement">Date Of Measurement:</label>
<form:input cssStyle="width:250px" id="_dateOfMeasurement" maxlength="30" path="dateOfMeasurement" size="0"/>
<br/>
<form:errors cssClass="errors" id="_dateOfMeasurement" path="dateOfMeasurement"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_dateOfMeasurement", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Date Of Measurement", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_dateOfMeasurement', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_age">
<label for="_age">Age:</label>
<form:input cssStyle="width:250px" id="_age" maxlength="30" path="age" size="0"/>
<br/>
<form:errors cssClass="errors" id="_age" path="age"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_age", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Age", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_hasPersistentHypertension">
<label for="_hasPersistentHypertension">Has Persistent Hypertension:</label>
<form:checkbox id="_hasPersistentHypertension" path="hasPersistentHypertension"/>
</div>
<br/>
<div id="roo_clinicalrecord_hasPubertyTannerB2_P2orGreater">
<label for="_hasPubertyTannerB2_P2orGreater">Has Puberty Tanner B2_ P2or Greater:</label>
<form:checkbox id="_hasPubertyTannerB2_P2orGreater" path="hasPubertyTannerB2_P2orGreater"/>
</div>
<br/>
<div id="roo_clinicalrecord_menarche">
<label for="_menarche">Menarche:</label>
<form:checkbox id="_menarche" path="menarche"/>
</div>
<br/>
<div id="roo_clinicalrecord_ifMenarcheAge">
<label for="_ifMenarcheAge">If Menarche Age:</label>
<form:input cssStyle="width:250px" id="_ifMenarcheAge" maxlength="30" path="ifMenarcheAge" size="0"/>
<br/>
<form:errors cssClass="errors" id="_ifMenarcheAge" path="ifMenarcheAge"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_ifMenarcheAge", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter If Menarche Age", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_ifMenarcheAge', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_eyesExaminedInLastYear">
<label for="_eyesExaminedInLastYear">Eyes Examined In Last Year:</label>
<form:checkbox id="_eyesExaminedInLastYear" path="eyesExaminedInLastYear"/>
</div>
<br/>
<div id="roo_clinicalrecord_cateract">
<label for="_cateract">Cateract:</label>
<form:input cssStyle="width:250px" id="_cateract" maxlength="30" path="cateract" size="0"/>
<br/>
<form:errors cssClass="errors" id="_cateract" path="cateract"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_cateract", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Cateract", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_visualAcuityRight">
<label for="_visualAcuityRight">Visual Acuity Right:</label>
<form:input cssStyle="width:250px" id="_visualAcuityRight" maxlength="20" path="visualAcuityRight" size="0"/>
<br/>
<form:errors cssClass="errors" id="_visualAcuityRight" path="visualAcuityRight"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_visualAcuityRight", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Visual Acuity Right", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_visualAcuityLeft">
<label for="_visualAcuityLeft">Visual Acuity Left:</label>
<form:input cssStyle="width:250px" id="_visualAcuityLeft" maxlength="20" path="visualAcuityLeft" size="0"/>
<br/>
<form:errors cssClass="errors" id="_visualAcuityLeft" path="visualAcuityLeft"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_visualAcuityLeft", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Visual Acuity Left", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_feetExaminedInLastYear">
<label for="_feetExaminedInLastYear">Feet Examined In Last Year:</label>
<form:checkbox id="_feetExaminedInLastYear" path="feetExaminedInLastYear"/>
</div>
<br/>
<div id="roo_clinicalrecord_monofilamentTested">
<label for="_monofilamentTested">Monofilament Tested:</label>
<form:checkbox id="_monofilamentTested" path="monofilamentTested"/>
</div>
<br/>
<div id="roo_clinicalrecord_monofilamentAbnormal">
<label for="_monofilamentAbnormal">Monofilament Abnormal:</label>
<form:checkbox id="_monofilamentAbnormal" path="monofilamentAbnormal"/>
</div>
<br/>
<div id="roo_clinicalrecord_tuningForkTested">
<label for="_tuningForkTested">Tuning Fork Tested:</label>
<form:checkbox id="_tuningForkTested" path="tuningForkTested"/>
</div>
<br/>
<div id="roo_clinicalrecord_tuningForkAbnormal">
<label for="_tuningForkAbnormal">Tuning Fork Abnormal:</label>
<form:checkbox id="_tuningForkAbnormal" path="tuningForkAbnormal"/>
</div>
<br/>
<div id="roo_clinicalrecord_lastHbA1cInLast12Months">
<label for="_lastHbA1cInLast12Months">Last Hb A1c In Last12 Months:</label>
<form:input cssStyle="width:250px" id="_lastHbA1cInLast12Months" maxlength="30" path="lastHbA1cInLast12Months" size="0"/>
<br/>
<form:errors cssClass="errors" id="_lastHbA1cInLast12Months" path="lastHbA1cInLast12Months"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_lastHbA1cInLast12Months", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Last Hb A1c In Last12 Months", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_hbA1cMethod">
<label for="_hbA1cMethod">Hb A1c Method:</label>
<form:input cssStyle="width:250px" id="_hbA1cMethod" maxlength="30" path="hbA1cMethod" size="0"/>
<br/>
<form:errors cssClass="errors" id="_hbA1cMethod" path="hbA1cMethod"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_hbA1cMethod", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Hb A1c Method", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_clinicalrecord_hbA1cMethodOther">
<label for="_hbA1cMethodOther">Hb A1c Method Other:</label>
<form:input cssStyle="width:250px" id="_hbA1cMethodOther" maxlength="30" path="hbA1cMethodOther" size="0"/>
<br/>
<form:errors cssClass="errors" id="_hbA1cMethodOther" path="hbA1cMethodOther"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_hbA1cMethodOther", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Hb A1c Method Other", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div class="submit" id="roo_clinicalrecord_submit">
<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
<input id="proceed" type="submit" value="Save"/>
</div>
</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
