
<%@ page import="PreConsent.RejectionReason" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'rejectionReason.label', default: 'Rejection Reason')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-rejectionReason" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="rejectionReasonName" title="${message(code: 'rejectionReason.rejectionReasonName.label', default: 'Rejection Reason Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${rejectionReasonInstanceList}" status="i" var="rejectionReasonInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${rejectionReasonInstance.id}">${fieldValue(bean: rejectionReasonInstance, field: "rejectionReasonName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${rejectionReasonInstanceCount}" />
	</div>
</section>

</body>

</html>
