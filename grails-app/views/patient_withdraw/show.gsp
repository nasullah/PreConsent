
<%@ page import="PreConsent.Patient_withdraw" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Patient withdrawal record for ${patient_withdrawInstance?.person?.forenames} ${patient_withdrawInstance?.person?.surname}</title>
</head>

<body>

<section id="show-patient_withdraw" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${patient_withdrawInstance?.clinician?.id}">${patient_withdrawInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${patient_withdrawInstance?.person?.id}">${patient_withdrawInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${patient_withdrawInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${patient_withdrawInstance?.mode?.id}">${patient_withdrawInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: patient_withdrawInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.consentForInterview.label" default="Consent For Interview" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${patient_withdrawInstance?.consentForInterview}" false="No" true="Yes"  /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.okWithScience.label" default="Ok With Science" /></td>
				<g:if test="${patient_withdrawInstance?.okWithScience == null}">
					<td valign="top" class="value">No opinion expressed</td>
				</g:if>
				<g:else >
					<td valign="top" class="value"><g:formatBoolean boolean="${patient_withdrawInstance?.okWithScience}" false="No" true="Yes" /></td>
				</g:else>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient_withdraw.reason.label" default="Reason" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: patient_withdrawInstance, field: "reason")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
