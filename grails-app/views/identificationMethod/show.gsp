
<%@ page import="PreConsent.IdentificationMethod" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'identificationMethod.label', default: 'Identification Method')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-identificationMethod" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="identificationMethod.identificationMethodName.label" default="Identification Method Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: identificationMethodInstance, field: "identificationMethodName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
