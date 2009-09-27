<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show Report">
    <c:if test="${not empty report}">
        <div id="roo_report_reporttype">
            <label for="_reporttype">Reporttype:</label>
            <div class="box" id="_reporttype">${report.reporttype}</div>
        </div>
        <br/>
    </c:if>
    <c:if test="${empty report}">No Report found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
