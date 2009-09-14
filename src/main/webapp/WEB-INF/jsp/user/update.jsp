<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update User">
<c:url value="/user/${user.id}" var="form_url"/>
<form:form action="${form_url}" method="PUT" modelAttribute="user">
<div id="roo_user_name">
<label for="_name">Name:</label>
<form:input cssStyle="width:250px" id="_name" maxlength="30" path="name" size="0"/>
<br/>
<form:errors cssClass="errors" id="_name" path="name"/>
<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_name", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Name", invalidMessage: "", required : false}})); </script>
</div>
<br/>
<div class="submit" id="roo_user_submit">
<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
<input id="proceed" type="submit" value="Update"/>
</div>
<form:hidden id="_id" path="id"/>
<form:hidden id="_version" path="version"/>
</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
