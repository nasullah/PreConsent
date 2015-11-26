
<%@ page import="PreConsent.Exit_interview" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Exit interview record for ${exit_interviewInstance?.person?.forenames} ${exit_interviewInstance?.person?.surname}</title>
</head>

<body>

<section id="show-exit_interview" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exit_interview.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${exit_interviewInstance?.clinician?.id}">${exit_interviewInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exit_interview.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${exit_interviewInstance?.person?.id}">${exit_interviewInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exit_interview.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${exit_interviewInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exit_interview.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${exit_interviewInstance?.mode?.id}">${exit_interviewInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exit_interview.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: exit_interviewInstance, field: "notes")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
