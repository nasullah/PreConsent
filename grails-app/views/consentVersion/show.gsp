
<%@ page import="PreConsent.ConsentVersion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consentVersion.label', default: 'Consent Version')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-consentVersion" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consentVersion.consentVersionName.label" default="Consent Version Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consentVersionInstance, field: "consentVersionName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
