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
                    <th>Reporttype</th>
                    <th/>
                    <th/>
                    <th/>
                </thead>
            </tr>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td>${report.id}</td>
                    <td>${fn:substring(report.reporttype, 0, 10)}</td>
                    <td>
                        <c:url value="/report/${report.id}" var="show_form_url"/>
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
