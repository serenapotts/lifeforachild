<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all Users">
<c:if test="${not empty users}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Name</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${users}" var="user">
<tr>
<td>${user.id}</td>
<td>${fn:substring(user.name, 0, 10)}</td>
<td>
<c:url value="/user/${user.id}" var="show_form_url"/>
<c:url value="/static/images/show.png" var="show_image_url"/>
<form:form action="${show_form_url}" method="GET">
<input alt="Show user" src="${show_image_url}" title="Show user" type="image" value="Show user"/>
</form:form>
</td>
<td>
<c:url value="/user/${user.id}/form" var="update_form_url"/>
<c:url value="/static/images/update.png" var="update_image_url"/>
<form:form action="${update_form_url}" method="GET">
<input alt="Update user" src="${update_image_url}" title="Update user" type="image" value="Update user"/>
</form:form>
</td>
<td>
<c:url value="/user/${user.id}" var="delete_form_url"/>
<c:url value="/static/images/delete.png" var="delete_image_url"/>
<form:form action="${delete_form_url}" method="DELETE">
<input alt="Delete user" src="${delete_image_url}" title="Delete user" type="image" value="Delete user"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty users}">No Users found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
