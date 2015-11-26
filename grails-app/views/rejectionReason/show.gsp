
<%@ page import="PreConsent.RejectionReason" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'rejectionReason.label', default: 'Rejection Reason')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-rejectionReason" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="rejectionReason.rejectionReasonName.label" default="Rejection Reason Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: rejectionReasonInstance, field: "rejectionReasonName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
