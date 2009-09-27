<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.SimpleTextarea");dojo.require("dijit.form.DateTextBox");dojo.require("dijit.form.FilteringSelect");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update ClinicalRecord">
    <c:url value="/clinicalrecord/${clinicalrecord.id}" var="form_url"/>
    <form:form action="${form_url}" method="PUT" modelAttribute="clinicalrecord">
        <div id="roo_clinicalrecord_bloodGlucoseSelfMonitoringPerWeek">
            <label for="_bloodGlucoseSelfMonitoringPerWeek">Blood Glucose Self Monitoring Per Week:</label>
            <form:input cssStyle="width:250px" id="_bloodGlucoseSelfMonitoringPerWeek" maxlength="30" path="bloodGlucoseSelfMonitoringPerWeek" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_bloodGlucoseSelfMonitoringPerWeek" path="bloodGlucoseSelfMonitoringPerWeek"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_bloodGlucoseSelfMonitoringPerWeek", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Blood Glucose Self Monitoring Per Week (required)", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : true}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_urineGlucoseSelfMonitoringPerWeek">
            <label for="_urineGlucoseSelfMonitoringPerWeek">Urine Glucose Self Monitoring Per Week:</label>
            <form:input cssStyle="width:250px" id="_urineGlucoseSelfMonitoringPerWeek" maxlength="30" path="urineGlucoseSelfMonitoringPerWeek" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_urineGlucoseSelfMonitoringPerWeek" path="urineGlucoseSelfMonitoringPerWeek"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_urineGlucoseSelfMonitoringPerWeek", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Urine Glucose Self Monitoring Per Week (required)", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : true}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_adjustInsulinDoseIfNeeded">
            <label for="_adjustInsulinDoseIfNeeded">Adjust Insulin Dose If Needed:</label>
            <form:checkbox id="_adjustInsulinDoseIfNeeded" path="adjustInsulinDoseIfNeeded"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_insulinUnitsPerDay">
            <label for="_insulinUnitsPerDay">Insulin Units Per Day:</label>
            <form:input cssStyle="width:250px" id="_insulinUnitsPerDay" maxlength="30" path="insulinUnitsPerDay" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_insulinUnitsPerDay" path="insulinUnitsPerDay"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_insulinUnitsPerDay", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Insulin Units Per Day (required)", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : true}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_numberOfInsulinInjectionsPerDay">
            <label for="_numberOfInsulinInjectionsPerDay">Number Of Insulin Injections Per Day:</label>
            <form:input cssStyle="width:250px" id="_numberOfInsulinInjectionsPerDay" maxlength="30" path="numberOfInsulinInjectionsPerDay" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_numberOfInsulinInjectionsPerDay" path="numberOfInsulinInjectionsPerDay"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_numberOfInsulinInjectionsPerDay", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Number Of Insulin Injections Per Day", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
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
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_oralAgentsDescription", widgetType: 'dijit.form.SimpleTextarea', widgetAttrs: {}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_oralAgentsDescription" path="oralAgentsDescription"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_routineClinicReviewsLastYear">
            <label for="_routineClinicReviewsLastYear">Routine Clinic Reviews Last Year:</label>
            <form:input cssStyle="width:250px" id="_routineClinicReviewsLastYear" maxlength="30" path="routineClinicReviewsLastYear" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_routineClinicReviewsLastYear" path="routineClinicReviewsLastYear"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_routineClinicReviewsLastYear", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Routine Clinic Reviews Last Year (required)", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : true}})); </script>
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
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_otherTreatments", widgetType: 'dijit.form.SimpleTextarea', widgetAttrs: {}})); </script>
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
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_dateOfMeasurement', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'MMM d, yyyy', required : false}, datePattern : 'MMM d, yyyy'}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_age">
            <label for="_age">Age:</label>
            <form:input cssStyle="width:250px" id="_age" maxlength="30" path="age" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_age" path="age"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_age", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Age (required)", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : true}})); </script>
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
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_ifMenarcheAge', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'MMM d, yyyy', required : false}, datePattern : 'MMM d, yyyy'}})); </script>
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
            <form:select cssStyle="width:250px" id="_lastHbA1cInLast12Months" items="${_lastHbA1cInLast12Months}" path="lastHbA1cInLast12Months"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_lastHbA1cInLast12Months', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_lastHbA1cInLast12Months" path="lastHbA1cInLast12Months"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_hbA1cPercentage">
            <label for="_hbA1cPercentage">Hb A1c Percentage:</label>
            <form:input cssStyle="width:250px" id="_hbA1cPercentage" maxlength="30" path="hbA1cPercentage" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_hbA1cPercentage" path="hbA1cPercentage"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_hbA1cPercentage", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Hb A1c Percentage", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
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
        <div id="roo_clinicalrecord_microalbuminuriaValue">
            <label for="_microalbuminuriaValue">Microalbuminuria Value:</label>
            <form:input cssStyle="width:250px" id="_microalbuminuriaValue" maxlength="30" path="microalbuminuriaValue" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_microalbuminuriaValue" path="microalbuminuriaValue"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_microalbuminuriaValue", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Microalbuminuria Value", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_microalbuminuriaUnitOfMeasure">
            <label for="_microalbuminuriaUnitOfMeasure">Microalbuminuria Unit Of Measure:</label>
            <form:input cssStyle="width:250px" id="_microalbuminuriaUnitOfMeasure" maxlength="30" path="microalbuminuriaUnitOfMeasure" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_microalbuminuriaUnitOfMeasure" path="microalbuminuriaUnitOfMeasure"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_microalbuminuriaUnitOfMeasure", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Microalbuminuria Unit Of Measure", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_creatinineValue">
            <label for="_creatinineValue">Creatinine Value:</label>
            <form:input cssStyle="width:250px" id="_creatinineValue" maxlength="30" path="creatinineValue" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_creatinineValue" path="creatinineValue"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_creatinineValue", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Creatinine Value", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_creatinineUnits">
            <label for="_creatinineUnits">Creatinine Units:</label>
            <form:input cssStyle="width:250px" id="_creatinineUnits" maxlength="30" path="creatinineUnits" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_creatinineUnits" path="creatinineUnits"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_creatinineUnits", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Creatinine Units", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_totalCholesterolValue">
            <label for="_totalCholesterolValue">Total Cholesterol Value:</label>
            <form:input cssStyle="width:250px" id="_totalCholesterolValue" maxlength="30" path="totalCholesterolValue" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_totalCholesterolValue" path="totalCholesterolValue"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_totalCholesterolValue", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Total Cholesterol Value", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_cholesterolUnits">
            <label for="_cholesterolUnits">Cholesterol Units:</label>
            <form:input cssStyle="width:250px" id="_cholesterolUnits" maxlength="30" path="cholesterolUnits" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_cholesterolUnits" path="cholesterolUnits"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_cholesterolUnits", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Cholesterol Units", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_hdlCholesterolValue">
            <label for="_hdlCholesterolValue">Hdl Cholesterol Value:</label>
            <form:input cssStyle="width:250px" id="_hdlCholesterolValue" maxlength="30" path="hdlCholesterolValue" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_hdlCholesterolValue" path="hdlCholesterolValue"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_hdlCholesterolValue", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Hdl Cholesterol Value", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_hdlUnits">
            <label for="_hdlUnits">Hdl Units:</label>
            <form:input cssStyle="width:250px" id="_hdlUnits" maxlength="30" path="hdlUnits" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_hdlUnits" path="hdlUnits"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_hdlUnits", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Hdl Units", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_triglyceridesValue">
            <label for="_triglyceridesValue">Triglycerides Value:</label>
            <form:input cssStyle="width:250px" id="_triglyceridesValue" maxlength="30" path="triglyceridesValue" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_triglyceridesValue" path="triglyceridesValue"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_triglyceridesValue", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Triglycerides Value", invalidMessage: "Number with '-' or '.' allowed", regExp: "-?[0-9]*\.[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_triglyceridesUnits">
            <label for="_triglyceridesUnits">Triglycerides Units:</label>
            <form:input cssStyle="width:250px" id="_triglyceridesUnits" maxlength="30" path="triglyceridesUnits" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_triglyceridesUnits" path="triglyceridesUnits"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_triglyceridesUnits", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Triglycerides Units", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_fasted">
            <label for="_fasted">Fasted:</label>
            <form:input cssStyle="width:250px" id="_fasted" maxlength="30" path="fasted" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_fasted" path="fasted"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_fasted", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Fasted", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_attendingSchool">
            <label for="_attendingSchool">Attending School:</label>
            <form:checkbox id="_attendingSchool" path="attendingSchool"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_notAttendingSchoolWhy">
            <label for="_notAttendingSchoolWhy">Not Attending School Why:</label>
            <form:select cssStyle="width:250px" id="_notAttendingSchoolWhy" items="${_notAttendingSchoolWhy}" path="notAttendingSchoolWhy"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_notAttendingSchoolWhy', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_notAttendingSchoolWhy" path="notAttendingSchoolWhy"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_diabetesLimitingAttendance">
            <label for="_diabetesLimitingAttendance">Diabetes Limiting Attendance:</label>
            <form:checkbox id="_diabetesLimitingAttendance" path="diabetesLimitingAttendance"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_appropriateGradeForAge">
            <label for="_appropriateGradeForAge">Appropriate Grade For Age:</label>
            <form:checkbox id="_appropriateGradeForAge" path="appropriateGradeForAge"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_diabetesCopingAbilities">
            <label for="_diabetesCopingAbilities">Diabetes Coping Abilities:</label>
            <form:input cssStyle="width:250px" id="_diabetesCopingAbilities" maxlength="30" path="diabetesCopingAbilities" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_diabetesCopingAbilities" path="diabetesCopingAbilities"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_diabetesCopingAbilities", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Diabetes Coping Abilities", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_numberOfSevereHypoglycaemiaEpisodes">
            <label for="_numberOfSevereHypoglycaemiaEpisodes">Number Of Severe Hypoglycaemia Episodes:</label>
            <form:input cssStyle="width:250px" id="_numberOfSevereHypoglycaemiaEpisodes" maxlength="30" path="numberOfSevereHypoglycaemiaEpisodes" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_numberOfSevereHypoglycaemiaEpisodes" path="numberOfSevereHypoglycaemiaEpisodes"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_numberOfSevereHypoglycaemiaEpisodes", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Number Of Severe Hypoglycaemia Episodes", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_reasonHypoglycaemiaEpisodesNotEntered">
            <label for="_reasonHypoglycaemiaEpisodesNotEntered">Reason Hypoglycaemia Episodes Not Entered:</label>
            <form:input cssStyle="width:250px" id="_reasonHypoglycaemiaEpisodesNotEntered" maxlength="30" path="reasonHypoglycaemiaEpisodesNotEntered" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_reasonHypoglycaemiaEpisodesNotEntered" path="reasonHypoglycaemiaEpisodesNotEntered"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_reasonHypoglycaemiaEpisodesNotEntered", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Reason Hypoglycaemia Episodes Not Entered", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_numberKetoacidosisEpisodes">
            <label for="_numberKetoacidosisEpisodes">Number Ketoacidosis Episodes:</label>
            <form:input cssStyle="width:250px" id="_numberKetoacidosisEpisodes" maxlength="30" path="numberKetoacidosisEpisodes" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_numberKetoacidosisEpisodes" path="numberKetoacidosisEpisodes"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_numberKetoacidosisEpisodes", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Number Ketoacidosis Episodes", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_reasonKetoacidosisEpisodesNotEntered">
            <label for="_reasonKetoacidosisEpisodesNotEntered">Reason Ketoacidosis Episodes Not Entered:</label>
            <form:input cssStyle="width:250px" id="_reasonKetoacidosisEpisodesNotEntered" maxlength="30" path="reasonKetoacidosisEpisodesNotEntered" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_reasonKetoacidosisEpisodesNotEntered" path="reasonKetoacidosisEpisodesNotEntered"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_reasonKetoacidosisEpisodesNotEntered", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Reason Ketoacidosis Episodes Not Entered", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_numberOfHospitalAdmissionsRelatedToDiabetes">
            <label for="_numberOfHospitalAdmissionsRelatedToDiabetes">Number Of Hospital Admissions Related To Diabetes:</label>
            <form:input cssStyle="width:250px" id="_numberOfHospitalAdmissionsRelatedToDiabetes" maxlength="30" path="numberOfHospitalAdmissionsRelatedToDiabetes" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_numberOfHospitalAdmissionsRelatedToDiabetes" path="numberOfHospitalAdmissionsRelatedToDiabetes"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_numberOfHospitalAdmissionsRelatedToDiabetes", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Number Of Hospital Admissions Related To Diabetes", invalidMessage: "Integer numbers only", regExp: "-?[0-9]*", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_reasonHospitalAdmissionsNotEntered">
            <label for="_reasonHospitalAdmissionsNotEntered">Reason Hospital Admissions Not Entered:</label>
            <form:input cssStyle="width:250px" id="_reasonHospitalAdmissionsNotEntered" maxlength="30" path="reasonHospitalAdmissionsNotEntered" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_reasonHospitalAdmissionsNotEntered" path="reasonHospitalAdmissionsNotEntered"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_reasonHospitalAdmissionsNotEntered", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Reason Hospital Admissions Not Entered", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_additionalComment">
            <label for="_additionalComment">Additional Comment:</label>
            <form:textarea cssStyle="width:250px" id="_additionalComment" path="additionalComment"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_additionalComment", widgetType: 'dijit.form.SimpleTextarea', widgetAttrs: {}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_additionalComment" path="additionalComment"/>
        </div>
        <br/>
        <div id="roo_clinicalrecord_personCompletingForm">
            <c:if test="${not empty users}">
                <label for="_personCompletingForm">Person Completing Form:</label>
                <form:select cssStyle="width:250px" id="_personCompletingForm" path="personCompletingForm">
                    <form:options itemValue="id" items="${users}"/>
                </form:select>
                <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_personCompletingForm', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            </c:if>
        </div>
        <br/>
        <div id="roo_clinicalrecord_dateCompleted">
            <label for="_dateCompleted">Date Completed:</label>
            <form:input cssStyle="width:250px" id="_dateCompleted" maxlength="30" path="dateCompleted" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_dateCompleted" path="dateCompleted"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_dateCompleted", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Date Completed (required)", invalidMessage: "", required : true}})); </script>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_dateCompleted', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'MMM d, yyyy', required : false}, datePattern : 'MMM d, yyyy'}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_seniorPhysician">
            <label for="_seniorPhysician">Senior Physician:</label>
            <form:input cssStyle="width:250px" id="_seniorPhysician" maxlength="30" path="seniorPhysician" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_seniorPhysician" path="seniorPhysician"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_seniorPhysician", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Senior Physician (required)", invalidMessage: "", required : true}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_literate">
            <label for="_literate">Literate:</label>
            <form:input cssStyle="width:250px" id="_literate" maxlength="30" path="literate" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_literate" path="literate"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_literate", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Literate", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_clinicalrecord_child">
            <c:if test="${not empty children}">
                <label for="_child">Child:</label>
                <form:select cssStyle="width:250px" id="_child" path="child">
                    <form:options itemValue="id" items="${children}"/>
                </form:select>
                <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_child', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            </c:if>
        </div>
        <br/>
        <div class="submit" id="roo_clinicalrecord_submit">
            <script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
            <input id="proceed" type="submit" value="Update"/>
        </div>
        <form:hidden id="_id" path="id"/>
        <form:hidden id="_version" path="version"/>
    </form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
