
<%@ page import="PreConsent.AppointmentType; PreConsent.Type; PreConsent.Appointment" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-appointment" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${appointmentInstance?.clinician?.id}">${appointmentInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.person.label" default="Person" /></td>

				<td valign="top" style="text-align: left;" class="value">
					<g:each in="${appointmentInstance.person}" var="a">
						<span>${a.toString()} </br></span>
					</g:each>
				</td>
				%{--<td valign="top" class="value"><g:link controller="person" action="show" id="${appointmentInstance?.person?.find{it?.id}}">${appointmentInstance?.person?.find{it?.id}}</g:link></td>--}%

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${appointmentInstance?.date}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.startTime.label" default="Start Time" /></td>

				<td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "startTime")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.endTime.label" default="End Time" /></td>

				<td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "endTime")}</td>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.mode.label" default="Mode" /></td>
				
				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${appointmentInstance?.mode?.id}">${appointmentInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.status.label" default="Status" /></td>
				
				<td valign="top" class="value"><g:link controller="appointmentStatus" action="show" id="${appointmentInstance?.status?.id}">${appointmentInstance?.status?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.location.label" default="Location" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "location")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appointment.type.label" default="Type" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<g:each in="${appointmentInstance.type}" var="a">
						<span>${a.toString()} </br></span>
					</g:each>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

<hr/>

<p class="text-primary">Available Action</p>

<g:if test="${PreConsent.Engage.list().person.findAll{it.findAll {it == appointmentInstance?.person}}.empty }">
	<a class='btn btn-primary btn-small' <g:link controller="engage" action="create" params="['person.id': appointmentInstance?.person?.id, 'clinician.id': appointmentInstance?.clinician?.id, 'date': appointmentInstance?.date]"><i class="glyphicon glyphicon-plus"></i> Engage this patient</g:link>
</g:if>

<g:if test="${PreConsent.Engage.list().person.findAll{it.findAll {it == appointmentInstance?.person}} && PreConsent.Clinical_withdrawal.list().person.findAll{it.findAll {it == appointmentInstance?.person}}.empty && PreConsent.Consent.list().person.findAll{it.findAll {it == appointmentInstance?.person}}.empty}">
	<a class='btn btn-primary btn-small' <g:link controller="consent" action="create" params="['person.id': appointmentInstance?.person?.id, 'clinician.id': appointmentInstance?.clinician?.id, 'date': appointmentInstance?.date]"><i class="glyphicon glyphicon-plus"></i> Consent this patient</g:link>
</g:if>

<g:if test="${PreConsent.Consent.list().person.findAll{it.findAll {it == appointmentInstance?.person}} && PreConsent.Patient_withdraw.list().person.findAll{it.findAll {it == appointmentInstance?.person}}.empty}">
	<a class='btn btn-primary btn-small' <g:link controller="patient_withdraw" action="create" params="['person.id': appointmentInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Record this patient’s withdrawal</g:link>
</g:if>

<g:if test="${appointmentInstance?.status?.id == PreConsent.AppointmentStatus.findByAppointmentStatusName('Rescheduled')?.id}">
	<a class='btn btn-primary btn-small' <g:link controller="appointment" action="create" params="['person': consentInstance?.person?.id, 'clinician.id': appointmentInstance?.clinician?.id, 'date': '',
																								   'mode.id': appointmentInstance?.mode?.id, 'notes': appointmentInstance?.notes, 'status':appointmentInstance?.status?.id]"><i class="glyphicon glyphicon-plus"></i> Create a new appointment </g:link>
</g:if>
%{--<p>${AppointmentType?.findAllByAppointmentTypeNameInList(appointmentInstance?.type?.collect { it?.toString()})}</p>--}%
<hr/>

</body>

</html>
