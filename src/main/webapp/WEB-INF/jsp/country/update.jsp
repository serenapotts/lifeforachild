<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.SimpleTextarea");dojo.require("dijit.form.MultiSelect");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update Country">
<form:form action="/LifeForAChild/country/${country.id}" method="PUT" modelAttribute="country">
<div id="roo_country_name">
<label for="_name">Name:</label>
<form:textarea cssStyle="width:250px" id="_name" path="name"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_name", widgetType: 'dijit.form.SimpleTextarea'})); </script>
<br/>
<form:errors cssClass="errors" id="_name" path="name"/>
</div>
<br/>
<div id="roo_country_diabetesCentres">
<c:if test="${not empty diabetescentres}">
<label for="_diabetesCentres">Diabetes Centres:</label>
<form:select cssStyle="width:250px" id="_diabetesCentres" path="diabetesCentres">
<form:options itemValue="id" items="${diabetescentres}"/>
</form:select>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_diabetesCentres', widgetType: 'dijit.form.MultiSelect'})); </script>
</c:if>
</div>
<br/>
<div class="submit" id="roo_country_submit">
<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
<input id="proceed" type="submit" value="Update"/>
</div>
<form:hidden id="_id" path="id"/>
<form:hidden id="_version" path="version"/>
</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
