<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all Children">
<c:if test="${not empty children}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Initials</th>
<th>Name</th>
<th>Ethnic Group</th>
<th>Sex</th>
<th>Survival Status</th>
<th>Date Of Death</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${children}" var="child">
<tr>
<td>${child.id}</td>
<td>${fn:substring(child.initials, 0, 10)}</td>
<td>${fn:substring(child.name, 0, 10)}</td>
<td>${fn:substring(child.ethnicGroup, 0, 10)}</td>
<td>${fn:substring(child.sex, 0, 10)}</td>
<td>${fn:substring(child.survivalStatus, 0, 10)}</td>
<td>
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${child.dateOfDeath}"/>
</td>
<td>
<c:url value="/child/${child.id}" var="show_form_url"/>
<c:url value="/static/images/show.png" var="show_image_url"/>
<form:form action="${show_form_url}" method="GET">
<input alt="Show child" src="${show_image_url}" title="Show child" type="image" value="Show child"/>
</form:form>
</td>
<td>
<c:url value="/child/${child.id}/form" var="update_form_url"/>
<c:url value="/static/images/update.png" var="update_image_url"/>
<form:form action="${update_form_url}" method="GET">
<input alt="Update child" src="${update_image_url}" title="Update child" type="image" value="Update child"/>
</form:form>
</td>
<td>
<c:url value="/child/${child.id}" var="delete_form_url"/>
<c:url value="/static/images/delete.png" var="delete_image_url"/>
<form:form action="${delete_form_url}" method="DELETE">
<input alt="Delete child" src="${delete_image_url}" title="Delete child" type="image" value="Delete child"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty children}">No Children found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
