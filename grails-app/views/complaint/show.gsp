
<%@ page import="PreConsent.Complaint" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Complaint record for ${complaintInstance?.person?.forenames} ${complaintInstance?.person?.surname}</title>

</head>

<body>

<section id="show-complaint" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${complaintInstance?.clinician?.id}">${complaintInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${complaintInstance?.person?.id}">${complaintInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${complaintInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${complaintInstance?.mode?.id}">${complaintInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.complaintSummary.label" default="Complaint Summary" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "complaintSummary")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.resolutionNotes.label" default="Resolution Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "resolutionNotes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaint.complaintStatus.label" default="Status" /></td>

				<td valign="top" class="value"><g:link controller="complaintStatus" action="show" id="${complaintInstance?.complaintStatus?.id}">${complaintInstance?.complaintStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
