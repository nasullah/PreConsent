
<%@ page import="PreConsent.Telephone_number" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'telephone_number.label', default: 'Telephone Number')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-telephone_number" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telephone_number.contactDetails.label" default="Contact Details" /></td>
				
				<td valign="top" class="value"><g:link controller="contact_details" action="show" id="${telephone_numberInstance?.contactDetails?.id}">${telephone_numberInstance?.contactDetails?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telephone_number.telephoneNumber.label" default="Telephone Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: telephone_numberInstance, field: "telephoneNumber")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
