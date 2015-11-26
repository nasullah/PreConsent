
<%@ page import="PreConsent.ConsentStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consentStatus.label', default: 'Consent Status')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-consentStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consentStatus.consentStatusName.label" default="Consent Status Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consentStatusInstance, field: "consentStatusName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
