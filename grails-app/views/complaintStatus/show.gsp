
<%@ page import="PreConsent.ComplaintStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'complaintStatus.label', default: 'Complaint Status')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-complaintStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="complaintStatus.complaintStatusName.label" default="Complaint Status Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: complaintStatusInstance, field: "complaintStatusName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
