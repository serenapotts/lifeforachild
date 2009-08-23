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
<form:form action="/LifeForAChild/diabetescentre/${diabetescentre.id}" method="GET">
<input alt="Show diabetescentre" src="/LifeForAChild/static/images/show.png" title="Show diabetescentre" type="image" value="Show diabetescentre"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/diabetescentre/${diabetescentre.id}/form" method="GET">
<input alt="Update diabetescentre" src="/LifeForAChild/static/images/update.png" title="Update diabetescentre" type="image" value="Update diabetescentre"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/diabetescentre/${diabetescentre.id}" method="DELETE">
<input alt="Delete diabetescentre" src="/LifeForAChild/static/images/delete.png" title="Delete diabetescentre" type="image" value="Delete diabetescentre"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty diabetescentres}">No DiabetesCentres found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
