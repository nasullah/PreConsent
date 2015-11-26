
<%@ page import="PreConsent.ContactMode" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contactMode.label', default: 'Contact Mode')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-contactMode" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactMode.contactModeName.label" default="Contact Mode Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactModeInstance, field: "contactModeName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
