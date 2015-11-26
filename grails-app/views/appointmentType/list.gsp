
<%@ page import="PreConsent.AppointmentType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appointmentType.label', default: 'Appointment Type')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-appointmentType" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="appointmentTypeName" title="${message(code: 'appointmentType.appointmentTypeName.label', default: 'Appointment Type Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${appointmentTypeInstanceList}" status="i" var="appointmentTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${appointmentTypeInstance.id}">${fieldValue(bean: appointmentTypeInstance, field: "appointmentTypeName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${appointmentTypeInstanceCount}" />
	</div>
</section>

</body>

</html>
