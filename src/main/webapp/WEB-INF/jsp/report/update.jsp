<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.FilteringSelect");dojo.require("dijit.form.DateTextBox");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update Report">
    <c:url value="/report/${report.id}" var="form_url"/>
    <form:form action="${form_url}" method="PUT" modelAttribute="report">
        <div id="roo_report_name">
            <label for="_name">Name:</label>
            <form:input cssStyle="width:250px" id="_name" maxlength="30" path="name" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_name" path="name"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_name", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Name", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_report_reporttype">
            <label for="_reporttype">Reporttype:</label>
            <form:select cssStyle="width:250px" id="_reporttype" items="${_reporttype}" path="reporttype"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_reporttype', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_reporttype" path="reporttype"/>
        </div>
        <br/>
        <div id="roo_report_statustype">
            <label for="_statustype">Statustype:</label>
            <form:select cssStyle="width:250px" id="_statustype" items="${_statustype}" path="statustype"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_statustype', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_statustype" path="statustype"/>
        </div>
        <br/>
        <div id="roo_report_timePeriod">
            <label for="_timePeriod">Time Period:</label>
            <form:input cssStyle="width:250px" id="_timePeriod" maxlength="30" path="timePeriod" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_timePeriod" path="timePeriod"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_timePeriod", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Time Period", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_report_timeperiodunit">
            <label for="_timeperiodunit">Timeperiodunit:</label>
            <form:select cssStyle="width:250px" id="_timeperiodunit" items="${_timeperiodunit}" path="timeperiodunit"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_timeperiodunit', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_timeperiodunit" path="timeperiodunit"/>
        </div>
        <br/>
        <div id="roo_report_fromDate">
            <label for="_fromDate">From Date:</label>
            <form:input cssStyle="width:250px" id="_fromDate" maxlength="30" path="fromDate" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_fromDate" path="fromDate"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_fromDate", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter From Date", invalidMessage: "", required : false}})); </script>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_fromDate', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
        </div>
        <br/>
        <div id="roo_report_toDate">
            <label for="_toDate">To Date:</label>
            <form:input cssStyle="width:250px" id="_toDate" maxlength="30" path="toDate" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_toDate" path="toDate"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_toDate", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter To Date", invalidMessage: "", required : false}})); </script>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_toDate', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
        </div>
        <br/>
        <div id="roo_report_centre">
            <label for="_centre">Centre:</label>
            <form:input cssStyle="width:250px" id="_centre" maxlength="30" path="centre" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_centre" path="centre"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_centre", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Centre", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_report_country">
            <label for="_country">Country:</label>
            <form:input cssStyle="width:250px" id="_country" maxlength="30" path="country" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_country" path="country"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_country", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Country", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_report_displayFields">
            <label for="_displayFields">Display Fields:</label>
            <form:input cssStyle="width:250px" id="_displayFields" maxlength="30" path="displayFields" size="0"/>
            <br/>
            <form:errors cssClass="errors" id="_displayFields" path="displayFields"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_displayFields", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Display Fields", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div class="submit" id="roo_report_submit">
            <script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
            <input id="proceed" type="submit" value="Update"/>
        </div>
        <form:hidden id="_id" path="id"/>
        <form:hidden id="_version" path="version"/>
    </form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
