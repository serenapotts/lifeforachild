<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show Site">
<c:if test="${not empty site}">
<div id="roo_site_address">
<label for="_address">Address:</label>
<div class="box" id="_address">${site.address}</div>
</div>
<br/>
<div id="roo_site_country">
<label for="_country">Country:</label>
<div class="box" id="_country">${site.country}</div>
</div>
<br/>
</c:if>
<c:if test="${empty site}">No Site found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
