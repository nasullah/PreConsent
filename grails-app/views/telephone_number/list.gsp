
<%@ page import="PreConsent.Telephone_number" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'telephone_number.label', default: 'Telephone Number')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-telephone_number" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="telephone_number.contactDetails.label" default="Contact Details" /></th>
			
				<g:sortableColumn property="telephoneNumber" title="${message(code: 'telephone_number.telephoneNumber.label', default: 'Telephone Number')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${telephone_numberInstanceList}" status="i" var="telephone_numberInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${telephone_numberInstance.id}">${fieldValue(bean: telephone_numberInstance, field: "contactDetails")}</g:link></td>
			
				<td>${fieldValue(bean: telephone_numberInstance, field: "telephoneNumber")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${telephone_numberInstanceCount}" />
	</div>
</section>

</body>

</html>
