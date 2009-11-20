<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all Reports">
    <c:if test="${not empty reports}">
        <table width="300px">
            <tr>
                <thead>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Reporttype</th>
                    <th>Statustype</th>
                    <th>Time Period</th>
                    <th>Timeperiodunit</th>
                    <th>From Date</th>
                    <th/>
                    <th/>
                    <th/>
                    <th/>
                    <th/>
                </thead>
            </tr>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td>${report.id}</td>
                    <td>${fn:substring(report.name, 0, 10)}</td>
                    <td>${fn:substring(report.reporttype, 0, 10)}</td>
                    <td>${fn:substring(report.statustype, 0, 10)}</td>
                    <td>${fn:substring(report.timePeriod, 0, 10)}</td>
                    <td>${fn:substring(report.timeperiodunit, 0, 10)}</td>
                    <td>
                        <fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${report.fromDate}"/>
                    </td>
                    <td>
                        <c:url value="/reportgenerator/${report.id}" var="show_form_url"/>
                        <c:url value="/static/images/show.png" var="show_image_url"/>
                        <form:form action="${show_form_url}" method="GET">
                            <input alt="Show report" src="${show_image_url}" title="Show report" type="image" value="Show report"/>
                        </form:form>
                    </td>
                    <td>
                        <c:url value="/report/${report.id}/form" var="update_form_url"/>
                        <c:url value="/static/images/update.png" var="update_image_url"/>
                        <form:form action="${update_form_url}" method="GET">
                            <input alt="Update report" src="${update_image_url}" title="Update report" type="image" value="Update report"/>
                        </form:form>
                    </td>
                    <td>
                        <c:url value="/excelgenerator/${report.id}" var="export_excel_url"/>
                        <c:url value="/static/images/excel.gif" var="excel_image_url"/>
                        <form:form action="${export_excel_url}" method="GET">
                            <input alt="Export to Excel" src="${excel_image_url}" title="Export to Excel" type="image" value="Export to Excel"/>
                        </form:form>
                    </td>
                    <td>
                        <c:url value="/pdfgenerator/${report.id}" var="export_pdf_url"/>
                        <c:url value="/static/images/pdf.gif" var="pdf_image_url"/>
                        <form:form action="${export_pdf_url}" method="GET">
                            <input alt="Export to PDF" src="${pdf_image_url}" title="Export to PDF" type="image" value="Export to PDF"/>
                        </form:form>
                    </td>                                        
                    <td>
                        <c:url value="/report/${report.id}" var="delete_form_url"/>
                        <c:url value="/static/images/delete.png" var="delete_image_url"/>
                        <form:form action="${delete_form_url}" method="DELETE">
                            <input alt="Delete report" src="${delete_image_url}" title="Delete report" type="image" value="Delete report"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty reports}">No Reports found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
