
<%@ page import="PreConsent.Email_address" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email_address.label', default: 'Email Address')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-email_address" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email_address.contactDetails.label" default="Contact Details" /></td>
				
				<td valign="top" class="value"><g:link controller="contact_details" action="show" id="${email_addressInstance?.contactDetails?.id}">${email_addressInstance?.contactDetails?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email_address.emailAddress.label" default="Email Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: email_addressInstance, field: "emailAddress")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
