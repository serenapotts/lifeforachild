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
<form:form action="/LifeForAChild/country/${country.id}" method="GET">
<input alt="Show country" src="/LifeForAChild/static/images/show.png" title="Show country" type="image" value="Show country"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/country/${country.id}/form" method="GET">
<input alt="Update country" src="/LifeForAChild/static/images/update.png" title="Update country" type="image" value="Update country"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/country/${country.id}" method="DELETE">
<input alt="Delete country" src="/LifeForAChild/static/images/delete.png" title="Delete country" type="image" value="Delete country"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty countrys}">No Countrys found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
