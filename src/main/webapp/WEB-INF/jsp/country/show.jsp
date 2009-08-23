<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show Country">
<c:if test="${not empty country}">
<div id="roo_country_name">
<label for="_name">Name:</label>
<div class="box" id="_name">${country.name}</div>
</div>
<br/>
<div id="roo_country_diabetesCentres">
<label for="_diabetesCentres">Diabetes Centres:</label>
<div class="box" id="_diabetesCentres">${country.diabetesCentres}</div>
</div>
<br/>
</c:if>
<c:if test="${empty country}">No Country found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
