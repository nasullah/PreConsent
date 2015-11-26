
<%@ page import="PreConsent.WithdrawStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'withdrawStatus.label', default: 'Withdraw Status')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-withdrawStatus" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="withdrawStatusName" title="${message(code: 'withdrawStatus.withdrawStatusName.label', default: 'Withdraw Status Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${withdrawStatusInstanceList}" status="i" var="withdrawStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${withdrawStatusInstance.id}">${fieldValue(bean: withdrawStatusInstance, field: "withdrawStatusName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${withdrawStatusInstanceCount}" />
	</div>
</section>

</body>

</html>
