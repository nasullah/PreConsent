
<%@ page import="PreConsent.Email_address" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email_address.label', default: 'Email Address')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-email_address" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="email_address.contactDetails.label" default="Contact Details" /></th>
			
				<g:sortableColumn property="emailAddress" title="${message(code: 'email_address.emailAddress.label', default: 'Email Address')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${email_addressInstanceList}" status="i" var="email_addressInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${email_addressInstance.id}">${fieldValue(bean: email_addressInstance, field: "contactDetails")}</g:link></td>
			
				<td>${fieldValue(bean: email_addressInstance, field: "emailAddress")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${email_addressInstanceCount}" />
	</div>
</section>

</body>

</html>
