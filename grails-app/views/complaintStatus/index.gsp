
<%@ page import="PreConsent.ComplaintStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'complaintStatus.label', default: 'Complaint Status')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-complaintStatus" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="complaintStatusName" title="${message(code: 'complaintStatus.complaintStatusName.label', default: 'Complaint Status Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${complaintStatusInstanceList}" status="i" var="complaintStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${complaintStatusInstance.id}">${fieldValue(bean: complaintStatusInstance, field: "complaintStatusName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${complaintStatusInstanceCount}" />
	</div>
</section>

</body>

</html>
