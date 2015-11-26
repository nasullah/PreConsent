
<%@ page import="PreConsent.ConsentStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consentStatus.label', default: 'Consent Status')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-consentStatus" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="consentStatusName" title="${message(code: 'consentStatus.consentStatusName.label', default: 'Consent Status Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${consentStatusInstanceList}" status="i" var="consentStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${consentStatusInstance.id}">${fieldValue(bean: consentStatusInstance, field: "consentStatusName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${consentStatusInstanceCount}" />
	</div>
</section>

</body>

</html>
