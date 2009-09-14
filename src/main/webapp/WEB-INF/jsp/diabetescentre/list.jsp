<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all DiabetesCentres">
<c:if test="${not empty diabetescentres}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Name</th>
<th>Address</th>
<th>Country</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${diabetescentres}" var="diabetescentre">
<tr>
<td>${diabetescentre.id}</td>
<td>${fn:substring(diabetescentre.name, 0, 10)}</td>
<td>${fn:substring(diabetescentre.address, 0, 10)}</td>
<td>${fn:substring(diabetescentre.country, 0, 10)}</td>
<td>
<c:url value="/diabetescentre/${diabetescentre.id}" var="show_form_url"/>
<c:url value="/static/images/show.png" var="show_image_url"/>
<form:form action="${show_form_url}" method="GET">
<input alt="Show diabetescentre" src="${show_image_url}" title="Show diabetescentre" type="image" value="Show diabetescentre"/>
</form:form>
</td>
<td>
<c:url value="/diabetescentre/${diabetescentre.id}/form" var="update_form_url"/>
<c:url value="/static/images/update.png" var="update_image_url"/>
<form:form action="${update_form_url}" method="GET">
<input alt="Update diabetescentre" src="${update_image_url}" title="Update diabetescentre" type="image" value="Update diabetescentre"/>
</form:form>
</td>
<td>
<c:url value="/diabetescentre/${diabetescentre.id}" var="delete_form_url"/>
<c:url value="/static/images/delete.png" var="delete_image_url"/>
<form:form action="${delete_form_url}" method="DELETE">
<input alt="Delete diabetescentre" src="${delete_image_url}" title="Delete diabetescentre" type="image" value="Delete diabetescentre"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty diabetescentres}">No DiabetesCentres found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
