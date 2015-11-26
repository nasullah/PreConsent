
<%@ page import="PreConsent.Appointment" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-appointment" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="appointment.clinician.label" default="Clinician" /></th>
			
				<th><g:message code="appointment.person.label" default="Person" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'appointment.date.label', default: 'Date')}" />
			
				<th><g:message code="appointment.mode.label" default="Mode" /></th>
			
				<g:sortableColumn property="notes" title="${message(code: 'appointment.notes.label', default: 'Notes')}" />
			
				<th><g:message code="appointment.status.label" default="Status" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "clinician")}</g:link></td>
			
				<td>${fieldValue(bean: appointmentInstance, field: "person")}</td>
			
				<td><g:formatDate format="yyyy-MM-dd" date="${appointmentInstance.date}" /></td>
			
				<td>${fieldValue(bean: appointmentInstance, field: "mode")}</td>
			
				<td>${fieldValue(bean: appointmentInstance, field: "notes")}</td>
			
				<td>${fieldValue(bean: appointmentInstance, field: "status")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${appointmentInstanceCount}" />
	</div>
</section>

</body>

</html>
