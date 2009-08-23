<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show DiabetesCentre">
<c:if test="${not empty diabetescentre}">
<div id="roo_diabetescentre_name">
<label for="_name">Name:</label>
<div class="box" id="_name">${diabetescentre.name}</div>
</div>
<br/>
<div id="roo_diabetescentre_address">
<label for="_address">Address:</label>
<div class="box" id="_address">${diabetescentre.address}</div>
</div>
<br/>
<div id="roo_diabetescentre_country">
<label for="_country">Country:</label>
<div class="box" id="_country">${diabetescentre.country}</div>
</div>
<br/>
</c:if>
<c:if test="${empty diabetescentre}">No DiabetesCentre found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
