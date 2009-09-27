<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all ClinicalRecords">
<c:if test="${not empty clinicalrecords}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Blood Glucose Self Monitoring Per Week</th>
<th>Urine Glucose Self Monitoring Per Week</th>
<th>Adjust Insulin Dose If Needed</th>
<th>Insulin Units Per Day</th>
<th>Number Of Insulin Injections Per Day</th>
<th>Long Acting Human</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${clinicalrecords}" var="clinicalrecord">
<tr>
<td>${clinicalrecord.id}</td>
<td>${fn:substring(clinicalrecord.bloodGlucoseSelfMonitoringPerWeek, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.urineGlucoseSelfMonitoringPerWeek, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.adjustInsulinDoseIfNeeded, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.insulinUnitsPerDay, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.numberOfInsulinInjectionsPerDay, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.longActingHuman, 0, 10)}</td>
<td>
<c:url value="/clinicalrecord/${clinicalrecord.id}" var="show_form_url"/>
<c:url value="/static/images/show.png" var="show_image_url"/>
<form:form action="${show_form_url}" method="GET">
<input alt="Show clinicalrecord" src="${show_image_url}" title="Show clinicalrecord" type="image" value="Show clinicalrecord"/>
</form:form>
</td>
<td>
<c:url value="/clinicalrecord/${clinicalrecord.id}/form" var="update_form_url"/>
<c:url value="/static/images/update.png" var="update_image_url"/>
<form:form action="${update_form_url}" method="GET">
<input alt="Update clinicalrecord" src="${update_image_url}" title="Update clinicalrecord" type="image" value="Update clinicalrecord"/>
</form:form>
</td>
<td>
<c:url value="/clinicalrecord/${clinicalrecord.id}" var="delete_form_url"/>
<c:url value="/static/images/delete.png" var="delete_image_url"/>
<form:form action="${delete_form_url}" method="DELETE">
<input alt="Delete clinicalrecord" src="${delete_image_url}" title="Delete clinicalrecord" type="image" value="Delete clinicalrecord"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty clinicalrecords}">No ClinicalRecords found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
