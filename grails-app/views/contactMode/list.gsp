
<%@ page import="PreConsent.ContactMode" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contactMode.label', default: 'Contact Mode')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-contactMode" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="contactModeName" title="${message(code: 'contactMode.contactModeName.label', default: 'Contact Mode Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${contactModeInstanceList}" status="i" var="contactModeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${contactModeInstance.id}">${fieldValue(bean: contactModeInstance, field: "contactModeName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${contactModeInstanceCount}" />
	</div>
</section>

</body>

</html>
