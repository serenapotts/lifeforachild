<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all Countrys">
<c:if test="${not empty countrys}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Name</th>
<th>Diabetes Centres</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${countrys}" var="country">
<tr>
<td>${country.id}</td>
<td>${fn:substring(country.name, 0, 10)}</td>
<td>${fn:length(country.diabetesCentres)}</td>
<td>
<c:url value="/country/${country.id}" var="show_form_url"/>
<c:url value="/static/images/show.png" var="show_image_url"/>
<form:form action="${show_form_url}" method="GET">
<input alt="Show country" src="${show_image_url}" title="Show country" type="image" value="Show country"/>
</form:form>
</td>
<td>
<c:url value="/country/${country.id}/form" var="update_form_url"/>
<c:url value="/static/images/update.png" var="update_image_url"/>
<form:form action="${update_form_url}" method="GET">
<input alt="Update country" src="${update_image_url}" title="Update country" type="image" value="Update country"/>
</form:form>
</td>
<td>
<c:url value="/country/${country.id}" var="delete_form_url"/>
<c:url value="/static/images/delete.png" var="delete_image_url"/>
<form:form action="${delete_form_url}" method="DELETE">
<input alt="Delete country" src="${delete_image_url}" title="Delete country" type="image" value="Delete country"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty countrys}">No Countrys found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
