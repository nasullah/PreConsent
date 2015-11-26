
<%@ page import="PreConsent.ConsentVersion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consentVersion.label', default: 'Consent Version')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-consentVersion" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="consentVersionName" title="${message(code: 'consentVersion.consentVersionName.label', default: 'Consent Version Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${consentVersionInstanceList}" status="i" var="consentVersionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${consentVersionInstance.id}">${fieldValue(bean: consentVersionInstance, field: "consentVersionName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${consentVersionInstanceCount}" />
	</div>
</section>

</body>

</html>
