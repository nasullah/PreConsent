
<%@ page import="PreConsent.Consent" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Consent record for ${consentInstance?.person?.forenames} ${consentInstance?.person?.surname}</title>
</head>

<body>

<section id="show-consent" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${consentInstance?.clinician?.id}">${consentInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${consentInstance?.person?.id}">${consentInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${consentInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.mode.label" default="Mode" /></td>

				<td valign="top" class="value"><g:link controller="contactMode" action="show" id="${consentInstance?.mode?.id}">${consentInstance?.mode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consentInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.consentVersion.label" default="Consent Version" /></td>

				<td valign="top" class="value"><g:link controller="consentVersion" action="show" id="${consentInstance?.consentVersion?.id}">${consentInstance?.consentVersion?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.incidentalFindings.label" default="Incidental Findings" /></td>

				<td valign="top" class="value"><g:formatBoolean boolean="${consentInstance?.incidentalFindings}" false="No" true="Yes" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.versionInformationSheet.label" default="Version Information Sheet" /></td>

				<td valign="top" class="value"><g:link controller="versionInformationSheet" action="show" id="${consentInstance?.versionInformationSheet?.id}">${consentInstance?.versionInformationSheet?.encodeAsHTML()}</g:link></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="consent.person.gelIdentifier" default="Gel Identifier" /></td>

				<td valign="top" class="value">${fieldValue(bean: consentInstance?.person?.find{it?.id}, field: "gelIdentifier")}</td>

			</tr>

		</tbody>
	</table>
</section>

<hr/>

<p class="text-primary">Available Action</p>

<g:if test="${PreConsent.Patient_withdraw.list().person.findAll{it.findAll {it == consentInstance?.person}}.empty }">
    <a class='btn btn-primary btn-small' <g:link controller="patient_withdraw" action="create" params="['person': consentInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Record this patient’s withdrawal</g:link>
</g:if>

<hr/>
</body>

</html>
