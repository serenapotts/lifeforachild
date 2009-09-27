<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.FilteringSelect");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update Report">
    <c:url value="/report/${report.id}" var="form_url"/>
    <form:form action="${form_url}" method="PUT" modelAttribute="report">
        <div id="roo_report_reporttype">
            <label for="_reporttype">Reporttype:</label>
            <form:select cssStyle="width:250px" id="_reporttype" items="${_reporttype}" path="reporttype"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_reporttype', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
            <form:errors cssClass="errors" id="_reporttype" path="reporttype"/>
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
