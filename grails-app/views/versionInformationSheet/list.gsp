
<%@ page import="PreConsent.VersionInformationSheet" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'versionInformationSheet.label', default: 'Version Information Sheet')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-versionInformationSheet" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="versionInformationSheet" title="${message(code: 'versionInformationSheet.versionInformationSheet.label', default: 'Version Information Sheet')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${versionInformationSheetInstanceList}" status="i" var="versionInformationSheetInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${versionInformationSheetInstance.id}">${fieldValue(bean: versionInformationSheetInstance, field: "versionInformationSheet")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${versionInformationSheetInstanceCount}" />
	</div>
</section>

</body>

</html>
