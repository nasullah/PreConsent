
<%@ page import="PreConsent.Enquiry" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Enquiry record for ${enquiryInstance?.person?.forenames} ${enquiryInstance?.person?.surname}</title>
</head>

<body>

<section id="show-enquiry" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enquiry.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${enquiryInstance?.clinician?.id}">${enquiryInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enquiry.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${enquiryInstance?.person?.id}">${enquiryInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enquiry.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${enquiryInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enquiry.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${enquiryInstance?.mode?.id}">${enquiryInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enquiry.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enquiryInstance, field: "notes")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
