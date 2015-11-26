
<%@ page import="PreConsent.AppointmentType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appointmentType.label', default: 'Appointment Type')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-appointmentType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointmentType.appointmentTypeName.label" default="Appointment Type Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appointmentTypeInstance, field: "appointmentTypeName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
