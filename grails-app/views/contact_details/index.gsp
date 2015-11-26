
<%@ page import="PreConsent.Contact_details" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contact_details.label', default: 'Contact Details')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-contact_details" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="contact_details.person.label" default="Person" /></th>
			
				<g:sortableColumn property="address" title="${message(code: 'contact_details.address.label', default: 'Address')}" />
			
				<g:sortableColumn property="postalCode" title="${message(code: 'contact_details.postalCode.label', default: 'Postal Code')}" />
			
				<g:sortableColumn property="fromDate" title="${message(code: 'contact_details.fromDate.label', default: 'From Date')}" />
			
				<g:sortableColumn property="to_date" title="${message(code: 'contact_details.to_date.label', default: 'Todate')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${contact_detailsInstanceList}" status="i" var="contact_detailsInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${contact_detailsInstance.id}">${fieldValue(bean: contact_detailsInstance, field: "person")}</g:link></td>
			
				<td>${fieldValue(bean: contact_detailsInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: contact_detailsInstance, field: "postalCode")}</td>
			
				<td><g:formatDate date="${contact_detailsInstance.fromDate}" /></td>
			
				<td><g:formatDate date="${contact_detailsInstance.to_date}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${contact_detailsInstanceCount}" />
	</div>
</section>

</body>

</html>
