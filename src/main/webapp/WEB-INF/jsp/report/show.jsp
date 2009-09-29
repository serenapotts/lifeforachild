<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show Report">
    <c:if test="${not empty report}">
        <div id="roo_report_name">
            <label for="_name">Name:</label>
            <div class="box" id="_name">${report.name}</div>
        </div>
        <br/>
        <div id="roo_report_reporttype">
            <label for="_reporttype">Reporttype:</label>
            <div class="box" id="_reporttype">${report.reporttype}</div>
        </div>
        <br/>
        <div id="roo_report_statustype">
            <label for="_statustype">Statustype:</label>
            <div class="box" id="_statustype">${report.statustype}</div>
        </div>
        <br/>
        <div id="roo_report_timePeriod">
            <label for="_timePeriod">Time Period:</label>
            <div class="box" id="_timePeriod">${report.timePeriod}</div>
        </div>
        <br/>
        <div id="roo_report_timeperiodunit">
            <label for="_timeperiodunit">Timeperiodunit:</label>
            <div class="box" id="_timeperiodunit">${report.timeperiodunit}</div>
        </div>
        <br/>
        <div id="roo_report_fromDate">
            <label for="_fromDate">From Date:</label>
            <div class="box" id="_fromDate">
                <fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${report.fromDate}"/>
            </div>
        </div>
        <br/>
        <div id="roo_report_toDate">
            <label for="_toDate">To Date:</label>
            <div class="box" id="_toDate">
                <fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${report.toDate}"/>
            </div>
        </div>
        <br/>
        <div id="roo_report_centre">
            <label for="_centre">Centre:</label>
            <div class="box" id="_centre">${report.centre}</div>
        </div>
        <br/>
        <div id="roo_report_country">
            <label for="_country">Country:</label>
            <div class="box" id="_country">${report.country}</div>
        </div>
        <br/>
        <div id="roo_report_displayFields">
            <label for="_displayFields">Display Fields:</label>
            <div class="box" id="_displayFields">${report.displayFields}</div>
        </div>
        <br/>
    </c:if>
    <c:if test="${empty report}">No Report found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
