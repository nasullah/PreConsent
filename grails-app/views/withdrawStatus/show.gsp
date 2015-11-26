
<%@ page import="PreConsent.WithdrawStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'withdrawStatus.label', default: 'Withdraw Status')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-withdrawStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="withdrawStatus.withdrawStatusName.label" default="Withdraw Status Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: withdrawStatusInstance, field: "withdrawStatusName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
