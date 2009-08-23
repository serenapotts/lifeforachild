<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.SimpleTextarea");dojo.require("dijit.form.FilteringSelect");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update Site">
<form:form action="/LifeForAChild/site/${site.id}" method="PUT" modelAttribute="site">
<div id="roo_site_address">
<label for="_address">Address:</label>
<form:textarea cssStyle="width:250px" id="_address" path="address"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_address", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_address" path="address"/>
</div>
<br/>
<div id="roo_site_country">
<c:if test="${not empty countrys}">
<label for="_country">Country:</label>
<form:select cssStyle="width:250px" id="_country" path="country">
<form:options itemValue="id" items="${countrys}"/>
</form:select>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_country', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
</c:if>
</div>
<br/>
<div class="submit" id="roo_site_submit">
<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
<input id="proceed" type="submit" value="Update"/>
</div>
<form:hidden id="_id" path="id"/>
<form:hidden id="_version" path="version"/>
</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
