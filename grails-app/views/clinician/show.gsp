
<%@ page import="PreConsent.Clinician" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Clinician record for ${clinicianInstance?.forenames} ${clinicianInstance?.surname}</title>
</head>

<body>

<section id="show-clinician" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.forenames.label" default="Forenames" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "forenames")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.surname.label" default="Surname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "surname")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.department.label" default="Department" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "department")}</td>
				
			</tr>
		%{----}%
			%{--<tr class="prop">--}%
				%{--<td valign="top" class="name"><g:message code="clinician.interactions.label" default="Interactions" /></td>--}%
				%{----}%
				%{--<td valign="top" style="text-align: left;" class="value">--}%
					%{--<ul>--}%
					%{--<g:each in="${clinicianInstance.interactions}" var="i">--}%
						%{--<li><g:link controller="interaction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>--}%
					%{--</g:each>--}%
					%{--</ul>--}%
				%{--</td>--}%
				%{----}%
			%{--</tr>--}%
		
		</tbody>
	</table>
</section>

</body>

</html>
