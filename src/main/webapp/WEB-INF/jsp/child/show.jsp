<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show Child">
<c:if test="${not empty child}">
<div id="roo_child_initials">
<label for="_initials">Initials:</label>
<div class="box" id="_initials">${child.initials}</div>
</div>
<br/>
<div id="roo_child_name">
<label for="_name">Name:</label>
<div class="box" id="_name">${child.name}</div>
</div>
<br/>
<div id="roo_child_ethnicGroup">
<label for="_ethnicGroup">Ethnic Group:</label>
<div class="box" id="_ethnicGroup">${child.ethnicGroup}</div>
</div>
<br/>
<div id="roo_child_sex">
<label for="_sex">Sex:</label>
<div class="box" id="_sex">${child.sex}</div>
</div>
<br/>
<div id="roo_child_survivalStatus">
<label for="_survivalStatus">Survival Status:</label>
<div class="box" id="_survivalStatus">${child.survivalStatus}</div>
</div>
<br/>
<div id="roo_child_dateOfDeath">
<label for="_dateOfDeath">Date Of Death:</label>
<div class="box" id="_dateOfDeath">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${child.dateOfDeath}"/>
</div>
</div>
<br/>
<div id="roo_child_causeOfDeath">
<label for="_causeOfDeath">Cause Of Death:</label>
<div class="box" id="_causeOfDeath">${child.causeOfDeath}</div>
</div>
<br/>
<div id="roo_child_causeOfDeathOther">
<label for="_causeOfDeathOther">Cause Of Death Other:</label>
<div class="box" id="_causeOfDeathOther">${child.causeOfDeathOther}</div>
</div>
<br/>
<div id="roo_child_dateOfRegistration">
<label for="_dateOfRegistration">Date Of Registration:</label>
<div class="box" id="_dateOfRegistration">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${child.dateOfRegistration}"/>
</div>
</div>
<br/>
<div id="roo_child_dateOfBirth">
<label for="_dateOfBirth">Date Of Birth:</label>
<div class="box" id="_dateOfBirth">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${child.dateOfBirth}"/>
</div>
</div>
<br/>
<div id="roo_child_diabetesDiagnosed">
<label for="_diabetesDiagnosed">Diabetes Diagnosed:</label>
<div class="box" id="_diabetesDiagnosed">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${child.diabetesDiagnosed}"/>
</div>
</div>
<br/>
<div id="roo_child_insulinSince">
<label for="_insulinSince">Insulin Since:</label>
<div class="box" id="_insulinSince">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${child.insulinSince}"/>
</div>
</div>
<br/>
<div id="roo_child_diabetesType">
<label for="_diabetesType">Diabetes Type:</label>
<div class="box" id="_diabetesType">${child.diabetesType}</div>
</div>
<br/>
<div id="roo_child_diabetesTypeOther">
<label for="_diabetesTypeOther">Diabetes Type Other:</label>
<div class="box" id="_diabetesTypeOther">${child.diabetesTypeOther}</div>
</div>
<br/>
<div id="roo_child_distanceLivesFromCentre">
<label for="_distanceLivesFromCentre">Distance Lives From Centre:</label>
<div class="box" id="_distanceLivesFromCentre">${child.distanceLivesFromCentre}</div>
</div>
<br/>
<div id="roo_child_clinicalRecords">
<label for="_clinicalRecords">Clinical Records:</label>
<div class="box" id="_clinicalRecords">${child.clinicalRecords}</div>
</div>
<br/>
</c:if>
<c:if test="${empty child}">No Child found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
