
<%@ page import="PreConsent.Engage" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Engagement record for ${engageInstance?.person?.forenames} ${engageInstance?.person?.surname}</title>
</head>

<body>

<section id="show-engage" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="engage.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${engageInstance?.clinician?.id}">${engageInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="engage.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${engageInstance?.person?.id}">${engageInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="engage.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${engageInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="engage.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${engageInstance?.mode?.id}">${engageInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="engage.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: engageInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="engage.approachLetter.label" default="Approach Letter" /></td>
				
				<td valign="top" class="value"><g:link action="renderFormPDF" id="${engageInstance.id}">Approach Letter</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

<hr/>

<p class="text-primary">Available Actions</p>

<g:if test="${PreConsent.Consent.list().person.findAll{it.findAll {engageInstance?.person?.each{p -> it == p}}}.empty && PreConsent.Clinical_withdrawal.list().person.findAll{it.findAll {engageInstance?.person?.each{p -> it == p}}}.empty}">
    <a class='btn btn-primary btn-small' <g:link controller="consent" action="create" params="['person': engageInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Record this patient’s consent</g:link>
</g:if>

<g:if test="${PreConsent.Clinical_withdrawal.list().person.findAll{it.findAll {engageInstance?.person?.each{p -> it == p}}}.empty && PreConsent.Consent.list().person.findAll{it.findAll {engageInstance?.person?.each{p -> it == p}}}.empty}">
    <a class='btn btn-primary btn-small' <g:link controller="clinical_withdrawal" action="create" params="['person': engageInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Withdraw patient for clinical reasons</g:link>
</g:if>

<a class='btn btn-primary btn-small' <g:link controller="appointment" action="create" params="['person': engageInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Create Appointment</g:link>

<hr/>

</body>

</html>
