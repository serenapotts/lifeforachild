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
<form:form action="/LifeForAChild/user/${user.id}" method="GET">
<input alt="Show user" src="/LifeForAChild/static/images/show.png" title="Show user" type="image" value="Show user"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/user/${user.id}/form" method="GET">
<input alt="Update user" src="/LifeForAChild/static/images/update.png" title="Update user" type="image" value="Update user"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/user/${user.id}" method="DELETE">
<input alt="Delete user" src="/LifeForAChild/static/images/delete.png" title="Delete user" type="image" value="Delete user"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty users}">No Users found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
