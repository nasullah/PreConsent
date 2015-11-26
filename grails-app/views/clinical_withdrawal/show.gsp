
<%@ page import="PreConsent.Clinical_withdrawal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Clinical withdrawal record for ${clinical_withdrawalInstance?.person?.forenames} ${clinical_withdrawalInstance?.person?.surname}</title>
</head>

<body>

<section id="show-clinical_withdrawal" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinical_withdrawal.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${clinical_withdrawalInstance?.clinician?.id}">${clinical_withdrawalInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinical_withdrawal.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${clinical_withdrawalInstance?.person?.id}">${clinical_withdrawalInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinical_withdrawal.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${clinical_withdrawalInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinical_withdrawal.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${clinical_withdrawalInstance?.mode?.id}">${clinical_withdrawalInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinical_withdrawal.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinical_withdrawalInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinical_withdrawal.reason.label" default="Reason" /></td>

				<td valign="top" class="value"><g:link controller="rejectionReason" action="show" id="${clinical_withdrawalInstance?.reason?.id}">${clinical_withdrawalInstance?.reason?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
