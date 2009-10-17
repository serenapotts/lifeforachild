<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all Children">
<table>
	<tr>
		<td class="submit">
			<c:url value="/excelgenerator" var="export_excel_url"/>
			<form:form action="${export_excel_url}" method="POST" modelAttribute="report">
				<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'exportExcel', event:'onclick'}));</script>
			    <input id="exportExcel" type="submit" value="Export Excel"/>
			    <form:hidden id="_reporttype" path="reporttype"/> 
			    <form:hidden id="_id" path="id"/>
			</form:form>
		</td>
		<td class="submit">
			<c:url value="/pdfgenerator" var="export_pdf_url"/>
			<form:form action="${export_pdf_url}" method="POST" modelAttribute="report">
				<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'exportPdf', event:'onclick'}));</script>
			    <input id="exportPdf" type="submit" value="Export PDF"/>
			    <form:hidden id="_reporttype" path="reporttype"/> 
			    <form:hidden id="_id" path="id"/>
			</form:form>
		</td>
	</tr>
</table>
${html}
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
