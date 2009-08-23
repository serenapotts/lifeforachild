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
<form:form action="/LifeForAChild/child/${child.id}" method="GET">
<input alt="Show child" src="/LifeForAChild/static/images/show.png" title="Show child" type="image" value="Show child"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/child/${child.id}/form" method="GET">
<input alt="Update child" src="/LifeForAChild/static/images/update.png" title="Update child" type="image" value="Update child"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/child/${child.id}" method="DELETE">
<input alt="Delete child" src="/LifeForAChild/static/images/delete.png" title="Delete child" type="image" value="Delete child"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty children}">No Children found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
