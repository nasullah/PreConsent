
<%@ page import="PreConsent.VersionInformationSheet" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'versionInformationSheet.label', default: 'Version Information Sheet')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-versionInformationSheet" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="versionInformationSheet.versionInformationSheet.label" default="Version Information Sheet" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: versionInformationSheetInstance, field: "versionInformationSheet")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
