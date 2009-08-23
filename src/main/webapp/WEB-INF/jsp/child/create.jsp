<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.DateTextBox");dojo.require("dijit.form.SimpleTextarea");dojo.require("dijit.form.MultiSelect");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Create New Child">
<form:form action="/LifeForAChild/child" method="POST" modelAttribute="child">
<div id="roo_child_initials">
<label for="_initials">Initials:</label>
<form:input cssStyle="width:250px" id="_initials" maxlength="30" path="initials" size="0"/>
<br/>
<form:errors cssClass="errors" id="_initials" path="initials"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_initials", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Initials", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_name">
<label for="_name">Name:</label>
<form:input cssStyle="width:250px" id="_name" maxlength="30" path="name" size="0"/>
<br/>
<form:errors cssClass="errors" id="_name" path="name"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_name", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Name", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_ethnicGroup">
<label for="_ethnicGroup">Ethnic Group:</label>
<form:input cssStyle="width:250px" id="_ethnicGroup" maxlength="20" path="ethnicGroup" size="0"/>
<br/>
<form:errors cssClass="errors" id="_ethnicGroup" path="ethnicGroup"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_ethnicGroup", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Ethnic Group", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_sex">
<label for="_sex">Sex:</label>
<form:input cssStyle="width:250px" id="_sex" maxlength="30" path="sex" size="0"/>
<br/>
<form:errors cssClass="errors" id="_sex" path="sex"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_sex", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Sex", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_survivalStatus">
<label for="_survivalStatus">Survival Status:</label>
<form:input cssStyle="width:250px" id="_survivalStatus" maxlength="30" path="survivalStatus" size="0"/>
<br/>
<form:errors cssClass="errors" id="_survivalStatus" path="survivalStatus"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_survivalStatus", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Survival Status", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_dateOfDeath">
<label for="_dateOfDeath">Date Of Death:</label>
<form:input cssStyle="width:250px" id="_dateOfDeath" maxlength="30" path="dateOfDeath" size="0"/>
<br/>
<form:errors cssClass="errors" id="_dateOfDeath" path="dateOfDeath"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_dateOfDeath", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Date Of Death", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_dateOfDeath', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_child_causeOfDeath">
<label for="_causeOfDeath">Cause Of Death:</label>
<form:input cssStyle="width:250px" id="_causeOfDeath" maxlength="30" path="causeOfDeath" size="0"/>
<br/>
<form:errors cssClass="errors" id="_causeOfDeath" path="causeOfDeath"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_causeOfDeath", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Cause Of Death", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_causeOfDeathOther">
<label for="_causeOfDeathOther">Cause Of Death Other:</label>
<form:textarea cssStyle="width:250px" id="_causeOfDeathOther" path="causeOfDeathOther"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_causeOfDeathOther", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_causeOfDeathOther" path="causeOfDeathOther"/>
</div>
<br/>
<div id="roo_child_dateOfRegistration">
<label for="_dateOfRegistration">Date Of Registration:</label>
<form:input cssStyle="width:250px" id="_dateOfRegistration" maxlength="30" path="dateOfRegistration" size="0"/>
<br/>
<form:errors cssClass="errors" id="_dateOfRegistration" path="dateOfRegistration"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_dateOfRegistration", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Date Of Registration", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_dateOfRegistration', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_child_dateOfBirth">
<label for="_dateOfBirth">Date Of Birth:</label>
<form:input cssStyle="width:250px" id="_dateOfBirth" maxlength="30" path="dateOfBirth" size="0"/>
<br/>
<form:errors cssClass="errors" id="_dateOfBirth" path="dateOfBirth"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_dateOfBirth", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Date Of Birth", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_dateOfBirth', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_child_diabetesDiagnosed">
<label for="_diabetesDiagnosed">Diabetes Diagnosed:</label>
<form:input cssStyle="width:250px" id="_diabetesDiagnosed" maxlength="30" path="diabetesDiagnosed" size="0"/>
<br/>
<form:errors cssClass="errors" id="_diabetesDiagnosed" path="diabetesDiagnosed"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_diabetesDiagnosed", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Diabetes Diagnosed", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_diabetesDiagnosed', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_child_insulinSince">
<label for="_insulinSince">Insulin Since:</label>
<form:input cssStyle="width:250px" id="_insulinSince" maxlength="30" path="insulinSince" size="0"/>
<br/>
<form:errors cssClass="errors" id="_insulinSince" path="insulinSince"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_insulinSince", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Insulin Since", invalidMessage: "", required : false}})); </script>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_insulinSince', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
</div>
<br/>
<div id="roo_child_diabetesType">
<label for="_diabetesType">Diabetes Type:</label>
<form:input cssStyle="width:250px" id="_diabetesType" maxlength="30" path="diabetesType" size="0"/>
<br/>
<form:errors cssClass="errors" id="_diabetesType" path="diabetesType"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_diabetesType", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Diabetes Type", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div id="roo_child_diabetesTypeOther">
<label for="_diabetesTypeOther">Diabetes Type Other:</label>
<form:textarea cssStyle="width:250px" id="_diabetesTypeOther" path="diabetesTypeOther"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_diabetesTypeOther", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_diabetesTypeOther" path="diabetesTypeOther"/>
</div>
<br/>
<div id="roo_child_clinicalRecords">
<c:if test="${not empty clinicalrecords}">
<label for="_clinicalRecords">Clinical Records:</label>
<form:select cssStyle="width:250px" id="_clinicalRecords" path="clinicalRecords">
<form:options itemValue="id" items="${clinicalrecords}"/>
</form:select>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_clinicalRecords', widgetType: 'dijit.form.MultiSelect'})); </script>
</c:if>
</div>
<br/>
<div class="submit" id="roo_child_submit">
<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
<input id="proceed" type="submit" value="Save"/>
</div>
</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
