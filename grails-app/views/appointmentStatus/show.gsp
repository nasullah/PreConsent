
<%@ page import="PreConsent.AppointmentStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appointmentStatus.label', default: 'Appointment Status')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-appointmentStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointmentStatus.appointmentStatusName.label" default="Appointment Status Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appointmentStatusInstance, field: "appointmentStatusName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
