
<%@ page import="PreConsent.AppointmentStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appointmentStatus.label', default: 'Appointment Status')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-appointmentStatus" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="appointmentStatusName" title="${message(code: 'appointmentStatus.appointmentStatusName.label', default: 'Appointment Status Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${appointmentStatusInstanceList}" status="i" var="appointmentStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${appointmentStatusInstance.id}">${fieldValue(bean: appointmentStatusInstance, field: "appointmentStatusName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${appointmentStatusInstanceCount}" />
	</div>
</section>

</body>

</html>
