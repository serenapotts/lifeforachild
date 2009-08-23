<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all Sites">
<c:if test="${not empty sites}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Address</th>
<th>Country</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${sites}" var="site">
<tr>
<td>${site.id}</td>
<td>${fn:substring(site.address, 0, 10)}</td>
<td>${fn:substring(site.country, 0, 10)}</td>
<td>
<form:form action="/LifeForAChild/site/${site.id}" method="GET">
<input alt="Show site" src="/LifeForAChild/static/images/show.png" title="Show site" type="image" value="Show site"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/site/${site.id}/form" method="GET">
<input alt="Update site" src="/LifeForAChild/static/images/update.png" title="Update site" type="image" value="Update site"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/site/${site.id}" method="DELETE">
<input alt="Delete site" src="/LifeForAChild/static/images/delete.png" title="Delete site" type="image" value="Delete site"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty sites}">No Sites found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
